-- Provides:
-- evil::temperature
--      temperature (integer - in Celcius)
local awful = require("awful")

local update_interval = 15

-- Intel CPU
-- local temp_script = [[
--   sh -c "
--   sensors | grep Package | awk '{print $4}' | cut -c 2-3
--   "]]

-- AMD CPU
local temp_script = [[
  sh -c "
  sensors | sed -n 'x;$p' | awk '{printf(\"%0.1f\", $2)}'
  "]]

-- Periodically get temperature info
awful.widget.watch(temp_script, update_interval, function(widget, stdout)
    awesome.emit_signal("evil::temperature", tonumber(stdout))
end)
