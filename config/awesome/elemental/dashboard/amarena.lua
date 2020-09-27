local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local icons = require("icons")
local helpers = require("helpers")
local apps = require("apps")

local keygrabber = require("awful.keygrabber")

-- Appearance
local box_radius = beautiful.dashboard_box_border_radius or dpi(12)
local box_gap = dpi(6)

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Create the widget
dashboard = wibox({visible = false, ontop = true, type = "dock", screen = screen.primary})
awful.placement.maximize(dashboard)

dashboard.bg = beautiful.dashboard_bg or beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
dashboard.fg = beautiful.dashboard_fg or beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

-- Add dashboard or mask to each screen
awful.screen.connect_for_each_screen(function(s)
    if s == screen.primary then
        s.dashboard = dashboard
    else
        s.dashboard = helpers.screen_mask(s, dashboard.bg)
    end
end)

local function set_visibility(v)
    for s in screen do
        s.dashboard.visible = v
    end
end

dashboard:buttons(gears.table.join(
    -- Middle click - Hide dashboard
    awful.button({ }, 2, function ()
        dashboard_hide()
    end)
))

-- Helper function that puts a widget inside a box with a specified background color
-- Invisible margins are added so that the boxes created with this function are evenly separated
-- The widget_to_be_boxed is vertically and horizontally centered inside the box
local function create_boxed_widget(widget_to_be_boxed, width, height, bg_color)
    local box_container = wibox.container.background()
    box_container.bg = bg_color
    box_container.forced_height = height
    box_container.forced_width = width
    box_container.shape = helpers.rrect(box_radius)
    -- box_container.shape = helpers.prrect(20, true, true, true, true)
    -- box_container.shape = helpers.prrect(30, true, true, false, true)

    local boxed_widget = wibox.widget {
        -- Add margins
        {
            -- Add background color
            {
                -- Center widget_to_be_boxed horizontally
                nil,
                {
                    -- Center widget_to_be_boxed vertically
                    nil,
                    -- The actual widget goes here
                    widget_to_be_boxed,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                layout = wibox.layout.align.horizontal,
                expand = "none"
            },
            widget = box_container,
        },
        margins = box_gap,
        color = "#FF000000",
        widget = wibox.container.margin
    }

    return boxed_widget
end



-- User widget
local user_picture_container = wibox.container.background()
-- user_picture_container.shape = gears.shape.circle
user_picture_container.shape = helpers.prrect(dpi(40), true, true, false, true)
user_picture_container.forced_height = dpi(140)
user_picture_container.forced_width = dpi(140)
local user_picture = wibox.widget {
    {
        wibox.widget.imagebox(user.profile_picture),
        widget = user_picture_container
    },
    shape = helpers.rrect(box_radius / 2),
    widget = wibox.container.background
}
local username = os.getenv("USER")
local user_text = wibox.widget.textbox(username:upper())
user_text.font = "San Francisco Display Heavy 20"
user_text.align = "center"
user_text.valign = "center"

local host_text = wibox.widget.textbox()
awful.spawn.easy_async_with_shell("hostname", function(out)
    -- Remove trailing whitespaces
    out = out:gsub('^%s*(.-)%s*$', '%1')
    host_text.markup = helpers.colorize_text("@"..out, x.color8)
end)
-- host_text.markup = "<span foreground='" .. x.color8 .."'>" .. minutes.text .. "</span>"
host_text.font = "monospace 16"
host_text.align = "center"
host_text.valign = "center"
local user_widget = wibox.widget {
    user_picture,
    helpers.vertical_pad(dpi(24)),
    user_text,
    helpers.vertical_pad(dpi(4)),
    host_text,
    layout = wibox.layout.fixed.vertical
}
local user_box = create_boxed_widget(user_widget, dpi(300), dpi(340), x.background)

-- Calendar
local calendar = require("noodle.calendar")
-- Update calendar whenever dashboard is shown
dashboard:connect_signal("property::visible", function ()
    if dashboard.visible then
        calendar.date = os.date('*t')
    end
end)

local calendar_box = create_boxed_widget(calendar, dpi(300), dpi(400), x.background)
-- local calendar_box = create_boxed_widget(calendar, 380, 540, x.color0)

local disk_arc = wibox.widget {
    start_angle = 3 * math.pi / 2,
    min_value = 0,
    max_value = 100,
    value = 50,
    border_width = 0,
    thickness = dpi(8),
    forced_width = dpi(90),
    forced_height = dpi(90),
    rounded_edge = true,
    bg = x.color8.."55",
    colors = { x.color13 },
    widget = wibox.container.arcchart
}

local disk_hover_text_value = wibox.widget {
    align = "center",
    valign = "center",
    font = "sans medium 13",
    widget = wibox.widget.textbox()
}
local disk_hover_text = wibox.widget {
    disk_hover_text_value,
    {
        align = "center",
        valign = "center",
        font = "sans medium 10",
        widget = wibox.widget.textbox("free")
    },
    spacing = dpi(2),
    visible = false,
    layout = wibox.layout.fixed.vertical
}

awesome.connect_signal("evil::disk", function(used, total)
    disk_arc.value = used * 100 / total
    disk_hover_text_value.markup = helpers.colorize_text(tostring(helpers.round(total - used, 1)).."G", x.color4)
end)

local disk_icon = wibox. widget {
    align = "center",
    valign = "center",
    font = "icomoon 23",
    markup = helpers.colorize_text("", x.color4),
    widget = wibox.widget.textbox()
}

local disk = wibox.widget {
    {
        nil,
        disk_hover_text,
        expand = "none",
        layout = wibox.layout.align.vertical
    },
    disk_icon,
    disk_arc,
    top_only = false,
    layout = wibox.layout.stack
}

local disk_box = create_boxed_widget(disk, dpi(150), dpi(150), x.background)

disk_box:connect_signal("mouse::enter", function ()
    disk_icon.visible = false
    disk_hover_text.visible = true
end)
disk_box:connect_signal("mouse::leave", function ()
    disk_icon.visible = true
    disk_hover_text.visible = false
end)


-- File system bookmarks
local function create_bookmark(name, path, color, hover_color)
    local bookmark = wibox.widget.textbox()
    bookmark.font = "sans bold 16"
    -- bookmark.text = wibox.widget.textbox(name:sub(1,1):upper()..name:sub(2))
    bookmark.markup = helpers.colorize_text(name, color)
    bookmark.align = "center"
    bookmark.valign = "center"

    -- Buttons
    bookmark:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            awful.spawn.with_shell(user.file_manager.." "..path)
            dashboard_hide()
        end),
        awful.button({ }, 3, function ()
            awful.spawn.with_shell(user.terminal.." -e 'ranger' "..path)
            dashboard_hide()
        end)
    ))

    -- Hover effect
    bookmark:connect_signal("mouse::enter", function ()
        bookmark.markup = helpers.colorize_text(name, hover_color)
    end)
    bookmark:connect_signal("mouse::leave", function ()
        bookmark.markup = helpers.colorize_text(name, color)
    end)

    helpers.add_hover_cursor(bookmark, "hand1")

    return bookmark
