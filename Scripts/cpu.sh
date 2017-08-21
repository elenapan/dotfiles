#!/bin/bash
CPU="$[100-$(vmstat 1 2|tail -1|awk '{printf "%d", $15}')]"
echo " $CPU%"