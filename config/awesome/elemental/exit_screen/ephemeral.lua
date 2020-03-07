local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
-- local naughty = require("naughty")

local helpers = require("helpers")

-- Appearance
-- icomoon symbols
local icon_font = "icomoon bold 45"
local poweroff_text_icon = ""
local reboot_text_icon = ""
local suspend_text_icon = ""
local exit_text_icon = ""
-- local exit_text_icon = ""
-- local poweroff_text_icon = ""
-- local reboot_text_icon = ""
-- local suspend_text_icon = ""
-- local exit_text_icon = ""
local lock_text_icon = ""

-- Typicons symbols
-- local icon_font = "Typicons 90"
-- local poweroff_text_icon = ""
-- local reboot_text_icon = ""
-- local suspend_text_icon = ""
-- local exit_text_icon = ""
-- local lock_text_icon = ""

local button_bg = x.color0
local button_size = dpi(120)


-- Commands
local poweroff_command = function()
    awful.spawn.with_shell("poweroff")
end
local reboot_command = function()
    awful.spawn.with_shell("reboot")
end
local suspend_command = function()
    lock_screen_show()
    awful.spawn.with_shell("systemctl suspend")
end
local exit_command = function()
    awesome.quit()
end
local lock_command = function()
    lock_screen_show()
end

-- Helper function that generates the clickable buttons
local create_button = function(symbol, hover_color, text, command)
    local icon = wibox.widget {
        forced_height = button_size,
        forced_width = button_size,
        align = "center",
        valign = "center",
        font = icon_font,
        text = symbol,
        -- markup = helpers.colorize_text(symbol, color),
        widget = wibox.widget.textbox()
    }

    local button = wibox.widget {
        {
            nil,
            icon,
            expand = "none",
            layout = wibox.layout.align.horizontal
        },
        forced_height = button_size,
        forced_width = button_size,
        border_width = dpi(8),
        border_color = button_bg,
        shape = helpers.rrect(dpi(20)),
        bg = button_bg,
        widget = wibox.container.background
    }

    -- Bind left click to run the command
    button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            command()
        end)
    ))

    -- Change color on hover
    button:connect_signal("mouse::enter", function ()
        icon.markup = helpers.colorize_text(icon.text, hover_color)
        button.border_color = hover_color
    end)
    button:connect_signal("mouse::leave", function ()
        icon.markup = helpers.colorize_text(icon.text, x.foreground)
        button.border_color = button_bg
    end)

    -- Use helper function to change the cursor on hover
    helpers.add_hover_cursor(button, "hand1")

    return button
end

-- Create the buttons
local poweroff = create_button(poweroff_text_icon, x.color1, "Poweroff", poweroff_command)
local reboot = create_button(reboot_text_icon, x.color2, "Reboot", reboot_command)
local suspend = create_button(suspend_text_icon, x.color3, "Suspend", suspend_command)
local exit = create_button(exit_text_icon, x.color4, "Exit", exit_command)
local lock = create_button(lock_text_icon, x.color5, "Lock", lock_command)

-- Create the exit screen wibox
exit_screen = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(exit_screen)

exit_screen.bg = beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
exit_screen.fg = beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

local exit_screen_grabber
function exit_screen_hide()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end
function exit_screen_show()
    exit_screen_grabber = awful.keygrabber.run(function(_, key, event)
        -- Ignore case
        key = key:lower()

        if event == "release" then return end

        if key == 's' then
            suspend_command()
            exit_screen_hide()
            -- 'e' for exit
        elseif key == 'e' then
            exit_command()
        elseif key == 'l' then
            lock_command()
            -- Kinda fixes the "white" (undimmed) flash that appears between
            -- exit screen disappearing and lock screen appearing
            gears.timer.delayed_call(function()
                exit_screen_hide()
            end)
        elseif key == 'p' then
            poweroff_command()
        elseif key == 'r' then
            reboot_command()
        elseif key == 'escape' or key == 'q' or key == 'x' then
            exit_screen_hide()
        end
    end)
    exit_screen.visible = true
end

exit_screen:buttons(gears.table.join(
    -- Left click - Hide exit_screen
    awful.button({ }, 1, function ()
        exit_screen_hide()
    end),
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
        nil,
        {
            poweroff,
            reboot,
            suspend,
            exit,
            lock,
            spacing = dpi(50),
            layout = wibox.layout.fixed.horizontal
        },
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    expand = "none",
    layout = wibox.layout.align.vertical
}
