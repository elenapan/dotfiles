local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- todo remove
local naughty = require("naughty")

local helpers = require("helpers")
local titlebars = {}

-- TODO: Need to add toggled appearance for sticky, floating, ontop and
-- maximized buttons

-- Helper function that generates clickable buttons for windows
-- Useful for creating simple shaped buttons
local gen_button, gen_button_size, gen_button_margin
local gen_button_size = dpi(8)
local gen_button_margin = dpi(5)
local gen_button_color_unfocused = beautiful.xcolor8
gen_button = function (c, color, hover_color, cmd)
    local button = wibox.widget {
        forced_height = gen_button_size,
        forced_width = gen_button_size,
        -- Initialize with the "unfocused" color
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


-- Generates a client button created by a font glyph
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
-- =================
-- Save the original beautiful values because they will have to be modified later
local titlebar_bg = beautiful.titlebar_bg
local titlebar_bg_focus = beautiful.titlebar_bg_focus
local titlebar_bg_normal = beautiful.titlebar_bg_normal

local titlebar_container_shape
local wants_equal_padding
local anti_aliasing_padding = beautiful.border_radius * 2
if user.anti_aliasing then
    beautiful.titlebar_bg = "#00000000"
    if beautiful.titlebar_bg_focus and beautiful.titlebar_bg_normal then
        beautiful.titlebar_bg_focus = "#00000000"
        beautiful.titlebar_bg_normal = "#00000000"
    end

    -- Function that returns true or false depending on whether the
    -- anti-aliasing titlebars should be added on all sides of a client or not.
    -- Padding is added under the top titlebar, and also titlebars are added to
    -- the left and right of the client in order to have equal padding on
    -- all sides. However they are not necessary for the anti aliasing itself
    -- and can be enabled or disabled per client in this function.
    -- ------------------
    wants_equal_padding = function(c)
        local class = c.class
        if  class == "kitty" or
            class == "editor" or
            class == "Nemo" or
            class == "music" or
            class == "email" or
            class == "htop" or
            class == "sensors" or
            class == "battop" or
            class == "mpvtube" or
            class == "scratchpad" or
            class == "Remacs" then
            return true
        else
            return false
        end
    end

    -- Only adds 4 anti_aliased titlebars of the same size around the client
    wants_only_borders = function(c)
        local class = c.class
        if  class == "feh" or
            class == "mpv" then
            return true
        else
            return false
        end
    end

    -- titlebar_container_shape = function(radius, tl, tr, br, bl)
    -- Function that returns a rounded shape according to a titlebar position
    titlebar_container_shape = function(radius, position)
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
else
    titlebar_container_shape = function()
        return gears.shape.rectangle
    end
end

-- Mouse buttons
titlebars.buttons = gears.table.join(
    -- Left button - move
    awful.button({ }, 1, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    -- Middle button - close
    awful.button({ }, 2, function ()
        window_to_kill = mouse.object_under_pointer()
        window_to_kill:kill()
    end),
    -- Right button - resize
    awful.button({ }, 3, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
        -- awful.mouse.resize(c, nil, {jump_to_corner=true})
    end),
    -- Side button up - toggle floating
    awful.button({ }, 9, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        --awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
        c.floating = not c.floating
    end),
    -- Side button down - toggle ontop
    awful.button({ }, 8, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        c.ontop = not c.ontop
    end)
)

-- Disable popup tooltip on titlebar button hover
awful.titlebar.enable_tooltip = false

-- Buttons needed for custom MPD client titlebar
-- Disabled for now until I figure out a cleaner way to use them alongside
-- anti-aliasing
-- =============================================
-- local playerctl_button_size = dpi(38)
-- local playerctl_toggle_icon = wibox.widget.imagebox(icons.playerctl_toggle)
-- playerctl_toggle_icon.resize = true
-- playerctl_toggle_icon.forced_width = playerctl_button_size
-- playerctl_toggle_icon.forced_height = playerctl_button_size
-- playerctl_toggle_icon:buttons(gears.table.join(
--     awful.button({ }, 1, function ()
--         awful.spawn.with_shell("mpc -q toggle")
--     end),
--     awful.button({ }, 3, function ()
--         awful.spawn.with_shell("mpvc toggle")
--     end),
--     awful.button({ }, 8, function ()
--         sidebar.visible = false
--         awful.spawn.with_shell("~/scr/Rofi/rofi_mpvtube")
--     end),
--     awful.button({ }, 9, function ()
--         awful.spawn.with_shell("~/scr/info/mpv-query.sh")
--     end)
-- ))

-- local playerctl_prev_icon = wibox.widget.imagebox(icons.playerctl_prev)
-- playerctl_prev_icon.resize = true
-- playerctl_prev_icon.forced_width = playerctl_button_size
-- playerctl_prev_icon.forced_height = playerctl_button_size
-- playerctl_prev_icon:buttons(gears.table.join(
--     awful.button({ }, 1, function ()
--         awful.spawn.with_shell("mpc -q prev")
--     end),
--     awful.button({ }, 3, function ()
--         awful.spawn.with_shell("mpvc prev")
--     end)
-- ))

-- local playerctl_next_icon = wibox.widget.imagebox(icons.playerctl_next)
-- playerctl_next_icon.resize = true
-- playerctl_next_icon.forced_width = playerctl_button_size
-- playerctl_next_icon.forced_height = playerctl_button_size
-- playerctl_next_icon:buttons(gears.table.join(
--     awful.button({ }, 1, function ()
--         awful.spawn.with_shell("mpc -q next")
--     end),
--     awful.button({ }, 3, function ()
--         awful.spawn.with_shell("mpvc next")
--     end)
-- ))

-- Add a titlebar
client.connect_signal("request::titlebars", function(c)
    local buttons = titlebars.buttons

    local title_widget
    if beautiful.titlebar_title_enabled then
        title_widget = awful.titlebar.widget.titlewidget(c)
        title_widget.font = beautiful.titlebar_font
        title_widget:set_align(beautiful.titlebar_title_align)
    else
        title_widget = wibox.widget.textbox("")
    end

    -- Create 4 dummy titlebars around the window to imitate borders
    if beautiful.titlebars_imitate_borders then
        awful.titlebar(c, {position = "top", size = beautiful.titlebar_size})
        awful.titlebar(c, {position = "bottom", size = beautiful.titlebar_size})
        awful.titlebar(c, {position = "right", size = beautiful.titlebar_size})
        awful.titlebar(c, {position = "left", size = beautiful.titlebar_size})
    else -- Single titlebar

        -- =========================================
        -- =========================================
        -- === Custom titlebars disabled for now ===
        -- =========================================
        -- =========================================
        -- Custom titlebar for music terminal (usually ncmpcpp)
        -- if c.class == "music" or c.instance == "music" or c.name == "Music Terminal" then
        -- if c.class == "music" then
        --     -- title_widget = awful.titlebar.widget.titlewidget(c)
        --     -- title_widget:set_align("left")
        --     -- title_widget.font = "sans 9"

        --     -- Music titlebar items
        --     awful.titlebar(c, {font = beautiful.titlebar_font, position = "bottom", size = dpi(50), bg = beautiful.xcolor0}) : setup {
        --         nil,
        --         {
        --             nil,
        --             { -- Music player buttons
        --                 playerctl_prev_icon,
        --                 playerctl_toggle_icon,
        --                 playerctl_next_icon,
        --                 spacing = dpi(10),
        --                 layout = wibox.layout.fixed.horizontal
        --             },
        --             nil,
        --             expand = "none",
        --             layout = wibox.layout.align.vertical,
        --         },
        --         nil,
        --         buttons = buttons,
        --         expand = "none",
        --         layout = wibox.layout.align.horizontal}
        -- end

        local anti_aliasing_padding_color = beautiful.xbackground
        -- if c.class == "feh" then
        --     anti_aliasing_padding_color = beautiful.xforeground
        -- else
        --     anti_aliasing_padding_color = beautiful.xbackground
        -- end

        -- Save these here in order to avoid re-evaluating them multiple times
        local equal_padding = user.anti_aliasing and wants_equal_padding(c)
        local only_borders = user.anti_aliasing and wants_only_borders(c)

        -- Top titlebar
        local titlebar_container = wibox.widget {
            shape = titlebar_container_shape(beautiful.border_radius, "top"),
            bg = titlebar_bg,
            widget = wibox.container.background
        }

        awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = (user.anti_aliasing and equal_padding) and beautiful.titlebar_size + anti_aliasing_padding or (user.anti_aliasing and only_borders) and anti_aliasing_padding or beautiful.titlebar_size}) : setup {
            {
                {
                    nil,
                    {
                        buttons = buttons,
                        widget = title_widget
                    },
                    {
                        -- AwesomeWM native buttons (images loaded from theme)
                        -- awful.titlebar.widget.minimizebutton(c),
                        -- awful.titlebar.widget.maximizedbutton(c),
                        -- awful.titlebar.widget.closebutton(c),

                        -- Generated buttons
                        gen_button(c, beautiful.xcolor6, beautiful.xcolor14, window_minimize),
                        gen_button(c, beautiful.xcolor4, beautiful.xcolor12, window_maximize),
                        gen_text_button(c, "", beautiful.xcolor1, beautiful.xcolor9, window_close),

                        -- Dummy widget to create spacing at the edge
                        {
                            forced_width = gen_button_margin,
                            layout = wibox.layout.fixed.horizontal
                        },
                        layout = wibox.layout.fixed.horizontal
                    },
                    visible = not only_borders,
                    forced_height = beautiful.titlebar_size,
                    layout = wibox.layout.align.horizontal
                },
                -- Padding
                -- Only visible when equal padding is desired for the client
                {
                    visible = user.anti_aliasing and equal_padding or only_borders,
                    buttons = user.anti_aliasing and only_borders and buttons or nil,
                    -- bg = beautiful.xbackground,
                    bg = anti_aliasing_padding_color,
                    -- bg = only_borders and anti_aliasing_padding_color or beautiful.xbackground,
                    forced_height = anti_aliasing_padding,
                    widget = wibox.container.background
                },
                layout = wibox.layout.fixed.vertical
            },
            widget = titlebar_container
        }

        if user.anti_aliasing then
            local bottom_titlebar_container = wibox.widget {
                shape = titlebar_container_shape(beautiful.border_radius, "bottom"),
                bg = titlebar_bg,
                widget = wibox.container.background
            }

            -- Add padding left and right if needed
            if equal_padding or only_borders then
                awful.titlebar(c, {font = beautiful.titlebar_font, position = "right", size = anti_aliasing_padding, bg = "#00000000"}) : setup {
                    buttons = titlebars.buttons,
                    bg = anti_aliasing_padding_color,
                    widget = wibox.container.background()
                }
                awful.titlebar(c, {font = beautiful.titlebar_font, position = "left", size = anti_aliasing_padding, bg = "#00000000"}) : setup {
                    buttons = titlebars.buttons,
                    bg = anti_aliasing_padding_color,
                    widget = wibox.container.background()
                }
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
            awful.titlebar(c, {font = beautiful.titlebar_font, position = "bottom", size = anti_aliasing_padding}) : setup {
                widget = bottom_titlebar_container
            }
        end
    end
end)

