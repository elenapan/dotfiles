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

local weather_icon = wibox.widget.imagebox(icons.image.whatever)
weather_icon.resize = true
weather_icon.forced_width = 40
weather_icon.forced_height = 40

local weather = wibox.widget{
    weather_icon,
    weather_text,
    layout = wibox.layout.fixed.horizontal
}

local weather_icons = {
    ["01d"] = icons.image.sun,
    ["01n"] = icons.image.star,
    ["02d"] = icons.image.dcloud,
    ["02n"] = icons.image.ncloud,
    ["03d"] = icons.image.cloud,
    ["03n"] = icons.image.cloud,
    ["04d"] = icons.image.cloud,
    ["04n"] = icons.image.cloud,
    ["09d"] = icons.image.rain,
    ["09n"] = icons.image.rain,
    ["10d"] = icons.image.rain,
    ["10n"] = icons.image.rain,
    ["11d"] = icons.image.storm,
    ["11n"] = icons.image.storm,
    ["13d"] = icons.image.snow,
    ["13n"] = icons.image.snow,
    ["40d"] = icons.image.mist,
    ["40n"] = icons.image.mist,
    ["50d"] = icons.image.mist,
    ["50n"] = icons.image.mist,
    ["_"] = icons.image.whatever,
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
