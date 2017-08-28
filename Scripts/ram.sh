free -m | awk 'NR==2{printf " %d%%\n", $3*100/$2 }'
#  