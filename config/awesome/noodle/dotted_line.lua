local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local cairo = require("lgi").cairo

local dotted_line = {}

local create_dot = function(size)
    local widget = wibox.widget {
        forced_width = size,
        forced_height = size,
        shape = gears.shape.circle,
        widget = wibox.container.background
    }
    return widget
end

local orientation_edges = {
    horizontal = { start_edge = "left", end_edge = "right" },
    vertical = { start_edge = "top", end_edge = "bottom" }
}

-- dot_number - Number of dots (including half dots)
-- dot_size - Size in pixels
-- dot_spacing - Spacing in pixels
-- orientation - horizontal / vertical
dotted_line.new = function(dot_number, dot_size, dot_spacing, orientation)
    local line = wibox.widget {
        -- spacing = dot_spacing,
        layout = wibox.layout.fixed[orientation]
    }

    local dots = {}

    line:add(helpers.pad[orientation](dot_spacing / 2))
    for i=1,(dot_number - 1) do
        local dot = create_dot(dot_size)
        table.insert(dots, dot)
        line:add(dot, helpers.pad[orientation](dot_spacing))
    end
    local dot = create_dot(dot_size)
    table.insert(dots, dot)
    line:add(dot, helpers.pad[orientation](dot_spacing / 2))

    -- This will allow to directly set bg like so `line.color = some_color`
    function line:set_color(color)
        for index, dot in ipairs(dots) do
            dot.bg = color
        end
    end

    return line
end

return dotted_line
