#df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'

# show only free space
#df -k -h . | awk '$NF=="/"{printf " %dGB\n", ($2-$3)}'

df -k -h /dev/sda1 | tail -1 | awk '{printf " %sB\n", $4}' 
