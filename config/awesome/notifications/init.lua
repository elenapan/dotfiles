local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

local notifications = {}

-- Notification settings
-- Icon size
-- naughty.config.defaults['icon_size'] = beautiful.notification_icon_size
naughty.config.defaults['border_width'] = beautiful.notification_border_width

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 2
naughty.config.presets.critical.timeout = 12

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
    -- Initialize various notification daemons
    require("notifications.volume")
    require("notifications.brightness")
    require("notifications.battery")
    require("notifications.mpd")
    require("notifications.league_of_legends")
    require("notifications.keyboardlayout")
    -- Load theme
    require("notifications.themes." .. theme_name)
end

-- Handle notification icon
naughty.connect_signal("request::icon", function(n, context, hints)
    -- Handle other contexts here
    if context ~= "app_icon" then return end

    -- Use XDG icon
    local path = menubar.utils.lookup_icon(hints.app_icon) or
    menubar.utils.lookup_icon(hints.app_icon:lower())

    if path then
        n.icon = path
    end
end)

-- Use XDG icon
naughty.connect_signal("request::action_icon", function(a, context, hints)
    a.icon = menubar.utils.lookup_icon(hints.id)
end)

return notifications
