local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")

local stroke = x.background
-- local stroke = "#000000"
local transparent = "#00000000"
local happy_color = x.color2
local sad_color = x.color1
local ok_color = x.color3
local charging_color = x.color6

-- Not great not terrible
local ok_threshold = 45

local bar_shape = function()
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 9)
    end
end

local battery_bar = wibox.widget{
    max_value     = 100,
    value         = 50,
    forced_height = dpi(50),
    forced_width  = dpi(100),
    bar_shape     = gears.shape.rectangle,
    color         = happy_color,
    background_color = happy_color.."55",
    widget        = wibox.widget.progressbar,
}

local charging_icon = wibox.widget {
    font = "Material Icons 13",
    align = "right",
    markup = helpers.colorize_text("", stroke.."80"),
    widget = wibox.widget.textbox()
}

local eye_size = dpi(5)
local mouth_size = dpi(10)

local mouth_shape = function()
    return function(cr, width, height)
        gears.shape.pie(cr, width, height, 0, math.pi)
    end
end

local mouth_widget = wibox.widget {
    forced_width = mouth_size,
    forced_height = mouth_size,
    shape = mouth_shape(),
    -- shape = gears.shape.pie,
    bg = stroke,
    widget = wibox.container.background()
}

local frown = wibox.widget {
    {
        mouth_widget,
        direction = "south",
        widget = wibox.container.rotate()
    },
    top = dpi(8),
    widget = wibox.container.margin()
}

local smile = wibox.widget {
    mouth_widget,
    direction = "north",
    widget = wibox.container.rotate()
}

local ok = wibox.widget {
    {
        bg = stroke,
        shape = helpers.rrect(dpi(2)),
        widget = wibox.container.background
    },
    top = dpi(5),
    bottom = dpi(1),
    widget = wibox.container.margin()
}

local mouth = wibox.widget {
    frown,
    ok,
    smile,
    top_only = true,
    widget = wibox.layout.stack()
}

local eye = wibox.widget {
    forced_width = eye_size,
    forced_height = eye_size,
    shape = gears.shape.circle,
    bg = stroke,
    widget = wibox.container.background()
}

-- 2 eyes 1 semicircle (smile or frown)
local face = wibox.widget {
    eye,
    mouth,
    eye,
    spacing = dpi(4),
    layout = wibox.layout.fixed.horizontal
}

local cute_battery_face = wibox.widget {
    {
        battery_bar,
        shape = helpers.rrect(dpi(16)),
        border_color = stroke,
        border_width = dpi(4),
        widget = wibox.container.background
    },
    {
        nil,
        { 
            nil,
            face,
            layout = wibox.layout.align.vertical,
            expand = "none"
        },
        layout = wibox.layout.align.horizontal,
        expand = "none"
    },
    {
        charging_icon,
        right = dpi(12),
        widget = wibox.container.margin()
    },
    top_only = false,
    layout = wibox.layout.stack
}

local last_value = 100
awesome.connect_signal("evil::battery", function(value)
    -- Update bar
    battery_bar.value = value
    last_value = value
    local color
    -- Update face
    if charging_icon.visible then
        color = charging_color
        mouth:set(1, smile)
    elseif value <= user.battery_threshold_low then
        color = sad_color
        mouth:set(1, frown)
    elseif value <= ok_threshold then
        color = ok_color
        mouth:set(1, ok)
    else
        color = happy_color
        mouth:set(1, smile)
    end
    battery_bar.color = color
    battery_bar.background_color = color.."44"
end)

awesome.connect_signal("evil::charger", function(plugged)
    local color
    if plugged then
        charging_icon.visible = true
        color = charging_color
        mouth:set(1, smile)
    elseif last_value <= user.battery_threshold_low then
        charging_icon.visible = false
        color = sad_color
        mouth:set(1, frown)
    elseif last_value <= ok_threshold then
        charging_icon.visible = false
        color = ok_color
        mouth:set(1, ok)
    else
        charging_icon.visible = false
        color = happy_color
        mouth:set(1, smile)
    end
    battery_bar.color = color
    battery_bar.background_color = color.."44"
end)

return cute_battery_face
