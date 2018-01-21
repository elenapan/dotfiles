#!/bin/bash
TEMP=3000
REDSHIFT="$(ps cax | grep redshift)"
if [ ${#REDSHIFT} -eq "0" ]; then
  #echo "redshift is not running."
  # run redshift
  redshift -l 0:0 -t $TEMP:$TEMP -r &
else
  killall redshift
fi
