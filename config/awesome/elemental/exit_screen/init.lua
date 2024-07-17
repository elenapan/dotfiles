local awful = require("awful")
local naughty = require("naughty")

local exit_screen = {}
exit_screen.commands = {
    poweroff = function ()
        awful.spawn.with_shell("loginctl poweroff")
    end,
    reboot = function ()
        awful.spawn.with_shell("loginctl reboot")
    end,
    suspend = function ()
        lock_screen_show()
        awful.spawn.with_shell("loginctl suspend")
    end,
    hibernate = function ()
        awful.spawn.with_shell("loginctl hibernate")
    end,
    exit = function ()
        awesome.quit()
    end,
    lock = function ()
        lock_screen_show()
    end,
}

return exit_screen
