#!/usr/bin/env bash
# Network widget controls
# Intended for IWD not NetworkManager.
interface=wlan0
rofi="$HOME/.config/eww/scripts/rofi-with-mode-restore networks"

update_networks() {
    iwctl station $interface scan
    iwctl_out="$(iwctl station $interface get-networks)"

    # iwctl version 2.22 BUG: Right after manually disconnecting from a network,
    # the next few get-networks runs may fail with one of the following errors:
    # 1. Device wlan0 not found.
    #    No station on device: 'wlan0'
    # 2. No matching method found
    #    Failed to retrieve IWD dbus objects, quitting...
    # It also does not correctly set a failure return code and it prints errors
    # in stdout.
    # HACK: Retry until get-networks succeeds. Usually takes 1-2 retries.
    # while true; do
    #     iwctl_out="$(iwctl station $interface get-networks)"
    #     [[ ! "$iwctl_out" =~ "Available networks" ]] || break
    #     sleep 0.1
    # done

    # Remove the first 4 lines of output (headers) and escape codes.
    # iwctl prints color escape codes even if piped to another command :(
    networks="$(sed -e '1,4d;s/\x1b\[[0-9;]*m/SIGNAL_END/g;s/SIGNAL_END\*.*//;s/SIGNAL_END//g' <<< "$iwctl_out")"

    if [[ "$networks" =~ "No networks available" ]]; then
        eww update networks-json="[]"
        exit
    fi

    # Find saved networks
    # We can connect to those without entering a password
    saved_networks="$(iwctl known-networks list | sed -e '1,4d;s/\x1b\[[0-9;]*m//g')"
    declare -A saved_networks_assoc
    while read -r line; do
        name="$(awk '{for (i=1; i<=NF-5; i++) printf $i " "}' <<< "$line" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')"
        saved_networks_assoc["$name"]=true
    done <<< "$saved_networks"

    json='['
    while read -r line; do
        first_column="$(awk '{print $1}' <<< "$line")"

        if [[ "$first_column" = ">" ]]; then
            selected="true"
            name="$(awk '{for (i=2; i<=NF-2; i++) printf $i " "}' <<< "$line" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')"
        else
            selected="false"
            name="$(awk '{for (i=1; i<=NF-2; i++) printf $i " "}' <<< "$line" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//')"
        fi

        if [[ -v saved_networks_assoc["$name"] ]]; then
            saved="true"
        else
            saved="false"
        fi

        signal_strength="$(awk '{ last_col = $NF; star_count = gsub("\\*", "", last_col); print star_count }' <<< "$line")"

        # Escape double quotes from network name
        json+="{\"name\": \"${name//\"/\\\"}\","
        json+="\"selected\": \"$selected\","
        json+="\"saved\": \"$saved\","
        json+="\"signal_strength\": $signal_strength},"
    done <<< "$networks"
    json=${json::-1} # Remove last comma
    json+=']'

    eww update networks-json="$json"
}

scan() {
    if [[ "$(eww get networks-scan-loading)" == "true" ]]; then
        exit 1
    fi
    eww update networks-scan-loading=true
    for (( i = 0; i < 5; i++ )); do
        update_networks
        sleep 1
    done
    eww update networks-scan-loading=false
}

disconnect() {
    network_name="$1"
    iwctl known-networks "$network_name" set-property AutoConnect no
    iwctl station $interface disconnect
    # We do not need to update_networks here. It will happen automatically due
    # to ./daemons/network-events.sh
}

connect() {
    networks_json="$(eww get networks-json)"
    network_name="$1"
    saved=$(jq -r --arg name "$network_name" '.[] | select(.name == $name) | .saved' <<< "$networks_json")

    if [[ "$saved" == "true" ]]; then
        iwctl_connect_out="$(iwctl station "$interface" connect "$network_name")"
    else
        if ! passphrase="$($rofi -dmenu -no-fixed-num-lines -p "Enter passphrase >")"; then
            exit 1
        fi

        if [[ "$passphrase" == "" ]]; then
            iwctl_connect_out="$(iwctl station "$interface" connect "$network_name")"
        else
            iwctl_connect_out="$(iwctl station "$interface" connect "$network_name" --passphrase "$passphrase")"
        fi
    fi
    iwctl known-networks "$network_name" set-property AutoConnect yes

    if [[ "$iwctl_connect_out" =~ "Operation failed" ]]; then
        notify-send -u low "Networks" "Could not connect to $network_name"
    fi

    # We do not need to update_networks here. It will happen automatically due
    # to ./daemons/network-events.sh
}

