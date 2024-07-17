local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local icons = require("icons")
local exit_screen_obj = require("elemental.exit_screen")
local commands = exit_screen_obj.commands

local helpers = require("helpers")

func_lock = function ()
    commands["lock"]()
    -- Kinda fixes the "white" (undimmed) flash that appears between
    -- exit screen disappearing and lock screen appearing
    gears.timer.delayed_call(function()
        exit_screen_hide()
    end)
end

func_suspend = function ()
    commands["suspend"]()
    exit_screen_hide()
end

-- Appearance
local icon_size = beautiful.exit_screen_icon_size or dpi(140)
local text_font = beautiful.exit_screen_font or "sans 14"

local username = os.getenv("USER")
-- Capitalize username
local goodbye_widget = wibox.widget.textbox("Goodbye " .. username:sub(1,1):upper()..username:sub(2))
goodbye_widget.font = "sans 70"

local poweroff_icon = wibox.widget.imagebox(icons.image.poweroff)
poweroff_icon.resize = true
poweroff_icon.forced_width = icon_size
poweroff_icon.forced_height = icon_size
local poweroff_text = wibox.widget.textbox("Poweroff")
poweroff_text.font = text_font

local poweroff = wibox.widget{
    {
        nil,
        poweroff_icon,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        poweroff_text,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    -- forced_width = 100,
    layout = wibox.layout.fixed.vertical
}
poweroff:buttons(gears.table.join(
    awful.button({ }, 1, commands["poweroff"])
))

local reboot_icon = wibox.widget.imagebox(icons.image.reboot)
reboot_icon.resize = true
reboot_icon.forced_width = icon_size
reboot_icon.forced_height = icon_size
local reboot_text = wibox.widget.textbox("Reboot")
reboot_text.font = text_font

local reboot = wibox.widget{
    {
        nil,
        reboot_icon,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        reboot_text,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    -- forced_width = 100,
    layout = wibox.layout.fixed.vertical
}
reboot:buttons(gears.table.join(
    awful.button({ }, 1, commands["reboot"])
))

local suspend_icon = wibox.widget.imagebox(icons.image.suspend)
suspend_icon.resize = true
suspend_icon.forced_width = icon_size
suspend_icon.forced_height = icon_size
local suspend_text = wibox.widget.textbox("Suspend")
suspend_text.font = text_font

local suspend = wibox.widget{
    {
        nil,
        suspend_icon,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        suspend_text,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    -- forced_width = 100,
    layout = wibox.layout.fixed.vertical
}
suspend:buttons(gears.table.join(
    awful.button({ }, 1, func_suspend)
))

local exit_icon = wibox.widget.imagebox(icons.image.exit)
exit_icon.resize = true
exit_icon.forced_width = icon_size
exit_icon.forced_height = icon_size
local exit_text = wibox.widget.textbox("Exit")
exit_text.font = text_font

local exit = wibox.widget{
    {
        nil,
        exit_icon,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        exit_text,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    -- forced_width = 100,
    layout = wibox.layout.fixed.vertical
}
exit:buttons(gears.table.join(
    awful.button({ }, 1, commands["exit"])
))

local lock_icon = wibox.widget.imagebox(icons.image.lock)
lock_icon.resize = true
lock_icon.forced_width = icon_size
lock_icon.forced_height = icon_size
local lock_text = wibox.widget.textbox("Lock")
lock_text.font = text_font

local lock = wibox.widget{
    {
        nil,
        lock_icon,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        lock_text,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    -- forced_width = 100,
    layout = wibox.layout.fixed.vertical
}
lock:buttons(gears.table.join(
    awful.button({ }, 1, func_lock)
))

-- Create the widget
exit_screen = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(exit_screen)

exit_screen.bg = beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
exit_screen.fg = beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

-- Create an container box
-- local exit_screen_box = wibox.container.background()
-- exit_screen_box.bg = exit_screen.bg
-- exit_screen_box.shape = gears.shape.rounded_rect
-- exit_screen_box.shape_border_radius = 20

local exit_screen_grabber
function exit_screen_hide()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end

local keybinds = {
    ['escape'] = exit_screen_hide,
    ['q'] = exit_screen_hide,
    ['x'] = exit_screen_hide,
    ['s'] = func_suspend,
    ['e'] = commands["exit"],
    ['p'] = commands["poweroff"],
    ['r'] = commands["reboot"],
    ['l'] = func_lock
}

function exit_screen_show()
    -- naughty.notify({text = "starting the keygrabber"})
    exit_screen_grabber = awful.keygrabber.run(function(_, key, event)
        -- Ignore case
        key = key:lower()

        if event == "release" then return end

        if keybinds[key] then
            keybinds[key]()
        end
    end)
    exit_screen.visible = true
end

exit_screen:buttons(gears.table.join(
    -- Middle click - Hide exit_screen
    awful.button({ }, 2, function ()
        exit_screen_hide()
    end),
    -- Right click - Hide exit_screen
    awful.button({ }, 3, function ()
        exit_screen_hide()
    end)
))

-- Item placement
exit_screen:setup {
    nil,
    {
        {
            nil,
            goodbye_widget,
            nil,
            expand = "none",
            layout = wibox.layout.align.horizontal
        },
        {
            nil,
            {
                poweroff,
                reboot,
                suspend,
                exit,
                lock,
                spacing = dpi(20),
                layout = wibox.layout.fixed.horizontal
            },
            nil,
            expand = "none",
            layout = wibox.layout.align.horizontal
            -- layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.fixed.vertical
    },
    nil,
    expand = "none",
    layout = wibox.layout.align.vertical
}
