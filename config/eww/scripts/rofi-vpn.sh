#!/usr/bin/env bash
rofi="$HOME/.config/eww/scripts/rofi-with-mode-restore networks"
source ~/.config/sway/scripts/sway-colors

disconnect() {
    eww update networks-vpn-loading=true
    vpn_config=$1
    pid=$2
    kill "$pid"
}

connect() {
    eww update networks-vpn-loading=true
    # First disconnect from existing VPN(s)
    pids="$(openvpn_pid "all")"
    # shellcheck disable=2086
    kill $pids 2>/dev/null

    vpn_config=$1
    # We need to cd here so that openvpn can find other configuration files needed to connect
    cd "${vpn_dirs[$vpn_config]}" || exit
    sudo openvpn --config "${vpn_dirs[$vpn_config]}/$vpn_config" >/dev/null & disown
}

openvpn_pid() {
    if [[ "$1" == "all" ]]; then
        # Find all "openvpn --config" processes
        ps ax | grep -e "openvpn --config.*" | grep -v grep | awk '{printf "%s ", $1 }'
    else
        # Only find the first process with the specific config
        ps ax | grep -e "openvpn --config.*$1" | grep -v grep | awk 'NR==1 {printf "%s", $1 }'
    fi
}

# We need a non associative array
vpns=(
    "mullvad_de_fra.conf"
    "mullvad_nl_ams.conf"
)

# VPN configs and their parent directory
declare -A vpn_dirs
vpn_dirs=(
    ["mullvad_de_fra.conf"]="$HOME/dox/mullvadvpn/mullvad_config_linux_de_fra"
    ["mullvad_nl_ams.conf"]="$HOME/dox/mullvadvpn/mullvad_config_linux_nl_ams"
)

# Human friendly name to be displayed in rofi
declare -A vpn_names
vpn_names=(
    ["mullvad_de_fra.conf"]="Germany - Frankfurt"
    ["mullvad_nl_ams.conf"]="Netherlands - Amsterdam"
)

# This will be filled by do_rofi
declare -A actions

do_rofi() {
    rofi_input=''
    for conf in "${vpns[@]}"; do
        pid="$(openvpn_pid "$conf")"
        if [[ "$pid" == "" ]]; then
            actions[$conf]="connect $conf"
            color=${x8:-"#666666"}
        else 
            actions[$conf]="disconnect $conf $pid"
            color="${x2:-"#5de381"}"
        fi

        line="<span font_desc=\"monospace 15\" foreground=\"$color\">⏽</span> ${vpn_names[$conf]}"
        rofi_input=$rofi_input${line}\\n
    done
    rofi_input=${rofi_input::-2}

    index="$(echo -e "$rofi_input" | $rofi -markup-rows -i -p 'VPN' -dmenu -format 'i')"
    if [[ "$index" == "" || "$index" == "-1" ]]; then
        exit 1
    fi

    ${actions[${vpns[$index]}]}
}

do_rofi
