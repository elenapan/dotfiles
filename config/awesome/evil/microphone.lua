-- Provides:
-- evil::microphone
--      muted (boolean)
local awful = require("awful")

local muted_old = -1
local function emit_microphone_info()
    -- See evil/volume.lua for the reason why we print the +7 and +11 lines after '* index'
    awful.spawn.easy_async_with_shell("pacmd list-sources | awk '/\\* index: /{nr[NR+7];nr[NR+11]}; NR in nr'", function(stdout)
        local muted = stdout:match('muted:(%s+)[yes]')
        local muted_int = muted and 1 or 0
        if not (muted_int == muted_old) then
            awesome.emit_signal("evil::microphone", muted)
            muted_old = muted_int
        end
    end)
end

-- Run once to initialize widgets
emit_microphone_info()

-- Sleeps until pactl detects an event (microphone volume up / down / (un)mute)
local microphone_script = [[
  bash -c '
  pactl subscribe 2> /dev/null | grep --line-buffered "source #"
  ']]

-- Kill old pactl subscribe processes
awful.spawn.easy_async_with_shell("ps x | grep \"pactl subscribe\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Run emit_microphone_info() with each line printed
    awful.spawn.with_line_callback(microphone_script, {
        stdout = function(line)
            emit_microphone_info()
        end
    })
end)
