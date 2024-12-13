#!/bin/sh
# Reachable + battery state of device linked with KDEconnect
# This helped a lot:
# https://github.com/haideralipunjabi/polybar-kdeconnect/blob/master/polybar-kdeconnect.sh

# Find (first) device ID
deviceid="$(qdbus org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices | head -1)"

# TODO (someday): Multiple devices
# for deviceid in $(qdbus org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices); do
#     echo $deviceid
# done

update() {
  # name="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.name)"
  reachable="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.isReachable)"
  if [[ "$reachable" == "true" ]]; then
    battery="$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/${deviceid}/battery org.kde.kdeconnect.device.battery.charge | tr -d '\n')"
    eww update kdeconnect-battery=$battery kdeconnect-reachable=1
  else
    eww update kdeconnect-reachable=0
  fi
}

if [ "$1" == "oneshot" ]; then
    update
    exit
fi

while true; do
  update
  sleep 15
done

# To get all methods, properties and signals use this:
# qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid"

# TODO (someday) Instead of polling, we could subscribe to 'reachable' changes
# dbus-monitor "type='signal',interface='org.kde.kdeconnect.device',member='reachableChanged'" |
# while read -r line; do
#     if [[ "$line" == *"boolean true"* ]]; then
#         echo "Device is reachable"
#     elif [[ "$line" == *"boolean false"* ]]; then
#         echo "Device is not reachable"
#     fi
# done