end

local bookmarks = wibox.widget {
    create_bookmark("home", os.getenv("HOME"), x.color1, x.color9),
    create_bookmark("downloads", user.dirs.downloads, x.color2, x.color10),
    create_bookmark("music", user.dirs.music, x.color6, x.color14),
    create_bookmark("pictures", user.dirs.pictures, x.color4, x.color12),
    create_bookmark("wallpapers", user.dirs.wallpapers, x.color5, x.color13),
    create_bookmark("screenshots", user.dirs.screenshots, x.color3, x.color11),
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical
}

local bookmarks_box = create_boxed_widget(bookmarks, dpi(200), dpi(300), x.background)

-- Corona
local corona_cases = wibox.widget.textbox()
local corona_deaths = wibox.widget.textbox()
local corona = wibox.widget {
    {
        align = "center",
        valign = "center",
        font = "Sans bold 20",
        markup = helpers.colorize_text("Pandemic", x.color2),
        widget = wibox.widget.textbox()
    },
    {
        {
            align = "center",
            valign = "center",
            font = "icomoon 20",
            markup = helpers.colorize_text("", x.color3),
            widget = wibox.widget.textbox()
        },
        {
            align = "center",
            valign = "center",
            font = "sans medium 14",
            widget = corona_cases
        },
        spacing = dpi(6),
        layout = wibox.layout.fixed.horizontal
    },
    {
        {
            align = "center",
            valign = "center",
            font = "icomoon 20",
            markup = helpers.colorize_text("", x.color1),
            widget = wibox.widget.textbox()
        },
        {
            align = "center",
            valign = "center",
            font = "sans medium 14",
            widget = corona_deaths
        },
        spacing = dpi(6),
        layout = wibox.layout.fixed.horizontal
    },
    spacing = dpi(20),
    layout = wibox.layout.fixed.vertical
}
awesome.connect_signal("evil::coronavirus", function(cases_total, cases_today, deaths_total, deaths_today)
    corona_cases.markup = cases_total.." <i>(+"..cases_today..")</i>"
    corona_deaths.markup = deaths_total.." <i>(+"..deaths_today..")</i>"
end)

