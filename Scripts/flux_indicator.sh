#!/bin/bash
REDSHIFT="$(ps cax | grep redshift)"
if [ ${#REDSHIFT} -eq "0" ]; then
  #echo "redshift is not running."
  # run redshift
  echo "  "
else
  echo "  "
fi