forget() {
    network_name=$1
    answer="$(echo -e "No\nYes" | $rofi -i -p "Forget network $network_name?" -dmenu)"
    if [[ "$answer" == "Yes" ]]; then
        iwctl known-networks "$network_name" forget
        update_networks
    else
        exit 1
    fi
}

speedtest() {
    chromium --app='https://www.speedtest.net'
}

rofi_select() {
    source ~/.config/sway/scripts/sway-colors
    grey="${x8:-"#666666"}"
    red="${x1:-"#de5063"}"
    yellow="${x3:-"#fcc93a"}"
    green="${x2:-"#5de381"}"
    blue="${x4:-"#4287f5"}"
    networks_json="$(eww get networks-json)"
    # Unfortunately, breaking the if statement inside jq into multiple lines
    # will break the rofi list
    index="$(jq -r ' .[] | .name as $name | .selected as $selected |
        .saved as $saved | .signal_strength as $signal_strength |
        "\( if $signal_strength == 1 then "<span font_desc=\"monospace 15\" foreground=\"'"$grey"'\">⏽</span>" elif $signal_strength == 2 then "<span font_desc=\"monospace 15\" foreground=\"'"$red"'\">⏽</span>" elif $signal_strength == 3 then "<span font_desc=\"monospace 15\" foreground=\"'"$yellow"'\">⏽</span>" else "<span font_desc=\"icomoon 15\" foreground=\"'"$green"'\">⏽</span>" end) \( if $selected == "true" then "<span font_desc=\"monospace 15\" foreground=\"'"$blue"'\"></span>" elif $saved == "true" then "<span font_desc=\"icomoon 15\" foreground=\"'"$blue"'\"></span>" else "<span font_desc=\"icomoon 15\" foreground=\"'"$blue"'\"></span>" end) \($name)" ' <<< "$networks_json" | $rofi -i -p 'Networks' -dmenu -format "i" -markup-rows)"

    if [[ "$index" == "" || "$index" == "-1" ]]; then
        exit 1
    fi
    network_obj="$(jq -r ".[$index]" <<< "$networks_json")"
    network_name="$(jq -r ".name" <<< "$network_obj")"

    choices=""
    if [ "$(jq -r ".selected" <<< "$network_obj")" == "true" ]; then
        choices+="Disconnect\n"
    else
        choices+="Connect\n"
    fi

    if [ "$(jq -r ".saved" <<< "$network_obj")" == "true" ]; then
        choices+="Forget\n"
    fi

    choices=${choices::-2} # Remove last \n
    answer="$(echo -e "$choices" | $rofi -i -p "Network $network_name" -dmenu)"
    if [[ "$answer" == "Disconnect" ]]; then
        disconnect "$@"
    elif [[ "$answer" == "Connect" ]]; then
        connect "$network_name"
    elif [[ "$answer" == "Forget" ]]; then
        forget "$network_name"
    else
        exit 1
    fi
}

ping() {
    if [[ "$(eww get networks-ping-loading)" == "true" ]]; then
        exit 1
    fi
    eww update networks-ping-loading=true networks-ping-result="ping"
    # packet_loss=''
    stdbuf -oL ping -w 30 -c 10 1.1.1.1 2>&1 | while read -r line; do
        if [[ "$line" =~ "time=" ]]; then
            ping="$(awk -F 'time=' '{gsub(/ ms/, "", $2); printf("%d\n", $2 + 0.5)}' <<< "$line")"
            eww update networks-ping-result="${ping}ms"
        # elif [[ "$line" =~ "packet loss" ]]; then
        #     packet_loss="/$(awk '{print $6}' <<< "$line")"
        elif [[ "$line" =~ "rtt min" ]]; then
            avg="$(awk -F '[ /=]' '{printf("%d\n", $9 + 0.5)}' <<< "$line")"
            # eww update networks-ping-result="${avg}ms${packet_loss}"
            eww update networks-ping-result="${avg}ms"
        elif [[ "$line" =~ "Network is unreachable" ]]; then
            eww update networks-ping-result="dc"
        fi
    done
    eww update networks-ping-loading=false
}

if [[ -z "$1" ]]; then
    echo No argument given
    exit 1
fi

# Call whichever function 1st argument says
cmd=$1
shift
$cmd "$@"
