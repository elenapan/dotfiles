local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Configuration
local update_interval = 120            -- in seconds

local disk = wibox.widget{
    text = "free disk space",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local function update_widget(disk_space)
  disk.markup = disk_space .. "B free"
end

-- Use /dev/sdXY according to your setup
local disk_script = [[
  bash -c "
  df -k -h /dev/sda1 | tail -1 | awk '{print $4}'
  "]]

awful.widget.watch(disk_script, update_interval, function(widget, stdout)
                     local disk_space = stdout
                     -- Remove trailing white space
                     disk_space = string.gsub(disk_space, '^%s*(.-)%s*$', '%1')
                     update_widget(disk_space)
end)

return disk
