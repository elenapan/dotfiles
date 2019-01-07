#!/bin/bash
# Control volume
# Requires pulseaudio
# AwesomeWM: Only sends a notification if the sidebar is not visible
# --------------------------

# Steps for raising/lowering volume
STEP=5
BIG_STEP=25

# Notification config
VOLUME_ICON=~/.config/awesome/themes/lovelace/icons/volume.png
MUTED_ICON=~/.config/awesome/themes/lovelace/icons/muted.png
NOTIF_ID=/tmp/volume-daemon-notification

if [[ "$1" = "up" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +$STEP%
elif [[ "$1" = "UP" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +$BIG_STEP%
elif [[ "$1" = "down" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -$STEP%
elif [[ "$1" = "DOWN" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -$BIG_STEP%
elif [[ "$1" = "toggle" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [[ "$1" = "reset" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ 50%
else
    echo "No argument."
fi

SIDEBAR_VISIBLE="$(awesome-client 'return sidebar.visible' | awk '{print $2}')"
# echo $SIDEBAR_VISIBLE
if [[ "$SIDEBAR_VISIBLE" == "false" ]]; then
    var=$(pactl list sinks)

    case $var in
        *'Mute: yes'*)
            out="off"
            ICON=$MUTED_ICON
            ;;
        *)
            # we want word splitting
            set -- ${var#*Volume:}
            out="$a$t$4"
            ICON=$VOLUME_ICON
    esac
    #echo "Volume: $out"
    notify-send --urgency low -R "$NOTIF_ID" -i $ICON "$out"
fi
