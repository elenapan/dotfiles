local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

local helpers = require("helpers")

-- Note: This theme does not show image notification icons

local rainbow_piece = function(color)
    return wibox.widget {
        bg = color,
        widget = wibox.container.background
    }
end

local rainbow_stripe = wibox.widget {
    rainbow_piece(x.color1),
    rainbow_piece(x.color5),
    rainbow_piece(x.color4),
    rainbow_piece(x.color6),
    rainbow_piece(x.color2),
    rainbow_piece(x.color3),
    layout = wibox.layout.flex.horizontal
}

-- For antialiasing
-- The real background color is set in the widget_template
local notification_bg = beautiful.notification_bg
beautiful.notification_bg = "#00000000"

local default_symbol = ""
local default_color = x.foreground

-- Template
-- ===================================================================
naughty.connect_signal("request::display", function(n)

    -- Debugging
    -- print('n.title = '..n.title)
    -- print('n.message = '..n.message)

    -- Custom icon widget
    -- It can be used instead of naughty.widget.icon if you prefer your icon to be
    -- a textbox instead of an image. However, you have to determine its
    -- text/markup value from the notification before creating the
    -- naughty.layout.box.
    local custom_notification_icon = wibox.widget {
        font = "icomoon 14",
        -- font = "icomoon bold 40",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }

    local symbol = default_symbol
    local color = default_color

    -- Try to detect the notification source and change the symbol and/or color ccordingly
    if n.title == "Telegram" then
        symbol = ""
    elseif n.title == "Volume" then
        symbol = ""
        n.title = ""
    elseif n.title == "Screenshot" then
        -- symbol = ""
        symbol = ""
        n.title = ""
    elseif n.title == "Performance mode" then
        symbol = ""
    elseif n.title == "Night mode" then
        symbol = ""
    elseif n.title:match('Connection') then
        symbol = ""
    elseif n.title == "Battery" then
        -- symbol = ""
        symbol = ""
    elseif n.title == "Charger" then
        symbol = ""
        n.title = ""
    elseif n.title:match('YouTube') then
        -- symbol = ""
        -- symbol = ""
        symbol = ""
    end

    naughty.layout.box {
        notification = n,
        -- type = "splash",
        -- For antialiasing: The real shape is set in widget_template
        shape = gears.shape.rectangle,
        border_width = beautiful.notification_border_width,
        border_color = beautiful.notification_border_color,
        position = beautiful.notification_position,
        widget_template = {
            {
                {
                    {
                        {
                            -- {
                                -- naughty.widget.icon,
                                {
                                    {
                                        {
                                            markup = helpers.colorize_text(symbol, color),
                                            widget = custom_notification_icon,
                                        },
                                        margins = beautiful.notification_margin,
                                        widget  = wibox.container.margin,
                                    },
                                    -- bg = x.background.."88",
                                    bg = x.color0,
                                    -- bg = x.background.."88",
                                    -- bg = "red",
                                    -- bg = notification_bg.."88",
                                    widget  = wibox.container.background,
                                },
                                {
                                    rainbow_stripe,
                                    forced_height = dpi(4),
                                    -- shape = gears.shape.rounded_bar,
                                    widget = wibox.container.background
                                },
                                {
                                    {
                                        {
                                            {
                                                align = "center",
                                                -- Only show title if no symbol has been set
                                                visible = symbol == default_symbol,
                                                widget = naughty.widget.title,
                                            },
                                            {
                                                align = "center",
                                                widget = naughty.widget.message,
                                            },
                                            -- spacing = dpi(4),
                                            layout  = wibox.layout.fixed.vertical,
                                        },
                                        margins = beautiful.notification_margin,
                                        widget  = wibox.container.margin,
                                    },
                                    bg = notification_bg,
                                    widget  = wibox.container.background,
                                },
                                -- naughty.list.actions,
                                -- spacing = dpi(4),
                                layout  = wibox.layout.fixed.vertical,
                            -- },
                            -- margins = beautiful.notification_margin,
                            -- widget  = wibox.container.margin,
                        },
                        bg = "#00000000",
                        id     = "background_role",
                        widget = naughty.container.background,
                    },
                    strategy = "min",
                    width    = dpi(160),
                    widget   = wibox.container.constraint,
                },
                strategy = "max",
                width    = beautiful.notification_max_width or dpi(500),
                widget   = wibox.container.constraint,
            },
            -- Anti-aliasing container
            bg = notification_bg,
            -- bg = "#00000000",
            -- This will be the anti-aliased shape of the notification
            shape = helpers.rrect(beautiful.notification_border_radius),
            widget = wibox.container.background
        }
    }
end)

-- naughty.disconnect_signal("request::display", naughty.default_notification_handler)
