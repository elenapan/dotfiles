local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Set colors
local active_color = beautiful.brightness_bar_active_color or "#5AA3CC"
local background_color = beautiful.brightness_bar_background_color or "#222222"

local brightness_bar = wibox.widget{
    max_value     = 100,
    value         = 50,
    forced_height = dpi(10),
    margins       = {
        top = dpi(8),
        bottom = dpi(8),
    },
    forced_width  = dpi(200),
    shape         = gears.shape.rounded_bar,
    bar_shape     = gears.shape.rounded_bar,
    color         = active_color,
    background_color = background_color,
    border_width  = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
}

awesome.connect_signal("evil::brightness", function (value)
    brightness_bar.value = value
end)

return brightness_bar
