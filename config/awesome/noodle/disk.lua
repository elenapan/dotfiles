local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local disk = wibox.widget{
    text = "free disk space",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

awesome.connect_signal("evil::disk", function (used, total)
    disk.markup = tostring(total - used) .. "GB free"
end)

return disk
