local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")
local dotted_line = require("noodle.dotted_line")

local font_family = "Kyok Medium"
local font_family_bold = "Kyok Bold"

local header_config = {
    { day = "m", color = x.color1 },
    { day = "t", color = x.color3 },
    { day = "w", color = x.color2 },
    { day = "t", color = x.color6 },
    { day = "f", color = x.color4 },
    { day = "s", color = x.color5 },
    { day = "s", color = x.color1 },
}

-- Create invisible dummy clock that actually updates in order to
-- connect to its redraw_needed signal
local dummy_textclock = wibox.widget.textclock("%d")
dummy_textclock.visible = false

local function get_month_calendar(year, month)
    -- Determine the first day of the month
    local first_day = os.time{year=year, month=month, day=1}

    -- Find the starting point (Monday of the week containing the first day)
    local first_day_weekday = os.date("*t", first_day).wday
    local start_date = first_day - (first_day_weekday - 2) * 86400
    if first_day_weekday == 1 then
        start_date = first_day - 6 * 86400  -- If the first day is Sunday, adjust to previous Monday
    end

    -- Determine the last day of the month
    local next_month = os.time{year=year, month=month+1, day=1}
    local last_day = os.time{year=os.date("*t", next_month).year, month=os.date("*t", next_month).month, day=1} - 86400

    local calendar = {}
    local current_date = start_date
    local today = os.date('%Y-%m-%d')
    local outside_of_month = true

    while current_date <= last_day or os.date("*t", current_date).wday ~= 2 do
        local week = {}
        for _ = 1, 7 do
            local value = os.date('%d', current_date)
            if value == "01" then
                outside_of_month = not outside_of_month
            end
            table.insert(week, {
                value = value,
                is_today = today == os.date('%Y-%m-%d', current_date),
                outside_of_month = outside_of_month,
            })
            current_date = current_date + 86400
        end
        table.insert(calendar, week)
    end

    return calendar
end

local cell_spacing = dpi(1)
local cell_size = dpi(26)
local create_header_cell = function(week_day, color)
    local cell = wibox.widget {
        {
            text = text,
            halign = "center",
            valign = "center",
            markup = helpers.colorize_text(week_day, color),
            font = font_family_bold.." 13",
            forced_height = cell_size,
            forced_width = cell_size,
            widget = wibox.widget.textbox
        },
        widget = wibox.container.background
    }
    return cell
end

local create_cell = function()
    local cell_text = wibox.widget {
        halign = "center",
        valign = "center",
        font = font_family.." 9",
        widget = wibox.widget.textbox
    }

    local cell = wibox.widget {
        {
            cell_text,
            -- Manually fix cell text alignment
            margins = { top = dpi(1) },
            widget = wibox.container.margin
        },
        forced_height = cell_size,
        forced_width = cell_size,
        shape = helpers.rrect(dpi(6)),
        widget = wibox.container.background
    }

    function cell:set_text(text)
        cell_text.text = text
    end

    function cell:set_outside_of_month(outside_of_month)
        cell.fg = outside_of_month and x.color8 or x.foreground
    end

    function cell:set_is_today(is_today)
        if is_today then
            cell.bg = x.foreground
            cell_text.markup = helpers.colorize_text(cell_text.text, x.background)
        else
            cell.bg = nil
            cell_text.markup = cell_text.text
        end
    end

    return cell
end

local header = wibox.widget {
    spacing = cell_spacing,
    layout = wibox.layout.fixed.horizontal
}
for i=1,7 do
    header:add(create_header_cell(header_config[i].day, header_config[i].color))
end

local footer = dotted_line.new(16, dpi(5), dpi(5), "horizontal")
footer.color = x.color0
footer.forced_height = cell_size

local row_widgets = {}
local cell_widgets = {}

local create_row = function()
    local row = wibox.widget {
        spacing = cell_spacing,
        layout = wibox.layout.fixed.horizontal
    }
    return row
end

-- Populate calendar with cell widgets
for i=1,6 do
    local row = create_row()
    table.insert(row_widgets, row)
    table.insert(cell_widgets, {})
    for j=1,7 do
        local cell = create_cell()
        table.insert(cell_widgets[i], cell)
        row:add(cell)
    end
end

local calendar_widget = wibox.widget {
    dummy_textclock,
    header,
    row_widgets[1],
    row_widgets[2],
    row_widgets[3],
    row_widgets[4],
    row_widgets[5],
    -- Some months require 6 rows to display instead of 5
    -- This row is hidden when unneeded
    row_widgets[6],
    -- The footer is shown when row 6 is unneeded to prevent shifting due to the
    -- calendar changing size
    {
        footer,
        halign = "center",
        valign = "center",
        widget = wibox.container.place
    },
    spacing = cell_spacing,
    layout = wibox.layout.fixed.vertical
}

function calendar_widget:set_cells(week_rows)
    for i=1,#week_rows do
        for j=1,7 do
            local cell_widget = cell_widgets[i][j]
            local cell = week_rows[i][j]
            cell_widget.text = cell.value
            cell_widget.is_today = cell.is_today
            cell_widget.outside_of_month = cell.outside_of_month
        end
    end

    if #week_rows == 5 then
        row_widgets[6].visible = false
        footer.visible = true
    else
        row_widgets[6].visible = true
        footer.visible = false
    end
end

local calendar_date
function calendar_widget:set_date(date_obj)
    calendar_date = date_obj
    calendar_widget.cells = get_month_calendar(date_obj.year, date_obj.month)
    calendar_widget:emit_signal("calendar::date_changed", date_obj)
end

function calendar_widget:increment_month()
    local new_date = {}
    if calendar_date.month == 12 then
        new_date.month = 1
        new_date.year = calendar_date.year + 1
    else
        new_date.month = calendar_date.month + 1
        new_date.year = calendar_date.year
    end
    calendar_widget.date = new_date
end

function calendar_widget:decrement_month()
    local new_date = {}
    if calendar_date.month == 1 then
        new_date.month = 12
        new_date.year = calendar_date.year - 1
    else
        new_date.month = calendar_date.month - 1
        new_date.year = calendar_date.year
    end
    calendar_widget.date = new_date
end

function calendar_widget:increment_year()
    calendar_widget.date = { month = calendar_date.month, year = calendar_date.year + 1 }
end

function calendar_widget:decrement_year()
    calendar_widget.date = { month = calendar_date.month, year = calendar_date.year - 1 }
end

calendar_widget:buttons(gears.table.join(
    -- Left Click - Reset date to current date
    awful.button({ }, 1, function ()
        calendar_widget.date = os.date('*t')
    end),
    -- Scroll - Move to previous or next month
    awful.button({ }, 4, function ()
        calendar_widget:decrement_month()
    end),
    awful.button({ }, 5, function ()
        calendar_widget:increment_month()
    end)
))

-- Initialize
calendar_widget.date = os.date('*t')

-- Update when time changes
dummy_textclock:connect_signal("widget::redraw_needed", function ()
    local now = os.date('*t')
    -- Only update calendar if current calendar date is today, in order not to
    -- interrupt the user browsing other months
    if calendar_date.year == now.year and calendar_date.month == now.month then
        -- TODO Only update calendar if last date is different than last updated date
        calendar_widget.date = now
    end
end)


return calendar_widget

