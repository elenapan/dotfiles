local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helpers = require("helpers")
local pad = helpers.pad

-- {{{ Widgets
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    -- awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ }, 3, function(t)
                        if client.focus then
                          client.focus:move_to_tag(t)
                        end
                    end),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, 
                        function (c)
                            if c == client.focus then
                                c.minimized = true
                            else
                                -- Without this, the following
                                -- :isvisible() makes no sense
                                c.minimized = false
                                if not c:isvisible() and c.first_tag then
                                    c.first_tag:view_only()
                                end
                                -- This will also un-minimize
                                -- the client, if needed
                                client.focus = c
                                c:raise()
                            end
                        end),
                     -- Middle mouse button closes the window
                     awful.button({ }, 2, function (c) c:kill() end),
                     awful.button({ }, 3, function (c) c.minimized = true end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(-1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(1)
                    end)
)
-- }}}

awful.screen.connect_for_each_screen(function(s)
    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = helpers.rrect(beautiful.border_radius), type = "dock"})
    s.traybox.width = dpi(120)
    s.traybox.height = beautiful.wibar_height - beautiful.screen_margin * 4
    s.traybox.x = s.geometry.width - beautiful.screen_margin * 2 - s.traybox.width
    s.traybox.y = s.geometry.height - s.traybox.height - beautiful.screen_margin * 2
    -- s.traybox.y = s.geometry.height - s.traybox.height - s.traybox.height / 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
      pad(1),
      s.systray,
      pad(1),
      layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
                        -- Middle click - Hide traybox
                        awful.button({ }, 2, function ()
                            s.traybox.visible = false
                        end)
    ))
    -- Hide traybox when mouse leaves
    s.traybox:connect_signal("mouse::leave", function ()
            s.traybox.visible = false
    end)

    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create an icon taglist
    -- local icon_taglist = require("noodle.icon_taglist")

    -- Create a custom text taglist
    local text_taglist = require("noodle.text_taglist")

    -- Create text weather widget
    local text_weather = require("noodle.text_weather")
    local weather_widget_icon = text_weather:get_all_children()[1]
    weather_widget_icon.font = "Typicons 11"
    local weather_widget_text = text_weather:get_all_children()[2]
    weather_widget_text.font = "sans 9"

    -- Create a widget that displays window buttons (close, maximize, minimize)
    local close_button = wibox.widget.textbox()
    close_button.font = "Typicons 11"
    close_button.markup = helpers.colorize_text("", beautiful.xcolor1)
    close_button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            if client.focus then
                client.focus:kill()
            end
        end)
    ))
    local maximize_button = wibox.widget.textbox()
    maximize_button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            if client.focus then
                client.focus.maximized = not client.focus.maximized
            end
        end)
    ))
    maximize_button.font = "Typicons 11"
    maximize_button.markup = helpers.colorize_text("", beautiful.xcolor5)
    local minimize_button = wibox.widget.textbox()
    minimize_button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            if client.focus then
                client.focus.minimized = true
            end
        end)
    ))
    minimize_button.font = "Typicons 11"
    minimize_button.markup = helpers.colorize_text("", beautiful.xcolor6)

    local window_buttons = wibox.widget {
        minimize_button,
        maximize_button,
        close_button,
        { -- Padding
            spacing = dpi(6),
            layout = wibox.layout.fixed.horizontal
        },
        spacing = dpi(12),
        layout = wibox.layout.fixed.horizontal
    }
    window_buttons:buttons(gears.table.join(
        awful.button({ }, 2, function ()
            awful.spawn.with_shell("rofi -show windowcd")
        end),
        awful.button({ }, 4, function ()
            awful.client.focus.byidx(-1)
        end),
        awful.button({ }, 5, function ()
            awful.client.focus.byidx(1)
        end)
    ))

    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        {
            { -- Some padding
                layout = wibox.layout.fixed.horizontal
            },
            text_weather,
            spacing = dpi(12),
            layout = wibox.layout.fixed.horizontal
        },
        text_taglist,
        window_buttons,
        expand = "none",
        layout = wibox.layout.align.horizontal
    }
end)

local s = mouse.screen
-- Show traybox when the mouse touches the rightmost edge of the wibar
-- TODO fix for wibar_position = "top"
traybox_activator = wibox({ x = s.geometry.width - 1, y = s.geometry.height - beautiful.wibar_height, height = beautiful.wibar_height, width = 1, opacity = 0, visible = true, bg = beautiful.wibar_bg })
traybox_activator:connect_signal("mouse::enter", function ()
    -- awful.screen.focused().traybox.visible = true
    s.traybox.visible = true
end)
