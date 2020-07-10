local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local helpers = require("helpers")


if beautiful.notification_border_radius > 0 then
    beautiful.notification_shape = helpers.rrect(beautiful.notification_border_radius)
end

naughty.connect_signal("request::display", function(n)
    local actions = wibox.widget {
        notification = n,
        base_layout = wibox.widget {
            spacing = dpi(5),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        font = "monospace 11 bold",
                        markup = helpers.colorize_text(" ", x.color4),
                        widget = wibox.widget.textbox
                    },
                    {
                        id = 'text_role',
                        font = beautiful.notification_font,
                        widget = wibox.widget.textbox
                    },
                    forced_height = dpi(35),
                    layout = wibox.layout.fixed.horizontal
                },
                widget = wibox.container.place
            },
            strategy = "min",
            width = dpi(60),
            widget = wibox.container.constraint,
        },
        style = {
            underline_normal = false,
            underline_selected = true
        },
        widget = naughty.list.actions
    }

    naughty.layout.box {
        notification = n,
        shape = helpers.rrect(beautiful.notification_border_radius),
        border_width = beautiful.notification_border_width,
        border_color = beautiful.notification_border_color,
        position = beautiful.notification_position,
        widget_template = {
            {
                {
                    {
                        {
                            naughty.widget.icon,
                            {
                                {
                                    nil,
                                    {
                                        {
                                            align = "left",
                                            font = beautiful.notification_font,
                                            markup = "<b>"..n.title.."</b>",
                                            widget = wibox.widget.textbox,
                                            -- widget = naughty.widget.title,
                                        },
                                        {
                                            align = "left",
                                            widget = naughty.widget.message,
                                        },
                                        layout = wibox.layout.fixed.vertical
                                    },
                                    expand = "none",
                                    layout = wibox.layout.align.vertical
                                },
                                left = n.icon and beautiful.notification_padding or 0,
                                widget = wibox.container.margin,
                            },
                            layout = wibox.layout.align.horizontal
                        },
                        {
                            helpers.vertical_pad(dpi(10)),
                            {
                                nil,
                                actions,
                                expand = "none",
                                layout = wibox.layout.align.horizontal
                            },
                            visible = n.actions and #n.actions > 0,
                            layout = wibox.layout.fixed.vertical
                        },
                        layout = wibox.layout.fixed.vertical
                    },
                    margins = beautiful.notification_padding,
                    widget = wibox.container.margin,
                },
                strategy = "min",
                width = beautiful.notification_min_width or dpi(150),
                widget = wibox.container.constraint,
            },
            strategy = "max",
            width = beautiful.notification_max_width or dpi(300),
            height = beautiful.notification_max_height or dpi(150),
            widget = wibox.container.constraint,
        }
    }
end)
