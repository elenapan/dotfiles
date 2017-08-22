# Prints the title of the first open YouTube window
# It works if the tab is in focus, so seperate the youtube tab from 
# the rest of the browser so you don't have to keep it in focus and the script will work.

OUTPUT="$(wmctrl -l | grep -v "wmctrl" | grep -m 1 YouTube | awk -v skipstart=3 -v skipend=4 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS};}')"
if [ "$OUTPUT" = "" ]; then
	echo " "
else
	echo " $OUTPUT" | head -c 35
fi

# general method to exlude fields
# awk -v skipstart=1 -v skipend=1 '{delim = ""; for (i=skipstart+1;i<=NF-skipend;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}'