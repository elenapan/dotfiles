-- Provides:
-- evil::ram
--      used (integer - mega bytes)
--      total (integer - mega bytes)
local awful = require("awful")

local update_interval = 20
-- Returns the used amount of ram in percentage
-- TODO output of free is affected by system language. The following command
-- works for any language:
-- free -m | sed -n '2p' | awk '{printf "%d available out of %d\n", $7, $2}'
local ram_script = [[
  sh -c "
  free -m | grep 'Mem:' | awk '{printf \"%d@@%d@\", $7, $2}'
  "]]

-- Periodically get ram info
awful.widget.watch(ram_script, update_interval, function(widget, stdout)
    local available = stdout:match('(.*)@@')
    local total = stdout:match('@@(.*)@')
    local used = tonumber(total) - tonumber(available)
    awesome.emit_signal("evil::ram", used, tonumber(total))
end)
