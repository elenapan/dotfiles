local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local helpers = {}

-- Create rounded rectangle shape
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
        --gears.shape.octogon(cr, width, height, radius)
        --gears.shape.rounded_bar(cr, width, height)
    end
end

helpers.rbar = function()
  return function(cr, width, height)
    gears.shape.rounded_bar(cr, width, height)
  end
end

helpers.prrect = function(radius, tl, tr, br, bl)
  return function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
  end
end

-- Create info bubble shape
-- TODO
helpers.infobubble = function(radius)
  return function(cr, width, height)
    gears.shape.infobubble(cr, width, height, radius)
  end
end

-- Create rectangle shape
helpers.rect = function()
    return function(cr, width, height)
        gears.shape.rectangle(cr, width, height)
    end
end

function helpers.colorize_text(txt, fg)
    return "<span foreground='" .. fg .."'>" .. txt .. "</span>"
end

function helpers.client_menu_toggle()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end

function helpers.pad(size)
    local str = ""
    for i = 1, size do
        str = str .. " "
    end
    local pad = wibox.widget.textbox(str)
    return pad
end

function helpers.move_to_edge(c, direction)
    local workarea = awful.screen.focused().workarea
    local client_geometry = c:geometry()
    if direction == "up" then
        c:geometry({ nil, y = workarea.y + beautiful.screen_margin * 2, nil, nil })
    elseif direction == "down" then 
        c:geometry({ nil, y = workarea.height + workarea.y - client_geometry.height - beautiful.screen_margin * 2 - beautiful.border_width * 2, nil, nil })
    elseif direction == "left" then 
        c:geometry({ x = workarea.x + beautiful.screen_margin * 2, nil, nil, nil })
    elseif direction == "right" then 
        c:geometry({ x = workarea.width + workarea.x - client_geometry.width - beautiful.screen_margin * 2 - beautiful.border_width * 2, nil, nil, nil })
    end
end

function helpers.create_titlebar(c, titlebar_buttons, titlebar_position, titlebar_size)
    awful.titlebar(c, {font = beautiful.titlebar_font, position = titlebar_position, size = titlebar_size}) : setup {
        { 
            buttons = titlebar_buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { 
            buttons = titlebar_buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        {
            buttons = titlebar_buttons,
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end


local double_tap_timer = nil
function helpers.single_double_tap(single_tap_function, double_tap_function)
  if double_tap_timer then
    double_tap_timer:stop()
    double_tap_timer = nil
    double_tap_function()
    -- naughty.notify({text = "We got a double tap"})
    return
  end
  
  double_tap_timer =
    gears.timer.start_new(0.20, function()
                            double_tap_timer = nil
                            -- naughty.notify({text = "We got a single tap"})
                            single_tap_function()
                            return false
    end)
end

return helpers
