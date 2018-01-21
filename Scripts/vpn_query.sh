# Replace with your own interface name here
VPN_IF="tap"
VPN="$(ifconfig -a | grep $VPN_IF)"

if [ ${#VPN} -eq "0" ]; then
	#echo "vpn off"
	# echo "VPN N"
	# echo "vpn "
	echo "vpn "
else
	# echo "vpn "
	echo "vpn "
	# echo "VPN Y"
fi
