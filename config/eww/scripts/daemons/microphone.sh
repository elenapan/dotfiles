#!/usr/bin/env bash
old_source=$(pactl get-default-source)
old_status=-1
update() {
    default_source=$(pactl get-default-source)
    info="$(pactl get-source-mute "$default_source")"
    status="$([[ "$info" == *"Mute: yes"* ]] && echo off || echo on)"

    if [[ "$default_source" != "$old_source" ]]; then
        device=$(pactl list sources | awk '/Name: '$default_source'/{nr[NR+1]}; NR in nr {print substr($0, index($0, $2))}')
        notify-send.sh -R /tmp/recording-device-notification --urgency low "Recording device" "$device"
        old_source="$default_source"
    fi

    # Only update if status changed
    if [ "$old_status" != "$status" ]; then
        eww update microphone="$status"
        old_status=$status
    fi
}

update
if [ "$1" == "oneshot" ]; then
    exit
fi

LANG=C pactl subscribe 2> /dev/null | grep --line-buffered "source #" | while read -r line ; do
    update
done
