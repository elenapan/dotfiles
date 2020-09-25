-- Provides:
-- evil::disk
--      used (integer - mega bytes)
--      total (integer - mega bytes)
local awful = require("awful")
local helpers = require("helpers")

local update_interval = 180 -- every 3 minutes

-- Use /dev/sdxY according to your setup
local disk_script = [[
    bash -c "
    df -kH -B 1MB /dev/sda1 | tail -1 | awk '{printf \"%d@%d\", $4, $3}'
    "
]]

-- Periodically get disk space info
awful.widget.watch(disk_script, update_interval, function(_, stdout)
    -- Get `available` and `used` instead of `used` and `total`,
    -- since the total size reported by the `df` command includes
    -- the 5% storage reserved for `root`, which is misleading.
    local available = tonumber(stdout:match('^(.*)@')) / 1000
    local used = tonumber(stdout:match('@(.*)$')) / 1000
    awesome.emit_signal("evil::disk", used, used + available)
end)
