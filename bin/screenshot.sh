#!/bin/bash
# Screenshot wrapper
# Uses maim (which uses slop)
# "Friendship ended with scrot. Now maim is my best friend."

SCREENSHOTS_DIR=~/pix/Screenshots
TIMESTAMP="$(date +%Y.%m.%d-%H.%M.%S)"
#TIMESTAMP="$(date +%Y.%m.%d--%s)"
FILENAME=$SCREENSHOTS_DIR/$TIMESTAMP.screenshot.png
PHOTO_ICON_PATH=~/.icons/oomox-only_icons/categories/scalable/applications-photography.svg


# -u option hides cursor
# -m option changes the compression level
#   -m 3 takes the shot faster but the file size is slightly bigger

if [[ "$1" = "-s" ]]; then
    # Area/window selection.
    notify-send 'Select area to capture.' --urgency low -i $PHOTO_ICON_PATH
    maim -u -m 3 -s $FILENAME
    if [[ "$?" = "0" ]]; then
        notify-send "Screenshot taken." --urgency low -i $PHOTO_ICON_PATH
    fi
elif [[ "$1" = "-c" ]]; then
    notify-send 'Select area to copy to clipboard.' --urgency low -i $PHOTO_ICON_PATH
    # Copy selection to clipboard
    #maim -u -m 3 -s | xclip -selection clipboard -t image/png
    maim -u -m 3 -s /tmp/maim_clipboard
    if [[ "$?" = "0" ]]; then
        xclip -selection clipboard -t image/png /tmp/maim_clipboard
        notify-send "Copied selection to clipboard." --urgency low -i $PHOTO_ICON_PATH
        rm /tmp/maim_clipboard
    fi
elif [[ "$1" = "-b" ]]; then
    # Browse with feh
    cd $SCREENSHOTS_DIR ; feh $(ls -t) &
elif [[ "$1" = "-e" ]]; then
    # Edit last screenshot with GIMP
    cd $SCREENSHOTS_DIR ; gimp $(ls -t | head -n1) & notify-send 'Opening last screenshot with GIMP' --urgency low -i ~/.icons/oomox-only_icons/categories/scalable/applications-painting.svg
else
    # Full screenshot
    maim -u -m 3 $FILENAME
    notify-send "Screenshot taken." --urgency low -i $PHOTO_ICON_PATH
fi
