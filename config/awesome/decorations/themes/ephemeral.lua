local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local keys = require("keys")
local helpers = require("helpers")

-- >> Anti-aliasing <<
-- ------------------
-- Requires a compositor to be running.
-- ------------------
-- The top titlebar corners are antialiased and a small titlebar is also
-- added at the bottom in order to round the bottom corners.
-- ------------------
-- This setting only affects clients, but you can "manually" apply
-- anti-aliasing to other wiboxes. Check out the notification
-- widget_template in ~/.config/awesome/notifications/themes/ephemeral.lua for
-- an example.
-- ------------------

-- TODO Need to add toggled appearance to sticky, floating, ontop, maximized
-- Helper function that generates clickable buttons for windows
-- Useful for creating simple shaped buttons
local gen_button, gen_button_size, gen_button_margin
local gen_button_size = dpi(8)
local gen_button_margin = dpi(8)
local gen_button_color_unfocused = x.color8
gen_button = function (c, color, hover_color, cmd)
    local button = wibox.widget {
        forced_height = gen_button_size,
        forced_width = gen_button_size,
        -- Initialize with the "unfocused" color
        -- bg = "#00000000",
        bg = gen_button_color_unfocused,
        -- border_color = gen_button_color_unfocused,
        -- border_width = dpi(2),
        shape = gears.shape.circle,
        widget = wibox.container.background()
    }

    -- Instead of adding spacing between the buttons, we add margins
    -- around them. That way it is more forgiving to click them
    -- (especially if they are very small)
    local button_widget = wibox.widget {
        button,
        margins = gen_button_margin,
        widget = wibox.container.margin(),
    }
    button_widget:buttons(gears.table.join(
            awful.button({ }, 1, function ()
                cmd(c)
            end)
        ))

    -- Hover "animation"
    button_widget:connect_signal("mouse::enter", function () 
        button.bg = hover_color
        -- button.border_color = hover_color
    end)
    button_widget:connect_signal("mouse::leave", function () 
        if c == client.focus then
            button.bg = color
            -- button.border_color = color
        else
            button.bg = gen_button_color_unfocused
            -- button.border_color = gen_button_color_unfocused
        end
    end)

    -- Press "animation"
    -- button_widget:connect_signal("button::press", function ()
    --     button.bg = color .. "55"
    -- end)
    -- button_widget:connect_signal("button::release", function ()
    --     if c == client.focus then
    --         button.bg = hover_color
    --     else
    --         button.bg = gen_button_color_unfocused
    --     end
    -- end)

    -- Focus / unfocus
    c:connect_signal("focus", function ()
        button.bg = color
        -- button.border_color = color
    end)
    c:connect_signal("unfocus", function ()
        button.bg = gen_button_color_unfocused
        -- button.border_color = gen_button_color_unfocused
    end)

    return button_widget
end


gen_text_button = function (c, symbol, color, hover_color, cmd)
    local button = wibox.widget {
        align = "center",
        valign = "center",
        font = "Material Icons 9",
        -- Initialize with the "unfocused" color
        markup = helpers.colorize_text(symbol, gen_button_color_unfocused),
        -- Increase the width of the textbox in order to make it easier to click. It does not affect the size of the symbol itself.
        forced_width = gen_button_size + gen_button_margin * 2,
        widget = wibox.widget.textbox
    }

    -- local button_widget = wibox.widget {
    --     button,
    --     forced_height = gen_button_size,
    --     forced_width = gen_button_size + gen_button_margin * 2,
    --     margins = gen_button_margin,
    --     widget = wibox.container.background()
    -- }
    -- button_widget:buttons(gears.table.join(
    button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            cmd(c)
        end)
    ))

    -- Hover "animation"
    button:connect_signal("mouse::enter", function () 
        button.markup = helpers.colorize_text(symbol, hover_color)
    end)
    button:connect_signal("mouse::leave", function () 
        if c == client.focus then
            button.markup = helpers.colorize_text(symbol, color)
        else
            button.markup = helpers.colorize_text(symbol, gen_button_color_unfocused)
        end
    end)

    -- Focus / unfocus
    c:connect_signal("focus", function ()
        button.markup = helpers.colorize_text(symbol, color)
    end)
    c:connect_signal("unfocus", function ()
        button.markup = helpers.colorize_text(symbol, gen_button_color_unfocused)
    end)

    return button
end

-- Functions for the generated buttons
local window_close
window_close = function (c)
    c:kill()
end
local window_maximize = function (c)
    c.maximized = not c.maximized
    c:raise()
end
local window_minimize = function (c)
    c.minimized = true
end
local window_sticky = function (c)
    c.sticky = not c.sticky
end
local window_ontop = function (c)
    c.ontop = not c.ontop
end
local window_floating = function (c)
    c.floating = not c.floating
end

-- For anti aliasing
-- Save the original beautiful values
local titlebar_bg = beautiful.titlebar_bg
local titlebar_bg_focus = beautiful.titlebar_bg_focus
local titlebar_bg_normal = beautiful.titlebar_bg_normal
-- Modify beautiful values to create an anti-aliased appearance.
beautiful.titlebar_bg = "#00000000"
if beautiful.titlebar_bg_focus and beautiful.titlebar_bg_normal then
    beautiful.titlebar_bg_focus = "#00000000"
    beautiful.titlebar_bg_normal = "#00000000"
end

local anti_aliasing_padding_size = beautiful.border_radius * 2
local anti_aliasing_padding_color = x.background

