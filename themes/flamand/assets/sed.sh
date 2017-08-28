#!/bin/sh
sed -i \
         -e 's/#0D0D0D/rgb(0%,0%,0%)/g' \
         -e 's/#DBDCDF/rgb(100%,100%,100%)/g' \
    -e 's/#0D0D0D/rgb(50%,0%,0%)/g' \
     -e 's/#DBDCDF/rgb(0%,50%,0%)/g' \
     -e 's/#0D0D0D/rgb(50%,0%,50%)/g' \
     -e 's/#DBDCDF/rgb(0%,0%,50%)/g' \
	$@
