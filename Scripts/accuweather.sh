#!/bin/bash
URL='https://www.accuweather.com/en/us/buffalo-ny/14202/weather-forecast/349726'
#TEMP="$(wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°F" }'| head -1)"
TEMP="$(wget -q -O- "$URL" | grep temp_f | awk '{print $3}' | cut -d "'" -f 2)"

echo "  $TEMP°F"
