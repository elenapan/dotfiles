local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
--local xresources = require("beautiful.xresources")
--local xrdb = xresources.get_current_theme()

local helpers = require("helpers")
local keys = require("keys")

-- {{{ Widgets
local desktop_control = require("noodle.desktop_control")
local minimal_tasklist = require("noodle.minimal_tasklist")
local icon_taglist = require("noodle.icon_taglist")

-- Start button widget (can toggle sidebar, tray, scratchpad)
start_widget = wibox.widget.imagebox(beautiful.sidebar_icon)
start_widget:buttons(gears.table.join(
                         -- Left click - Toggle sidebar
                         awful.button({ }, 1, function ()
                             sidebar.visible = not sidebar.visible
                         end),
                         -- Middle click - Toggle scratchpad
                         awful.button({ }, 2, function ()
                             if client.focus ~= nil and client.focus.class == "scratchpad" then
                               client.focus.minimized = true
                               return
                             end
                             local matcher = function (c)
                               return awful.rules.match(c, {class = 'scratchpad'})
                             end
                             awful.client.run_or_raise( "scratchpad" , matcher)
                         end),
                         -- Right click - Toggle tray
                         awful.button({ }, 3, function ()
                             awful.screen.focused().traybox.visible = not awful.screen.focused().traybox.visible
                         end)
))
   
-- Create item separator
textseparator = wibox.widget.textbox()
textseparator.text = beautiful.separator_text
textseparator.font = "hurmit nerd font bold 14"
textseparator.markup = helpers.colorize_text(textseparator.text, beautiful.separator_fg)

-- Create padding
pad = wibox.widget.textbox(" ")

awful.screen.connect_for_each_screen(function(s)
    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Wibar detached - Method: Transparent useless bar
    -- Requires compositor
    if beautiful.wibar_detached then
        s.useless_wibar = awful.wibar({ position = beautiful.wibar_position, screen = s, height = beautiful.screen_margin * 2, opacity = 0 })
    end
    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            pad,
            start_widget
            -- minimal_tasklist
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            -- textseparator,
            textseparator,
            icon_taglist,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            textseparator,
            desktop_control,
            pad
        },
    }

    -- Only set them if they exist, else they overwrite the position variable
    if beautiful.wibar_x then
        s.mywibox.x = beautiful.wibar_x
    end
    if beautiful.wibar_y then
        s.mywibox.y = beautiful.wibar_y
    end

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = helpers.rbar(), type = "dock"})
    s.traybox.width = 150
    s.traybox.height = 30
    s.traybox.x = beautiful.screen_margin * 2
    -- s.traybox.x = s.geometry.width - s.traybox.width - beautiful.screen_margin * 2
    s.traybox.y = s.geometry.height - s.traybox.height - beautiful.screen_margin * 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
      -- wibox.widget.textbox("test"),
      pad,
      s.systray,
      pad,
      layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
                        -- Middle click - Hide traybox
                        awful.button({ }, 2, function ()
                            s.traybox.visible = false
                        end)
    ))
end)

