local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")
local helpers = require("helpers")

apps = {}

apps.browser = function ()
    awful.spawn(user.browser, {switchtotag = true})
end
apps.file_manager = function ()
    awful.spawn(user.file_manager, { floating = true })
end
apps.telegram = function ()
    helpers.run_or_raise({class = 'TelegramDesktop'}, false, "telegram", { switchtotag = true })
end
apps.discord = function ()
    -- Run or raise Discord running on the browser, spawned with Chromium browser's app mode
    helpers.run_or_raise({instance = 'discordapp.com__channels_@me'}, false, "chromium-browser --app=\"https://discordapp.com/channels/@me\"")
    -- Run or raise Discord app
    -- helpers.run_or_raise({class = 'discord'}, false, "discord")
end
apps.mail = function ()
    helpers.run_or_raise({instance = 'email'}, false, user.email_client, {switchtotag = true})
end
apps.gimp = function ()
    helpers.run_or_raise({class = 'Gimp'}, false, "gimp")
end
apps.steam = function ()
    helpers.run_or_raise({class = 'Steam'}, false, "steam")
end
apps.lutris = function ()
    helpers.run_or_raise({class = 'Lutris'}, false, "lutris")
end
apps.youtube = function ()
    awful.spawn.with_shell("~/scr/Rofi/rofi_mpvtube")
end
apps.networks = function ()
    awful.spawn.with_shell("~/bin/networks-rofi")
end
apps.passwords = function ()
    helpers.run_or_raise({class = 'KeePassXC'}, true, "keepassxc")
end
apps.volume = function ()
    helpers.run_or_raise({class = 'Pavucontrol'}, true, "pavucontrol")
end

apps.editor = function ()
    -- helpers.run_or_raise({class = 'Emacs'}, false, "emacs")
    helpers.run_or_raise({instance = 'editor'}, false, user.editor, { switchtotag = true })
    -- helpers.run_or_raise({class = 'editor'}, false, user.editor, { switchtotag = true })
end

apps.performance_mode = function ()
    -- local cmd = "pgrep compton > /dev/null && (pkill compton && sudo cpufreq-set -g performance && echo 'ON') || (echo 'OFF' && compton --config ~/.config/compton/compton.conf & sudo cpufreq-set -g powersave &)"
    -- awful.spawn.easy_async_with_shell(cmd, function(out)
    --     if out:match('ON') then
    --         naughty.notify({ title = "Performance mode", message = "Activated!" })
    --     else
    --         naughty.notify({ title = "Performance mode", message = "Deactivated!" })
    --     end
    -- end)
    awful.spawn.with_shell("performance_mode")
end

local night_mode_notif
apps.night_mode = function ()
    local cmd = "pgrep redshift > /dev/null && (pkill redshift && echo 'OFF') || (echo 'ON' && redshift -l 0:0 -t 3700:3700 -r &>/dev/null &)"
    awful.spawn.easy_async_with_shell(cmd, function(out)
        if out:match('ON') then
            night_mode_notif = notifications.notify_dwim({ title = "Night mode", message = "Activated!" }, night_mode_notif)
        else
            night_mode_notif = notifications.notify_dwim({ title = "Night mode", message = "Deactivated!" }, night_mode_notif)
        end
    end)
end

apps.record = function ()
    awful.spawn.with_shell("screenrec.sh")
end

-- I only use emacs for org mode :)
apps.org = function ()
    helpers.run_or_raise({class = 'Emacs'}, false, "emacs")
end

apps.music = function ()
    helpers.run_or_raise({instance = "music"}, true, user.music_client)
end

apps.process_monitor = function ()
    helpers.run_or_raise({instance = 'htop'}, false, user.terminal.." --class htop -e htop", { switchtotag = true })
end

apps.process_monitor_gui = function ()
    helpers.run_or_raise({class = 'Lxtask'}, false, "lxtask")
end

apps.temperature_monitor = function ()
    helpers.run_or_raise({class = 'sensors'}, false, user.terminal.." --class sensors -e watch sensors", { switchtotag = true, tag = mouse.screen.tags[5] })
end

apps.battery_monitor = function ()
    helpers.run_or_raise({class = 'battop'}, false, user.terminal.." --class battop -e battop", { switchtotag = true, tag = mouse.screen.tags[5] })
end

apps.markdown_scratchpad = function ()
    local cf = client.focus
    if cf and cf.name == "Markdown Scratchpad" then
        cf.minimized = true
    else
        helpers.run_or_raise(
            { name = 'Markdown Scratchpad' },
            true,
            'emacsclient -e "(markdown-input-frame)"')
    end
end

apps.scratchpad = function()
    -- local screen = awful.screen.focused()
    -- Get rid of it if it is focused
    local cf = client.focus
    -- if cf and cf.class == "scratchpad" then
    if cf and cf.instance == "scratchpad" then
        -- 1. Minimize scratchpad - Does not work?
        cf.minimized = true
        -- 2. Move scratchpad to "Miscellaneous" tag
        -- local tag = screen.tags[10]
        -- if tag then
        --     client.focus:move_to_tag(tag)
        -- end
    else
        -- helpers.run_or_raise({class = "scratchpad"}, true, "scratchpad")
        helpers.run_or_raise({instance = "scratchpad"}, true, "scratchpad")
    end
end
