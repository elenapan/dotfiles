#!/usr/bin/env bash
eww="$HOME/.config/eww/scripts"
network_notif="/tmp/eww-network-events-notif"

# We use uniq to remove duplicate lines sometimes caused when wifi connects
ip monitor link | grep --line-buffered -e "\(wlan\|enp\).*state \(DOWN\|UP\)" | stdbuf -oL uniq | while read -r line; do
    interface="$(awk '{print substr($2, 1, length($2)-1)}' <<< "$line")"
    state="$(awk '{for(i=1;i<=NF;i++) if ($i=="state") print $(i+1)}' <<< "$line")"

    if [[ "$interface" =~ ^wlan ]]; then
        interface_pretty_name="Wi-Fi"
    elif [[ "$interface" =~ ^enp ]]; then
        interface_pretty_name="Ethernet"
    fi

    if [[ "$state" == "UP" ]]; then
        event_verb="connected"
    elif [[ "$state" =~ "DOWN" ]]; then
        event_verb="disconnected"
    fi

    notify-send.sh -R "$network_notif" -u low "Network" "${interface_pretty_name} ${event_verb}"
    "$eww/networks.sh" update_networks
done
