local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local last_notification_id
-- local screen_height = mouse.screen.geometry.height
local function send_notification(notification_title, notification_text, notification_icon, notification_timeout)
  notification = naughty.notify({
      title = notification_title,
      text = notification_text,
      icon = notification_icon,
      width = dpi(220),
      -- height = dpi(75),
      position = "top_middle",
      icon_size = dpi(50),
      timeout = notification_timeout or 1.5,
      replaces_id = last_notification_id
  })
  last_notification_id = notification.id
end

local s = awful.screen.focused()

-- Notification for changing tags
-- awful.tag.attached_connect_signal(s, "property::selected", function ()
--     local t = s.selected_tag
--     if t then
--         send_notification( "You are on: ","Tag " .. t.index, beautiful.taglist_icons_empty[t.index])
--     end
-- end)

-- Notification for urgent clients that appear
awful.tag.attached_connect_signal(s, "property::urgent", function (t)
    send_notification("Urgent client:", "Tag ".. t.index, beautiful.alert_icon, 4)
end)

-- Notification for tag layout change
awful.tag.attached_connect_signal(s, "property::layout", function ()
    local l = awful.layout.get(s)
    if l then
        local name = awful.layout.getname(l)
        send_notification("Layout:", name, beautiful["layout_"..name])
    end
end)
