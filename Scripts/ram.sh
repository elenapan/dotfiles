# Icon and percentage
#free -m | awk 'NR==2{printf " %d%%\n", $3*100/$2 }'

# Text and percentage
#free -m | awk 'NR==2{printf "mem %d%%\n", $3*100/$2 }'

# Full
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'


#  
