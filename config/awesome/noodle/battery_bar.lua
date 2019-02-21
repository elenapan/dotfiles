local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.battery_bar_active_color or "#5AA3CC"
local background_color = beautiful.battery_bar_background_color or "#222222"

-- Configuration
local update_interval = 30            -- in seconds

local battery_bar = wibox.widget{
  max_value     = 100,
  value         = 50,
    forced_height = dpi(10),
    margins       = {
      top = dpi(8),
      bottom = dpi(8),
    },
    forced_width  = dpi(200),
  shape         = gears.shape.rounded_bar,
  bar_shape     = gears.shape.rounded_bar,
  color         = active_color,
  background_color = background_color,
  border_width  = 0,
  border_color  = beautiful.border_color,
  widget        = wibox.widget.progressbar,
}

-- Mouse control
-- battery_bar:buttons(gears.table.join(
--     -- 
--     awful.button({ }, 1, function ()
--     end),
--     -- 
--     awful.button({ }, 2, function () 
--     end),
--     -- 
--     awful.button({ }, 3, function () 
--     end),
--     -- 
--     awful.button({ }, 4, function () 
--     end),
--     awful.button({ }, 5, function () 
--     end)
-- ))

local function update_widget(bat)
  battery_bar.value = tonumber(bat)
end

local bat_script = [[
  bash -c "
  upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}'
  "]]

awful.widget.watch(bat_script, update_interval, function(widget, stdout)
                     local bat = stdout:gsub("%%", "")
                     update_widget(bat)
end)

return battery_bar
