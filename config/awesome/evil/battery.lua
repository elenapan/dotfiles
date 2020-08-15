-- Provides:
-- evil::battery
--      percentage (integer)
-- evil::charger
--      plugged (boolean)

local awful = require("awful")

local update_interval = 30

-- Subscribe to power supply status changes with acpi_listen
local charger_script = [[
    sh -c '
    acpi_listen | grep --line-buffered ac_adapter
    '
]]

-- First get battery file path
-- If there are multiple, only get the first one
-- TODO support multiple batteries
awful.spawn.easy_async_with_shell("sh -c 'out=\"$(find /sys/class/power_supply/BAT?/capacity)\" && (echo \"$out\" | head -1) || false' ", function (battery_file, _, __, exit_code)
    -- No battery file found
    if not (exit_code == 0) then
        return
    end
    -- Periodically get battery info
    awful.widget.watch("cat "..battery_file, update_interval, function(_, stdout)
        awesome.emit_signal("evil::battery", tonumber(stdout))
    end)
end)

-- First get charger file path
awful.spawn.easy_async_with_shell("sh -c 'out=\"$(find /sys/class/power_supply/*/online)\" && (echo \"$out\" | head -1) || false' ", function (charger_file, _, __, exit_code)
    -- No charger file found
    if not (exit_code == 0) then
        return
    end
    -- Then initialize function that emits charger info
    local emit_charger_info = function()
        awful.spawn.easy_async_with_shell("cat "..charger_file, function (out)
            local status = tonumber(out) == 1
            awesome.emit_signal("evil::charger", status)
        end)
    end

    -- Run once to initialize widgets
    emit_charger_info()

    -- Kill old acpi_listen process
    awful.spawn.easy_async_with_shell("ps x | grep \"acpi_listen\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
        -- Update charger status with each line printed
        awful.spawn.with_line_callback(charger_script, {
            stdout = function(_)
                emit_charger_info()
            end
        })
    end)
end)
