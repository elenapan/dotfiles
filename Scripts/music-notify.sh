#!/bin/bash
# Prints media info from mpd, youtube

# Priority:
# 1. Prints the title of the mpd song playing, while scrolling (WORK IN PROGRESS)
# 2. Prints the title of the first open YouTube window, while scrolling (sexy!)
# NOTE: It works if the tab is in focus, so seperate the youtube tab from 
# the rest of the browser so you don't have to keep it in focus and the script will work.

# Note: on tint2, set interval=0 and continuous output=2 or larger
# (in general continuous output should be larger than sleep time)

while :
do  
	# Seach for mpd info, youtube and pandora windows
	MPDSTATE="$(mpc | head -2 | tail -1 | awk '{print $1}')"
	#NCMPCPP="$(ps cax | grep ncmpcpp)"
	YOUTUBE="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "YouTube")"
	PANDORA="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "Pandora Radio")"

	# Grab youtube window title 
	# Depending on your browser, uncomment the correct INPUT line (and comment the others)

	# Vivaldi
	if [[ "$MPDSTATE" != "[playing]" ]]; then
		# Grab youtube window title 
		# Depending on your browser, uncomment the correct INPUT line (and comment the others)
		# Vivaldi
		#INPUT="$(echo $YOUTUBE | awk -v skipstart=3 -v skipend=2 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"
	
		# Mozilla
		INPUT="$(echo $YOUTUBE | awk -v skipstart=3 -v skipend=3 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"
	
		# Chromium/Mozilla
		# INPUT="$(echo $YOUTUBE | awk -v skipstart=3 -v skipend=4 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"
	else
		INPUT="$(mpc | head -1)"
	fi

	# If the song has changed, start from the beginning and send a notification
	if [[ "$INPUT" != "$OLD_INPUT" ]]; then
		i=1

		# Uncomment this to enable notifying every time the song changes
		if [ ${#INPUT} -ne "0" ]; then
			notify-send "Now playing:" "$INPUT" -i ~/.icons/oomox-wally-flat/actions/scalable/player_play.svg
		fi
	fi

	# Save old input for the next check
	OLD_INPUT="$(echo $INPUT)"

	# Optional: remove multibyte characters 
	# (they dont show up properly while scrolling due to "cut -c" being identical to "cut -b")
	INPUT="$(echo $INPUT | tr -dc '[:print:]')"

	INPUT_LENGTH="$(echo ${#INPUT})"

	# If no youtube window is found
	#if [ ${#YOUTUBE} -eq "0" ] && [ ${#NCMPCPP} -eq "0" ]; then
	if [ ${#YOUTUBE} -eq "0" ] && [[ "$MPDSTATE" != "[playing]" ]]; then
		#echo "  "
		#echo "  "
		#echo "  "
		#echo "  "
		#echo " "
		echo " ·| "
	else
		if [[ "$MPDSTATE" != "[playing]" ]]; then
			echo " ·@ "
			#echo "  "
		else
			echo " ·> "
			#echo "  "
		fi
	fi

	# For fat bars/panels, I add this newline so the previous output is not visible
	echo ""

	sleep 1
done

# general method to exlude fields
# awk -v skipstart=1 -v skipend=1 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}'
