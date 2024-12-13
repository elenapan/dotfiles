#!/usr/bin/env bash
# Update total minutes and turn them into HH:MM format.
# This can also be done with eww expressions but in a more verbose and
# inefficient way, which is why we created this script
total_minutes="$(eww get alarms-total-minutes)"
operation=$1
amount=$2
if [[ "$operation" == "plus" ]]; then
    # 24 * 60 = 1440 minutes in a day
    total_minutes=$(((total_minutes + amount) % 1440))
elif [[ "$operation" == "minus" ]]; then
    total_minutes=$(((total_minutes - amount + 1440) % 1440))
else
    echo "Invalid operation"
    exit 1
fi

hours=$((total_minutes / 60))
minutes=$((total_minutes % 60))

eww update \
    alarms-input-hours="$hours" \
    alarms-input-minutes="$minutes" \
    alarms-preview-hours="$(printf "%02d" $hours)" \
    alarms-preview-minutes="$(printf "%02d" $minutes)" \
    alarms-total-minutes="$total_minutes"
