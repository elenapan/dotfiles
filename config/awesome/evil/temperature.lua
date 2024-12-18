-- Provides:
-- evil::temperature
--      temperature (integer - in Celcius)
local awful = require("awful")

local update_interval = 15

local temp_script = [[
  sh -c "
  head -c -4 /sys/devices/virtual/thermal/thermal_zone0/temp
  "]]

-- Periodically get temperature info
awful.widget.watch(temp_script, update_interval, function(widget, stdout)
    awesome.emit_signal("evil::temperature", tonumber(stdout))
end)
