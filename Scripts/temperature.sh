#
TEMP="$(sensors | grep "Package" | awk '{print $4}' | cut -c 2-3,6-8)"

# With icon
echo " $TEMP"

# Just text
# echo "HEAT $TEMP"
