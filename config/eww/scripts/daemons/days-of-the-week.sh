#!/bin/sh
date_file=/tmp/eww-days-of-the-week

old_index=-1
update() {
    week_day="$(date +%u)"
    # Generate / empty date file
    > "$date_file"
    for i in $(seq 1 $((week_day - 1)) | tac); do echo $i days ago >> "$date_file"; done
    echo today >> "$date_file"
    for i in $(seq 1 $((7 - week_day))); do echo $i days >> "$date_file"; done

    # Update relevant vars
    update_str="["
    update_str=$update_str"$(date -f "$date_file" '+"%d",' | tr '\n' ' ' )"
    update_str=${update_str::-2} # Remove last comma and space
    update_str=$update_str"]"
    current_index=$((week_day - 1))
    # Only update if day changed
    if [ "$old_index" != "$current_index" ]; then
        eww update dotw-current-index="$current_index" dotw-numbers="$update_str"
        old_index=$current_index
    fi
}

if [ "$1" == "oneshot" ]; then
    update
    exit
fi

while true; do
    update
    sleep 10
done
