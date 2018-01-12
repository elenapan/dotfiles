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
	echo "VOL OFF"

	# Line
	# echo "-----------"
else
	# Text only
	if [ "${VOL%?}" -ge "10" ]; then
		echo "VOL $VOL"
	else	
		echo "VOL  $VOL"
	fi

	# Line (with siji icons)
	# VOL="$(echo ${VOL%?})"
	# if [ "$VOL" -ge "100" ]; then
	# 	echo " ----------| "
	# elif [ "$VOL" -ge "90" ]; then
	# 	echo " ---------|- "
	# elif [ "$VOL" -ge "80" ]; then
	# 	echo " --------|-- "
	# elif [ "$VOL" -ge "70" ]; then
	# 	echo " -------|--- "
	# elif [ "$VOL" -ge "60" ]; then
	# 	echo " ------|---- "
	# elif [ "$VOL" -ge "50" ]; then
	# 	echo " -----|----- "
	# elif [ "$VOL" -ge "40" ]; then
	# 	echo " ----|------ "
	# elif [ "$VOL" -ge "30" ]; then
	# 	echo " ---|------- "
	# elif [ "$VOL" -ge "20" ]; then
	# 	echo " --|-------- "
	# elif [ "$VOL" -ge "10" ]; then
	# 	echo " -|--------- "
	# else
	# 	echo " |---------- "
	# fi

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
