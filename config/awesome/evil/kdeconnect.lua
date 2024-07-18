-- Provides:
-- evil::kdeconnect
--      reachable (boolean)
--      battery (integer from 0 to 100)
local awful = require("awful")

local update_interval = 20

local kdeconnect_devices_script = [[
    sh -c "
    for device in \$(qdbus --literal org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices); do
        # Print the second field split by double quotes using awk
        echo \"\$device\" | awk -F'\"' '{print \$2}'
        # TODO: Remove break when/if I decide to support multiple devices
        break
    done
    "
]]

-- First get device ID
awful.spawn.easy_async_with_shell(kdeconnect_devices_script, function(stdout, _, __, exit_code)
    device_id = string.gsub(stdout, '^%s*(.-)%s*$', '%1')

    -- Use device ID to create the script
    local kdeconnect_script = [[
      sh -c '
      deviceid="]]..device_id..[["
      reachable=$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.isReachable)
      if [ "$reachable" = "true" ]; then
          battery=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/${deviceid}/battery org.kde.kdeconnect.device.battery.charge | tr -d 'n')
          echo $battery
      else
          echo -1
      fi
      '
    ]]

    -- Periodically get device info
    awful.widget.watch(kdeconnect_script, update_interval, function(widget, stdout)
        local value = tonumber(stdout)
        local battery, reachable
        if value < 0 then
            battery = nil
            reachable = false
        else
            battery = value
            reachable = true
        end
        awesome.emit_signal("evil::kdeconnect", reachable, battery)
    end)
end)
