-- Provides:
-- evil::uptime
--      uptime (string)
local awful = require("awful")

local update_interval = 60
local uptime_script = [[
  sh -c "
  uptime -p | sed 's/^...//;s/ weeks\?,/w/;s/ days\?,/d/;s/ hours\?,/h/;s/ minutes\?/m/'
  "]]

-- Periodically get uptime
awful.widget.watch(uptime_script, update_interval, function(widget, stdout)
    local uptime = string.gsub(stdout, '^%s*(.-)%s*$', '%1')
    awesome.emit_signal("evil::uptime", uptime)
end)

