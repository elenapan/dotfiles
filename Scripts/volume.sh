#!/bin/bash

# For Alsa
#amixer get Master | grep "${snd_cha}" | awk -F'[]%[]' '/%/ {if ($7 == "off") {print "  "} else {printf "%d%% ", $2}}'
#


# For pulse
VOL="$(pactl list sinks | grep "Volume: " | awk '{print $5}' | head -1)"
MUTE="$(pactl list sinks | grep -i "mute" | head -1 | awk '{print $2}')"

if [[ "$MUTE" != "no" ]]; then
	# Icon only
	# echo "  "

	# Text only
	echo "vol off"
else
	# Text only
	echo "vol $VOL"

	# Icon only (simple)
	# echo "  "

	#Icon only (gradual)
	# VOL="$(echo ${VOL%?})"
	# if [ "$VOL" -ge "85" ]; then
	# 	echo "  "
	# elif [ "$VOL" -ge "20" ]; then
	# 	echo "  "
	# else
	# 	echo "  "
	# fi
fi
