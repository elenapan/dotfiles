#!/usr/bin/env bash
# Forwards input to the correct script depending on eww state
eww="$HOME/.config/eww/scripts"
input=$1

declare -A sinks
sinks=(
    ["lockscreen"]="${eww}/input-sink-lockscreen.sh"
    ["alarms"]="${eww}/input-sink-alarms.sh"
)

# All widgets that can accept input update this file with their name when their
# input is active. This is faster than using an eww variable since an `eww get`
# is more expensive than writing to / reading from tmpfs
widget=$(</tmp/eww-widget-input-active)
pipe=/tmp/eww-widget-input-pipe-${widget}

# Write to pipe (which is read by the respective buffer script)
builtin echo "${sinks[$widget]}" \""${input}"\" > "$pipe"
