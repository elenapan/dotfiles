local awful = require("awful")
local beautiful = require("beautiful")
local helpers = require("helpers")
local gears = require("gears")

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
-- require("decorations.mpv")
-- require("decorations.mpd")

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

