#upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
echo -n " "; upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2;}'