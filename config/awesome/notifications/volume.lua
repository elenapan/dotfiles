local naughty = require("naughty")

local notif
local timeout = 1.5
local first_time = true
awesome.connect_signal("evil::volume", function (percentage, muted)
    if first_time then
        first_time = false
    else
        if sidebar.visible or (client.focus and client.focus.class == "Pavucontrol") then
            -- Sidebar and Pavucontrol already show volume, so
            -- destroy notification if it exists
            if notif then
                notif:destroy()
            end
        else
            -- Send notification
            if muted then
                notif = notifications.notify_dwim({ title = "Volume", message = "muted", icon = icons.muted, timeout = timeout }, notif)
            else
                notif = notifications.notify_dwim({ title = "Volume", message = tostring(percentage), icon = icons.volume, timeout = timeout }, notif)
            end
        end
    end
end)

