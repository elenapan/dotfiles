-- Provides:
-- evil::weather
--      temperature (integer)
--      description (string)
--      icon_code (string)
local awful = require("awful")

-- Configuration
local key = user.openweathermap_key
local city_id = user.openweathermap_city_id
local units = user.weather_units
-- Don't update too often, because your requests might get blocked for 24 hours
local update_interval = 1200

local weather_details_script = [[
    bash -c '
    KEY="]]..key..[["
    CITY="]]..city_id..[["
    UNITS="]]..units..[["
  
    weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$CITY&units=$UNITS")
  
    if [ ! -z "$weather" ]; then
        weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
        weather_icon=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
        weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1)
  
        echo "$weather_icon" "$weather_description"@@"$weather_temp"
    else
        echo "..."
    fi
  ']]

-- Periodically get weather info
awful.widget.watch(weather_details_script, update_interval, function(widget, stdout)
    local icon_code = string.sub(stdout, 1, 3)
    local weather_details = string.sub(stdout, 5)
    weather_details = string.gsub(weather_details, '^%s*(.-)%s*$', '%1')
    -- Replace "-0" with "0" degrees
    weather_details = string.gsub(weather_details, '%-0', '0')
    -- Capitalize first letter of the description
    weather_details = weather_details:sub(1,1):upper()..weather_details:sub(2)
    local description = weather_details:match('(.*)@@')
    local temperature = weather_details:match('@@(.*)')
    if icon_code == "..." then
        awesome.emit_signal("evil::weather", 999, "Weather unavailable", "")
    else
        awesome.emit_signal("evil::weather", tonumber(temperature), description, icon_code)
    end
end)
