local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local weather_temperature_symbol
if user.weather_units == "metric" then
    weather_temperature_symbol = "°C"
elseif user.weather_units == "imperial" then
    weather_temperature_symbol = "°F"
end

local weather_text = wibox.widget{
    text = "Weather unavailable",
    -- align  = 'center',
    valign = 'center',
    -- font = "sans 14",
    widget = wibox.widget.textbox
}

local weather_icon = wibox.widget.imagebox(icons.whatever)
weather_icon.resize = true
weather_icon.forced_width = 40
weather_icon.forced_height = 40

local weather = wibox.widget{
    weather_icon,
    weather_text,
    layout = wibox.layout.fixed.horizontal
}

awesome.connect_signal("evil::weather", function(temperature, description, icon_code)
    -- Set icon
    if string.find(icon_code, "01d") then
        weather_icon.image = icons.sun
    elseif string.find(icon_code, "01n") then
        weather_icon.image = icons.star
    elseif string.find(icon_code, "02d") then
        weather_icon.image = icons.dcloud
    elseif string.find(icon_code, "02n") then
        weather_icon.image = icons.ncloud
    elseif string.find(icon_code, "03") or string.find(icon_code, "04") then
        weather_icon.image = icons.cloud
    elseif string.find(icon_code, "09") or string.find(icon_code, "10") then
        weather_icon.image = icons.rain
    elseif string.find(icon_code, "11") then
        weather_icon.image = icons.storm
    elseif string.find(icon_code, "13") then
        weather_icon.image = icons.snow
    elseif string.find(icon_code, "50") or string.find(icon_code, "40") then
        weather_icon.image = icons.mist
    else
        weather_icon.image = icons.whatever
    end

    weather_text.markup = description.." "..tostring(temperature)..weather_temperature_symbol
end)

return weather
