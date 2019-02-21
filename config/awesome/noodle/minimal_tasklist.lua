local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local capi = { screen = screen, client = client }

-- Get theme variables
local visible_clients_color = beautiful.minimal_tasklist_visible_clients_color or "#1D8CD2"
local visible_clients_text = beautiful.minimal_tasklist_visible_clients_text or "v: "
local hidden_clients_color = beautiful.minimal_tasklist_hidden_clients_color or "#2DD283"
local hidden_clients_text = beautiful.minimal_tasklist_hidden_clients_text or "h: "

local minimal_tasklist = wibox.widget{
    text = "minimal_tasklist widget",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

-- Mouse control
minimal_tasklist:buttons(gears.table.join(
    -- Restore minimized
    awful.button({ }, 1, function ()
        local c = awful.client.restore()
        if c then
            client.focus = c
            c:raise()
        end
    end),
    -- Close
    awful.button({ }, 2, function () 
        if client.focus ~= nil then
            client.focus:kill()
        end
    end),
    -- Minimize
    awful.button({ }, 3, function () 
        if client.focus ~= nil then
            client.focus.minimized = true
        end
    end),
    -- Cycle clients
    awful.button({ }, 4, function () 
        awful.client.focus.byidx(-1)
    end),
    awful.button({ }, 5, function () 
        awful.client.focus.byidx(1)
    end)
))

-- Returns the minimized clients in the current tag(s)
local function get_minimized_clients()
    local clients = {}
    for _, c in ipairs(capi.client.get()) do
        if not (c.skip_taskbar or c.hidden
                or c.type == "splash" or c.type == "dock"
                or c.type == "desktop") and c.minimized
                and awful.widget.tasklist.filter.currenttags(c, awful.screen.focused()) then
            table.insert(clients,c)
        end
    end

    return clients
end

local function update_widget()
    local s = awful.screen.focused()
    local hidden_clients = get_minimized_clients()
    --local hidden_clients = s.hidden_clients
    local clients = s.clients
    --local color = "#493999"
    local txt = hidden_clients_text .. #hidden_clients .. visible_clients_text .. #clients

    -- Padding for single digit numbers
    local vpad = ""
    local hpad = ""
    if #clients < 10 then
        vpad = " "
        --vpad = "0"
        --vpad = "_"
    end
    if #hidden_clients < 10 then
        hpad = " "
        --hpad = "0"
        --hpad = "_"
    end

    minimal_tasklist.markup =
            "<span foreground='" .. visible_clients_color .."'>"
            .. visible_clients_text .. "</span>" .. vpad .. #clients
            .. "<span foreground='" .. hidden_clients_color .."'>"
            .. hidden_clients_text .. "</span>" .. hpad .. #hidden_clients
end

-- Signals
--minimal_tasklist:connect_signal("mouse::enter", function ()
    --awful.spawn.with_shell("notify-send hello")
--end)
--minimal_tasklist:connect_signal("mouse::leave", function ()
    --awful.spawn.with_shell("notify-send bye")
--end)

client.connect_signal("unmanage", function(c)
    update_widget()
end)
client.connect_signal("manage", function(c)
    update_widget()
end)
client.connect_signal("untagged", function(c)
    update_widget()
end)
client.connect_signal("property::minimized", function(c)
    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::selected", function ()
    update_widget()
end)

return minimal_tasklist
