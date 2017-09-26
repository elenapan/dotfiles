#!/bin/bash
weatherURL='http://www.accuweather.com/en/us/buffalo-ny/78701/weather-forecast/351193'
TEMP="$(wget -q -O- "$weatherURL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12"°F" }'| head -1)"
echo " $TEMP"