-- Provides:
-- evil::volume
--      percentage (integer)
--      muted (boolean)
-- evil::microphone
--      muted (boolean)
local awful = require("awful")

local volume_old = -1
local muted_old = -1
local function emit_volume_info()
    -- Get volume info
    awful.spawn.easy_async("pactl list sinks", function(stdout)
        local volume = stdout:match('(%d+)%% /')
        local muted = stdout:match('Mute:(%s+)[yes]')
        local muted_int = muted and 1 or 0
        local volume_int = tonumber(volume)
        -- Only send signal if there was a change
        -- We need this since we use `pactl subscribe` to detect
        -- volume events. These are not only triggered when the
        -- user adjusts the volume through a keybind, but also
        -- through `pavucontrol` or even without user intervention,
        -- when a media file starts playing.
        if volume_int ~= volume_old or muted_int ~= muted_old then
            awesome.emit_signal("evil::volume", volume_int, muted)
        end
        volume_old = volume_int
        muted_old = muted_int
        -- TODO maybe collect garbage here?
    end)
end

local function emit_microphone_info()
    -- Use tail to grab the last line of the output (which refers to the microphone)
    awful.spawn.easy_async_with_shell("pacmd list-sources | grep muted | tail -1 | awk '{print $2}'",
        function(stdout)
            -- Remove trailing whitespace
            muted = stdout:gsub('^%s*(.-)%s*$', '%1')
            awesome.emit_signal("evil::microphone", muted == "yes")
        end
    )
end


-- Run once to initialize widgets
emit_volume_info()
emit_microphone_info()

-- Sleeps until pactl detects an event (volume up/down/toggle mute)
local volume_script = [[
    bash -c '
    pactl subscribe 2> /dev/null | grep --line-buffered "sink"
    ']]


-- Sleeps until pactl detects an event (microphone volume up / down / (un)mute)
local microphone_script = [[
  bash -c '
  pactl subscribe 2> /dev/null | grep --line-buffered "source"
  ']]

-- Kill old pactl subscribe processes
awful.spawn.easy_async_with_shell("ps x | grep \"pactl subscribe\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Run emit_volume_info() with each line printed
    awful.spawn.with_line_callback(volume_script, {
        stdout = function(line)
            emit_volume_info()
        end
    })
    -- Run emit_microphone_info() with each line printed
    awful.spawn.with_line_callback(microphone_script, {
        stdout = function(line)
            emit_microphone_info()
        end
    })

end)


