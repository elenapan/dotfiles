local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local decorations = require("decorations")

-- Get theme variables
local floating_color = beautiful.desktop_mode_color_floating or "#1D8CD2"
local tile_color = beautiful.desktop_mode_color_tile or "#2DD283"
local max_color = beautiful.desktop_mode_color_max or "#D21D43"
local floating_text = beautiful.desktop_mode_text_floating or "(fl)"
local tile_text = beautiful.desktop_mode_text_tile or "(ti)"
local max_text = beautiful.desktop_mode_text_max or "(ma)"

--local desktop_mode_widget = wibox.widget.textbox("")
--desktop_mode_widget.font = beautiful.font
--desktop_mode_widget.align = "center"
local desktop_mode_widget = wibox.widget{
    text = "desktop_mode widget",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

-- Mouse control
desktop_mode_widget:buttons(gears.table.join(
    -- Old Left click: toggle between tile and floating + toggle titlebars
    -- Left click: toggle titlebar for focused client
    awful.button({ }, 1, function ()
        --switch_modes()
        if client.focus ~= nil then
            decorations.cycle(c)
        end
    end),
    -- Right click: Toggle titlebars in all visible clients
    awful.button({ }, 3, function ()
        local clients = awful.screen.focused().clients
        for _, c in pairs(clients) do
            -- Don't toggle if titlebars are used as borders
            decorations.cycle(c)
        end
    end),
    awful.button({ }, 4, function ()
        awful.layout.inc(-1)
    end),
    awful.button({ }, 5, function ()
        awful.layout.inc(1)
    end)
))

local function update_widget()
    local current_layout = awful.layout.get(mouse.screen)
    local color
    local txt
    if current_layout == awful.layout.suit.max then
        color = max_color
        txt = max_text
    elseif current_layout == awful.layout.suit.tile then
        color = tile_color
        txt = tile_text
    elseif current_layout == awful.layout.suit.floating then
        color = floating_color
        txt = floating_text
    else
        --default
        color = tile_color
        txt = tile_text
    end

    desktop_mode_widget.markup = "<span foreground='" .. color .."'>" .. txt .. "</span>"
end

-- Signals
awful.tag.attached_connect_signal(s, "property::selected", function ()
    update_widget()
end)
awful.tag.attached_connect_signal(s, "property::layout", function ()
    update_widget()
end)

return desktop_mode_widget
