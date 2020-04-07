local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local icons = require("icons")

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

local weather_icons = {
    ["01d"] = icons.sun,
    ["01n"] = icons.star,
    ["02d"] = icons.dcloud,
    ["02n"] = icons.ncloud,
    ["03d"] = icons.cloud,
    ["03n"] = icons.cloud,
    ["04d"] = icons.cloud,
    ["04n"] = icons.cloud,
    ["09d"] = icons.rain,
    ["09n"] = icons.rain,
    ["10d"] = icons.rain,
    ["10n"] = icons.rain,
    ["11d"] = icons.storm,
    ["11n"] = icons.storm,
    ["13d"] = icons.snow,
    ["13n"] = icons.snow,
    ["40d"] = icons.mist,
    ["40n"] = icons.mist,
    ["50d"] = icons.mist,
    ["50n"] = icons.mist,
    ["_"] = icons.whatever,
}

awesome.connect_signal("evil::weather", function(temperature, description, icon_code)
    if weather_icons[icon_code] then
        weather_icon.image = weather_icons[icon_code]
    else
        weather_icon.image = weather_icons['_']
    end

    weather_text.markup = description.." "..tostring(temperature)..weather_temperature_symbol
end)

return weather
