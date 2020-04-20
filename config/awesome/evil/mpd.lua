-- Provides:
-- evil::mpd
--      artist (string)
--      song (string)
--      paused (boolean)
-- evil::mpd_volume
--      value (integer from 0 to 100)
-- evil::mpd_options
--      loop (boolean)
--      random (boolean)
local awful = require("awful")

local function emit_info()
    awful.spawn.easy_async_with_shell("sh -c 'mpc -f ARTIST@%artist%@TITLE@%title%@FILE@%file%@'",
        function(stdout)
            local artist = stdout:match('^ARTIST@(.*)@TITLE')
            local title = stdout:match('@TITLE@(.*)@FILE')
            local status = stdout:match('\n%[(.*)%]')

            if not artist or artist == "" then
              artist = "N/A"
            end
            if not title or title == "" then
              title = stdout:match('@FILE@(.*)@')
              if not title or title == "" then
                  title = "N/A"
              end
            end

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

local mpd_options_script = [[
  sh -c "
    mpc idleloop options
  "]]

local function emit_options_info()
    awful.spawn.easy_async_with_shell("mpc | tail -1",
        function(stdout)
            local loop = stdout:match('repeat: (.*)')
            local random = stdout:match('random: (.*)')
            awesome.emit_signal("evil::mpd_options", loop:sub(1, 2) == "on", random:sub(1, 2) == "on")
        end
    )
end

-- Run once to initialize widgets
emit_options_info()

-- Kill old mpc idleloop options process
awful.spawn.easy_async_with_shell("ps x | grep \"mpc idleloop options\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_options_script, {
        stdout = function()
            emit_options_info()
        end
    })
end)
