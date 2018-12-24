local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")
local capi = { screen = screen, client = client }

-- Get theme variables
local visible_clients_color = beautiful.icon_taglist_visible_clients_color or "#1D8CD2"
local visible_clients_text = beautiful.icon_taglist_visible_clients_text or "v: "
local hidden_clients_color = beautiful.icon_taglist_hidden_clients_color or "#2DD283"
local hidden_clients_text = beautiful.icon_taglist_hidden_clients_text or "h: "

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
      end),
      -- Right click - Move focused client to tag
      awful.button({ }, 3, function ()
          local clicked_tag = s.tags[i]
          if client.focus then
            client.focus:move_to_tag(clicked_tag)
          end
      end),
      -- Scroll - Cycle through tags
      awful.button({ }, 4, function ()
          awful.tag.viewprev()
      end),
      awful.button({ }, 5, function ()
          awful.tag.viewnext()
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

local function update_widget()
  for i = 1, ntags do
    local tag_clients
    if s.tags[i] then
      tag_clients = s.tags[i]:clients()
    end
    if s.tags[i] == s.selected_tag then
      tag_icons[i].image = beautiful.taglist_icons_focused[i]
    elseif awful.tag.getproperty(s.tags[i], "urgent") then
      tag_icons[i].image = beautiful.taglist_icons_urgent[i]
    elseif tag_clients and #tag_clients > 0 then
      tag_icons[i].image = beautiful.taglist_icons_occupied[i]
    else
      tag_icons[i].image = beautiful.taglist_icons_empty[i]
    end
  end
end

-- Signals
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
