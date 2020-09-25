local naughty = require("naughty")
local icons = require("icons")
local notifications = require("notifications")

notifications.mpd = {}

local notif
local first_time = true
local timeout = 2

local old_artist, old_song
local send_mpd_notif = function (artist, song, paused)
    if first_time then
        first_time = false
    else
        if  paused or (sidebar and sidebar.visible)
            or (client.focus and (client.focus.instance == "music" or client.focus.class == "music")) then
            -- Sidebar and already shows mpd info, so
            -- destroy notification if it exists
            -- Also destroy it if music pauses
            if notif then
                notif:destroy()
            end
        else
            -- Since the evil::mpd signal is also emitted when seeking, only
            -- send a notification when the song and artist are different than
            -- before.
            if artist ~= old_artist and song ~=old_song then
                notif = notifications.notify_dwim(
                    {
                        title = "Now playing:",
                        message = "<b>"..song.."</b> by <b>"..artist.."</b>",
                        icon = icons.image.music,
                        timeout = timeout,
                        app_name = "mpd"
                    },
                    notif)
            end
        end
        old_artist = artist
        old_song = song
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
