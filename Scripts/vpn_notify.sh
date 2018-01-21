# Replace with your own interface name here
VPN_IF="tap"
VPN="$(ifconfig -a | grep $VPN_IF)"

if [ ${#VPN} -eq "0" ]; then
	notify-send "VPN status:" "Disabled" --icon=dialog-information
else
	notify-send "VPN status:" "Enabled" --icon=dialog-information
fi
