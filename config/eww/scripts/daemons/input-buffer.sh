#!/usr/bin/env bash
# This script is started by the init script for each eww widget that can accepts
# input.
widget=$1 # Widget name e.g. alarms
sink=$2 # Path to sink script, e.g. input-sink-alarms.sh

pipe=/tmp/eww-widget-input-pipe-${widget}

[ ! -p $pipe ] && mkfifo $pipe

tail -f $pipe | while IFS= read -r cmd; do
    eval "$cmd"
done
