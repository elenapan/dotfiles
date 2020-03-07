local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local helpers = require("helpers")

local keygrabber = require("awful.keygrabber")

-- Appearance
local box_radius = beautiful.dashboard_box_border_radius or dpi(12)
local box_gap = dpi(6)

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Create the widget
dashboard = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(dashboard)

dashboard.bg = beautiful.dashboard_bg or beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
dashboard.fg = beautiful.dashboard_fg or beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

-- Create an container box
-- local dashboard_box = wibox.container.background()
-- dashboard_box.bg = dashboard.bg
-- dashboard_box.shape = gears.shape.rounded_rect
-- dashboard_box.shape_border_radius = 20

dashboard:buttons(gears.table.join(
    -- Middle click - Hide dashboard
    awful.button({ }, 2, function ()
        dashboard_hide()
    end),
    -- Right click - Hide dashboard
    awful.button({ }, 3, function ()
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
user_picture_container.shape = gears.shape.circle
user_picture_container.forced_height = dpi(140)
user_picture_container.forced_width = dpi(140)
local user_picture = wibox.widget {
    wibox.widget.imagebox(user.profile_picture),
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
    host_text.markup = helpers.colorize_text("@"..out, x.color8)
end)
-- host_text.markup = "<span foreground='" .. x.color8 .."'>" .. minutes.text .. "</span>"
host_text.font = "sans italic 18"
host_text.align = "center"
host_text.valign = "center"
local user_widget = wibox.widget {
    user_picture,
    -- Dummy widget for spacing
    {
        forced_height = dpi(30),
        -- forced_width = gen_button_margin,
        layout = wibox.layout.fixed.vertical
    },
    user_text,
    host_text,
    layout = wibox.layout.fixed.vertical
}
local user_box = create_boxed_widget(user_widget, dpi(300), dpi(340), x.background)

-- Calendar
-- Create the calendar
local styles = {}
styles.month   = { padding      = 20,
    fg_color     = x.color7,
    bg_color     = x.background.."00",
    border_width = 0,
}
styles.normal  = {}
styles.focus   = { fg_color = x.color1,
    bg_color = x.color5.."00",
    markup   = function(t) return '<b>' .. t .. '</b>' end,
    -- markup   = function(t) return '<span foreground="'..x.color1..'"><b>' .. t .. '</b></span>' end,
}
styles.header  = { fg_color = x.color7,
    bg_color = x.color1.."00",
    -- markup   = function(t) return '<b>' .. t .. '</b>' end,
    markup   = function(t) return '<span font_desc="sans bold 24">' .. t .. '</span>' end,
}
styles.weekday = { fg_color = x.color7,
    bg_color = x.color1.."00",
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
    local default_fg = x.color7
    local default_bg = x.color0.."00"
    -- local default_bg = (weekday==0 or weekday==6) and x.color6 or x.color14
    local ret = wibox.widget {
        {
            widget,
            margins = (props.padding or 2) + (props.border_width or 0),
            widget  = wibox.container.margin
        },
        shape              = props.shape,
        shape_border_color = props.border_color or x.background,
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

local calendar_box = create_boxed_widget(calendar_widget, dpi(300), dpi(400), x.background)
-- local calendar_box = create_boxed_widget(calendar, 380, 540, x.color0)



-- Time widget
local hours = wibox.widget.textclock("%H  ")
hours.font = "sans bold 30"
hours.align = "center"
hours.valign = "center"
local minutes = wibox.widget.textclock("  %M")
minutes.font = "sans 30"
minutes.align = "center"
minutes.valign = "center"
minutes.markup = "<span foreground='" .. x.color14 .."'>" .. minutes.text .. "</span>"
minutes:connect_signal("widget::redraw_needed", function () 
    minutes.markup = "<span foreground='" .. x.color14 .."'>" .. minutes.text .. "</span>"
end)

-- Time
local time = wibox.widget {
    hours,
    minutes,
    layout = wibox.layout.fixed.vertical
}
local time_box = create_boxed_widget(time, dpi(150), dpi(150), x.background)

-- Date
local day_of_the_week = wibox.widget.textclock("%A")
day_of_the_week.font = "sans italic 20"
day_of_the_week.fg = x.color0
day_of_the_week.align = "center"
day_of_the_week.valign = "center"
day_of_the_week.align = "center"
day_of_the_week.valign = "center"
-- day_of_the_week.markup = "<span foreground='" .. x.color7 .."'>" .. day_of_the_week.text .. "</span>"
-- day_of_the_week:connect_signal("widget::redraw_needed", function () 
--     day_of_the_week.markup = "<span foreground='" .. x.color7 .."'>" .. day_of_the_week.text .. "</span>"
-- end)
local day_of_the_month = wibox.widget.textclock("%d")
day_of_the_month.font = "sans bold 30"
day_of_the_month.fg = x.color0
day_of_the_month.align = "center"
day_of_the_month.valign = "center"

day_of_the_month.align = "center"
day_of_the_month.valign = "center"
day_of_the_month.markup = "<span foreground='" .. x.color1 .."'>" .. day_of_the_month.text .. "</span>"
day_of_the_month:connect_signal("widget::redraw_needed", function () 
    day_of_the_month.markup = "<span foreground='" .. x.color1 .."'>" .. day_of_the_month.text .. "</span>"

    -- Also update the calendar widget ;)
    calendar_widget.date = os.date('*t')
end)

local date = wibox.widget {
    day_of_the_week,
    day_of_the_month,
    layout = wibox.layout.align.vertical
}
local date_box = create_boxed_widget(date, dpi(150), dpi(150), x.background)

-- File system bookmarks
local function create_bookmark(name, path)
    local original_color = x.color1
    local hover_color = x.color9

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
        bookmark.markup = helpers.colorize_text(name, original_color)
    end)

    helpers.add_hover_cursor(bookmark, "hand1")

    return bookmark
end

local bookmarks = wibox.widget {
    create_bookmark("HOME", ""),
    create_bookmark("DOWNLOADS", "~/Downloads"),
    create_bookmark("MUSIC", "~/Music"),
    create_bookmark("PICTURES", "~/Pictures"),
    create_bookmark("WALLPAPERS", "~/Pictures/Wallpapers"),
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical
}

local bookmarks_box = create_boxed_widget(bookmarks, dpi(200), dpi(300), x.background)

-- URLs
local function create_url(name, path)
    local original_color = x.color4
    local hover_color = x.color12

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
                dashboard_hide()
            end),
            awful.button({ }, 3, function ()
                awful.spawn(user.browser.." -new-window "..path)
                dashboard_hide()
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
    create_url("REDDIT", "reddit.com"),
    create_url("GITHUB", "github.com/elenapan"),
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical
}

local urls_box = create_boxed_widget(urls, dpi(200), dpi(180), x.background)

-- Fortune
local fortune_command = "fortune -n 140 -s"
-- local fortune_command = "fortune -n 140 -s computers"
local fortune = wibox.widget {
    font = "sans italic 12",
    align = "center",
    text = "Loading your cookie...",
    widget = wibox.widget.textbox
}

local fortune_update_interval = 3600
awful.widget.watch(fortune_command, fortune_update_interval, function(widget, stdout)
    -- Remove trailing whitespaces
    stdout = stdout:gsub('^%s*(.-)%s*$', '%1')
    fortune.text = stdout
end)

-- local start_quotation_marks = wibox.widget.textbox(" ")
-- start_quotation_marks.font = "Iosevka Nerd Font 18"
-- start_quotation_marks.align = "left"
-- local end_quotation_marks = wibox.widget.textbox(" ")
-- end_quotation_marks.font = "Iosevka Nerd Font 18"
-- end_quotation_marks.align = "right"

local fortune_widget = wibox.widget {
    fortune,
    -- {
    --     start_quotation_marks,
    --     fortune,
    --     end_quotation_marks,
    --     expand = "none",
    --     layout = wibox.layout.fixed.vertical
    -- },
    margins = box_gap * 3,
    color = "#00000000",
    widget = wibox.container.margin
}


local fortune_box = create_boxed_widget(fortune_widget, dpi(300), dpi(140), x.background)
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

-- Launcher petals
-- local function create_launcher_petal(bg_color)
--     local petal_container = wibox.container.background()
--     petal_container.bg = bg_color
--     petal_container.forced_height = dpi(65)
--     petal_container.forced_width = dpi(65)
--     petal_container.shape = helpers.prrect(99, true, true, false, true)

--     -- Put the petal container inside a rounded container. Why?
--     -- Because I want the unrounded petal corner to not be pointy!
--     local petal = wibox.widget {
--         petal_container,
--         shape = helpers.rrect(box_radius / 2),
--         widget = wibox.container.background()
--     }

--     return petal
-- end

-- -- Create the containers
-- local petal_container_top_left = create_launcher_petal(x.background)
-- local petal_container_top_right = wibox.widget {
--     create_launcher_petal(x.background),
--     widget = wibox.container.mirror,
--     reflection = { horizontal = true }
-- }
-- local petal_container_bottom_left = wibox.widget {
--     create_launcher_petal(x.background),
--     widget = wibox.container.mirror,
--     reflection = { vertical = true }
-- }
-- local petal_container_bottom_right = wibox.widget {
--     create_launcher_petal(x.background),
--     widget = wibox.container.mirror,
--     reflection = { horizontal = true, vertical = true }
-- }

-- -- Create the icons
-- local petal_font = "Material Design Icons 20"
-- local petal_icon_top_left = wibox.widget.textbox("", { align = "center", valign = "center", font = petal_font })
-- -- petal_icon_top_left.font = petal_font
-- local petal_icon_top_right = wibox.widget.textbox("")
-- petal_icon_top_right.font = petal_font
-- local petal_icon_bottom_left = wibox.widget.textbox("")
-- petal_icon_bottom_left.font = petal_font
-- local petal_icon_bottom_right = wibox.widget.textbox("")
-- petal_icon_bottom_right.font = petal_font

-- -- Finally, create the petals and add buttons
-- local petal_top_left = wibox.widget {
--     petal_container_top_left,
--     petal_icon_top_left,
--     layout = wibox.layout.stack
-- }
-- petal_top_left:buttons(gears.table.join(
--                 awful.button({ }, 1, function ()
--                     awful.spawn(user.browser)
--                 end)
-- ))

-- local petal_top_right = wibox.widget {
--     petal_container_top_right,
--     petal_icon_top_right,
--     layout = wibox.layout.stack
-- }
-- petal_top_right:buttons(gears.table.join(
--                 awful.button({ }, 1, function ()
--                     awful.spawn(user.browser .. " reddit.com")
--                 end)
-- ))

-- local petal_bottom_left = wibox.widget {
--     petal_container_bottom_left,
--     petal_icon_bottom_left,
--     layout = wibox.layout.stack
-- }
-- petal_bottom_left:buttons(gears.table.join(
--                 awful.button({ }, 1, function ()
--                     awful.spawn("flux")
--                 end)
-- ))

-- local petal_bottom_right = wibox.widget {
--     petal_container_bottom_right,
--     petal_icon_bottom_right,
--     layout = wibox.layout.stack
-- }
-- petal_bottom_right:buttons(gears.table.join(
--                 awful.button({ }, 1, function ()
--                     awful.spawn("lutris")
--                 end)
-- ))

-- -- Add clickable effects on hover
-- helpers.add_hover_cursor(petal_top_left, "hand1")
-- helpers.add_hover_cursor(petal_top_right, "hand1")
-- helpers.add_hover_cursor(petal_bottom_left, "hand1")
-- helpers.add_hover_cursor(petal_bottom_right, "hand1")

-- local launcher_petals = wibox.widget {
--     petal_top_left,
--     petal_top_right,
--     petal_bottom_left,
--     petal_bottom_right,
--     forced_num_cols = 2,
--     spacing = box_gap * 2,
--     layout = wibox.layout.grid
-- }

-- local launcher_petals_box = create_boxed_widget(launcher_petals, dpi(150), dpi(150), "#00000000")
local icon_size = dpi(40)

local brightness_icon = wibox.widget.imagebox(icons.redshift)
brightness_icon.resize = true
brightness_icon.forced_width = icon_size
brightness_icon.forced_height = icon_size
-- local brightness_icon = wibox.widget.textbox("")
-- brightness_icon.font = "Material Design Icons 30"
local brightness_bar = wibox.widget{
  max_value     = 100,
  value         = 50,
  forced_height = dpi(10),
  margins       = {
    top = dpi(8),
    bottom = dpi(8),
  },
  forced_width  = dpi(210),
  shape         = gears.shape.rounded_bar,
  bar_shape     = gears.shape.rounded_bar,
  color         = beautiful.brightness_bar_active_color or "#5AA3CC",
  background_color = beautiful.brightness_bar_background_color or "#222222",
  border_width  = 0,
  border_color  = beautiful.border_color,
  widget        = wibox.widget.progressbar,
}

awesome.connect_signal("evil::brightness", function (value)
    brightness_bar.value = value
end)

local brightness = wibox.widget {
    brightness_icon,
    brightness_bar,
    spacing = dpi(5),
    layout = wibox.layout.fixed.horizontal
}

local brightness_box = create_boxed_widget(brightness, dpi(300), dpi(80), x.background)

brightness_box:buttons(
    gears.table.join(
        -- Left click - Toggle redshift
        awful.button({ }, 1, apps.night_mode),
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
local notification_state_box = create_boxed_widget(notification_state, dpi(150), dpi(78), x.background)
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
local screenshot_box = create_boxed_widget(screenshot, dpi(150), dpi(78), x.background)
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

local dashboard_grabber
function dashboard_hide()
    awful.keygrabber.stop(dashboard_grabber)
    dashboard.visible = false
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
    dashboard.visible = true
end
