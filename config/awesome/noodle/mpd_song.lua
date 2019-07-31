local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Set colors
local title_color =  beautiful.mpd_song_title_color or beautiful.wibar_fg
local artist_color = beautiful.mpd_song_artist_color or beautiful.wibar_fg
local paused_color = beautiful.mpd_song_paused_color or beautiful.normal_fg

local mpd_title = wibox.widget{
    text = "---------",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local mpd_artist = wibox.widget{
    text = "---------",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

-- Main widget
local mpd_song = wibox.widget{
    mpd_title,
    mpd_artist,
    layout = wibox.layout.fixed.vertical
}

local artist_fg
local artist_bg
awesome.connect_signal("evil::mpd", function(artist, title, status)
    if status == "paused" then
        artist_fg = paused_color
        title_fg = paused_color
    else
        artist_fg = artist_color
        title_fg = title_color
    end

    -- Escape &'s
    title = string.gsub(title, "&", "&amp;")
    artist = string.gsub(artist, "&", "&amp;")

    mpd_title.markup =
        "<span foreground='" .. title_fg .."'>"
        .. title .. "</span>"
    mpd_artist.markup =
        "<span foreground='" .. artist_fg .."'>"
        .. artist .. "</span>"
end)

return mpd_song
