local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local notifications = require("notifications")
local keys = require("keys")

local create_little_circle = function(color)
    return wibox.widget {
        forced_width = dpi(8),
        forced_height = dpi(8),
        bg = color,
        shape = gears.shape.circle,
        widget = wibox.container.background
    }
end

-- 2x2 grid of little circles
local toolbar_icon = wibox.widget {
    create_little_circle(x.color4),
    create_little_circle(x.color1),
    create_little_circle(x.color3),
    create_little_circle(x.color2),
    spacing = dpi(2),
    forced_num_cols = 2,
    forced_num_rows = 2,
    layout = wibox.layout.grid
}

local toolbar_position = "left"
local toolbar_size = dpi(60)
local toolbar_bg = x.color0.."66"
local toolbar_enabled_initially = true

-- Note: Some terminals require moving the window after toggling
-- the toolbar in order to keep the window in the same place.
-- If your music terminal moves everytime you toggle the toolbar,
-- set its name to true in terminal_has_to_move_after_resizing
-- The name should be the command you use to launch it
-- e.g. "gnome-terminal" for GNOME Terminal
local terminal_has_to_move_after_resizing = {
    ["kitty"] = true,
}

-- Get music client terminal name
local music_client_terminal = user.music_client:match("(%w+)(.+)")
local terminal_has_to_move = terminal_has_to_move_after_resizing[music_client_terminal]

local mpd_toolbar_toggle = function(c)
    if c.toolbar_enabled then
        c.toolbar_enabled = false
        awful.titlebar.hide(c, toolbar_position)
        c.width = c.width + toolbar_size
        if terminal_has_to_move then
            c.x = c.x - toolbar_size
        end
    else
        c.toolbar_enabled = true
        awful.titlebar.show(c, toolbar_position)
        c.width = c.width - toolbar_size
        if terminal_has_to_move then
            c.x = c.x + toolbar_size
        end
    end
end

local create_toolbar_button = function(c)
    local toolbar_button = wibox.widget {
        {
            nil,
            {
                nil,
                toolbar_icon,
                expand = "none",
                layout = wibox.layout.align.horizontal
            },
            expand = "none",
            layout = wibox.layout.align.vertical
        },
        forced_width = dpi(34),
        forced_height = dpi(34),
        shape = gears.shape.circle,
        widget = wibox.container.background
    }

    toolbar_button:connect_signal("mouse::enter", function ()
        toolbar_button.bg = x.color8.."55"
    end)
    toolbar_button:connect_signal("mouse::leave", function ()
        toolbar_button.bg = "#00000000"
    end)

    c.toolbar_enabled = toolbar_enabled_initially
    toolbar_button:buttons(gears.table.join(
        awful.button({ }, 1, function() mpd_toolbar_toggle(c) end)
    ))

    return toolbar_button
end

local control_button_bg = "#00000000"
local control_button_bg_hover = x.color0
local control_button = function(c, symbol, color, size, on_click, on_right_click)
    local icon = wibox.widget{
        markup = helpers.colorize_text(symbol, color),
        font = "icomoon 12",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox()
    }

    local button = wibox.widget {
        icon,
        bg = control_button_bg,
        widget = wibox.container.background
    }

    local container = wibox.widget {
        button,
        strategy = "min",
        height = dpi(50),
        widget = wibox.container.constraint,
    }

    container:buttons(gears.table.join(
        awful.button({ }, 1, on_click),
        awful.button({ }, 3, on_right_click)
    ))

    container:connect_signal("mouse::enter", function ()
        button.bg = control_button_bg_hover
    end)
    container:connect_signal("mouse::leave", function ()
        button.bg = control_button_bg
    end)

    return container
end

local mpd_buttons = require("noodle.mpd_buttons")

local volume_bar = wibox.widget {
    max_value     = 100,
    value         = 50,
    margins       = {
        top = dpi(20),
        bottom = dpi(20),
        left = dpi(6),
        right = dpi(6),
    },
    forced_width  = dpi(60),
    shape         = gears.shape.rounded_bar,
    bar_shape     = gears.shape.rounded_bar,
    color         = x.color4,
    background_color = x.foreground.."11",
    border_width  = 0,
    widget        = wibox.widget.progressbar,
}

-- Update bar
awesome.connect_signal("evil::mpd_volume", function(value)
    volume_bar.value = value and value <= 100 and value or 100
end)

-- Set up volume bar buttons
volume_bar:connect_signal("button::press", function(_, lx, __, button)
    if button == 1 then
        awful.spawn.with_shell("mpc volume "..tostring(math.ceil(lx * 100 / volume_bar.forced_width)))
    end
end)

