local beautiful = require("beautiful")
local naughty = require("naughty")
local helpers = require("helpers")

notifications = {}

-- Notification settings
-- Icon size
-- naughty.config.defaults['icon_size'] = beautiful.notification_icon_size

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 2
naughty.config.presets.critical.timeout = 12

-- Apply theme variables
naughty.config.padding = beautiful.notification_padding
naughty.config.spacing = beautiful.notification_spacing
naughty.config.defaults.margin = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width

naughty.config.presets.normal = {
    font         = beautiful.notification_font,
    fg           = beautiful.notification_fg,
    -- bg           = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    -- position     = beautiful.notification_position
}

naughty.config.presets.low = {
    font         = beautiful.notification_font,
    fg           = beautiful.notification_fg,
    -- bg           = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    -- position     = beautiful.notification_position
}

naughty.config.presets.ok = naughty.config.presets.low
naughty.config.presets.info = naughty.config.presets.low
naughty.config.presets.warn = naughty.config.presets.normal

naughty.config.presets.critical = {
    font         = beautiful.notification_font,
    fg           = beautiful.notification_crit_fg,
    -- bg           = beautiful.notification_crit_bg,
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    -- position     = beautiful.notification_position
}

-- Icon size
-- naughty.config.defaults['icon_size'] = beautiful.notification_icon_size

-- >> Notify DWIM (Do What I Mean):
-- Create or update notification automagically. Requires storing the
-- notification in a variable.
-- Example usage:
--     local my_notif = notifications.notify_dwim({ title = "hello", message = "there" }, my_notif)
--     -- After a while, use this to update or recreate the notification if it is expired / dismissed
--     my_notif = notifications.notify_dwim({ title = "good", message = "bye" }, my_notif)
function notifications.notify_dwim(args, notif)
    local n = notif
    if n and not n._private.is_destroyed and not n.is_expired then
        notif.title = args.title or notif.title
        notif.message = args.message or notif.message
        -- notif.text = args.text or notif.text
        notif.icon = args.icon or notif.icon
        notif.timeout = args.timeout or notif.timeout
    else
        n = naughty.notification(args)
    end
    return n
end

function notifications.init(theme_name)
    -- Load theme
    require("notifications.themes." .. theme_name)
end

-- Initialize various notification daemons
require("notifications.volume")
require("notifications.brightness")
require("notifications.battery")
