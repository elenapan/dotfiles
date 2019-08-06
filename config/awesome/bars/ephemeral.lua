local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local keys = require("keys")
local helpers = require("helpers")
local pad = helpers.pad

-- Helper function that creates a button widget
local create_button = function (symbol, color, bg_color, hover_color)
    local widget = wibox.widget {
        font = "icomoon 14",
        align = "center",
        id = "text_role",
        valign = "center",
        markup = helpers.colorize_text(symbol, color),
        widget = wibox.widget.textbox()
    }

    local section = wibox.widget {
        widget,
        forced_width = dpi(70),
        bg = bg_color,
        widget = wibox.container.background
    }

    -- Hover animation
    section:connect_signal("mouse::enter", function ()
        section.bg = hover_color
    end)
    section:connect_signal("mouse::leave", function ()
        section.bg = bg_color
    end)

    -- helpers.add_hover_cursor(section, "hand1")

    return section
end

local exit = create_button("", beautiful.xcolor6, beautiful.xcolor8.."C0",beautiful.xcolor8.."E0")
exit:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        exit_screen_show()
    end)
))

local volume_symbol = ""
local volume_muted_color = beautiful.xcolor8
local volume_unmuted_color = beautiful.xcolor5
local volume = create_button(volume_symbol, volume_unmuted_color, beautiful.xcolor8.."30", beautiful.xcolor8.."50")

volume:buttons(gears.table.join(
    -- Left click - Mute / Unmute
    awful.button({ }, 1, function ()
        helpers.volume_control(0)
    end),
    -- Right click - Run or raise pavucontrol
    awful.button({ }, 3, function ()
        helpers.run_or_raise({class = 'Pavucontrol'}, true, "pavucontrol")
    end),
    -- Scroll - Increase / Decrease volume
    awful.button({ }, 4, function ()
        helpers.volume_control(5)
    end),
    awful.button({ }, 5, function ()
        helpers.volume_control(-5)
    end)
))

awesome.connect_signal("evil::volume", function(_, muted)
    local t = volume:get_all_children()[1]
    if muted then
        t.markup = helpers.colorize_text(volume_symbol, volume_muted_color)
    else
        t.markup = helpers.colorize_text(volume_symbol, volume_unmuted_color)
    end
end)

local microphone_symbol = ""
local microphone_muted_color = beautiful.xcolor8
local microphone_unmuted_color = beautiful.xcolor3
local microphone = create_button(microphone_symbol, microphone_unmuted_color, beautiful.xcolor8.."60", beautiful.xcolor8.."80")

microphone:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("amixer -D pulse sset Capture toggle &> /dev/null")
    end)
))

awesome.connect_signal("evil::microphone", function(muted)
    local t = microphone:get_all_children()[1]
    if muted then
        t.markup = helpers.colorize_text(microphone_symbol, microphone_muted_color)
    else
        t.markup = helpers.colorize_text(microphone_symbol, microphone_unmuted_color)
    end
end)

local music = create_button("", beautiful.xcolor4, beautiful.xcolor8.."90", beautiful.xcolor8.."B0")

music:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        helpers.run_or_raise({class = "music"}, true, user.music_client)
    end),
    awful.button({ }, 3, function ()
        helpers.run_or_raise({class = "music"}, true, user.music_client)
    end)
))

local sandwich = create_button("", beautiful.xcolor1, beautiful.xcolor8.."30", beautiful.xcolor8.."50")
sandwich:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        app_drawer_show()
    end),
    awful.button({ }, 2, function ()
        helpers.toggle_scratchpad()
    end),
    awful.button({ }, 3, function ()
        toggle_tray()
    end)
))

-- Helper function that updates a tasklist item
local update_tasklist = function (task, c)
    local background = task:get_children_by_id('bg_role')[1]
    local text = task:get_children_by_id('text_role')[1]
    if c.minimized then
        color = "#00000000"
    else
        if c.class == "email" then
            color = beautiful.xcolor2
        elseif c.class == "Firefox" then
            color = beautiful.xcolor1
        elseif c.class == "music" then
            color = beautiful.xcolor5
        elseif c.class == "TelegramDesktop" then
            color = beautiful.xcolor2
        elseif c.class == "Thunar" then
            color = beautiful.xcolor3
        elseif c.class == "mpv" then
            color = beautiful.xcolor6
        elseif c.class == "Alacritty" then
            color = beautiful.xcolor4
        else
            color = beautiful.xcolor7
        end
    end
    if client.focus == c then
        text.markup = helpers.colorize_text(text.text, color)
        -- background.bg = color
        background.border_color = color
        background.bg = beautiful.xbackground.."AA"
    else
        text.markup = helpers.colorize_text(text.text, beautiful.xforeground)
        background.bg = color
        background.border_color = "#00000000"
    end
end

local tag_colors_empty = { "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", "#00000000", }

