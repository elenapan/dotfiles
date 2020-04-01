local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local keys = require("keys")

-- TODO ability to switch to minimized clients:
-- Might need to ditch the "easy" tasklist approach for something manual

local window_switcher_margin = dpi(10)
local item_size = dpi(50)

-- Set up text symbols and colors to be used instead of awful.widget.clienticon
-- Based on the client's `class` property
local class_icons = {
    -- Terminals
    ['kitty'] = { symbol = "", color = x.color5 },
    ['Alacritty'] = { symbol = "", color = x.color5 },
    ['Termite'] = { symbol = "", color = x.color5 },
    ['URxvt'] = { symbol = "", color = x.color5 },
    ['st'] = { symbol = "", color = x.color5 },
    ['st-256color'] = { symbol = "", color = x.color5 },

    -- Image viewers
    ['feh'] = { symbol = "", color = x.color1 },
    ['Sxiv'] = { symbol = "", color = x.color1 },

    -- General
    ['TelegramDesktop'] = { symbol = "", color = x.color4 },
    ['Firefox'] = { symbol = "", color = x.color3 },
    ['Chromium'] = { symbol = "", color = x.color4 },
    ['Chromium-browser'] = { symbol = "", color = x.color4 },
    ['Steam'] = { symbol = "", color = x.color2 },
    ['Lutris'] = { symbol = "", color = x.color6 },
    ['editor'] = { symbol = "", color = x.color5 },
    ['Emacs'] = { symbol = "", color = x.color5 },
    ['email'] = { symbol = "", color = x.color6 },
    ['music'] = { symbol = "", color = x.color6 },
    ['mpv'] = { symbol = "", color = x.color6 },
    ['KeePassXC'] = { symbol = "", color = x.color1 },
    ['Gucharmap'] = { symbol = "", color = x.color6 },
    ['Pavucontrol'] = { symbol = "", color = x.color4 },
    ['htop'] = { symbol = "", color = x.color2 },
    ['Screenruler'] = { symbol = "", color = x.color3 },
    ['Galculator'] = { symbol = "", color = x.color2 },
    ['Zathura'] = { symbol = "", color = x.color2 },

    -- File managers
    ['Thunar'] = { symbol = "", color = x.color3 },
    ['Nemo'] = { symbol = "", color = x.color3 },

    ['Gimp'] = { symbol = "", color = x.color4 },
    ['Inkscape'] = { symbol = "", color = x.color2 },
    ['Gpick'] = { symbol = "", color = x.color6 },

    -- Default
    ['_'] = { symbol = "", color = x.color7.."99" }
}

awful.screen.connect_for_each_screen(function(s)
    s.window_switcher = wibox({
        width = dpi(500),
        height = dpi(100), -- Will change dynamically
        visible = false,
        ontop = true,
        screen = s,
        bg = "#00000000",
        fg = x.foreground
    })
    awful.placement.centered(s.window_switcher, { honor_workarea = true, honor_padding = true })

    -- Tasklist
    s.window_switcher_tasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = keys.tasklist_buttons,
        style    = {
            font = beautiful.tasklist_font,
            -- font = "sans 10 medium",
            bg = x.color0,
        },
        layout   = {
            layout  = wibox.layout.fixed.vertical
        },
        widget_template = {
            {
                -- Standard icon (from beautiful.icon_theme)
                -- {
                --     awful.widget.clienticon,
                --     margins = 5,
                --     widget  = wibox.container.margin
                -- },
                -- Text icon
                {
                    id     = 'text_icon',
                    font   = 'icomoon 25',
                    forced_width = dpi(50),
                    align  = "center",
                    valign = "center",
                    widget = wibox.widget.textbox,
                },
                {
                    {
                        id     = 'text_role',
                        align  = "center",
                        widget = wibox.widget.textbox,
                    },
                    left = dpi(6),
                    right = dpi(14),
                    -- Add margins to top and bottom in order to force the
                    -- text to be on a single line, if needed. Might need
                    -- to adjust them according to font size.
                    top  = dpi(14),
                    bottom = dpi(14),
                    widget = wibox.container.margin
                },
                layout  = wibox.layout.fixed.horizontal
            },
            forced_height = item_size,
            id = "bg_role",
            widget = wibox.container.background,
            create_callback = function(self, c, _, __)
                local i
                if class_icons[c.class] then
                    i = c.class
                else
                    i = '_'
                end
                self:get_children_by_id('text_icon')[1].markup = helpers.colorize_text(class_icons[i].symbol, class_icons[i].color)
            end,
        },
    }

    s.window_switcher:setup {
        {
            s.window_switcher_tasklist,
            margins = window_switcher_margin,
            widget = wibox.container.margin
        },
        bg = x.color0,
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background
    }
