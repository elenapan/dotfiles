local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local naughty = require("naughty")
local capi = { screen = screen, client = client }

local helpers = require("helpers")

local ntags = 10
local s = awful.screen.focused()
local tag_text = {}

-- Create textboxes and set their buttons
for i = 1, ntags do
  table.insert(tag_text, wibox.widget.textbox())
  tag_text[i]:buttons(
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
  tag_text[i].font = beautiful.taglist_text_font
  -- So that glyphs of different width always take up the same space in the taglist
  tag_text[i].forced_width = dpi(25)
  tag_text[i].align = "center"
  tag_text[i].valign = "center"
end

local text_taglist = wibox.widget{
  tag_text[1],
  tag_text[2],
  tag_text[3],
  tag_text[4],
  tag_text[5],
  tag_text[6],
  tag_text[7],
  tag_text[8],
  tag_text[9],
  tag_text[10],
  layout = wibox.layout.fixed.horizontal
}

text_taglist:buttons(
gears.table.join(
  -- Middle click - Show clients in current tag
  awful.button({ }, 2, function ()
    awful.spawn.with_shell("rofi -show windowcd")
  end),
  -- Scroll - Cycle through tags
  awful.button({ }, 4, function ()
      awful.tag.viewprev()
  end),
  awful.button({ }, 5, function ()
      awful.tag.viewnext()
  end)
))

-- Shorter names (eg. tf = text_focused) to save space
local tf, tu, to, te, tcf, tcu, tco, tce;
-- Set fallback values if needed
if beautiful.taglist_text_focused then
    tf = beautiful.taglist_text_focused
    tu = beautiful.taglist_text_urgent
    to = beautiful.taglist_text_occupied
    te = beautiful.taglist_text_empty
    cf = beautiful.taglist_text_color_focused
    cu = beautiful.taglist_text_color_urgent
    co = beautiful.taglist_text_color_occupied
    ce = beautiful.taglist_text_color_empty
else
   -- Fallback values
    tf = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
    tu = tf
    to = tf
    te = tf

    local ff = beautiful.fg_focus
    local fu = beautiful.fg_urgent
    local fo = beautiful.fg_normal
    local fe = beautiful.fg_minimize

    cf = {ff, ff, ff, ff, ff, ff, ff, ff, ff, ff}
    cu = {fu, fu, fu, fu, fu, fu, fu, fu, fu, fu}
    co = {fo, fo, fo, fo, fo, fo, fo, fo, fo, fo}
    ce = {fe, fe, fe, fe, fe, fe, fe, fe, fe, fe}
end

local function update_widget()
  for i = 1, ntags do
    local tag_clients
    if s.tags[i] then
      tag_clients = s.tags[i]:clients()
    end
    if s.tags[i] and s.tags[i].selected then
        tag_text[i].markup = helpers.colorize_text(tf[i], cf[i])
    elseif s.tags[i] and s.tags[i].urgent then
        tag_text[i].markup = helpers.colorize_text(tu[i], cu[i])
    elseif tag_clients and #tag_clients > 0 then
        tag_text[i].markup = helpers.colorize_text(to[i], co[i])
    else
        tag_text[i].markup = helpers.colorize_text(te[i], ce[i])
    end
  end
end


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

return text_taglist
