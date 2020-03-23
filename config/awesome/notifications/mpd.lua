local naughty = require("naughty")

notifications.mpd = {}

local notif
local first_time = true
local timeout = 2

local send_mpd_notif = function (artist, song, paused)
    if first_time then
        first_time = false
    else
        if paused or sidebar.visible then
            -- Sidebar and already shows mpd info, so
            -- destroy notification if it exists
            -- Also destroy it if music pauses
            if notif then
                notif:destroy()
            end
        else
            -- Send notification
            notif = notifications.notify_dwim({ title = "Now playing:", message = "<b>"..song.."</b> by <b>"..artist.."</b>", icon = icons.music, timeout = timeout, app_name = "mpd" }, notif)
        end
    end
end

-- Allow dynamically toggling mpd notifications
notifications.mpd.enable = function()
    awesome.connect_signal("evil::mpd", send_mpd_notif)
    notifications.mpd.enabled = true
end
notifications.mpd.disable = function()
    awesome.disconnect_signal("evil::mpd", send_mpd_notif)
    notifications.mpd.enabled = false
end
notifications.mpd.toggle = function()
    if notifications.mpd.enabled then
        notifications.mpd.disable()
    else
        notifications.mpd.enable()
    end
end

-- Start with mpd notifications enabled
notifications.mpd.enable()
