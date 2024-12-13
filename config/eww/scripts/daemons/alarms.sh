#!/bin/sh
alarm_dir="/tmp/eww-alarms"
mkdir -p "$alarm_dir"

update() {
    alarms="["
    for alarm_file in "$alarm_dir"/*; do
        timestamp="$(basename "$alarm_file")"
        # alarm_file gets this value when directory is empty
        if [[ "$alarm_file" == "$alarm_dir/*" ]]; then
            eww update alarms-json="[]" alarms-index=0
            return
        fi
        alarms="$alarms""{ \"hour\": \"$(date -d @"$timestamp" "+%H")\", \"min\": \"$(date -d @"$timestamp" "+%M")\", \"label\": \"$(tail -1 $alarm_file)\"},"
    done
    alarms="${alarms::-1}" # Remove last comma
    alarms="$alarms""]"

    eww update \
        alarms-json="$alarms" \
        alarms-index=0 \
        alarms-state=select-type
}

update
if [ "$1" == "oneshot" ]; then
    exit
fi

while (inotifywait -e modify,delete "$alarm_dir" -qq) do update; done

