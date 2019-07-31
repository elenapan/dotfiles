local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local keygrabber = require("awful.keygrabber")

local helpers = require("helpers")
local pad = helpers.pad

-- Appearance
local box_radius = beautiful.start_screen_box_border_radius or dpi(12)
local box_gap = dpi(6)

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Create the widget
start_screen = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(start_screen)

start_screen.bg = beautiful.start_screen_bg or beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
start_screen.fg = beautiful.start_screen_fg or beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

start_screen:buttons(gears.table.join(
    -- Left click - Hide start_screen
    awful.button({ }, 1, function ()
        start_screen_hide()
    end),
    -- Middle click - Hide start_screen
    awful.button({ }, 2, function ()
        start_screen_hide()
    end),
    -- Right click - Hide start_screen
    awful.button({ }, 3, function ()
        start_screen_hide()
    end)
))

-- Helper function that puts a widget inside a box with a specified background color
-- TODO also accept buttons and signals?
-- Invisible margins are added so that the boxes created with this function are evenly separated
-- The widget_to_be_boxed is vertically and horizontally centered inside the box
local function create_boxed_widget(widget_to_be_boxed, width, height, bg_color)
    local box_container = wibox.container.background()
    box_container.bg = bg_color
    box_container.forced_height = height
    box_container.forced_width = width
    box_container.shape = helpers.rrect(box_radius)

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
user_picture_container.shape = gears.shape.circle
user_picture_container.forced_height = dpi(140)
user_picture_container.forced_width = dpi(140)
local user_picture = wibox.widget {
    wibox.widget.imagebox(os.getenv("HOME").."/.config/awesome/profile.png"),
    widget = user_picture_container
}
local username = os.getenv("USER")
local user_text = wibox.widget.textbox(username)
-- Capitalize username
-- local user_text = wibox.widget.textbox(username:upper())
-- local user_text = wibox.widget.textbox(username:sub(1,1):upper()..username:sub(2))
user_text.font = "sans bold 18"
user_text.align = "center"
user_text.valign = "center"

local host_text = wibox.widget.textbox()
awful.spawn.easy_async_with_shell("hostname", function(out)
    -- Remove trailing whitespaces
    out = out:gsub('^%s*(.-)%s*$', '%1')
    host_text.markup = helpers.colorize_text("@"..out, beautiful.xcolor8)
end)
-- host_text.markup = "<span foreground='" .. beautiful.xcolor8 .."'>" .. minutes.text .. "</span>"
host_text.font = "sans italic 18"
host_text.align = "center"
host_text.valign = "center"
local user = wibox.widget {
    user_picture,
    pad(1),
    pad(1),
    pad(1),
    user_text,
    host_text,
    layout = wibox.layout.fixed.vertical
}
local user_box = create_boxed_widget(user, dpi(300), dpi(340), beautiful.xbackground)

-- Calendar
-- Create the calendar
local styles = {}
styles.month   = { padding      = 20,
    fg_color     = beautiful.xcolor7,
    bg_color     = beautiful.xbackground.."00",
    border_width = 0,
}
styles.normal  = {}
styles.focus   = { fg_color = beautiful.xcolor1,
    bg_color = beautiful.xcolor5.."00",
    markup   = function(t) return '<b>' .. t .. '</b>' end,
    -- markup   = function(t) return '<span foreground="'..beautiful.xcolor1..'"><b>' .. t .. '</b></span>' end,
}
styles.header  = { fg_color = beautiful.xcolor7,
    bg_color = beautiful.xcolor1.."00",
    -- markup   = function(t) return '<b>' .. t .. '</b>' end,
    markup   = function(t) return '<span font_desc="sans bold 24">' .. t .. '</span>' end,
}
styles.weekday = { fg_color = beautiful.xcolor7,
    bg_color = beautiful.xcolor1.."00",
    padding  = 3,
    markup   = function(t) return '<b>' .. t .. '</b>' end,
}
local function decorate_cell(widget, flag, date)
    if flag=='monthheader' and not styles.monthheader then
        flag = 'header'
    end
    local props = styles[flag] or {}
    if props.markup and widget.get_text and widget.set_markup then
        widget:set_markup(props.markup(widget:get_text()))
    end
    -- Change bg color for weekends
    local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
    local weekday = tonumber(os.date('%w', os.time(d)))
    local default_fg = beautiful.xcolor7
    local default_bg = beautiful.xcolor0.."00"
    -- local default_bg = (weekday==0 or weekday==6) and beautiful.xcolor6 or beautiful.xcolor14
    local ret = wibox.widget {
        {
            widget,
            margins = (props.padding or 2) + (props.border_width or 0),
            widget  = wibox.container.margin
        },
        shape              = props.shape,
        shape_border_color = props.border_color or beautiful.xbackground,
        shape_border_width = props.border_width or 0,
        fg                 = props.fg_color or default_fg,
        bg                 = props.bg_color or default_bg,
        widget             = wibox.container.background
    }
    return ret