local corona_box = create_boxed_widget(corona, dpi(200), dpi(180), x.background)

corona_box:buttons(gears.table.join(
    -- Left click - Go to a more detailed website
    awful.button({ }, 1, function ()
        awful.spawn.with_shell(user.browser.." https://www.worldometers.info/coronavirus/")
        dashboard_hide()
    end)
))
helpers.add_hover_cursor(corona_box, "hand1")

-- Fortune
local fortune_command = "fortune -n 140 -s"
local fortune_update_interval = 3600
-- local fortune_command = "fortune -n 140 -s computers"
local fortune = wibox.widget {
    font = "sans medium 11",
    text = "Loading your cookie...",
    widget = wibox.widget.textbox
}

local update_fortune = function()
    awful.spawn.easy_async_with_shell(fortune_command, function(out)
        -- Remove trailing whitespaces
        out = out:gsub('^%s*(.-)%s*$', '%1')
        fortune.markup = "<i>"..helpers.colorize_text(out, x.color4).."</i>"
    end)
end

gears.timer {
    autostart = true,
    timeout = fortune_update_interval,
    single_shot = false,
    call_now = true,
    callback = update_fortune
}

local fortune_widget = wibox.widget {
    {
        nil,
        fortune,
        layout = wibox.layout.align.horizontal,
    },
    margins = box_gap * 4,
    color = "#00000000",
    widget = wibox.container.margin
}

local fortune_box = create_boxed_widget(fortune_widget, dpi(300), dpi(140), x.background)
fortune_box:buttons(gears.table.join(
    -- Left click - New fortune
    awful.button({ }, 1, update_fortune)
))
helpers.add_hover_cursor(fortune_box, "hand1")

-- URL launcher petals
local petal_font = "Sans Bold 11"
local function create_url_petal(text, bg_color, hover_color, url, tl, tr, br, bl)
    local petal_container = wibox.widget {
        bg = bg_color,
        forced_height = dpi(65),
        forced_width = dpi(65),
        shape = helpers.prrect(99, tl, tr, br, bl),
        widget = wibox.container.background()
    } 

    local petal = wibox.widget {
        {
            {
                font = petal_font,
                align = "center",
                valign = "center",
                widget = wibox.widget.textbox(text)
            },
            widget = petal_container
        },
        -- Put the petal container inside a rounded container. Why?
        -- Because I want the unrounded petal corner to not be pointy!
        shape = helpers.rrect(dpi(4)),
        widget = wibox.container.background()
    }

    petal:buttons(
        gears.table.join(
            awful.button({ }, 1, function ()
                awful.spawn(user.browser.." "..url)
                dashboard_hide()
            end),
            awful.button({ }, 3, function ()
                awful.spawn(user.browser.." -new-window "..url, { switch_to_tags = true })
                dashboard_hide()
            end)
    ))

    petal:connect_signal("mouse::enter", function ()
        petal_container.bg = hover_color
    end)
    petal:connect_signal("mouse::leave", function ()
        petal_container.bg = bg_color
    end)

    return petal
end

-- Create the containers
local petal_top_left = create_url_petal("GH", x.color4, x.color12, "https://github.com/elenapan/dotfiles", true, true, false, true)
local petal_top_right = create_url_petal("YT", x.color1, x.color9, "https://youtube.com/", true, true, true, false)
local petal_bottom_right = create_url_petal("4C", x.color2, x.color10, "https://4chan.org/",false, true, true, true)
local petal_bottom_left = create_url_petal("RD", x.color3, x.color11, "https://reddit.com/",true, false, true, true)

-- Add clickable effects on hover
helpers.add_hover_cursor(petal_top_left, "hand1")
helpers.add_hover_cursor(petal_top_right, "hand1")
helpers.add_hover_cursor(petal_bottom_left, "hand1")
helpers.add_hover_cursor(petal_bottom_right, "hand1")

local url_petals = wibox.widget {
    petal_top_left,
    petal_top_right,
    petal_bottom_left,
    petal_bottom_right,
    forced_num_cols = 2,
    spacing = box_gap * 2,
    layout = wibox.layout.grid
}

