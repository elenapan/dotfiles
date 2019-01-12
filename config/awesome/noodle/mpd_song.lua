-- NOTE:
-- This widget runs a script in the background
-- When awesome restarts, its process will remain alive!
-- Don't worry though! The cleanup script that runs in rc.lua takes care of it :)

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Set colors
local title_color =  beautiful.mpd_song_title_color or beautiful.wibar_fg
local artist_color = beautiful.mpd_song_artist_color or beautiful.wibar_fg
local paused_color = beautiful.mpd_song_paused_color or beautiful.normal_fg
-- Set notification icon path
local notification_icon = beautiful.music_icon

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

local last_notification_id
local function send_notification(artist, title)
  notification = naughty.notify({
      -- title = "Now playing:",
      -- text = title .. " -- " .. artist,
      title = title,
      text = artist,
      icon = notification_icon,
      -- width = 360,
      -- height = 90,
      icon_size = 60,
      timeout = 4,
      replaces_id = last_notification_id
  })
  last_notification_id = notification.id
end

local function update_widget()
  awful.spawn.easy_async({"mpc", "-f", "[[%artist%@@%title%@]]"},
    function(stdout)
      local artist = stdout:match('(.*)@@')
      local title = stdout:match('@@(.*)@')
      title = string.gsub(title, '^%s*(.-)%s*$', '%1')
      local status = stdout:match('%[(.*)%]')
      status = string.gsub(status, '^%s*(.-)%s*$', '%1')
      if status == "paused" then
        artist_fg = paused_color
        title_fg = paused_color
      else
        artist_fg = artist_color
        title_fg = title_color
        if sidebar.visible == false then
          send_notification(artist, title)
        end
      end

      -- Escape &'s
      title = string.gsub(title, "&", "&amp;")
      artist = string.gsub(artist, "&", "&amp;")

      -- naughty.notify({text = artist .. " - " .. title})
      mpd_title.markup =
        "<span foreground='" .. title_fg .."'>"
        .. title .. "</span>"
      mpd_artist.markup =
        "<span foreground='" .. artist_fg .."'>"
        .. artist .. "</span>"
    end
  )

end

update_widget()

-- Sleeps until mpd changes state (pause/play/next/prev)
local mpd_script = [[
  bash -c '
  mpc idleloop player
  ']]

awful.spawn.with_line_callback(mpd_script, {
                                 stdout = function(line)
                                   update_widget()
                                 end
})


return mpd_song
