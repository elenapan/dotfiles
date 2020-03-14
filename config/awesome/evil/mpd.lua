-- Provides:
-- evil::mpd
--      artist (string)
--      song (string)
--      paused (boolean)
-- evil::mpd_volume
--      value (integer from 0 to 100)
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
        stdout = function()
            emit_info()
        end
    })
end)

----------------------------------------------------------

-- MPD Volume
local function emit_volume_info()
    awful.spawn.easy_async_with_shell("mpc volume | awk '{print substr($2, 1, length($2)-1)}'",
        function(stdout)
            awesome.emit_signal("evil::mpd_volume", tonumber(stdout))
        end
    )
end

-- Run once to initialize widgets
emit_volume_info()

-- Sleeps until mpd volume changes
-- >> We use `sed '1~2d'` to remove every other line since the mixer event
-- is printed twice for every volume update.
-- >> The `-u` option forces sed to work in unbuffered mode in order to print
-- without waiting for `mpc idleloop mixer` to finish
local mpd_volume_script = [[
  sh -c "
    mpc idleloop mixer | sed -u '1~2d'
  "]]

-- Kill old mpc idleloop mixer process
awful.spawn.easy_async_with_shell("ps x | grep \"mpc idleloop mixer\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_volume_script, {
        stdout = function()
            emit_volume_info()
        end
    })
end)
