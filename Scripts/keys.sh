#!/bin/bash
#XSET_OUTPUT="$(xset -q)"
#KEYS="$(echo $XSET_OUTPUT | grep Caps | awk '{print $4 " " $8;}')"
#CAPS="$(echo $KEYS | awk '{if ($1 == "off") {print ""} else {print ""}}')" 
#NUM="$(echo $KEYS | awk '{if ($2 == "off") {print ""} else {print ""}}')"
#echo " "$CAPS $NUM $LANG

# if [ $LANG_CODE -gt "1000" ]; then
# 	# greek is around 1000-1003, and i only have gr and en so this is enough
# 	LANG="gr"
# else
# 	# english
# 	LANG="en"
# fi

#LANG_CODE="$(xset -q | grep LED | awk '{print $10}')"
LANG="$(xset -q | grep LED | awk '{if ($10 >= 1000) {print "gr"} else {print "en"}}')"

echo " $LANG "





# 
#    C N
#    both off
#    num on
#    caps on
#    both on