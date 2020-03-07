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
                            -- {
                            --     naughty.widget.icon,
                            --     bg = "#ff0000",
                            --     widget = wibox.container.background
                            -- },
                            -- TODO does not render properly
                            -- That is why we use a normal image box
                            -- Downside: we cannot update icon
                            {
                                forced_height = beautiful.notification_icon_size or dpi(40),
                                forced_width = beautiful.notification_icon_size or dpi(40),
                                resize = true,
                                image = n.icon,
                                id = "notification_icon",
                                widget = wibox.widget.imagebox
                            },
                            {
                                {
                                    nil,
                                    {
                                        nil,
                                        {
                                            {
                                                align = "left",
                                                -- valign = "center",
                                                widget = naughty.widget.title,
                                            },
                                            {
                                                align = "left",
                                                -- valign = "center",
                                                widget = naughty.widget.message,
                                            },
                                            layout = wibox.layout.fixed.vertical
                                        },
                                        expand = "none",
                                        layout = wibox.layout.align.vertical
                                    },
                                    expand = "none",
                                    layout = wibox.layout.align.horizontal
                                },
                                left = beautiful.notification_padding,
                                widget = wibox.container.margin,
                            },
                            layout = wibox.layout.align.horizontal
                        },
                        {
                            helpers.vertical_pad(dpi(10)),
                            naughty.list.actions,
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
            -- height = beautiful.notification_max_height or dpi(300),
            widget = wibox.container.constraint,
        }
    }
end)
