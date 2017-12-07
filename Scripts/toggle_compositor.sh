#!/bin/bash
# Run compton only if it is not already running.
COMPTON="$(ps cax | grep compton)"
if [ ${#COMPTON} -eq "0" ]; then
  #echo "compton is not running."
  # run compton
  compton -f -c &
else
  killall compton
fi
