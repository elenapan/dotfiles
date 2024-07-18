local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local icons = require("icons")
local get_weather_icon = icons.text.get_weather_icon

local weather_temperature_symbol
if user.weather_units == "metric" then
    weather_temperature_symbol = "°C"
elseif user.weather_units == "imperial" then
    weather_temperature_symbol = "°F"
end

local weather_description = wibox.widget{
    -- text = "Weather unavailable",
    text = "Loading weather...",
    -- align  = 'center',
    valign = 'center',
    -- font = "sans 14",
    widget = wibox.widget.textbox
}

local weather_icon = wibox.widget{
    text = whatever_icon,
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather_temperature = wibox.widget{
    text = "  ",
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather = wibox.widget{
    weather_icon,
    weather_description,
    weather_temperature,
    spacing = dpi(8),
    layout = wibox.layout.fixed.horizontal
}

awesome.connect_signal("evil::weather", function(temperature, description, icon_code)
    local icon = get_weather_icon(icon_code, "filled")
    local symbol = icon.symbol
    local color = icon.color

    weather_icon.markup = helpers.colorize_text(symbol, color)
    weather_description.markup = description
    weather_temperature.markup = temperature
    -- weather_temperature.markup = helpers.colorize_text(tostring(temperature)..weather_temperature_symbol, color)
end)

return weather
