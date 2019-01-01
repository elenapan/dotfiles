local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local helpers = require("helpers")
local titlebars = {}
local pad = helpers.pad

-- Mouse buttons
titlebars.buttons = gears.table.join(
    -- Left button - move
    -- (Double tap - Toggle maximize) -- A little BUGGY
    awful.button({ }, 1, function()
        local c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        -- awful.mouse.client.move(c)
        local function single_tap()
          awful.mouse.client.move(c)
        end
        local function double_tap()
          gears.timer.delayed_call(function()
              c.maximized = not c.maximized
          end)
        end
        helpers.single_double_tap(single_tap, double_tap)
        -- helpers.single_double_tap(nil, double_tap)
    end),
    -- Middle button - close
    awful.button({ }, 2, function ()
        window_to_kill = mouse.object_under_pointer()
        window_to_kill:kill()
    end),
    -- Right button - resize
    awful.button({ }, 3, function()
        c = mouse.object_under_pointer()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end),
    -- Side button up - toggle floating
    awful.button({ }, 9, function()
        c = mouse.object_under_pointer()
        --client.focus = c
        --awful.placement.centered(c,{honor_workarea=true})
        c.floating = not c.floating
        c:raise()
    end),
    -- Side button down - toggle ontop
    awful.button({ }, 8, function()
        local c = mouse.object_under_pointer()
        c.ontop = not c.ontop
    end)
)

-- Disable popup tooltip on titlebar button hover
awful.titlebar.enable_tooltip = false

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

    local titlebar_item_layout
    local titlebar_layout
    if beautiful.titlebar_position == "left" or beautiful.titlebar_position == "right" then
        titlebar_item_layout = wibox.layout.fixed.vertical
        titlebar_layout = wibox.layout.align.vertical
    else
        titlebar_item_layout = wibox.layout.fixed.horizontal
        titlebar_layout = wibox.layout.align.horizontal
    end
        
    -- Create 4 dummy titlebars around the window to imitate borders
    if beautiful.titlebars_imitate_borders then
        helpers.create_titlebar(c, buttons, "top", beautiful.titlebar_size)
        helpers.create_titlebar(c, buttons, "bottom", beautiful.titlebar_size)
        helpers.create_titlebar(c, buttons, "left", beautiful.titlebar_size)
        helpers.create_titlebar(c, buttons, "right", beautiful.titlebar_size)
    else -- Normal, single titlebar
        awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = beautiful.titlebar_size}) : setup {
            -- Titlebar items
            { -- Left
                -- In the presence of buttons, use padding to center the title if needed.
                --pad(10),
                -- Clickable buttons
                --awful.titlebar.widget.closebutton    (c),
                --awful.titlebar.widget.maximizedbutton(c),
                --awful.titlebar.widget.minimizebutton   (c),
                -- awful.titlebar.widget.ontopbutton    (c),
                -- awful.titlebar.widget.stickybutton   (c),
                -- awful.titlebar.widget.floatingbutton (c),
                buttons = buttons,
                --awful.titlebar.widget.iconwidget(c),

                layout  = titlebar_item_layout
            },
            { -- Middle
                --{ -- Title
                    --align  = beautiful.titlebar_title_align,
                    --widget = title_widget
                --},
                title_widget,
                buttons = buttons,
                layout  = wibox.layout.flex.horizontal
            },
            { -- Right
                -- Clickable buttons
                --awful.titlebar.widget.floatingbutton (c),
                --awful.titlebar.widget.stickybutton   (c),
                --awful.titlebar.widget.ontopbutton    (c),
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.closebutton    (c),
                --buttons = buttons,
                -- In the presence of buttons, use padding to center the title if needed.
                --pad(10),
                layout = titlebar_item_layout
                --layout = wibox.layout.fixed.horizontal()
            },
            layout = titlebar_layout
            --layout = wibox.layout.align.horizontal
        }
    end
end)

return titlebars
