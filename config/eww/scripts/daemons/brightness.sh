#!/bin/sh
update() {
    eww update brightness=$(light -G)
}

update
if [ "$1" == "oneshot" ]; then
    exit
fi

while (inotifywait -e modify /sys/class/backlight/?*/brightness -qq) do update; done
