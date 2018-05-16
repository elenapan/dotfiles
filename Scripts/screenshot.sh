#!/bin/bash
# Screenshot wrapper
# Uses maim (which uses slop)
# "Friendship ended with scrot. Now maim is my best friend."

SCREENSHOTS_DIR=~/Pictures/Screenshots
TIMESTAMP="$(date +%Y.%m.%d-%H.%M.%S)"
FILENAME=$SCREENSHOTS_DIR/$TIMESTAMP.screenshot.png
PHOTO_ICON_PATH=~/.icons/oomox-only_icons/categories/scalable/applications-photography.svg


# -u option hides cursor

if [[ "$1" = "-s" ]]; then
    # Area/window selection.
	notify-send 'Select area or window to capture.' --urgency low -i $PHOTO_ICON_PATH
    maim -u -s $FILENAME
	notify-send "Screenshot taken." --urgency low -i $PHOTO_ICON_PATH
elif [[ "$1" = "-c" ]]; then
    # Copy selection to clipboard
    maim -u -s | xclip -selection clipboard -t image/png
	notify-send "Copied selection to clipboard." --urgency low -i $PHOTO_ICON_PATH
else
    # Full screenshot
	maim -u $FILENAME
	notify-send "Screenshot taken." --urgency low -i $PHOTO_ICON_PATH
fi
