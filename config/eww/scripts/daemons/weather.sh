#!/usr/bin/env bash
eww="$HOME/.config/eww/scripts"
# Get location from pass vault
location="$(pass-field wttr.in location)"
# Or hardcode it
# location="Moscow,Russia"

# Associative array with weather icon codes and icons
# https://github.com/chubin/wttr.in/blob/master/lib/constants.py
declare -A icons
icons[113]="" # Sunny
icons[116]="" # PartlyCloudy
icons[119]="" # Cloudy
icons[122]="" # VeryCloudy
icons[143]="" # Fog
icons[176]="" # LightShowers
icons[179]="" # LightSleetShowers
icons[182]="" # LightSleet
icons[185]="" # LightSleet
icons[200]="" # ThunderyShowers
icons[227]="" # LightSnow
icons[230]="" # HeavySnow
icons[248]="" # Fog
icons[260]="" # Fog
icons[263]="" # LightShowers
icons[266]="" # LightRain
icons[281]="" # LightSleet
icons[284]="" # LightSleet
icons[293]="" # LightRain
icons[296]="" # LightRain
icons[299]="" # HeavyShowers
icons[302]="" # HeavyRain
icons[305]="" # HeavyShowers
icons[308]="" # HeavyRain
icons[311]="" # LightSleet
icons[314]="" # LightSleet
icons[317]="" # LightSleet
icons[320]="" # LightSnow
icons[323]="" # LightSnowShowers
icons[326]="" # LightSnowShowers
icons[329]="" # HeavySnow
icons[332]="" # HeavySnow
icons[335]="" # HeavySnowShowers
icons[338]="" # HeavySnow
icons[350]="" # LightSleet
icons[353]="" # LightShowers
icons[356]="" # HeavyShowers
icons[359]="" # HeavyRain
icons[362]="" # LightSleetShowers
icons[365]="" # LightSleetShowers
icons[368]="" # LightSnowShowers
icons[371]="" # HeavySnowShowers
icons[374]="" # LightSleetShowers
icons[377]="" # LightSleet
icons[386]="" # ThunderyShowers
icons[389]="" # ThunderyHeavyRain
icons[392]="" # ThunderySnowShowers
icons[395]="" # HeavySnowShowers
icons[placeholder]=""
icons[error]=""

if [ -z "$location" ]; then
    eww update \
        weather-temperature="--" \
        weather-description="Weather location unset" \
        weather-icon="${icons[error]}"
    exit 1
fi

update() {
    # weather=$(curl -sf "https://wttr.in/${location}?format=j1")
    weather=$(wget -O - "https://wttr.in/${location}?format=j1" 2>/dev/null)

    if [ -n "$weather" ]; then
        weather_temp=$(jq -r ".current_condition[0].temp_C" <<< "$weather")
        weather_icon=$(jq -r ".current_condition[0].weatherCode" <<< "$weather")
        weather_description=$(jq -r ".current_condition[0].weatherDesc[0].value" <<< "$weather")

        eww update \
            weather-temperature="$weather_temp" \
            weather-description="$weather_description" \
            weather-icon="${icons[$weather_icon]}"
        true
    else
        eww update \
            weather-temperature="--" \
            weather-description="Weather request failed" \
            weather-icon="${icons[error]}"
        false
    fi
}

if [ "$1" == "oneshot" ]; then
    update
    exit
fi

while true; do
    if update; then
        # Update succeeded, try again in 20 minutes.
        # Use safe-sleep to fix the case when the machine is resumed after
        # suspend which might cause up to 20m delay until the next update.
        "${eww}/safe-sleep" 20m with-interval 10
    else
        # Update failed, retry in 30 seconds.
        sleep 30
    fi
done
