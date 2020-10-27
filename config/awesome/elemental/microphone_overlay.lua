local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local microphone_icon = ""
local muted_color = x.color8
local active_color = x.color1

local microphone_overlay = wibox({
    bg = x.color0.."99",
    width = dpi(50),
    height = dpi(50),
    visible = false,
    ontop = true,
    type = "dock",
    input_passthrough = true,
    shape = helpers.rrect(beautiful.border_radius),
})

awful.placement.top_left(microphone_overlay, { margins = beautiful.useless_gap * 2 })

local indicator = wibox.widget {
    font = "icomoon 20",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox(microphone_icon)
}

microphone_overlay:setup {
    widget = indicator
}

awesome.connect_signal("evil::microphone", function(muted)
    indicator.markup = helpers.colorize_text(microphone_icon, muted and muted_color or active_color)
end)

function microphone_overlay_toggle()
    microphone_overlay.visible = not microphone_overlay.visible
end
