local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local keys = require("keys")

local taglist_autohide_delay = 1.25 -- seconds

-- {{{ Widgets
local update_taglist = function (item, tag, index)
    if tag.selected then
        item.bg = beautiful.taglist_text_color_focused[index]
    elseif tag.urgent then
        item.bg = beautiful.taglist_text_color_urgent[index]
    elseif #tag:clients() > 0 then
        item.bg = beautiful.taglist_text_color_occupied[index]
    else
        item.bg = beautiful.taglist_text_color_empty[index]
    end
end

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Create a system tray widget
    s.systray = wibox.widget.systray()
    s.systray.visible = false

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        widget_template = {
            {
                forced_width = dpi(12),
                forced_height = dpi(12),
                shape = gears.shape.circle,
                widget = wibox.container.background,
            },
            left = dpi(12),
            right = dpi(12),
            widget = wibox.container.margin,
            create_callback = function(self, tag, index, _)
                update_taglist(self:get_all_children()[1], tag, index)
            end,
            update_callback = function(self, tag, index, _)
                update_taglist(self:get_all_children()[1], tag, index)
            end,
        }
    }

    -- Create the wibox
    s.mywibox = wibox({ screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius), bg = "#00000000", visible = false, ontop = true})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        {
            nil,
            s.mytaglist,
            expand = "none",
            layout = wibox.layout.align.horizontal,
        },
        bg = beautiful.wibar_bg,
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background
    }

    -- Place bar at the bottom and add margins
    -- awful.placement.bottom(s.mywibox, {margins = beautiful.useless_gap * 2})
    awful.placement.bottom(s.mywibox, {margins = { bottom = beautiful.useless_gap * 4 }})

    local popup_timer
    local autohide = function ()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
        popup_timer = gears.timer.start_new(taglist_autohide_delay, function()
            popup_timer = nil
            s.mywibox.visible = false
        end)
    end

    -- Initialize wibox activator
    s.mywibox_activator = wibox({ screen = s, width = beautiful.wibar_width, height = 1, bg = "#00000000", visible = true, ontop = false})
    awful.placement.bottom(s.mywibox_activator)
    s.mywibox_activator:connect_signal("mouse::enter", function()
        s.mywibox.visible = true
        autohide()
    end)

    s.mywibox_activator:buttons(
        gears.table.join(
            awful.button({ }, 4, function ()
                awful.tag.viewprev()
            end),
            awful.button({ }, 5, function ()
                awful.tag.viewnext()
            end)
    ))

    s.mywibox:connect_signal("mouse::enter", function ()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
    end)

    s.mywibox:connect_signal("mouse::leave", function ()
        autohide()
    end)

    -- Show taglist on tag change
    awful.tag.attached_connect_signal(s, "property::selected", function (t)
        if t.selected and not awesome.startup then
            s.mywibox.visible = true
            if mouse.current_wibox == s.mywibox then
                return
            end
            autohide()
        end
    end)

    -- Show taglist when a tag becomes urgent
    awful.tag.attached_connect_signal(s, "property::urgent", function (t)
        if t.urgent then
            s.mywibox.visible = true
            if mouse.current_wibox == s.mywibox then
                return
            end
            autohide()
        end
    end)

end)

-- Every bar theme should provide these fuctions
function wibars_toggle()
    local s = awful.screen.focused()
    s.mywibox.visible = not s.mywibox.visible
end
function tray_toggle()
    local s = awful.screen.focused()
    s.systray.visible = not s.systray.visible
end
