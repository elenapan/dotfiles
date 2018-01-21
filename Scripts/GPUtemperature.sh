#!/bin/bash
#
TEMP="$(nvidia-settings -q all | grep "Attribute 'ThermalSensorReading'" -m 1 | awk '{print $4}')"

# With icon
# echo " $TEMP"

# Just text
if [ ${#TEMP} -eq "0" ]; then
	# Print CPU temp if nvidia card is disabled
	~/Scripts/temperature.sh
else
	echo " ${TEMP%?}°C"
	# echo "HEAT ${TEMP%?}°C"
fi
#echo "gpu ${TEMP%?}°C"
