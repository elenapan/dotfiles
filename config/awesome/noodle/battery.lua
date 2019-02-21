local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Configuration
local update_interval = 30            -- in seconds

local battery = wibox.widget{
    text = "battery widget",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

-- Mouse control
-- battery:buttons(gears.table.join(
--     -- 
--     awful.button({ }, 1, function ()
--     end),
--     -- 
--     awful.button({ }, 2, function () 
--     end),
--     -- 
--     awful.button({ }, 3, function () 
--     end),
--     -- 
--     awful.button({ }, 4, function () 
--     end),
--     awful.button({ }, 5, function () 
--     end)
-- ))

local function update_widget(bat)
  battery.markup = bat .. "%"
end

local bat_script = [[
  bash -c '
  upower -i $(upower -e | grep BAT) | grep percentage
  ']]

awful.widget.watch(bat_script, update_interval, function(widget, stdout)
                     local bat = stdout:match(':%s*(.*)..')
                     -- bat = string.gsub(bat, '^%s*(.-)%s*$', '%1')
                     update_widget(bat)
end)

return battery