end

calendar_widget = wibox.widget {
    date     = os.date('*t'),
    font     = "sans 14",
    long_weekdays = false,
    spacing  = dpi(3),
    fn_embed = decorate_cell,
    widget   = wibox.widget.calendar.month
}

local current_month = os.date('*t').month
calendar_widget:buttons(gears.table.join(
    -- Left Click - Reset date to current date
    awful.button({ }, 1, function ()
        calendar_widget.date = os.date('*t')
    end),
    -- Scroll - Move to previous or next month
    awful.button({ }, 4, function ()
        new_calendar_month = calendar_widget.date.month - 1
        if new_calendar_month == current_month then
            calendar_widget.date = os.date('*t')
        else
            calendar_widget.date = {month = new_calendar_month, year = calendar_widget.date.year} 
        end
    end),
    awful.button({ }, 5, function ()
        new_calendar_month = calendar_widget.date.month + 1
        if new_calendar_month == current_month then
            calendar_widget.date = os.date('*t')
        else
            calendar_widget.date = {month = new_calendar_month, year = calendar_widget.date.year} 
        end
    end)
))

local calendar_box = create_boxed_widget(calendar_widget, dpi(300), dpi(400), beautiful.xbackground)
-- local calendar_box = create_boxed_widget(calendar, 380, 540, beautiful.xcolor0)

-- Time widget
local hours = wibox.widget.textclock("%H  ")
hours.font = "sans bold 30"
hours.align = "center"
hours.valign = "center"
local minutes = wibox.widget.textclock("  %M")
minutes.font = "sans 30"
minutes.align = "center"
minutes.valign = "center"
minutes.markup = "<span foreground='" .. beautiful.xcolor14 .."'>" .. minutes.text .. "</span>"
minutes:connect_signal("widget::redraw_needed", function () 
    minutes.markup = "<span foreground='" .. beautiful.xcolor14 .."'>" .. minutes.text .. "</span>"
end)

-- Time
local time = wibox.widget {
    hours,
    minutes,
    layout = wibox.layout.fixed.vertical
}
local time_box = create_boxed_widget(time, dpi(150), dpi(150), beautiful.xbackground)

-- Date
local day_of_the_week = wibox.widget.textclock("%A")
day_of_the_week.font = "sans italic 20"
day_of_the_week.fg = beautiful.xcolor0
day_of_the_week.align = "center"
day_of_the_week.valign = "center"
day_of_the_week.align = "center"
day_of_the_week.valign = "center"
-- day_of_the_week.markup = "<span foreground='" .. beautiful.xcolor7 .."'>" .. day_of_the_week.text .. "</span>"
-- day_of_the_week:connect_signal("widget::redraw_needed", function () 
--     day_of_the_week.markup = "<span foreground='" .. beautiful.xcolor7 .."'>" .. day_of_the_week.text .. "</span>"
-- end)
local day_of_the_month = wibox.widget.textclock("%d")
day_of_the_month.font = "sans bold 30"
day_of_the_month.fg = beautiful.xcolor0
day_of_the_month.align = "center"
day_of_the_month.valign = "center"

day_of_the_month.align = "center"
day_of_the_month.valign = "center"
day_of_the_month.markup = "<span foreground='" .. beautiful.xcolor1 .."'>" .. day_of_the_month.text .. "</span>"
day_of_the_month:connect_signal("widget::redraw_needed", function () 
    day_of_the_month.markup = "<span foreground='" .. beautiful.xcolor1 .."'>" .. day_of_the_month.text .. "</span>"

    -- Also update the calendar widget ;)
    calendar_widget.date = os.date('*t')
end)

local date = wibox.widget {
    day_of_the_week,
    day_of_the_month,
    layout = wibox.layout.align.vertical
}
local date_box = create_boxed_widget(date, dpi(150), dpi(150), beautiful.xbackground)

