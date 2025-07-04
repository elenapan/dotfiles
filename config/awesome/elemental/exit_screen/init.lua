local awful = require("awful")
local naughty = require("naughty")

local ctl_var = "\"$(command -v systemctl >/dev/null && echo systemctl || echo loginctl)\""

local exit_screen = {}
exit_screen.commands = {
    poweroff = function ()
        awful.spawn.with_shell(ctl_var.." poweroff")
    end,
    reboot = function ()
        awful.spawn.with_shell(ctl_var.." reboot")
    end,
    suspend = function ()
        lock_screen_show()
        awful.spawn.with_shell(ctl_var.." suspend")
    end,
    hibernate = function ()
        awful.spawn.with_shell(ctl_var.." hibernate")
    end,
    exit = function ()
        awesome.quit()
    end,
    lock = function ()
        lock_screen_show()
    end,
}

return exit_screen
