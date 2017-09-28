#!/bin/bash

# Run as follows: ./scrolling_title string
# It will look for "string" in all active windows and display the window title that includes this string.
# Case sensitive!

# Limit for scrolling text
LIMIT=30
#SEPERATOR=" --- "
#SEPERATOR=" -- "
#SEPERATOR=" ~~~ "
SEPERATOR=" ~~ "
#SEPERATOR=" <> "
SEPERATOR_LENGTH="$(echo ${#SEPERATOR})"

i=1
while :
do  
	# For debugging purposes
	printf "|%02d|" $i

	INPUT="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 $1 | awk -v skipstart=3 -v skipend=0 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"

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

	if [ $INPUT_LENGTH -le $LIMIT ]; then
		# Song has a smaller title than the limit, so no need to scroll.
		echo -n "  "
		#echo -e -n "$INPUT"

		#Justify - left
		#SPACES=$(($LIMIT-$INPUT_LENGTH+1))
		#echo -n "$INPUT" | awk -v spaces=$SPACES '{printf "%s%*.s\n", $0, spaces, " "}'

		#Justify - center
		SPACES_AFTER=$(($LIMIT-$(((${#INPUT}+$LIMIT)/2))))
		printf "%*s\n" $(((${#INPUT}+$LIMIT)/2 + 1)) "$INPUT" | awk -v spaces=$SPACES_AFTER '{printf "%s%*.s\n", $0, spaces, " "}'

	else
		LOOPTAIL="$(echo $INPUT | cut -c -$LIMIT)"
		FULLSTRING="$(echo "$INPUT$SEPERATOR$LOOPTAIL")"
		#FULLSTRING="$(echo $INPUT | sed "s/$/$SEPERATOR/" | sed "s/$/$LOOPTAIL/" )"


		# This is to prevent the bug when song changes and current i is larger than current song length
		# (Not needed anymore, this bug was fixed differently)
		# if [ $i -gt "${#FULLSTRING}" ]; then
		# 	i=1
		# fi

		echo -n "  "
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
