#!/bin/bash
# Run compton only if it is not already running.
COMPTON="$(ps cax | grep compton)"
if [ ${#COMPTON} -eq "0" ]; then
  #echo "compton is not running."
  # run compton
  # compton -c &
  # compton &
  compton -c --shadow-exclude "class_g = 'Tint2'" -r 10
  # compton -c --shadow-exclude "class_g = 'Tint2'" --shadow-exclude "class_g = 'Dunst'" -r 1 --shadow-red 0.35 --shadow-green 0 -o 1 --shadow-blue 0.4 &
  # compton -c --shadow-exclude "class_g = 'Tint2'" -o 0.9 -r 10 -i 0.7 -f --active-opacity 0.9 --blur-background &
  # compton -i 0.7 -f --active-opacity 0.9 --blur-background &
  # compton --config ~/.config/compton/compton.conf
else
  killall compton
fi
