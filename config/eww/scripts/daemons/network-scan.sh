#!/usr/bin/env bash
eww="$HOME/.config/eww/scripts"
update() {
    $eww/networks.sh scan
}

while true; do
    update
    "$eww/safe-sleep" 5m with-interval 10
done
