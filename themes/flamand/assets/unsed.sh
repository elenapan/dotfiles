#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#0D0D0D/g' \
         -e 's/rgb(100%,100%,100%)/#DBDCDF/g' \
    -e 's/rgb(50%,0%,0%)/#0D0D0D/g' \
     -e 's/rgb(0%,50%,0%)/#DBDCDF/g' \
 -e 's/rgb(0%,50.196078%,0%)/#DBDCDF/g' \
     -e 's/rgb(50%,0%,50%)/#0D0D0D/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#0D0D0D/g' \
     -e 's/rgb(0%,0%,50%)/#DBDCDF/g' \
	$@
