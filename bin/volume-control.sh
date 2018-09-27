#!/bin/bash
# Control volume
# Requires pulseaudio
# --------------------------

# Steps for raising/lowering volume
STEP=5
BIG_STEP=25

if [[ "$1" = "up" ]]; then
    pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ +$STEP%
elif [[ "$1" = "UP" ]]; then
    pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ +$BIG_STEP%
elif [[ "$1" = "down" ]]; then
    pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ -$STEP%
elif [[ "$1" = "DOWN" ]]; then
    pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ -$BIG_STEP%
elif [[ "$1" = "toggle" ]]; then
    pactl set-sink-mute 0 toggle
else
    echo "No argument."
fi