-- File system bookmarks
local function create_bookmark(name, path)
    local original_color = beautiful.xcolor1
    local hover_color = beautiful.xcolor9

    local bookmark = wibox.widget.textbox()
    bookmark.font = "sans bold 16"
    -- bookmark.text = wibox.widget.textbox(name:sub(1,1):upper()..name:sub(2))
    bookmark.markup = helpers.colorize_text(name, original_color)
    bookmark.align = "center"
    bookmark.valign = "center"

    -- Buttons
    bookmark:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            awful.spawn.with_shell(user.file_manager.." "..path)
        end),
        awful.button({ }, 3, function ()
            awful.spawn.with_shell(user.terminal.." -e 'ranger' "..path)
        end)
    ))

    -- Hover effect
    bookmark:connect_signal("mouse::enter", function ()
        bookmark.markup = helpers.colorize_text(name, hover_color)
    end)
    bookmark:connect_signal("mouse::leave", function ()
        bookmark.markup = helpers.colorize_text(name, original_color)
    end)

    helpers.add_hover_cursor(bookmark, "hand1")

    return bookmark
end

local bookmarks = wibox.widget {
    create_bookmark("HOME", ""),
    pad(1),
    create_bookmark("DOWNLOADS", "~/Downloads"),
    pad(1),
    create_bookmark("MUSIC", "~/Music"),
    pad(1),
    create_bookmark("PICTURES", "~/Pictures"),
    pad(1),
    create_bookmark("WALLPAPERS", "~/Pictures/Wallpapers"),
    layout = wibox.layout.fixed.vertical
}

local bookmarks_box = create_boxed_widget(bookmarks, dpi(200), dpi(300), beautiful.xbackground)

-- URLs
local function create_url(name, path)
    local original_color = beautiful.xcolor4
    local hover_color = beautiful.xcolor12

    local url = wibox.widget.textbox()
    url.font = "sans bold 16"
    -- url.text = wibox.widget.textbox(name:sub(1,1):upper()..name:sub(2))
    url.markup = helpers.colorize_text(name, original_color)
    url.align = "center"
    url.valign = "center"

    -- Buttons
    url:buttons(
        gears.table.join(
            awful.button({ }, 1, function ()
                awful.spawn(user.browser.." "..path)
                start_screen_hide()
            end),
            awful.button({ }, 3, function ()
                awful.spawn(user.browser.." -new-window "..path)
                start_screen_hide()
            end)
    ))

    -- Hover effect
    url:connect_signal("mouse::enter", function ()
        url.markup = helpers.colorize_text(name, hover_color)
    end)
    url:connect_signal("mouse::leave", function ()
        url.markup = helpers.colorize_text(name, original_color)
    end)

    helpers.add_hover_cursor(url, "hand1")

    return url
end

local urls = wibox.widget {
    create_url("4CHAN", "4chan.org"),
    pad(1),
    create_url("REDDIT", "reddit.com"),
    pad(1),
    create_url("GITHUB", "github.com/elenapan"),
    layout = wibox.layout.fixed.vertical
}

local urls_box = create_boxed_widget(urls, dpi(200), dpi(180), beautiful.xbackground)

-- Fortune
local fortune_command = "fortune -n 140 -s"
-- local fortune_command = "fortune -n 140 -s computers"
local fortune = wibox.widget.textbox()
fortune.font = "sans 12"
local fortune_update_interval = 3600
awful.widget.watch(fortune_command, fortune_update_interval, function(widget, stdout)
    -- Remove trailing whitespaces
    -- stdout = stdout:gsub('^%s*(.-)%s*$', '%1')
    fortune.markup = "<i>"..stdout.."</i>"
end)

local fortune_widget = wibox.widget {
    fortune,
    margins = box_gap * 3,
    color = "#00000000",
    widget = wibox.container.margin
}


local fortune_box = create_boxed_widget(fortune_widget, dpi(300), dpi(140), beautiful.xbackground)
fortune_box:buttons(gears.table.join(
    -- Left click - New fortune
    awful.button({ }, 1, function ()
        awful.spawn.easy_async_with_shell(fortune_command, function(out)
            -- Remove trailing whitespaces
            out = out:gsub('^%s*(.-)%s*$', '%1')
            fortune.markup = "<i>"..out.."</i>"
        end)
    end)
))
helpers.add_hover_cursor(fortune_box, "hand1")

