#!/bin/sh
file="$(find /sys/class/power_supply/A*/online)"

update() {
    if [[ $(<$file) == "1" ]]; then
        eww update charger=true
    else
        eww update charger=false
    fi
}

update
if [ "$1" == "oneshot" ]; then
    exit
fi

acpi_listen | grep --line-buffered ac_adapter | while read -r line ; do
    update
done
