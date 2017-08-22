# Focuses the first window with some string in its title
# Use: focus.sh mystring
WINDOWID="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 "$1" | awk '{print $1}')"
wmctrl -i -a $WINDOWID