-- Wrappers around awful.titlebar.hide and show
decorations = {}
if user.anti_aliasing then
    decorations.show = function(c)
        if wants_equal_padding(c) or wants_only_borders(c) then
            awful.titlebar.show(c, "left")
            awful.titlebar.show(c, "right")
        end
        awful.titlebar.show(c, "top")
        awful.titlebar.show(c, "bottom")
    end
    decorations.hide = function(c)
        if wants_equal_padding(c) or wants_only_borders(c) then
            awful.titlebar.hide(c, "left")
            awful.titlebar.hide(c, "right")
        end
        awful.titlebar.hide(c, "top")
        awful.titlebar.hide(c, "bottom")
    end
    decorations.toggle = function(c)
        if wants_equal_padding(c) or wants_only_borders(c) then
            awful.titlebar.toggle(c, "left")
            awful.titlebar.toggle(c, "right")
        end
        awful.titlebar.toggle(c, "top")
        awful.titlebar.toggle(c, "bottom")
    end
else
    decorations.show = function(c)
        awful.titlebar.show(c, beautiful.titlebar_position)
    end
    decorations.hide = function(c)
        awful.titlebar.hide(c, beautiful.titlebar_position)
    end
    decorations.toggle = function(c)
        awful.titlebar.toggle(c, beautiful.titlebar_position)
    end
end

return titlebars
