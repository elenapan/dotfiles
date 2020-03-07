local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local weather_temperature_symbol
if user.weather_units == "metric" then
    weather_temperature_symbol = "°C"
elseif user.weather_units == "imperial" then
    weather_temperature_symbol = "°F"
end

-- Text icons
-- 'Typicons' font
-- local sun_icon = ""
-- local moon_icon = ""
-- local dcloud_icon = ""
-- local ncloud_icon = ""
-- local cloud_icon = ""
-- local rain_icon = ""
-- local storm_icon = ""
-- local snow_icon = ""
-- local mist_icon = ""
-- local whatever_icon = ""

-- 'Icomoon' font (filled variant)
local sun_icon = ""
local moon_icon = ""
local dcloud_icon = ""
local ncloud_icon = ""
local cloud_icon = ""
local rain_icon = ""
local storm_icon = ""
local snow_icon = ""
local mist_icon = ""
local whatever_icon = ""

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
    local icon
    local color
    -- Set icon and color depending on icon_code
    if string.find(icon_code, "01d") then
        icon = sun_icon
        color = x.color3
    elseif string.find(icon_code, "01n") then
        icon = moon_icon
        color = x.color4
    elseif string.find(icon_code, "02d") then
        icon = dcloud_icon
        color = x.color3
    elseif string.find(icon_code, "02n") then
        icon = ncloud_icon
        color = x.color6
    elseif string.find(icon_code, "03") or string.find(icon_code, "04") then
        icon = cloud_icon
        color = x.color1
    elseif string.find(icon_code, "09") or string.find(icon_code, "10") then
        icon = rain_icon
        color = x.color4
    elseif string.find(icon_code, "11") then
        icon = storm_icon
        color = x.color1
    elseif string.find(icon_code, "13") then
        icon = snow_icon
        color = x.color6
    elseif string.find(icon_code, "50") or string.find(icon_code, "40") then
        icon = mist_icon
        color = x.color5
    else
        icon = whatever_icon
        color = x.color2
    end

    weather_icon.markup = helpers.colorize_text(icon, color)
    weather_description.markup = description
    weather_temperature.markup = temperature
    -- weather_temperature.markup = helpers.colorize_text(tostring(temperature)..weather_temperature_symbol, color)
end)

return weather
