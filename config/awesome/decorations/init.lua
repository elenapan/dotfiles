local awful = require("awful")
local beautiful = require("beautiful")
local helpers = require("helpers")
local gears = require("gears")
local wibox = require("wibox")

-- Disable popup tooltip on titlebar button hover
awful.titlebar.enable_tooltip = false

decorations = {}

-- >> Default decoration management functions
-- Can be overrided by the selected decoration theme when the titlebar
-- configuration is more complex
function decorations.hide(c)
    awful.titlebar.hide(c, beautiful.titlebar_position)
end

function decorations.show(c)
    awful.titlebar.show(c, beautiful.titlebar_position)
end

-- We use `cycle` instead of `toggle` since some decoration themes may provide
-- the ability to change between different types of titlebars (e.g. full,
-- minimal, none)
function decorations.cycle(c)
    awful.titlebar.toggle(c, beautiful.titlebar_position)
end

-- TODO (work in progress)
-- Custom decorations for specific clients
require("decorations.mpd")

-- Load theme
function decorations.init(theme_name)
    require("decorations.themes." .. theme_name)
end

-- Helper function to be used by decoration themes to enable client rounding
function decorations.enable_rounding()
    -- Apply rounded corners to clients if needed
    if beautiful.border_radius > 0 then
        client.connect_signal("manage", function (c, startup)
            if not c.fullscreen and not c.maximized then
                c.shape = helpers.rrect(beautiful.border_radius)
            end
        end)

        -- Fullscreen and maximized clients should not have rounded corners
        local function no_round_corners (c)
            if c.fullscreen or c.maximized then
                c.shape = gears.shape.rectangle
            else
                c.shape = helpers.rrect(beautiful.border_radius)
            end
        end

        client.connect_signal("property::fullscreen", no_round_corners)
        client.connect_signal("property::maximized", no_round_corners)

        beautiful.snap_shape = helpers.rrect(beautiful.border_radius * 2)
    else
        beautiful.snap_shape = gears.shape.rectangle
    end
end

local button_commands = {
    ['close'] = function(c) c:kill() end,
    ['maximize'] = function(c) c.maximized = not c.maximized; c:raise() end,
    ['minimize'] = function (c) c.minimized = true end,
    ['sticky'] = function (c) c.sticky = not c.sticky end,
    ['ontop'] = function (c) c.ontop = not c.ontop end,
    ['floating'] = function (c) c.floating = not c.floating end,
}

-- >> Helper functions for generating simple window buttons
-- Generates a button from using an AwesomeWM widget
decorations.button = function (c, shape, color, unfocused_color, hover_color, size, margin, cmd)
    local button = wibox.widget {
        forced_height = size,
        forced_width = size,
        -- Initialize with the "unfocused" color
        -- bg = "#00000000",
        bg = unfocused_color,
        -- border_color = unfocused_color,
        -- border_width = dpi(2),
        shape = shape,
        widget = wibox.container.background()
    }

    -- Instead of adding spacing between the buttons, we add margins
    -- around them. That way it is more forgiving to click them
    -- (especially if they are very small)
    local button_widget = wibox.widget {
        button,
        margins = margin,
        widget = wibox.container.margin(),
    }
    button_widget:buttons(gears.table.join(
            awful.button({ }, 1, function ()
                button_commands[cmd](c)
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
            button.bg = unfocused_color
            -- button.border_color = unfocused_color
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
    --         button.bg = unfocused_color
    --     end
    -- end)

    -- Focus / unfocus
    c:connect_signal("focus", function ()
        button.bg = color
        -- button.border_color = color
    end)
    c:connect_signal("unfocus", function ()
        button.bg = unfocused_color
        -- button.border_color = unfocused_color
    end)

    return button_widget
end



-- Generates a button from a text symbol
decorations.text_button = function (c, symbol, font, color, unfocused_color, hover_color, size, margin, cmd)
    local button = wibox.widget {
        align = "center",
        valign = "center",
        font = font,
        -- Initialize with the "unfocused" color
        markup = helpers.colorize_text(symbol, unfocused_color),
        -- Increase the width of the textbox in order to make it easier to click. It does not affect the size of the symbol itself.
        forced_width = size + margin * 2,
        widget = wibox.widget.textbox
    }

    -- local button_widget = wibox.widget {
    --     button,
    --     forced_height = size,
    --     forced_width = size + margin * 2,
    --     margins = margin,
    --     widget = wibox.container.background()
    -- }
    -- button_widget:buttons(gears.table.join(
    button:buttons(gears.table.join(
        awful.button({ }, 1, function ()
            button_commands[cmd](c)
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
            button.markup = helpers.colorize_text(symbol, unfocused_color)
        end
    end)

    -- Focus / unfocus
    c:connect_signal("focus", function ()
        button.markup = helpers.colorize_text(symbol, color)
    end)
    c:connect_signal("unfocus", function ()
        button.markup = helpers.colorize_text(symbol, unfocused_color)
    end)

    return button
end

