local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")

local helpers = require("helpers")

-- Note: This theme does not show image notification icons

-- For antialiasing
-- The real background color is set in the widget_template
local notification_bg = beautiful.notification_bg
beautiful.notification_bg = "#00000000"

local default_icon = ""
local default_color = x.color6

-- Custom text icons according to the notification's app_name
-- plus whether the title should be visible or not
-- (This will be removed when notification rules are released)
-- Using icomoon font
local app_config = {
    ['battery'] = { icon = "", title = false },
    ['charger'] = { icon = "", title = false },
    ['volume'] = { icon = "", title = false },
    ['brightness'] = { icon = "", title = false },
    ['screenshot'] = { icon = "", title = false },
    ['Telegram Desktop'] = { icon = "", title = true },
    ['night_mode'] = { icon = "", title = false },
    ['NetworkManager'] = { icon = "", title = true },
    ['youtube'] = { icon = "", title = true },
    ['mpd'] = { icon = "", title = true },
    ['mpv'] = { icon = "", title = true },
    ['keyboard'] = { icon = "", title = false },
    ['email'] = { icon = "", title = true },
}

local urgency_bg = {
    ['low'] = x.color4,
    ['normal'] = x.color11,
    ['critical'] = x.color1,
}

-- Template
-- ===================================================================
naughty.connect_signal("request::display", function(n)

    -- Custom icon widget
    -- It can be used instead of naughty.widget.icon if you prefer your icon to be
    -- a textbox instead of an image. However, you have to determine its
    -- text/markup value from the notification before creating the
    -- naughty.layout.box.
    local custom_notification_icon = wibox.widget {
        font = "icomoon 18",
        -- font = "icomoon bold 40",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }

    local icon, title_visible
    local color = default_color
    local bg = urgency_bg[n.urgency] or urgency_bg['normal']
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
            spacing = dpi(3),
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
                bg = x.foreground.."22",
                forced_height = dpi(25),
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
        type = "notification",
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
                                    markup = helpers.colorize_text(icon, color),
                                    align = "center",
                                    valign = "center",
                                    widget = custom_notification_icon,
                                },
                                forced_height = dpi(50),
                                bg = x.foreground,
                                widget  = wibox.container.background,
                            },
                            {
                                {
                                    {
                                        {
                                            align = "center",
                                            visible = title_visible,
                                            font = beautiful.notification_font,
                                            markup = "<b>"..n.title.."</b>",
                                            widget = wibox.widget.textbox,
                                            -- widget = naughty.widget.title,
                                        },
                                        {
                                            align = "center",
                                            widget = naughty.widget.message,
                                        },
                                        {
                                            helpers.vertical_pad(dpi(10)),
                                            {
                                                actions,
                                                shape = gears.shape.rounded_bar,
                                                widget = wibox.container.background,
                                            },
                                            visible = n.actions and #n.actions > 0,
                                            layout  = wibox.layout.fixed.vertical
                                        },
                                        layout  = wibox.layout.align.vertical,
                                    },
                                    margins = beautiful.notification_margin,
                                    widget  = wibox.container.margin,
                                },
                                bg = bg,
                                widget  = wibox.container.background,
                            },
                            layout  = wibox.layout.fixed.vertical,
                        },
                        strategy = "min",
                        width    = dpi(200),
                        widget   = wibox.container.constraint,
                    },
                    strategy = "max",
                    width    = beautiful.notification_max_width or dpi(350),
                    height   = beautiful.notification_max_height or dpi(180),
                    widget   = wibox.container.constraint,
                },
                -- Anti-aliasing container
                bg = notification_bg,
                shape = helpers.prrect(dpi(30), true, true, false, true),
                widget = wibox.container.background
            },
            -- Anti-aliasing container
            shape = helpers.rrect(beautiful.notification_border_radius),
            widget = wibox.container.background
        }
    }
end)

-- naughty.disconnect_signal("request::display", naughty.default_notification_handler)
