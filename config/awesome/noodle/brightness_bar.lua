local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.brightness_bar_active_color or "#5AA3CC"
local background_color = beautiful.brightness_bar_background_color or "#222222"

local brightness_bar = wibox.widget{
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
-- brightness_bar:buttons(gears.table.join(
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

local function update_widget()
    awful.spawn.easy_async_with_shell("xbacklight -get", function(out)
        -- Remove trailing whitespaces
        -- out = out:gsub('^%s*(.-)%s*$', '%1')
        -- host_text.markup = helpers.colorize_text("@"..out, xcolor8)
        brightness_bar.value = tonumber(out)
    end)
end

-- Signals
awesome.connect_signal("brightness_changed", function ()
    update_widget()
end)

update_widget()

return brightness_bar
