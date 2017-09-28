# Scrolling text
LIMIT=12
SEPERATOR=" ~~~ "
SEPERATOR_LENGTH="$(echo ${#SEPERATOR})"

i=1
while :
do
	# Get input and create the full string that will be used
	INPUT="$@"
	INPUT_LENGTH="$(echo ${#INPUT})"
	LOOPTAIL="$(echo $INPUT | cut -c -$LIMIT)"
	FULLSTRING="$(echo "$INPUT$SEPERATOR$LOOPTAIL")"

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

		echo -n "  "
		# Show only LIMIT characters, from i to i+LIMIT. Output scrolls due to incrementing i
		echo -n $FULLSTRING | cut -c $i-$(($LIMIT+$i))
		#echo -n $FULLSTRING | awk -v charlimit="$LIMIT" -v start="$i" '{print substr($0,start,charlimit)}'

		# If we have shown the full string, start over
		if [ $i -eq $(($INPUT_LENGTH+$SEPERATOR_LENGTH)) ]; then
			i=0
		fi

		i=$(($i+1))
	fi

	sleep 1
done