#!/bin/bash

# For Alsa
#amixer get Master | grep "${snd_cha}" | awk -F'[]%[]' '/%/ {if ($7 == "off") {print "  "} else {printf "%d%% ", $2}}'
#


# For pulse
VOL="$(pactl list sinks | grep "Volume: " | awk '{print $5}' | head -1)"
MUTE="$(pactl list sinks | grep -i "mute" | head -1 | awk '{print $2}')"

if [[ "$MUTE" != "no" ]]; then
	echo "  "
else
	echo "$VOL "
fi
