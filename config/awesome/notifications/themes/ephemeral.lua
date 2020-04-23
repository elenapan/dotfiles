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

local default_icon = ""
local default_color = x.foreground

-- Custom text icons according to the notification's app_name
-- plus whether the title should be visible or not
-- (This will be removed when notification rules are released)
-- Using icomoon font
local app_config = {
    ['battery'] = { icon = "", title = false },
    ['charger'] = { icon = "", title = false },
    ['volume'] = { icon = "", title = false },
    ['brightness'] = { icon = "", title = false },
    ['screenshot'] = { icon = "", title = false },
    ['Telegram Desktop'] = { icon = "", title = true },
    ['night_mode'] = { icon = "", title = false },
    ['NetworkManager'] = { icon = "", title = true },
    ['youtube'] = { icon = "", title = true },
    ['mpd'] = { icon = "", title = true },
    ['mpv'] = { icon = "", title = true },
    ['keyboard'] = { icon = "", title = false },
    ['email'] = { icon = "", title = true },
}

-- Template
-- ===================================================================
naughty.connect_signal("request::display", function(n)

    -- Debugging
    -- print('n.title = '..n.title)
    -- print('n.message = '..n.message)
    -- print('n.app_name = '..n.app_name)

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

    local icon, title_visible
    local color = default_color
    -- Set icon according to app_name
    if app_config[n.app_name] then
        icon = app_config[n.app_name].icon
        title_visible = app_config[n.app_name].title
    else
        icon = default_icon
        title_visible = true
    end

    local actions = wibox.widget {
        notification = n,
        base_layout = wibox.widget {
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = 'text_role',
                        font = beautiful.notification_font,
                        widget = wibox.widget.textbox
                    },
                    widget = wibox.container.place
                },
                bg = x.color0,
                forced_height = dpi(35),
                widget = wibox.container.background
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
                            {
                                {
                                    {
                                        markup = helpers.colorize_text(icon, color),
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
                                            visible = title_visible,
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
                            {
                                rainbow_stripe,
                                forced_height = dpi(4),
                                visible = n.actions and #n.actions > 0,
                                widget = wibox.container.background
                            },
                            actions,
                            layout  = wibox.layout.fixed.vertical,
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
                width    = beautiful.notification_max_width or dpi(350),
                height   = beautiful.notification_max_height or dpi(200),
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
