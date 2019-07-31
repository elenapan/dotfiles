-- Provides:
-- evil::mpd
--      artist (string)
--      song (string)
--      paused (boolean)
local awful = require("awful")

local function emit_info()
    awful.spawn.easy_async({"mpc", "-f", "[[%artist%@@%title%@]]"},
        function(stdout)
            local artist = stdout:match('(.*)@@')
            local title = stdout:match('@@(.*)@')
            title = string.gsub(title, '^%s*(.-)%s*$', '%1')
            local status = stdout:match('%[(.*)%]')
            status = string.gsub(status, '^%s*(.-)%s*$', '%1')

            local paused
            if status == "playing" then
                paused = false
            else
                paused = true
            end

            awesome.emit_signal("evil::mpd", artist, title, paused)
        end
    )
end

-- Run once to initialize widgets
emit_info()

-- Sleeps until mpd changes state (pause/play/next/prev)
local mpd_script = [[
  sh -c '
    mpc idleloop player
  ']]

-- Kill old mpc idleloop player process
awful.spawn.easy_async_with_shell("ps x | grep \"mpc idleloop player\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_script, {
        stdout = function(line)
            emit_info()
        end
    })
end)
