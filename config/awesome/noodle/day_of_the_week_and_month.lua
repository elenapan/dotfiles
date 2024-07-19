local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local dotted_line = require("noodle.dotted_line")

local font_family = "Kyok Medium"
local font_family_bold = "Kyok Bold"

-- Create invisible dummy clock that actually updates in order to
-- connect to its redraw_needed signal
local dummy_textclock = wibox.widget.textclock("%M")
dummy_textclock.visible = false

local dotw_initials = {"m", "t", "w", "t", "f", "s", "s"}
local dotw_colors = {
    x.color1,
    x.color3,
    x.color2,
    x.color6,
    x.color4,
    x.color5,
    x.color1,
}

local dotw_month_day = {}
local dotw_separators = {}

local create_dotw_container = function(week_day, color)
    local week_day = wibox.widget {
        font = font_family_bold.." 13",
        markup = helpers.colorize_text(week_day, color),
        align = "center",
        valign = "bottom",
        -- Manually set the height here to prevent tall letters (like f) from
        -- being cut off. This has to be adjusted if the font/size changes.
        forced_height = dpi(19),
        widget = wibox.widget.textbox()
    }

    local month_day = wibox.widget {
        font = font_family_bold.." 9",
        align = "center",
        valign = "top",
        widget = wibox.widget.textbox()
    }

    local separator = dotted_line.new(3, dpi(5), dpi(5), "horizontal")

    table.insert(dotw_month_day, month_day)
    table.insert(dotw_separators, separator)

    local container = wibox.widget {
        {
            {
                {
                    helpers.pad.vertical(dpi(2)),
                    week_day,
                    helpers.pad.vertical(dpi(6)),
                    separator,
                    helpers.pad.vertical(dpi(10)),
                    month_day,
                    helpers.pad.vertical(dpi(1)),
                    layout = wibox.layout.fixed.vertical
                },
                valign = "center",
                widget = wibox.container.place
            },
            margins = {
                top = dpi(6),
                bottom = dpi(8),
                left = 0,
                right = 0,
            },
            widget = wibox.container.margin()
        },
        shape = helpers.rrect(dpi(6)),
        widget = wibox.container.background()
    }

    return container
end

local dotw_containers = {}
for i=1,7 do
    table.insert(dotw_containers, create_dotw_container(dotw_initials[i], dotw_colors[i]))
end

local day_of_the_week_and_month = wibox.widget {
    nil,
    {
        dummy_textclock,
        dotw_containers[1],
        dotw_containers[2],
        dotw_containers[3],
        dotw_containers[4],
        dotw_containers[5],
        dotw_containers[6],
        dotw_containers[7],
        layout = wibox.layout.fixed.horizontal
    },
    expand = "none",
    layout = wibox.layout.align.horizontal
}

local update_dotw = function ()
    local index_today = tonumber(os.date("%u"))
    local date_today = os.date("*t")

    local month_days = {}

    -- Compute days before today
    for i=1,(index_today - 1) do
        local date_adjusted = {
            year = date_today.year,
            month = date_today.month,
            day = date_today.day - (index_today - i),
            hour = date_today.hour,
            min = date_today.min,
            sec = date_today.sec,
            isdst = date_today.isdst
        }
        table.insert(month_days, os.date("%d", os.time(date_adjusted)))
    end

    -- Today
    table.insert(month_days, os.date("%d"))

    -- Compute days after today
    for i=(index_today+1),7 do
        local date_adjusted = {
            year = date_today.year,
            month = date_today.month,
            day = date_today.day + (i - index_today),
            hour = date_today.hour,
            min = date_today.min,
            sec = date_today.sec,
            isdst = date_today.isdst
        }
        table.insert(month_days, os.date("%d", os.time(date_adjusted)))
    end

    -- Update widget
    for i=1,7 do
        if index_today == i then
            dotw_containers[i].bg = x.color0
            dotw_separators[i].color = dotw_colors[i]
            dotw_month_day[i].markup = helpers.colorize_text(month_days[i], x.foreground)
        else
            dotw_containers[i].bg = "#00000000"
            dotw_separators[i].color = x.color0
            dotw_month_day[i].markup = helpers.colorize_text(month_days[i], x.color8)
        end
    end
end

-- Initialize
update_dotw()

-- Update every time the dummy clock updates since the "+%u" textclock does not
-- update on its own for some reason
dummy_textclock:connect_signal("widget::redraw_needed", function ()
    update_dotw()
end)

return day_of_the_week_and_month
