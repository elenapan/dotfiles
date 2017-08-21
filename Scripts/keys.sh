KEYS="$(xset -q | grep Caps | awk '{print $4 " " $8;}')"
CAPS="$(echo $KEYS | awk '{if ($1 == "off") {print ""} else {print ""}}')" 
NUM="$(echo $KEYS | awk '{if ($2 == "off") {print ""} else {print ""}}')" 

echo " "$CAPS $NUM

#    C N
#    both off
#    num on
#    caps on
#    both on