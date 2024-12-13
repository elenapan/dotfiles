#!/usr/bin/env bash
old_sink=$(pactl get-default-sink)
old_muted=-1
old_volume=-1
update() {
    default_sink=$(pactl get-default-sink)
    # info="$(pactl list sinks | awk '/Name: '$default_sink'/{nr[NR+6];nr[NR+7]}; NR in nr')"
    # muted="$([[ "$info" == *"Mute: yes"* ]] && echo muted || echo '')"
    info="$(pactl get-sink-volume $default_sink)"
    muted="$([[ "$(pactl get-sink-mute $default_sink)" == *"Mute: yes"* ]] && echo muted || echo '')"
    volume="$(echo "$info" | awk '{ str = substr($5, 1, length($5)-1); gsub("%", "", str); print str }')"
    if [[ "$default_sink" != "$old_sink" ]]; then
        device=$(pactl list sinks | awk '/Name: '$default_sink'/{nr[NR+1]}; NR in nr {print substr($0, index($0, $2))}')
        notify-send.sh -R /tmp/audio-device-notification --urgency low "Audio device" "$device"
        old_sink=$default_sink
    fi

    if [[ "$volume" != "$old_volume" || "$muted" != "$old_muted" ]]; then
        eww update volume-muted="$muted" volume=$volume
        old_volume=$volume
        old_muted=$muted
    fi
}

update
if [ "$1" == "oneshot" ]; then
    exit
fi

pactl subscribe 2> /dev/null | grep --line-buffered "sink #" | while read -r _ ; do
    update
done
