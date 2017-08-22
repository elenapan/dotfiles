# Focuses the first youtube window
WINDOWID="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "YouTube" | awk '{print $1}')"
wmctrl -i -a $WINDOWID