local icon_size = dpi(40)
local brightness_icon = wibox.widget.imagebox(icons.redshift)
brightness_icon.resize = true
brightness_icon.forced_width = icon_size
brightness_icon.forced_height = icon_size
-- local brightness_icon = wibox.widget.textbox("")
-- brightness_icon.font = "Material Design Icons 30"
local brightness_bar = require("noodle.brightness_bar")
brightness_bar.forced_width = dpi(210)

local brightness = wibox.widget {
    brightness_icon,
    pad(1),
    brightness_bar,
    layout = wibox.layout.fixed.horizontal
}

local brightness_box = create_boxed_widget(brightness, dpi(300), dpi(80), beautiful.xbackground)

brightness_box:buttons(
    gears.table.join(
        -- Left click - Toggle redshift
        awful.button({ }, 1, function ()
            helpers.toggle_night_mode()
        end),
        -- Right click - Reset brightness (Set to max)
        awful.button({ }, 3, function ()
            awful.spawn.with_shell("light -S 100")
        end),
        -- Scroll up - Increase brightness
        awful.button({ }, 4, function ()
            awful.spawn.with_shell("light -A 10")
        end),
        -- Scroll down - Decrease brightness
        awful.button({ }, 5, function ()
            awful.spawn.with_shell("light -U 10")
        end)
))

helpers.add_hover_cursor(brightness_box, "hand1")

local notification_state = wibox.widget.imagebox(icons.alarm)
notification_state.resize = true
notification_state.forced_width = icon_size
notification_state.forced_height = icon_size
-- local notification_state = wibox.widget.textbox()
-- notification_state.font = "Material Design Icons 30"
local function update_notification_state_icon()
    if naughty.is_suspended() then
        notification_state.image = icons.alarm_off
    else
        notification_state.image = icons.alarm
    end
end
update_notification_state_icon()
local notification_state_box = create_boxed_widget(notification_state, dpi(150), dpi(78), beautiful.xbackground)
notification_state_box:buttons(gears.table.join(
    -- Left click - Toggle notification state
    awful.button({ }, 1, function ()
        naughty.toggle()
        update_notification_state_icon()
    end)
))

helpers.add_hover_cursor(notification_state_box, "hand1")

local screenshot = wibox.widget.imagebox(icons.screenshot)
screenshot.resize = true
screenshot.forced_width = icon_size
screenshot.forced_height = icon_size
-- local screenshot = wibox.widget.textbox("")
-- screenshot.font = "Material Design Icons 30"
local screenshot_box = create_boxed_widget(screenshot, dpi(150), dpi(78), beautiful.xbackground)
screenshot_box:buttons(gears.table.join(
    -- Left click - Take screenshot
    awful.button({ }, 1, function ()
        helpers.screenshot("full")
    end),
    -- Right click - Take screenshot in 5 seconds
    awful.button({ }, 3, function ()
        naughty.notify({title = "Say cheese!", text = "Taking shot in 5 seconds", timeout = 4, icon = icons.screenshot})
        helpers.screenshot("full", 5)
    end)
))

helpers.add_hover_cursor(screenshot_box, "hand1")

-- Item placement
start_screen:setup {
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
                time_box,
                -- launcher_petals_box,
                notification_state_box,
                screenshot_box,
                date_box,
                layout = wibox.layout.fixed.vertical
            },
            {
                -- Column 3
                bookmarks_box,
                urls_box,
                layout = wibox.layout.fixed.vertical
            },
            {
                -- Column 4
                calendar_box,
                brightness_box,
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

local start_screen_grabber
function start_screen_hide()
    awful.keygrabber.stop(start_screen_grabber)
    start_screen.visible = false
end


local original_cursor = "left_ptr"
function start_screen_show()
    -- Fix cursor sometimes turning into "hand1" right after showing the start_screen
    -- Sigh... This fix does not always work
    local w = mouse.current_wibox
    if w then
        w.cursor = original_cursor
    end
    -- naughty.notify({text = "starting the keygrabber"})
    start_screen_grabber = awful.keygrabber.run(function(_, key, event)
        if event == "release" then return end
        -- Press Escape or q or F1 to hide it
        if key == 'Escape' or key == 'q' or key == 'F1' then
            start_screen_hide()
        end
    end)
    start_screen.visible = true
end
