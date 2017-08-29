#!/bin/bash

# Prints the title of the first open YouTube window, while scrolling (sexy!)
# It works if the tab is in focus, so seperate the youtube tab from 
# the rest of the browser so you don't have to keep it in focus and the script will work.

# Note: on tint2, set interval=0 and continuous output=2 or larger
# (in general continuous output should be larger than sleep time)

# TODO: start from the beginning if the output has changed (if the song has changed)

# Another way
# b=${a:12:5}
# (where 12 is the offset (zero-based) and 5 is the length)

# Limit for scrolling text
LIMIT=16
#SEPERATOR=" --- "
#SEPERATOR=" -- "
SEPERATOR=" ~~~ "
#SEPERATOR=" ~~ "
#SEPERATOR=" <> "
SEPERATOR_LENGTH="$(echo ${#SEPERATOR})"

# for multibyte chars (idk if it works): 
# iconv -sc -t UTF-8 -f cp1251
# tr -dc '[:print:]'

i=1
while :
do  
	# For debugging purposes
	# printf "|%02d|" $i
	
	# Seach for youtube and pandora windows
	YOUTUBE="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "YouTube")"
	PANDORA="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "Pandora Radio")"

	# Grab youtube window title
	INPUT="$(echo $YOUTUBE | awk -v skipstart=3 -v skipend=4 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"

	# If the song has changed, start from the beginning
	if [[ "$INPUT" != "$OLD_INPUT" ]]; then
		i=1
	fi

	# Save old input for the next check
	OLD_INPUT="$(echo $INPUT)"

	# Optional: remove multibyte characters 
	# (they dont show up properly while scrolling due to "cut -c" being identical to "cut -b")
	INPUT="$(echo $INPUT | tr -dc '[:print:]')"

	INPUT_LENGTH="$(echo ${#INPUT})"

	# If no youtube window is found (+pandora)
	if [ ${#YOUTUBE} -eq "0" ]; then
		if [ ${#PANDORA} -eq "0" ]; then
			#echo "  "
			echo "  "
		else
			echo " Pandora Radio"
		fi
	elif [ $INPUT_LENGTH -le $LIMIT ]; then
		echo -n " "
		echo $INPUT
	else
		LOOPTAIL="$(echo $INPUT | cut -c -$LIMIT)"
		FULLSTRING="$(echo $INPUT | sed "s/$/$SEPERATOR/" | sed "s/$/$LOOPTAIL/" )"
		
		# This is to prevent the bug when song changes and current i is larger than current song length
		# (Not needed anymore, this bug was fixed differently)
		# if [ $i -gt "${#FULLSTRING}" ]; then
		# 	i=1
		# fi

		echo -n " "
		# Show only LIMIT characters, from i to i+LIMIT. Output scrolls due to incrementing i
		echo -n $FULLSTRING | cut -c $i-$(($LIMIT+$i))
		#echo -n $FULLSTRING | awk -v charlimit="$LIMIT" -v start="$i" '{print substr($0,start,charlimit)}'

		# If we have shown the full string, start over
		if [ $i -eq $(($INPUT_LENGTH+$SEPERATOR_LENGTH)) ]; then
			i=0
		fi


		i=$(($i+1))
	fi

	# For fat bars/panels, I add this newline so the previous output is not visible
	echo ""

	sleep 1
done

# general method to exlude fields
# awk -v skipstart=1 -v skipend=1 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}'