local volume = wibox.widget {
    volume_bar,
    helpers.horizontal_pad(dpi(3)),
    {
        align = "left",
        font = "icomoon 16",
        markup = helpers.colorize_text("", x.color1),
        widget = wibox.widget.textbox()
    },
    helpers.horizontal_pad(dpi(2)),
    layout = wibox.layout.fixed.horizontal
}

volume:buttons(gears.table.join(
    -- Scroll - Increase or decrease volume
    awful.button({ }, 4, function ()
        awful.spawn.with_shell("mpc volume +5")
    end),
    awful.button({ }, 5, function ()
        awful.spawn.with_shell("mpc volume -5")
    end)
))

local random_color = x.color1
local random_symbol = ""
local random_button = control_button(c, random_symbol, random_color, dpi(30), function()
    awful.spawn.with_shell("mpc random")
end)

local loop_color = x.color3
local loop_symbol = ""
local loop_button = control_button(c, loop_symbol, loop_color, dpi(30), function()
    awful.spawn.with_shell("mpc repeat")
end)

local loop_textbox = loop_button:get_all_children()[1]:get_all_children()[1]
local random_textbox = random_button:get_all_children()[1]:get_all_children()[1]

local disabled_color = x.color8
-- Update loop and random button colors based on their state
awesome.connect_signal("evil::mpd_options", function(loop, random)
    if loop then
        loop_textbox.markup = helpers.colorize_text(loop_symbol, loop_color)
    else
        loop_textbox.markup = helpers.colorize_text(loop_symbol, disabled_color)
    end

    if random then
        random_textbox.markup = helpers.colorize_text(random_symbol, random_color)
    else
        random_textbox.markup = helpers.colorize_text(random_symbol, disabled_color)
    end
end) 

local notifications_color = x.color2
local notifications_symbol = ""
local notifications_button
notifications_button = control_button(c, notifications_symbol, notifications.mpd.enabled and notifications_color or disabled_color, dpi(30), function()
    notifications.mpd.toggle()
    local text = notifications_button:get_all_children()[1]:get_all_children()[1]
    text.markup = helpers.colorize_text(notifications_symbol, notifications.mpd.enabled and notifications_color or disabled_color)
end)

local main_titlebar_size = dpi(50)

local mpd_create_decoration = function (c)
    -- Main titlebar
    awful.titlebar(c, { position = "top", size = main_titlebar_size, bg = x.background }):setup {
        {
            {
                create_toolbar_button(c),
                {
                    buttons = keys.titlebar_buttons,
                    widget = wibox.container.background
                },
                layout = wibox.layout.align.horizontal
            },
            mpd_buttons,
            {
                nil,
                {
                    buttons = keys.titlebar_buttons,
                    widget = wibox.container.background
                },
                volume,
                layout = wibox.layout.align.horizontal
            },
            expand = "outside",
            layout = wibox.layout.align.horizontal
        },
        left = dpi(10),
        right = dpi(10),
        widget = wibox.container.margin
    }

    -- Toolbar
    -- The functions that send keys to the ncmpcpp client assume that
    -- you are using default ncmpcpp keybindings. Otherwise, you will
    -- have to modify the helpers.send_key() function arguments so they
    -- send your desired keys.
    awful.titlebar(c, { position = toolbar_position, size = toolbar_size, bg = x.background }):setup {
        {
            {
                -- Go to playlist and focus currently playing song
                control_button(c, "", x.color6, dpi(30), function()
                    helpers.send_key_sequence(c, "1o")
                end),
                -- Toggle lyrics
                control_button(c, "", x.color5, dpi(30), function()
                    helpers.send_key(c, "l")
                end),
                -- Go to list of playlists
                control_button(c, "", x.color4, dpi(30), function()
                    helpers.send_key(c, "5")
                end),
                -- Visualizer button
                control_button(c, "", x.color5, dpi(30),
                    -- Left click - Go to visualizer
                    function()
                        helpers.send_key(c, "8")
                    end,
                    -- Right click - Toggle visualizer
                    function()
                        awful.spawn.with_shell("mpc toggleoutput mpd_fifo")
                    end
                    ),
                random_button,
                loop_button,
                notifications_button,
                layout = wibox.layout.flex.vertical
            },
            {
                buttons = keys.titlebar_buttons,
                widget = wibox.container.background
            },
            layout = wibox.layout.align.vertical
        },
        bg = toolbar_bg,
        shape = helpers.prrect(dpi(20), false, true, false, false),
        widget = wibox.container.background
    }

    if not toolbar_enabled_initially then
        awful.titlebar.hide(c, toolbar_position)
    end

    -- Set custom decoration flags
    c.custom_decoration = { top = true, left = true }
end

-- Add the titlebar whenever a new music client is spawned
table.insert(awful.rules.rules, {
    rule_any = {
        class = {
            "music",
        },
        instance = {
            "music",
        },
    },
    properties = {},
    callback = mpd_create_decoration
})
