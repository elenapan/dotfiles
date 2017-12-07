#!/bin/bash
# needs work

CITY="Moscow"

# glyphs (TODO)
#  day cloud
#  storm
#  night cloud
#  rain 
# umbrella 
#  snow 
#  sun
#  cloud
#  moon  star ⏾ another moon
#   house
#  globe
#  bed

# curl -4 http://wttr.in/@$(curl -s 'https://api.ipify.org?format=plaintext')


TEMP="$(curl -s -A "Mozilla/5.0" wttr.in/$CITY | grep -m 1 '°C'| awk '{print $(NF-1)}' | cut -d ">" -f2 | cut -f1 -d "<")"

# NOTE: Currently weather state disabled (not fully implemented). Uncomment to reenable
# STATE="$(curl -s -A "Mozilla/5.0" wttr.in/$CITY | grep -m 1 -B 1 '°C' | sed '$d' | awk '{printf "%s %s", $(NF-1), $NF}')"
# PRELAST="$(echo $STATE | awk '{print $1}')"
# HOUR="$(date +%H)"

# # Check if state is only one word
# if [[ "$PRELAST" = "</span>" ]]; then
# 	STATE="$(echo $STATE | awk '{print $2}')"
# fi

# if [[ "$STATE" = "Clear" ]]; then
# 	if [ $HOUR -lt 20 ] && [ $HOUR -gt $5 ]; then
# 		echo " $TEMP°C"
# 	else
# 		echo " $TEMP°C"
# 	fi
# elif [[ "$STATE" = "Partly cloudy" ]]; then
# 	if [ $HOUR -lt 20 ] && [ $HOUR -gt 5 ]; then
# 		echo " $TEMP°C"
# 	else
# 		echo " $TEMP°C"
# 	fi
# elif [[ "$STATE" = "Cloudy" ]]; then
# 	echo " $TEMP°C"
# elif [[ "$STATE" = "Sunny" ]]; then
# 	echo " $TEMP°C"
# else
# 	echo " $TEMP°C"
# fi


# City+degrees
echo " $CITY $TEMP°C"

# Degrees only
#echo "$TEMP°C"

# Leaf + degrees
#echo "  $TEMP°C"