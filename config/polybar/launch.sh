#!/usr/bin/env sh

killall -q polybar

polybar_proc=$(pgrep -u $UID -x polybar)

# Terminate already running bar instances
if [ $polybar_proc ] ; then
    for i in ${polybar_proc} ; do
        kill -9 $i
    done
fi

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar top & bottom
polybar top &
polybar bottom &

echo "Bars launched..."
