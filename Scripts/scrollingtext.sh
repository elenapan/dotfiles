# Scrolling text v2
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
	FULLSTRING="$(echo $INPUT | sed "s/$/$SEPERATOR/" | sed "s/$/$LOOPTAIL/" )"
	
	# Show only LIMIT characters. Output scrolls due to incrementing i
	echo -n $FULLSTRING | cut -c $i-$(($LIMIT+$i))

	# If we have shown the full string, start over
	if [ $i -eq $(($INPUT_LENGTH+$SEPERATOR_LENGTH)) ]; then
		i=0
	fi

	i=$(($i+1))
	sleep 1
done