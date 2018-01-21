#!/bin/bash

#Get id of all non-floating windows on current desktop
WINDOWS="$(bspc query -N -d focused -n .window.\!floating)"

#Get id of currently focused window
FOCUSED="$(bspc query -N -d focused -n .\focused.window.\!floating)"

#Choose what format to use:
#-Show short output if there are more than one window on desktop
#-Show full output if there is only one window on desktop

if [[  $(wc -l <<< $WINDOWS) = 1 ]]; then
    FORMAT="-f3-"
else
    FORMAT="-f3"
fi

#Get WM_CLASS string from all IDs
for wid in $WINDOWS; do
	#Get window's class
	wclass="$(< "/proc/${1:-$(xdotool getwindowpid $wid)}/comm")"

	#Get window's name
	wname="$(xprop -id $wid WM_NAME | cut -d " " $FORMAT)"

	#Get rid of quotation marks
	wname="$(echo ${wname//\"})"

	#Uppercase first character of window class
	wname="$(tr '[:lower:]' '[:upper:]' <<< ${wname:0:1})${wname:1}"
	wclass="$(tr '[:lower:]' '[:upper:]' <<< ${wclass:0:1})${wclass:1}"

	#If window is focused - highlight it with green color
	#Use either $wmclass or $wmname to choose what to display
	if [[ "$wid" = "$FOCUSED" ]]; then
		win="$(printf "%s" "%{F#50fa7b} $wname%{F#ffffff}")"
	else
		win="%{T3}%{T-} $wname"
	fi

	windowlist="$windowlist $win"
done

#Result

echo "$windowlist"