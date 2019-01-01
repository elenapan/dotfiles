local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local pad = helpers.pad

-- Item configuration
local exit_icon = wibox.widget.imagebox(beautiful.poweroff_icon)
exit_icon.resize = true
exit_icon.forced_width = 40
exit_icon.forced_height = 40
local exit_text = wibox.widget.textbox("Exit")
exit_text.font = "sans 13"

local exit = wibox.widget{
  exit_icon,
  exit_text,
  layout = wibox.layout.fixed.horizontal
}
exit:buttons(gears.table.join(
                 awful.button({ }, 1, function ()
                     exit_screen_show()
                     sidebar.visible = false
                 end)
))

local weather_widget = require("noodle.weather")
local weather_widget_text = weather_widget:get_all_children()[2]
weather_widget_text.font = "sans 13"
-- Dummy weather_widget for testing
-- (avoid making requests with every awesome restart)
-- local weather_widget = wibox.widget.textbox("[icon] clear sky 8oC")
local weather = wibox.widget{
    pad(0),
    weather_widget,
    pad(0),
    layout = wibox.layout.align.horizontal,
    expand = "none"
}

local temperature_icon = wibox.widget.imagebox(beautiful.temperature_icon)
temperature_icon.resize = true
temperature_icon.forced_width = 40
temperature_icon.forced_height = 40
local temperature_bar = require("noodle.temperature_bar")
local temperature = wibox.widget{
  pad(0),
  {
    temperature_icon,
    pad(1),
    temperature_bar,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

local battery_icon = wibox.widget.imagebox(beautiful.battery_icon)
battery_icon.resize = true
battery_icon.forced_width = 40
battery_icon.forced_height = 40
awesome.connect_signal(
  "charger_plugged", function(c)
    battery_icon.image = beautiful.battery_charging_icon
end)
awesome.connect_signal(
  "charger_unplugged", function(c)
    battery_icon.image = beautiful.battery_icon
end)
local battery_bar = require("noodle.battery_bar")
local battery = wibox.widget{
  pad(0),
  {
    battery_icon,
    pad(1),
    battery_bar,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

local cpu_icon = wibox.widget.imagebox(beautiful.cpu_icon)
cpu_icon.resize = true
cpu_icon.forced_width = 40
cpu_icon.forced_height = 40
local cpu_bar = require("noodle.cpu_bar")
local cpu = wibox.widget{
  pad(0),
  {
    cpu_icon,
    pad(1),
    cpu_bar,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

cpu:buttons(
  gears.table.join(
    awful.button({ }, 1, function ()
        local matcher = function (c)
          return awful.rules.match(c, {name = 'htop'})
        end
        awful.client.run_or_raise(terminal .." -e htop", matcher)
    end),
    awful.button({ }, 3, function ()
        local matcher = function (c)
          return awful.rules.match(c, {class = 'Lxtask'})
        end
        awful.client.run_or_raise("lxtask", matcher)
    end)
))

local ram_icon = wibox.widget.imagebox(beautiful.ram_icon)
ram_icon.resize = true
ram_icon.forced_width = 40
ram_icon.forced_height = 40
local ram_bar = require("noodle.ram_bar")
local ram = wibox.widget{
  pad(0),
  {
    ram_icon,
    pad(1),
    ram_bar,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

ram:buttons(
  gears.table.join(
    awful.button({ }, 1, function ()
        local matcher = function (c)
          return awful.rules.match(c, {name = 'htop'})
        end
        awful.client.run_or_raise(terminal .." -e htop", matcher)
    end),
    awful.button({ }, 3, function ()
        local matcher = function (c)
          return awful.rules.match(c, {class = 'Lxtask'})
        end
        awful.client.run_or_raise("lxtask", matcher)
    end)
))


local playerctl_button_size = 50
local playerctl_toggle_icon = wibox.widget.imagebox(beautiful.playerctl_toggle_icon)
playerctl_toggle_icon.resize = true
playerctl_toggle_icon.forced_width = playerctl_button_size
playerctl_toggle_icon.forced_height = playerctl_button_size
playerctl_toggle_icon:buttons(gears.table.join(
                         awful.button({ }, 1, function ()
                             awful.spawn.with_shell("mpc toggle")
                         end),
                         awful.button({ }, 3, function ()
                             awful.spawn.with_shell("mpvc toggle")
                         end)
))

local playerctl_prev_icon = wibox.widget.imagebox(beautiful.playerctl_prev_icon)
playerctl_prev_icon.resize = true
playerctl_prev_icon.forced_width = playerctl_button_size
playerctl_prev_icon.forced_height = playerctl_button_size
playerctl_prev_icon:buttons(gears.table.join(
                         awful.button({ }, 1, function ()
                             awful.spawn.with_shell("mpc prev")
                         end),
                         awful.button({ }, 3, function ()
                             awful.spawn.with_shell("mpvc prev")
                         end)
))

local playerctl_next_icon = wibox.widget.imagebox(beautiful.playerctl_next_icon)
playerctl_next_icon.resize = true
playerctl_next_icon.forced_width = playerctl_button_size
playerctl_next_icon.forced_height = playerctl_button_size
playerctl_next_icon:buttons(gears.table.join(
                         awful.button({ }, 1, function ()
                             awful.spawn.with_shell("mpc next")
                         end),
                         awful.button({ }, 3, function ()
                             awful.spawn.with_shell("mpvc next")
                         end)
))

local playerctl_buttons = wibox.widget {
  pad(0),
  {
    playerctl_prev_icon,
    pad(1),
    playerctl_toggle_icon,
    pad(1),
    playerctl_next_icon,
    layout  = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal,
}

local time = wibox.widget.textclock("%H %M")
time.align = "center"
time.valign = "center"
time.font = "sans 50"

local date = wibox.widget.textclock("%A, %B %d")
-- local date = wibox.widget.textclock("%A, %B %d, %Y")
date.align = "center"
date.valign = "center"
date.font = "sans medium 15"

local fancy_date = wibox.widget.textclock("%-j days around the sun")
fancy_date.align = "center"
fancy_date.valign = "center"
fancy_date.font = "sans 11"

local mpd_song = require("noodle.mpd_song")
local mpd_widget_children = mpd_song:get_all_children()
local mpd_title = mpd_widget_children[1]
local mpd_artist = mpd_widget_children[2]
mpd_title.font = "sans medium 13"
mpd_artist.font = "sans 11"
-- Set forced height in order to limit the widgets to one line.
-- Might need to be adjusted depending on the font.
mpd_title.forced_height = 22
mpd_artist.forced_height = 22

mpd_song:buttons(gears.table.join(
                awful.button({ }, 1, function ()
                    awful.spawn.with_shell("mpc toggle")
                end),
                awful.button({ }, 3, function ()
                    awful.spawn(terminal .. " -e ncmpcpp", {floating = true})
                end),
                awful.button({ }, 4, function ()
                    awful.spawn.with_shell("mpc prev")
                end),
                awful.button({ }, 5, function ()
                    awful.spawn.with_shell("mpc next")
                end)
))

local disk_space = require("noodle.disk")
disk_space.font = "sans 13"
local disk_icon = wibox.widget.imagebox(beautiful.files_icon)
disk_icon.resize = true
disk_icon.forced_width = 40
disk_icon.forced_height = 40
local disk = wibox.widget{
  pad(0),
  {
    disk_icon,
    disk_space,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

disk:buttons(gears.table.join(
                       awful.button({ }, 1, function ()
                           awful.spawn(filemanager, {floating = true})
                       end),
                       awful.button({ }, 3, function ()
                           awful.spawn(filemanager .. " /data", {floating = true})
                       end)
))

local search_icon = wibox.widget.imagebox(beautiful.search_icon)
search_icon.resize = true
search_icon.forced_width = 40
search_icon.forced_height = 40
local search_text = wibox.widget.textbox("Search")
search_text.font = "sans 13"

local search = wibox.widget{
  search_icon,
  search_text,
  layout = wibox.layout.fixed.horizontal
}
search:buttons(gears.table.join(
                 awful.button({ }, 1, function ()
                     awful.spawn.with_shell("rofi -show combi")
                 end),
                 awful.button({ }, 3, function ()
                     awful.spawn.with_shell("rofi -show run")
                 end)
))

local volume_icon = wibox.widget.imagebox(beautiful.volume_icon)
volume_icon.resize = true
volume_icon.forced_width = 40
volume_icon.forced_height = 40
local volume_bar = require("noodle.volume_bar")
local volume = wibox.widget{
  pad(0),
  {
    volume_icon,
    pad(1),
    volume_bar,
    layout = wibox.layout.fixed.horizontal
  },
  pad(0),
  expand = "none",
  layout = wibox.layout.align.horizontal
}

volume:buttons(gears.table.join(
                 -- Left click - Mute / Unmute
                 awful.button({ }, 1, function ()
                     awful.spawn.with_shell("volume-control.sh toggle")
                 end),
                 -- Right click - Run or raise pavucontrol
                 awful.button({ }, 3, function () 
                     local matcher = function (c)
                       return awful.rules.match(c, {class = 'Pavucontrol'})
                     end
                     awful.client.run_or_raise("pavucontrol", matcher)
                 end),
                 -- Scroll - Increase / Decrease volume
                 awful.button({ }, 4, function () 
                     awful.spawn.with_shell("volume-control.sh up")
                 end),
                 awful.button({ }, 5, function () 
                     awful.spawn.with_shell("volume-control.sh down")
                 end)
))


-- Create the sidebar
sidebar = wibox({x = 0, y = 0, visible = false, ontop = true, type = "dock"})

sidebar.bg = beautiful.sidebar_bg or beautiful.wibar_bg or "#111111"
sidebar.fg = beautiful.sidebar_fg or beautiful.wibar_fg or "#FFFFFF"
sidebar.opacity = beautiful.sidebar_opacity or 1
sidebar.height = beautiful.sidebar_height or awful.screen.focused().geometry.height
sidebar.width = beautiful.sidebar_width or 300
sidebar.y = beautiful.sidebar_y or 0
local radius = beautiful.sidebar_border_radius or 0
if beautiful.sidebar_position == "right" then
  sidebar.x = awful.screen.focused().geometry.width - sidebar.width
  sidebar.shape = helpers.prrect(radius, true, false, false, true)
else
  sidebar.x = 0
  sidebar.shape = helpers.prrect(radius, false, true, true, false)
end

sidebar:buttons(gears.table.join(
                  -- Middle click - Hide sidebar
                  awful.button({ }, 2, function ()
                      sidebar.visible = false
                  end)
))

-- Hide sidebar when mouse leaves
if beautiful.sidebar_hide_on_mouse_leave then
  sidebar:connect_signal("mouse::leave", function ()
                           sidebar.visible = false
  end)
end
-- Activate sidebar by moving the mouse at the edge of the screen
if beautiful.sidebar_hide_on_mouse_leave then
  local sidebar_activator = wibox({y = 0, width = 1, height = awful.screen.focused().geometry.height, visible = true, ontop = false, opacity = 0, below = true})
  sidebar_activator:connect_signal("mouse::enter", function ()
                                     sidebar.visible = true
  end)

  if beautiful.sidebar_position == "right" then
    sidebar_activator.x = awful.screen.focused().geometry.width - sidebar_activator.width
  else
    sidebar_activator.x = 0
  end

  sidebar_activator:buttons(
    gears.table.join(
      awful.button({ }, 2, function ()
          sidebar.visible = not sidebar.visible
      end),
      awful.button({ }, 4, function ()
          awful.tag.viewprev()
      end),
      awful.button({ }, 5, function ()
          awful.tag.viewnext()
      end)
  ))
end

-- Item placement
sidebar:setup {
  { ----------- TOP GROUP -----------
    pad(1),
    pad(1),
    time,
    date,
    fancy_date,
    pad(1),
    weather,
    pad(1),
    pad(1),
    layout = wibox.layout.fixed.vertical
  },
  { ----------- MIDDLE GROUP -----------
    playerctl_buttons,
    {
      -- Put some padding at the left and right edge so that
      -- it looks better with extremely long titles/artists
      pad(2),
      mpd_song,
      pad(2),
      layout = wibox.layout.align.horizontal,
    },
    pad(1),
    pad(1),
    volume,
    cpu,
    temperature,
    ram,
    battery,
    pad(1),
    disk,
    pad(1),
    pad(1),
    layout = wibox.layout.fixed.vertical
  },
  { ----------- BOTTOM GROUP -----------
    { -- Search and exit screen
      pad(0),
      {
        search,
        pad(5),
        exit,
        pad(2),
        layout = wibox.layout.fixed.horizontal
      },
      pad(0),
      layout = wibox.layout.align.horizontal,
      expand = "none"
    },
    pad(1),
    layout = wibox.layout.fixed.vertical
  },
  layout = wibox.layout.align.vertical,
  -- expand = "none"
}
