local naughty = require("naughty")
local icons = require("icons")
local notifications = require("notifications")

local notif
local first_time = true
local timeout = 1.5

awesome.connect_signal("evil::brightness", function (percentage)
    if first_time then
        first_time = false
    else
        if (sidebar and sidebar.visible) or (dashboard and dashboard.visible) then
            -- Sidebar and dashboard already show brightness, so
            -- destroy notification if it exists
            if notif then
                notif:destroy()
            end
        else
            -- Send notification
            notif = notifications.notify_dwim({ title = "Brightness", message = tostring(percentage), icon = icons.image.redshift, timeout = timeout, app_name = "brightness" }, notif)
        end
    end
end)
