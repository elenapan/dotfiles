#!/bin/bash
# Focus specific window
# Default (no options): focus window that has a specific string in its title
# Focus by pid (-i): focus window that has a specific pid
# Focus by priority (-p): focuses the window with the highest priority, if it exists, else it focuses the next one etc.
# Use: focus.sh mystring
#      focus.sh -i pid
#	   focus.sh -p str1 str2 str3

if [[ "$1" = "-i" ]]; then
	# focus by pid
	PID="$(echo $2)"
	wmctrl -i -a $(wmctrl -lp | grep -v "$0" | grep $PID | awk '{print $1}') 
elif [[ "$1" = "-p" ]]; then
	for var in "${@:2}"
	do
	    WINDOWID="$(wmctrl -l | grep -v "$0" | grep -m 1 "$var" | awk '{print $1}')"
	    if [ ${#WINDOWID} -ne "0" ]; then
	    	wmctrl -i -a $WINDOWID
	    	break
	    fi
	done
else
	# focus by string in window title
	WINDOWID="$(wmctrl -l | grep -v "$0" | grep -m 1 "$1" | awk '{print $1}')"
	wmctrl -i -a $WINDOWID
fi



# if [[ $(ls -A) ]]; then
#     echo "there are files"
# else
#     echo "no files found"
# fi