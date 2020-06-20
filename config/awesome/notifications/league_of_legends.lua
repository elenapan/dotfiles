local awful = require("awful")
local naughty = require("naughty")
local helpers = require("helpers")
local icons = require("icons")
local notifications = require("notifications")

local jump_to_client = naughty.action { name = "Jump to client" }

jump_to_client:connect_signal('invoked', function()
    -- Search for LoL client and jump to it
    local matcher = function (c)
        return awful.rules.match(c, { instance = "leagueclientux.exe" })
    end
    for c in awful.client.iterate(matcher) do
        -- c.minimized = false
        c:jump_to()
    end
end)

local league_notif
table.insert(awful.rules.rules, {
    rule = { instance = "leagueclientux.exe" },
    properties = {},
    callback = function (c)
        c.urgent_first_time = true
        c:connect_signal("property::urgent", function()
            if c.urgent and not c.urgent_first_time then
                league_notif = notifications.notify_dwim({ title = "League of Legends", message = "is desperate for your attention", icon = icons.image.games, timeout = 15, app_name = "League of Legends", actions = { jump_to_client } }, league_notif)
            else
                if league_notif then
                    league_notif:destroy()
                end
                c.urgent_first_time = false
            end
        end)
    end
})
