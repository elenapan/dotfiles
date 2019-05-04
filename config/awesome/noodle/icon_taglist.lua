local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")
local capi = { screen = screen, client = client }

local ntags = 10
local s = awful.screen.focused()
local tag_icons = {}
-- Create imageboxes and set their buttons
for i = 1, ntags do
  table.insert(tag_icons, wibox.widget.imagebox())
  tag_icons[i]:buttons(
    gears.table.join(
      -- Left click - Tag back and forth
      awful.button({ }, 1, function ()
          local current_tag = s.selected_tag
          local clicked_tag = s.tags[i]
          if clicked_tag == current_tag then
            awful.tag.history.restore()
          else
            clicked_tag:view_only()
          end
          -- naughty.notify({ text = tostring(i) })
      end),
      -- Right click - Move focused client to tag
      awful.button({ }, 3, function ()
          local clicked_tag = s.tags[i]
          if client.focus then
            client.focus:move_to_tag(clicked_tag)
          end
      end)
  ))
end

local icon_taglist = wibox.widget{
  tag_icons[1],
  tag_icons[2],
  tag_icons[3],
  tag_icons[4],
  tag_icons[5],
  tag_icons[6],
  tag_icons[7],
  tag_icons[8],
  tag_icons[9],
  tag_icons[10],
  layout = wibox.layout.fixed.horizontal
}

icon_taglist:buttons(
gears.table.join(
  -- Scroll - Cycle through tags
  awful.button({ }, 4, function ()
      awful.tag.viewprev()
  end),
  awful.button({ }, 5, function ()
      awful.tag.viewnext()
  end)
))


-- Shorter names (eg. f = focused) to save space
local f, u, o, e;
-- Set fallback values if needed
if beautiful.taglist_icons_focused then
    f = beautiful.taglist_icons_focused
    u = beautiful.taglist_icons_urgent
    o = beautiful.taglist_icons_occupied
    e = beautiful.taglist_icons_empty
else
   -- Fallback values (very useless ones though)
    local i = beautiful.awesome_icon
    f = {i, i, i, i, i, i, i, i, i, i}
    u = f
    o = f
    e = f
end


local function update_widget()
  for i = 1, ntags do
    local tag_clients
    if s.tags[i] then
      tag_clients = s.tags[i]:clients()
    end
    if s.tags[i] and s.tags[i].selected then
      tag_icons[i].image = f[i]
    elseif s.tags[i] and s.tags[i].urgent then
      tag_icons[i].image = u[i]
    elseif tag_clients and #tag_clients > 0 then
      tag_icons[i].image = o[i]
    else
      tag_icons[i].image = e[i]
    end
  end
end

-- Signals
--icon_taglist:connect_signal("mouse::enter", function ()
    --awful.spawn.with_shell("notify-send hello")
--end)
--icon_taglist:connect_signal("mouse::leave", function ()
    --awful.spawn.with_shell("notify-send bye")
--end)

client.connect_signal("unmanage", function(c)
    update_widget()
end)
client.connect_signal("untagged", function(c)
    update_widget()
end)
client.connect_signal("tagged", function(c)
                        update_widget()
end)
client.connect_signal("screen", function(c)
                        update_widget()
end)
awful.tag.attached_connect_signal(s, "property::selected", function ()
                                    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::hide", function ()
                                    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::activated", function ()
                                    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::screen", function ()
                                    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::index", function ()
                                    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::urgent", function ()
                                    update_widget()
end)
--capi.screen.connect_signal("removed", function(s)
                                -- instances[get_screen(s)] = nil
                                -- end)

return icon_taglist
