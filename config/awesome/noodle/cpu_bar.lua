local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Set colors
local active_color = beautiful.cpu_bar_active_color or "#5AA3CC"
local background_color = beautiful.cpu_bar_background_color or "#222222"

-- Configuration
local update_interval = 5            -- in seconds

local cpu_bar = wibox.widget{
  max_value     = 100,
  value         = 50,
  forced_height = 10,
  margins       = {
    top = 10,
    bottom = 10,
  },
  forced_width  = 200,
  shape         = gears.shape.rounded_bar,
  bar_shape     = gears.shape.rounded_bar,
  color         = active_color,
  background_color = background_color,
  border_width  = 0,
  border_color  = beautiful.border_color,
  widget        = wibox.widget.progressbar,
}

local function update_widget(cpu_idle)
  cpu_bar.value = 100 - cpu_idle
end

local cpu_idle_script = [[
  bash -c "
  vmstat 1 2 | tail -1 | awk '{printf \"%d\", $15}'
  "]]

awful.widget.watch(cpu_idle_script, update_interval, function(widget, stdout)
                     -- local cpu_idle = stdout:match('+(.*)%.%d...(.*)%(')
                     local cpu_idle = stdout
                     cpu_idle = string.gsub(cpu_idle, '^%s*(.-)%s*$', '%1')
                     update_widget(cpu_idle)
end)

return cpu_bar
