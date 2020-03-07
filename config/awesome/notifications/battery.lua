local naughty = require("naughty")
local helpers = require("helpers")

-- Helper variables
local charger_first_time = true
local charger_plugged = true
local battery_full_already_notified = true
local battery_low_already_notified = false
local battery_critical_already_notified = false
local notif
local battery_current = 0

-- Full / Low / Critical notifications
awesome.connect_signal("evil::battery", function(battery)
    local message
    local icon
    local timeout
    battery_current = battery
    if not charger_plugged then
        icon = icons.battery
        if battery <= user.battery_threshold_critical and not battery_critical_already_notified then
            battery_critical_already_notified = true
            message = helpers.colorize_text("CRITICAL", x.color9)
            timeout = 0
        elseif battery <= user.battery_threshold_low and not battery_low_already_notified then
            battery_low_already_notified = true
            message = helpers.colorize_text("Low", x.color11)
            timeout = 6
        end
    else
        icon = icons.battery_charging
        if battery > 99 and not battery_full_already_notified then
            battery_full_already_notified = true
            message = helpers.colorize_text("Full", x.color10)
            timeout = 6
        end
    end

    -- If message has been initialized, then we need to send a notification
    if message then
        notif = notifications.notify_dwim({title = "Battery", message = message, icon = icon, timeout = timeout}, notif)
    end
end)

-- Charger notifications
awesome.connect_signal("evil::charger", function(plugged)
    charger_plugged = plugged
    local message
    local icon
    if plugged then
        battery_critical_already_notified = false
        battery_low_already_notified = false
        -- Avoids notifying of a full battery if it was almost full after plugging
        battery_full_already_notified = battery_current > 97
        message = "Plugged"
        icon = icons.battery_charging
    else
        battery_full_already_notified = false
        message = "Unplugged"
        icon = icons.battery
    end

    -- Do not send a notification the first time (when AwesomeWM (re)starts)
    if charger_first_time then
        charger_first_time = false
    else
        notif = notifications.notify_dwim({title = "Charger", message = message, icon = icon, timeout = 3}, notif)
    end
end)
