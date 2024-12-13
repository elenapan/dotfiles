#!/usr/bin/env bash
vpn_notif="/tmp/eww-vpn-notif"
# It can also be "tap" instead of "tun" depending on the config (?)
vpn_interface=tun0

# Human friendly name to be displayed in notifications
declare -A vpn_names
vpn_names=(
    ["mullvad_gr_ath.conf"]="Greece - Athens"
    ["mullvad_nl_ams.conf"]="Netherlands - Amsterdam"
)

update() {
    eww update vpn-status="$1"
}

update "$(ip addr | grep "${vpn_interface}:" >/dev/null && echo on || echo off)"
if [ "$1" == "oneshot" ]; then
    exit
fi

# Ignore the first 3 informational lines (udevadm monitor has no quiet mode)
udevadm monitor -u --subsystem-match=net | stdbuf -oL awk 'NR > 3' | while read -r line; do
    if grep -q -e "add.*/devices/virtual/net/${vpn_interface}" <<< "$line"; then
        update "on"
        vpn_config="$(ps ax | grep -e "openvpn --config.*" | grep -v grep | awk 'NR==1 {sub(/.*--config /, ""); print}' | xargs basename)"
        notify-send.sh -R "$vpn_notif" -u low "VPN" "Connected to ${vpn_names[$vpn_config]}"
    elif grep -q -e "remove.*/devices/virtual/net/${vpn_interface}" <<< "$line"; then
        update "off"
        notify-send.sh -R "$vpn_notif" -u low "VPN" "Disconnected"
    fi
    eww update networks-vpn-loading=false
done

# Alternatively use `ip monitor all`