local tag_colors_urgent = {
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7,
    beautiful.xcolor7
}

local tag_colors_focused = {
    beautiful.xcolor1,
    beautiful.xcolor5,
    beautiful.xcolor4,
    beautiful.xcolor6,
    beautiful.xcolor2,
    beautiful.xcolor3,
    beautiful.xcolor1,
    beautiful.xcolor5,
    beautiful.xcolor4,
    beautiful.xcolor6,
}

local tag_colors_occupied = {
    beautiful.xcolor1.."55",
    beautiful.xcolor5.."55",
    beautiful.xcolor4.."55",
    beautiful.xcolor6.."55",
    beautiful.xcolor2.."55",
    beautiful.xcolor3.."55",
    beautiful.xcolor1.."55",
    beautiful.xcolor5.."55",
    beautiful.xcolor4.."55",
    beautiful.xcolor6.."55",
}

-- Helper function that updates a taglist item
local update_taglist = function (item, tag, index)
    if tag.selected then
        item.bg = tag_colors_focused[index]
    elseif tag.urgent then
        item.bg = tag_colors_urgent[index]
    elseif #tag:clients() > 0 then
        item.bg = tag_colors_occupied[index]
    else
        item.bg = tag_colors_empty[index]
    end
end

awful.screen.connect_for_each_screen(function(s)
    -- Create a taglist for every screen
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        layout = wibox.layout.flex.horizontal,
        widget_template = {
            widget = wibox.container.background,
            create_callback = function(self, tag, index, _)
                update_taglist(self, tag, index)
            end,
            update_callback = function(self, tag, index, _)
                update_taglist(self, tag, index)
            end,
        }
    }

    -- Create a tasklist for every screen
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = keys.tasklist_buttons,
        style    = {
            font = beautiful.tasklist_font,
            bg = beautiful.xcolor0,
        },
        layout   = {
            layout  = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    id     = 'text_role',
                    align  = "center",
                    widget = wibox.widget.textbox,
                },
                forced_width = dpi(220),
                left = dpi(15),
                right = dpi(15),
                -- Add margins to top and bottom in order to force the
                -- text to be on a single line, if needed. Might need
                -- to adjust them according to font size.
                top  = dpi(4),
                bottom = dpi(4),
                widget = wibox.container.margin
            },
            id = "bg_role",
            widget = wibox.container.background,
        },
    }


    -- Create the wibox
    s.mywibox = awful.wibar({screen = s, visible = true, ontop = true, type = "dock", position = "bottom"})
    s.mywibox.height = beautiful.wibar_height
    -- s.mywibox.width = beautiful.wibar_width

    s.mywibox.bg = beautiful.xcolor0

    -- Bar placement
    awful.placement.maximize_horizontally(s.mywibox)

    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        sandwich,
        s.mytasklist,
        {
            volume,
            microphone,
            music,
            exit,
            layout = wibox.layout.fixed.horizontal
        },
        -- expand = "none",
        layout = wibox.layout.align.horizontal
    }


    -- Create the top bar
    s.mytopwibox = awful.wibar({screen = s, visible = true, ontop = false, type = "dock", position = "top", height = dpi(5)})
    -- Bar placement
    awful.placement.maximize_horizontally(s.mytopwibox)
    s.mytopwibox.bg = "#00000000"

    s.mytopwibox:setup {
        widget = s.mytaglist,
    }

    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, type = "normal"})
    s.traybox.width = dpi(120)
    s.traybox.height = beautiful.wibar_height
    awful.placement.bottom_left(s.traybox, {honor_workarea = true, margins = beautiful.screen_margin * 2})
    s.traybox.bg = "#00000000"
    s.traybox:setup {
        s.systray,
        bg = beautiful.bg_systray,
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background()
    }

    s.traybox:buttons(gears.table.join(
    -- Middle click - Hide traybox
    awful.button({ }, 2, function ()
        s.traybox.visible = false
    end)
    ))
    -- Hide traybox when mouse leaves
    s.traybox:connect_signal("mouse::leave", function ()
        s.traybox.visible = false
    end)
end)

-- We have set the wibar(s) to be ontop, but we do not want it to be above fullscreen clients
local function no_wibar_ontop(c)
    local s = awful.screen.focused()
    if c.fullscreen then
        s.mywibox.ontop = false
    else
        s.mywibox.ontop = true
    end
end

client.connect_signal("focus", no_wibar_ontop)
client.connect_signal("unfocus", no_wibar_ontop)
client.connect_signal("property::fullscreen", no_wibar_ontop)

-- Every bar theme should provide these fuctions
function toggle_wibars()
    local s = awful.screen.focused()
    s.mywibox.visible = not s.mywibox.visible
    s.mytopwibox.visible = not s.mytopwibox.visible
end

function toggle_tray()
    local s = awful.screen.focused()
    s.traybox.visible = not s.traybox.visible
end