local url_petals_box = create_boxed_widget(url_petals, dpi(150), dpi(150), "#00000000")
local icon_size = dpi(40)

-- Uptime
local uptime_text = wibox.widget.textbox()
awful.widget.watch("uptime -p | sed 's/^...//'", 60, function(_, stdout)
    -- Remove trailing whitespaces
    local out = stdout:gsub('^%s*(.-)%s*$', '%1')
    uptime_text.text = out
end)
local uptime = wibox.widget {
    {
        align = "center",
        valign = "center",
        font = "icomoon 20",
        markup = helpers.colorize_text("", x.color3),
        widget = wibox.widget.textbox()
    },
    {
        align = "center",
        valign = "center",
        font = "sans medium 11",
        widget = uptime_text
    },
    spacing = dpi(10),
    layout = wibox.layout.fixed.horizontal
}

local uptime_box = create_boxed_widget(uptime, dpi(300), dpi(80), x.background)

uptime_box:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        exit_screen_show()
        gears.timer.delayed_call(function()
            dashboard_hide()
        end)
    end)
))
helpers.add_hover_cursor(uptime_box, "hand1")

local notification_state = wibox.widget {
    align = "center",
    valign = "center",
    font = "icomoon 25",
    widget = wibox.widget.textbox("")
}
local function update_notification_state_icon()
    if naughty.suspended then
        notification_state.markup = helpers.colorize_text(notification_state.text, x.color8)
    else
        notification_state.markup = helpers.colorize_text(notification_state.text, x.color2)
    end
end
update_notification_state_icon()
local notification_state_box = create_boxed_widget(notification_state, dpi(150), dpi(78), x.background)
notification_state_box:buttons(gears.table.join(
    -- Left click - Toggle notification state
    awful.button({ }, 1, function ()
        naughty.suspended = not naughty.suspended
        update_notification_state_icon()
    end)
))

helpers.add_hover_cursor(notification_state_box, "hand1")

local screenshot = wibox.widget {
    align = "center",
    valign = "center",
    font = "icomoon 25",
    markup = helpers.colorize_text("", x.color3),
    widget = wibox.widget.textbox()
}
local screenshot_box = create_boxed_widget(screenshot, dpi(150), dpi(78), x.background)
screenshot_box:buttons(gears.table.join(
    -- Left click - Take screenshot
    awful.button({ }, 1, function ()
        apps.screenshot("full")
    end),
    -- Right click - Take screenshot in 5 seconds
    awful.button({ }, 3, function ()
        naughty.notify({title = "Say cheese!", text = "Taking shot in 5 seconds", timeout = 4, icon = icons.image.screenshot})
        apps.screenshot("full", 5)
    end)
))

helpers.add_hover_cursor(screenshot_box, "hand1")

-- Item placement
dashboard:setup {
    -- Center boxes vertically
    nil,
    {
        -- Center boxes horizontally
        nil,
        {
            -- Column container
            {
                -- Column 1
                user_box,
                fortune_box,
                layout = wibox.layout.fixed.vertical
            },
            {
                -- Column 2
                url_petals_box,
                notification_state_box,
                screenshot_box,
                disk_box,
                layout = wibox.layout.fixed.vertical
            },
            {
                -- Column 3
                bookmarks_box,
                corona_box,
                layout = wibox.layout.fixed.vertical
            },
            {
                -- Column 4
                calendar_box,
                uptime_box,
                layout = wibox.layout.fixed.vertical
            },
            layout = wibox.layout.fixed.horizontal
        },
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal

    },
    nil,
    expand = "none",
    layout = wibox.layout.align.vertical
}

local dashboard_grabber
function dashboard_hide()
    awful.keygrabber.stop(dashboard_grabber)
    set_visibility(false)
end


local original_cursor = "left_ptr"
function dashboard_show()
    -- Fix cursor sometimes turning into "hand1" right after showing the dashboard
    -- Sigh... This fix does not always work
    local w = mouse.current_wibox
    if w then
        w.cursor = original_cursor
    end
    -- naughty.notify({text = "starting the keygrabber"})
    dashboard_grabber = awful.keygrabber.run(function(_, key, event)
        if event == "release" then return end
        -- Press Escape or q or F1 to hide it
        if key == 'Escape' or key == 'q' or key == 'F1' then
            dashboard_hide()
        end
    end)
    set_visibility(true)
end
