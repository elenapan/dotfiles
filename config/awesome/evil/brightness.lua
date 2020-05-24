-- Provides:
-- evil::brightness
--      percentage (integer)
local awful = require("awful")

-- Subscribe to backlight changes
-- Requires inotify-tools
local brightness_subscribe_script = [[
   bash -c "
   while (inotifywait -e modify /sys/class/backlight/?*/brightness -qq) do echo; done
"]]

local brightness_script = [[
   sh -c "
   light -G
"]]

local emit_brightness_info = function()
    awful.spawn.with_line_callback(brightness_script, {
        stdout = function(line)
            percentage = math.floor(tonumber(line))
            awesome.emit_signal("evil::brightness", percentage)
        end
    })
end

-- Run once to initialize widgets
emit_brightness_info()

-- Kill old inotifywait process
awful.spawn.easy_async_with_shell("ps x | grep \"inotifywait -e modify /sys/class/backlight\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Update brightness status with each line printed
    awful.spawn.with_line_callback(brightness_subscribe_script, {
        stdout = function(_)
            emit_brightness_info()
        end
    })
end)
