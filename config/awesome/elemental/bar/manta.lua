local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
--local xrdb = xresources.get_current_theme()

local helpers = require("helpers")
local keys = require("keys")

-- {{{ Widgets
local desktop_mode_widget = require("noodle.desktop_mode_widget")
local minimal_tasklist = require("noodle.minimal_tasklist")

-- Volume widget prefix
volumebar_prefix = wibox.widget.textbox(" ")
volumebar_prefix.markup = helpers.colorize_text(volumebar_prefix.text, beautiful.prefix_fg)

-- Keyboard map indicator and switcher
keyboardlayout_prefix = wibox.widget.textbox(" ")
keyboardlayout_prefix.markup = helpers.colorize_text(keyboardlayout_prefix.text, beautiful.prefix_fg)
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget that shows date
date_prefix = wibox.widget.textbox(" ")
date_prefix.markup = helpers.colorize_text(date_prefix.text, beautiful.prefix_fg)
--mytextdate = wibox.widget.textclock("%a %d %B")
mytextdate = wibox.widget.textclock("%j days around the sun") --HAHA very useful
-- Create a textclock widget
clock_prefix = wibox.widget.textbox(" ")
clock_prefix.markup = helpers.colorize_text(clock_prefix.text, beautiful.prefix_fg)
mytextclock = wibox.widget.textclock("%H:%M")
   
-- Create item separator
textseparator = wibox.widget.textbox()
textseparator.text = beautiful.separator_text
textseparator.markup = helpers.colorize_text(textseparator.text, beautiful.separator_fg)

-- Create padding
pad = wibox.widget.textbox(" ")

-- }}}

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt({prompt = " Run: ", fg = beautiful.prompt_fg})
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
               awful.button({ }, 1, function () awful.layout.inc( 1) end),
               awful.button({ }, 3, function () awful.layout.inc(-1) end),
               awful.button({ }, 4, function () awful.layout.inc( 1) end),
               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, keys.taglist_buttons)
    s.mytaglist.font = beautiful.font

    -- Outer gaps
    --awful.screen.padding(awful.screen.focused(),{left = 28, right = 28, top = 28, bottom = 28})

    -- Create a system tray widget
    s.systray = wibox.widget.systray()
    s.systray.visible = false -- can be toggled by a keybind

    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            --mylauncher,
            s.mytaglist,
            textseparator,
            minimal_tasklist
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mypromptbox,
            --textseparator,
            --s.mytasklist,
            --minimal_tasklist
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mpdarc_widget,
            --textseparator,
            --volumebar_prefix,
            --volumebar_widget,
            --textseparator,
            --keyboardlayout_prefix,
            --mykeyboardlayout,
            --textseparator,
            s.systray,
            --minimal_tasklist,
            textseparator,
            --date_prefix,
            mytextdate,
            textseparator,
            --clock_prefix,
            mytextclock,
            textseparator,
            desktop_mode_widget,
            pad,
            pad
        },
    }

    -- Place bar at the bottom and add margins
    awful.placement.bottom(s.mywibox, {margins = beautiful.useless_gap * 2})
    -- Also add some screen padding so that clients do not stick to the bar
    s.padding = { bottom = s.padding.bottom + beautiful.useless_gap * 2 }

end)

-- Every bar theme should provide these fuctions
function wibars_toggle()
    local s = awful.screen.focused()
    s.mywibox.visible = not s.mywibox.visible
end
function tray_toggle()
    local s = awful.screen.focused()
    s.systray.visible = not s.systray.visible
end
