#!/bin/bash
# Screen recording script
# Uses ffmpeg

RECORDINGS_DIR=~/Videos/Rec
SCREEN_RESOLUTION=1366x768
FPS=60

TIMESTAMP="$(date +%Y.%m.%d-%H.%M.%S)"
FILENAME=$RECORDINGS_DIR/$TIMESTAMP.screenrec.mp4
REC_ICON_PATH=~/.icons/oomox-only_icons/categories/scalable/applications-multimedia.svg

notify-send "Screen is being recorded." --urgency low -i $REC_ICON_PATH
ffmpeg -f x11grab -s $SCREEN_RESOLUTION -r $FPS -i :0.0 -vcodec libx264 -preset medium -crf 22 -y $FILENAME
notify-send "Screen recording over." --urgency low -i $REC_ICON_PATH

