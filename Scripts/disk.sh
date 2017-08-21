#df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'

# show only free space
df -h | awk '$NF=="/"{printf " %dGB\n", ($2-$3)}'