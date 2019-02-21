local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local naughty = require("naughty")
local helpers = require("helpers")

-- Configuration
-- Get your key and find your city id at https://openweathermap.org/
-- You will need to make an account!
local key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
local city_id = "yyyyyy"
local units = "metric"
local symbol = "°C"
-- Don't update too often, because your requests might get blocked for 24 hours
local update_interval = 1200         -- in seconds

-- Text icons
local sun_icon = ""
local moon_icon = ""
local dcloud_icon = ""
local ncloud_icon = ""
local cloud_icon = ""
local rain_icon = ""
local storm_icon = ""
local snow_icon = ""
local mist_icon = ""
local whatever_icon = ""

local weather_text = wibox.widget{
    text = "Loading weather...",
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather_icon = wibox.widget.textbox()
local weather_icon = wibox.widget{
    text = whatever_icon,
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather = wibox.widget{
  weather_icon,
  weather_text,
  spacing = dpi(8),
  layout = wibox.layout.fixed.horizontal
}

local function update_widget(icon_code, weather_details)
  -- Set icon
  if string.find(icon_code, "01d") then
    weather_icon.markup = helpers.colorize_text(sun_icon, beautiful.xcolor3)
  elseif string.find(icon_code, "01n") then
    weather_icon.markup = helpers.colorize_text(moon_icon, beautiful.xcolor4)
  elseif string.find(icon_code, "02d") then
    weather_icon.markup = helpers.colorize_text(dcloud_icon, beautiful.xcolor3)
  elseif string.find(icon_code, "02n") then
    weather_icon.markup = helpers.colorize_text(ncloud_icon, beautiful.xcolor6)
  elseif string.find(icon_code, "03") or string.find(icon_code, "04") then
    weather_icon.markup = helpers.colorize_text(cloud_icon, beautiful.xcolor1)
  elseif string.find(icon_code, "09") or string.find(icon_code, "10") then
    weather_icon.markup = helpers.colorize_text(rain_icon, beautiful.xcolor4)
  elseif string.find(icon_code, "11") then
    weather_icon.markup = helpers.colorize_text(storm_icon, beautiful.xcolor1)
  elseif string.find(icon_code, "13") then
    weather_icon.markup = helpers.colorize_text(snow_icon, beautiful.xcolor6)
  elseif string.find(icon_code, "50") or string.find(icon_code, "40") then
    weather_icon.markup = helpers.colorize_text(mist_icon, beautiful.xcolor7)
  else
    weather_icon.markup = helpers.colorize_text(whatever_icon, beautiful.xcolor2)
  end

  -- Set text --
  -- Replace -0 with 0 degrees
  weather_details = string.gsub(weather_details, '%-0', '0')
  -- Capitalize first letter of the description
  weather_details = weather_details:sub(1,1):upper()..weather_details:sub(2)
  weather_text.markup = weather_details
end

local weather_details_script = [[
  bash -c '
  KEY="]]..key..[["
  CITY="]]..city_id..[["
  UNITS="]]..units..[["
  SYMBOL="]]..symbol..[["

  weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$CITY&units=$UNITS")

  if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
    weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1)

    echo "$weather_icon" "$weather_description" "$weather_temp$SYMBOL"
  else
    echo "... Info unavailable"
  fi
']]

awful.widget.watch(weather_details_script, update_interval, function(widget, stdout)
                     local icon_code = string.sub(stdout, 1, 3)
                     local weather_details = string.sub(stdout, 5)
                     weather_details = string.gsub(weather_details, '^%s*(.-)%s*$', '%1')
                     update_widget(icon_code, weather_details)
end)

return weather
