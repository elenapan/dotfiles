#!/bin/zsh
# upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
# glyphs:     

INFO="$(upower -i "$(upower -e | grep 'BAT')")"

STATE="$(echo $INFO | grep "state" | awk '{print $2}')"
# Note: I cut off the percentage sign so i can later compare POWER as an int
POWER="$(echo $INFO | grep "percentage" | awk '{print $2}' | head -c -2)"

# With icons
if [[ "$STATE" = "discharging" ]]; then
	if [ "$POWER" -ge "85" ]; then
		echo " $POWER%"
	elif [ "$POWER" -ge "60" ]; then
		echo " $POWER%"
	elif [ "$POWER" -ge "35" ]; then
		echo " $POWER%"
	elif [ "$POWER" -ge "10" ]; then
		echo " $POWER%"
	else
		echo " $POWER%"
	fi
else
	# State = fully charged or charging
	echo " $POWER%"
fi

# Without icons
# if [[ "$STATE" = "discharging" ]]; then
# 	echo "BAT* $POWER%"
# else
# 	# State = fully charged or charging
# 	echo "BAT $POWER%"
# fi
