#!/bin/sh
update() {
    eww update uptime="$(uptime -p | sed 's/^...//;s/ weeks\?,/w/;s/ days\?,/d/;s/ hours\?,/h/;s/ minutes\?/m/')"
}

if [ "$1" == "oneshot" ]; then
    update
    exit
fi

while true; do
    update
    sleep 1m
done
