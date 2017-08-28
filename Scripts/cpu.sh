#!/bin/bash

#   
CPU="$[100-$(vmstat 1 2|tail -1|awk '{printf "%d", $15}')]"
GOVERNOR="$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"

if [[ "$GOVERNOR" == "performance" ]]; then
	echo " $CPU%"
else
	echo " $CPU%"
fi