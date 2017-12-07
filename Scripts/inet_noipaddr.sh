# needs work! not thoroughly tested...
# Replace with your own interface names here
WIRELESS_IF="wlp3s0"
WIRED_IF="enp2s0f0"

WIFI="$(ifconfig | grep -A 1 $WIRELESS_IF | grep "inet" | awk '{print $2}')"
ETHER="$(ifconfig | grep -A 1 $WIRED_IF | grep "inet" | awk '{print $2}')"

if [ ${#ETHER} -eq "0" ]; then
	if [ ${#WIFI} -eq "0" ]; then
		echo ""
	else
		echo ""
	fi
else
	echo ""
fi
