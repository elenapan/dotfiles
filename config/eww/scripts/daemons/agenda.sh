#!/usr/bin/env bash

org_files=("$HOME/notes/todo.org" "$HOME/notes/birthdays.org" "$HOME/notes/finance.org" "$HOME/notes/health.org" "$HOME/notes/home.org")

update() {
    ~/.config/eww/scripts/agenda.py "${org_files[@]}"
    ~/.config/eww/scripts/cal.py
}

if [ "$1" == "oneshot" ]; then
    update
    exit
fi

(while (true) do
   update
    sleep 1m
done)&

while true; do
    inotifywait -qq -e modify "${org_files[@]}"
    update;
done