end)

-- Keygrabber configuration
local window_switcher_grabber
local function window_switcher_hide()
    -- Add currently focused client to history
    if client.focus then
        awful.client.focus.history.add(client.focus)
    end
    -- Resume recording focus history
    awful.client.focus.history.enable_tracking()
    -- Stop and hide window_switcher
    local s = awful.screen.focused()
    awful.keygrabber.stop(window_switcher_grabber)
    s.window_switcher.visible = false
end

-- Helper functions for keybinds
local window_search = function()
    window_switcher_hide()
    awful.spawn.with_shell("rofi -show windowcd")
end

local function get_num_clients(s)
    local clients = s.selected_tag:clients()
    local num_clients = 0
    for _, c in pairs(clients) do
        if not c.skip_taskbar then
            num_clients = num_clients + 1
        end
    end

    return num_clients
end

local close = function()
    if client.focus then
        client.focus:kill()
        local s = awful.screen.focused()
        local num_clients = get_num_clients(s)
        -- Hide or adjust size and position if needed
        if num_clients > 1 then
            s.window_switcher.height = s.window_switcher.height - item_size
            awful.placement.centered(s.window_switcher, { honor_workarea = true, honor_padding = true })
        else
            window_switcher_hide()
        end
    end
end

local unminimize = function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        client.focus = c
    end
end

local cycle = function(direction)
    awful.client.focus.byidx(direction)
end

-- Set up keybinds
-- Single keys only
local keybinds = {
    ['Escape'] = window_switcher_hide,
    ['Tab'] = function() cycle(1) end,
    -- (Un)Minimize
    ['n'] = function() if client.focus then client.focus.minimized = true end end,
    ['N'] = unminimize,
    ['u'] = unminimize, -- `u` for up
    -- Close
    ['d'] = close,
    ['q'] = close,
    -- Move with vim keys
    ['j'] = function() cycle(1) end,
    ['k'] = function() cycle(-1) end,
    -- Move with arrow keys
    ['Down'] = function() cycle(1) end,
    ['Up'] = function() cycle(-1) end,
    -- Space
    [' '] = window_search
}

function window_switcher_show(s)
    local num_clients = get_num_clients(s)

    if num_clients == 0 or (num_clients == 1 and client.focus) then
        return
    end

    -- Adjust size and position
    s.window_switcher.height = num_clients * item_size + window_switcher_margin * 2
    awful.placement.centered(s.window_switcher, { honor_workarea = true, honor_padding = true })

    -- Stop recording focus history
    awful.client.focus.history.disable_tracking()

    -- Go to previously focused client (in the tag)
    awful.client.focus.history.previous()

    -- Start the keygrabber
    window_switcher_grabber = awful.keygrabber.run(function(modifiers, key, event)
        if event == "release" then
            -- Hide if the modifier was released
            -- We try to match Super or Alt or Control since we do not know which keybind is
            -- used to activate the window switcher (the keybind is set by the user in keys.lua)
            if key:match("Super") or key:match("Alt") or key:match("Control") then
                window_switcher_hide()
            end
            -- Do nothing
            return
        end

        -- Run function attached to key, if it exists
        if keybinds[key] then
            keybinds[key]()
        end
    end)

    -- Finally make the window switcher wibox visible
    s.window_switcher.visible = true
end