local anti_aliasing_padding_titlebar = function(c, position)
    awful.titlebar(c, {font = beautiful.titlebar_font, position = position, size = anti_aliasing_padding_size, bg = "#00000000"}) : setup {
        buttons = keys.titlebar_buttons,
        bg = anti_aliasing_padding_color,
        widget = wibox.container.background()
    }
end

-- Function that returns true or false depending on whether the
-- anti-aliasing titlebars should be added on all sides of a client or not.
-- Padding is added under the top titlebar, and also titlebars are added to
-- the left and right of the client in order to have equal padding on
-- all sides. However they are not necessary for the anti aliasing itself
-- and can be enabled or disabled per client in this function.
-- ------------------
local wants_equal_padding = function(c)
    local class = c.class
    if  class == "URxvt" or
        class == "kitty" or
        class == "Alacritty" or
        c.role == "GtkFileChooserDialog" or
        class == "editor" or
        class == "Nemo" or
        class == "music" or
        class == "email" or
        class == "htop" or
        class == "sensors" or
        class == "battop" or
        class == "mpvtube" or
        class == "scratchpad" or
        class == "Emacs" then
        return true
    else
        return false
    end
end

-- titlebar_container_shape = function(radius, tl, tr, br, bl)
-- Function that returns a rounded shape according to a titlebar position
local titlebar_container_shape = function(radius, position)
    if position == "bottom" then
        return function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, radius)
        end
    elseif position == "left" then
        return function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, false, false, true, radius)
        end
    elseif position == "right" then
        return function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, radius)
        end
    else
        return function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, radius)
        end
    end
end

-- Add a titlebar
client.connect_signal("request::titlebars", function(c)
    local title_widget
    if beautiful.titlebar_title_enabled then
        title_widget = awful.titlebar.widget.titlewidget(c)
        title_widget.font = beautiful.titlebar_font
        title_widget:set_align(beautiful.titlebar_title_align)
    else
        title_widget = wibox.widget.textbox("")
    end

    -- Save these here in order to avoid re-evaluating them multiple times
    local equal_padding = wants_equal_padding(c)

    -- Top titlebar
    local titlebar_container = wibox.widget {
        shape = titlebar_container_shape(beautiful.border_radius, "top"),
        bg = titlebar_bg,
        widget = wibox.container.background
    }

    awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = equal_padding and beautiful.titlebar_size + anti_aliasing_padding_size or beautiful.titlebar_size}) : setup {
        {
            {
                nil,
                {
                    buttons = keys.titlebar_buttons,
                    widget = title_widget
                },
                {
                    -- AwesomeWM native buttons (images loaded from theme)
                    -- awful.titlebar.widget.minimizebutton(c),
                    -- awful.titlebar.widget.maximizedbutton(c),
                    -- awful.titlebar.widget.closebutton(c),

                    -- Generated buttons
                    gen_button(c, x.color3, x.color11, window_minimize),
                    gen_button(c, x.color2, x.color10, window_maximize),
                    -- gen_button(c, x.color1, x.color9, window_close),
                    gen_text_button(c, "", x.color1, x.color9, window_close),

                    -- Create equal spacing at the edge
                    helpers.horizontal_pad(gen_button_margin / 2),

                    layout = wibox.layout.fixed.horizontal
                },
                forced_height = beautiful.titlebar_size,
                layout = wibox.layout.align.horizontal
            },
            -- Padding
            -- Only visible when equal padding is desired for the client
            {
                visible = equal_padding,
                buttons = keys.titlebar_buttons,
                bg = anti_aliasing_padding_color,
                forced_height = anti_aliasing_padding_size,
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.vertical
        },
        widget = titlebar_container
    }

    local bottom_titlebar_container = wibox.widget {
        buttons = keys.titlebar_buttons,
        shape = titlebar_container_shape(beautiful.border_radius, "bottom"),
        bg = titlebar_bg,
        widget = wibox.container.background
    }

    -- Add padding left and right if needed
    if equal_padding then
        anti_aliasing_padding_titlebar(c, "right")
        anti_aliasing_padding_titlebar(c, "left")
        -- Change the color of the bottom titlebar
        bottom_titlebar_container.bg = anti_aliasing_padding_color
    else
        -- Change the titlebar color depending on focus
        if beautiful.titlebar_bg_focus and beautiful.titlebar_bg_normal then
            c:connect_signal("focus", function ()
                titlebar_container.bg = titlebar_bg_focus
                bottom_titlebar_container.bg = titlebar_bg_focus
            end)
            c:connect_signal("unfocus", function ()
                titlebar_container.bg = titlebar_bg_normal
                bottom_titlebar_container.bg = titlebar_bg_normal
            end)
        end
    end

    -- Create an anti-aliased bottom titlebar in order to round the bottom corners
    awful.titlebar(c, {font = beautiful.titlebar_font, position = "bottom", size = anti_aliasing_padding_size}) : setup {
        widget = bottom_titlebar_container
    }
end)

decorations.show = function(c)
    if wants_equal_padding(c) then
        awful.titlebar.show(c, "left")
        awful.titlebar.show(c, "right")
    end
    awful.titlebar.show(c, "top")
    awful.titlebar.show(c, "bottom")
end
decorations.hide = function(c)
    if wants_equal_padding(c) then
        awful.titlebar.hide(c, "left")
        awful.titlebar.hide(c, "right")
    end
    awful.titlebar.hide(c, "top")
    awful.titlebar.hide(c, "bottom")
end
decorations.cycle = function(c)
    if wants_equal_padding(c) then
        awful.titlebar.toggle(c, "left")
        awful.titlebar.toggle(c, "right")
    end
    awful.titlebar.toggle(c, "top")
    awful.titlebar.toggle(c, "bottom")
end
