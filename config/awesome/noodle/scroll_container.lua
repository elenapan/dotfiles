local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local naughty = require("naughty")

local scroll_container = {}

scroll_container.new = function(orientation, max_visible_children, loop)
    local container = wibox.widget {
        layout = wibox.layout.fixed[orientation]
    }

    local scroll_start_index = 1

    -- BUG(?): For some reason the layout_changed signal is fired twice when
    -- container children change. During the first event, container.children is
    -- always empty so we do not really mind since the loop terminate instantly.
    container:connect_signal("widget::layout_changed", function()
        scroll_start_index = 1
        for i, task in ipairs(container.children) do
            if i > max_visible_children then
                container.children[i].visible = false
            end
        end
    end)


    local function update_scroll(scroll_start_index)
        for i=1,(scroll_start_index - 1) do
            container.children[i].visible = false
        end

        for i=scroll_start_index,(scroll_start_index + max_visible_children - 1) do
            container.children[i].visible = true
        end

        for i=(scroll_start_index + max_visible_children), #(container.children) do
            container.children[i].visible = false
        end
    end

    -- Number can be both positive (scroll forwards) or negative (scroll
    -- backwards).
    if loop then
        function container:scroll(number)
            scroll_start_index = (scroll_start_index + number - 1) % (#(container.children) - max_visible_children + 1) + 1
            update_scroll(scroll_start_index)
        end
    else
        function container:scroll(number)
            scroll_start_index = scroll_start_index + number
            if scroll_start_index < 1 then
                scroll_start_index = 1
            elseif scroll_start_index > (#(container.children) - max_visible_children + 1) then
                scroll_start_index = #(container.children) - max_visible_children + 1
            end
            update_scroll(scroll_start_index)
        end
    end

    return container
end

return scroll_container
