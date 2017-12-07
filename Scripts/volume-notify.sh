#!/bin/bash
VOL="$(pactl list sinks | grep "Volume: " | awk '{print $5}' | head -1)"
MUTE="$(pactl list sinks | grep -i "mute" | head -1 | awk '{print $2}')"

if [[ "$MUTE" != "no" ]]; then
	notify-send " Volume is muted"
else
	notify-send " Volume is at $VOL"
fi