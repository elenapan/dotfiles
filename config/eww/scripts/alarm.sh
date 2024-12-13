#!/bin/bash
# Alarm manager for eww
eww="$HOME/.config/eww/scripts"
alarm_sound="$HOME/.config/mpv/alarm.mp3"

alarm_dir="/tmp/eww-alarms"

mkdir -p "$alarm_dir"

function help {
    echo -e "Usage:\nalarm in 5m\nalarm at 18:40"
}

action="$1"
alarm_time_input="$2"
alarm_label="${3:-beep beep}"

# To transform everything to seconds
declare -A symbols_to_seconds=(
    ["d"]=86400
    ["h"]=3600
    ["m"]=60
    ["s"]=1
)

now="$(date +%s)"
if [[ "$action" == "in" ]]; then
    last_character="${alarm_time_input: -1}"
    case $last_character in
        d|h|m|s )
            multiplier=${symbols_to_seconds[$last_character]}
            time="${alarm_time_input::-1}"
            ;;
        * )
            multiplier=1
            time="$alarm_time_input"
    esac
    seconds_to_add=$((time * multiplier))
    alarm_time_timestamp=$((now + seconds_to_add))
elif [[ "$action" == "at" ]]; then
    alarm_time_timestamp="$(date -d "$alarm_time_input" +%s)"
    if [[ "$now" -ge "$alarm_time_timestamp" ]]; then
        alarm_time_timestamp="$(date -d "tomorrow $alarm_time_input" +%s)"
    fi
elif [[ "$action" == "delete" ]]; then
    alarm_index="$2"
    # Since file names are timestamps, alphabetical order is also chronological order
    alarm_file="$(find "$alarm_dir" -type f | sort | sed -n $((alarm_index + 1))p)"
    if [ ! -f "$alarm_file" ]; then
        exit 1
    fi
    kill "$(head -1 < "$alarm_file")"
    rm "$alarm_file"
    exit 0
else
    help
    exit 1
fi

alarm_file="${alarm_dir}/$alarm_time_timestamp"
echo -e "$$\n$alarm_label" > "$alarm_file"
notify-send -t 2000 -a eww-alarm "Alarm" "Will ring at $(date -d @"${alarm_time_timestamp}" "+%H:%M")"

# We use safe-sleep since with normal sleep, if the computer is suspended in the
# middle of a long sleep, the alarm will not ring at the right time.

# For less immediate alarms, we can be a bit more relaxed with the sleep interval
if [[ "$((alarm_time_timestamp - now))" -lt 60 ]]; then
    sleep_interval=1
else
    sleep_interval=5
fi

"${eww}"/safe-sleep until "$alarm_time_timestamp" with-interval "$sleep_interval"
playsound "$alarm_sound"
notify-send -t 0 -a eww-alarm "Alarm" "$alarm_label"

rm "$alarm_file"
