notify-send 'Select area to capture.' --icon=/home/elena/.icons/oomox-wally-flat/apps/scalable/gnome-screenshot.svg  --urgency low
scrot -s '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/Pictures/Screenshots/';
notify-send "Screenshot taken." --icon=/home/elena/.icons/oomox-wally-flat/apps/scalable/gnome-screenshot.svg  --urgency low
