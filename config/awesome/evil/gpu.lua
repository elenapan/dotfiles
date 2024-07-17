-- Provides:
-- evil::gpu
--      used percentage (integer from 0 to 100)
local awful = require("awful")

local update_interval = 5

-- For AMD GPUs
local gpu_script = [[
  sh -c "
  amdgpu_top -gm --single | awk '/average_gfx_activity/ {print substr($2, 1, length($2)-1)}'
  "]]

awful.widget.watch(gpu_script, update_interval, function(_, stdout)
    awesome.emit_signal("evil::gpu", tonumber(stdout))
end)
