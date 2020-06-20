local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local apps = require("apps")
local icons = require("icons")

local helpers = require("helpers")
local keys = require("keys")

-- {{{ Widgets
local desktop_control = require("noodle.desktop_control")
local minimal_tasklist = require("noodle.minimal_tasklist")

-- Start button widget (can toggle sidebar, tray, scratchpad)
start_widget = wibox.widget.imagebox(icons.image.start)
start_widget:buttons(gears.table.join(
        -- Left click - Toggle sidebar
        awful.button({ }, 1, function ()
            sidebar_toggle()
        end),
        -- Middle click - Toggle scratchpad
        awful.button({ }, 2, apps.scratchpad),
        -- Right click - Toggle tray
        awful.button({ }, 3, function ()
            local traybox = awful.screen.focused().traybox
            traybox.visible = not traybox.visible
        end)
    ))

-- Create item separator
textseparator = wibox.widget.textbox()
textseparator.text = beautiful.separator_text
textseparator.font = "hurmit nerd font bold 14"
textseparator.markup = helpers.colorize_text(textseparator.text, beautiful.separator_fg)

-- Create padding
pad = wibox.widget.textbox(" ")

-- }}}
local update_taglist = function (item, tag, index)
    if tag.selected then
        item.image = beautiful.taglist_icons_focused[index]
    elseif tag.urgent then
        item.image = beautiful.taglist_icons_urgent[index]
    elseif #tag:clients() > 0 then
        item.image = beautiful.taglist_icons_occupied[index]
    else
        item.image = beautiful.taglist_icons_empty[index]
    end
end

awful.screen.connect_for_each_screen(function(s)
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.horizontal,
        widget_template = {
            widget = wibox.widget.imagebox,
            -- Add support for hover colors and an index label
            create_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, objects)
                update_taglist(self, tag, index)
            end,
        },
        buttons = keys.taglist_buttons
    }

    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        layout = wibox.layout.fixed.horizontal,
        pad,
        start_widget,
        textseparator,
        s.mytaglist,
        textseparator,
        desktop_control,
        pad
    }

    -- Only set them if they exist, else they overwrite the position variable
    if beautiful.wibar_x then
        s.mywibox.x = beautiful.wibar_x
    end
    if beautiful.wibar_y then
        s.mywibox.y = beautiful.wibar_y
    end

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = gears.shape.rounded_bar, type = "dock"})
    s.traybox.width = dpi(150)
    s.traybox.height = dpi(38)
    s.traybox.x = beautiful.screen_margin * 2
    -- s.traybox.x = s.geometry.width - s.traybox.width - beautiful.screen_margin * 2
    s.traybox.y = s.geometry.height - s.traybox.height - beautiful.screen_margin * 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
        -- wibox.widget.textbox("test"),
        pad,
        s.systray,
        pad,
        layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
            -- Middle click - Hide traybox
            awful.button({ }, 2, function ()
                s.traybox.visible = false
            end)
        ))

end)

-- Every bar theme should provide these fuctions
function wibars_toggle()
    local s = awful.screen.focused()
    s.mywibox.visible = not s.mywibox.visible
end
function tray_toggle()
    local s = awful.screen.focused()
    s.traybox.visible = not s.traybox.visible
end
