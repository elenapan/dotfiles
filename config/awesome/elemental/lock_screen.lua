-- Disclaimer:
-- This lock screen was not designed with security in mind. There is
-- no guarantee that it will protect you against someone that wants to
-- gain access to your computer.
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local helpers = require("helpers")

local password = user.lock_screen_password or ""

local lock_screen_symbol = ""
local lock_screen_fail_symbol = ""
local lock_animation_icon = wibox.widget {
    -- Set forced size to prevent flickering when the icon rotates
    forced_height = dpi(80),
    forced_width = dpi(80),
    font = "icomoon 40",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox(lock_screen_symbol)
}

-- A dummy textbox needed to get user input.
-- It will not be visible anywhere.
local some_textbox = wibox.widget.textbox()

-- This function adds blurry mask to a screen
local function screen_mask(s)
    local mask = wibox({visible = false, ontop = true, type = "splash", screen = s})
    awful.placement.maximize(mask)
    mask.bg = beautiful.lock_screen_bg or "#21252b"
    mask.fg = beautiful.lock_screen_fg or "#abb2bf"
    return mask
end

-- Create the lock screen wibox
-- Set the type to "splash" and set all "splash" windows to be blurred in your
-- compositor configuration file
lock_screen = wibox({visible = false, ontop = true, type = "splash", screen = screen.primary})
awful.placement.maximize(lock_screen)

lock_screen.bg = beautiful.lock_screen_bg or beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
lock_screen.fg = beautiful.lock_screen_fg or beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

-- Add lockscreen to each screen
for s in screen do
    if s == screen.primary then
        s.mylockscreen = lock_screen
    else
        s.mylockscreen = screen_mask(s)
    end
end

local function set_visibility(v)
    for s in screen do
        s.mylockscreen.visible = v
    end
end

-- Items
local day_of_the_week = wibox.widget {
    -- Fancy font
    font = "Scriptina Bold 80",
    -- font = "Space Craft 50",
    -- font = "Razed Galerie 70",
    -- font = "A-15-BIT 70",
    -- font = "Kill The Noise 90",
    -- Set forced width in order to keep it from getting cut off
    forced_width = dpi(1000),
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock("%A")
}

local function update_dotw()
    day_of_the_week.markup = helpers.colorize_text(day_of_the_week.text, x.color3)
end
update_dotw()
day_of_the_week:connect_signal("widget::redraw_needed", function ()
    update_dotw()
end)

local month = wibox.widget {
    font = "San Francisco Display Heavy 100",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock("%B %d")
}

local function update_month()
    month.markup = helpers.colorize_text(month.text:upper(), x.foreground.."25")
end

update_month()
month:connect_signal("widget::redraw_needed", function ()
    update_month()
end)


-- Month + Day of the week stacked on top of each other
local fancy_date = wibox.widget {
    month,
    day_of_the_week,
    -- Set forced width in order to keep it from getting cut off
    forced_width = dpi(1000),
    layout = wibox.layout.stack
}

local time = {
        {
            font = "sans bold 16",
            widget = wibox.widget.textclock("%H")
        },
        {
            font = "sans 16",
            widget = wibox.widget.textclock("%M")
        },
        spacing = dpi(2),
        layout = wibox.layout.fixed.horizontal
}

-- Lock animation
local lock_animation_widget_rotate = wibox.container.rotate()

local arc = function()
    return function(cr, width, height)
        gears.shape.arc(cr, width, height, dpi(5), 0, math.pi/2, true, true)
    end
end

local lock_animation_arc = wibox.widget {
    shape = arc(),
    bg = "#00000000",
    forced_width = dpi(100),
    forced_height = dpi(100),
    widget = wibox.container.background
}

local lock_animation_widget = {
    {
        lock_animation_arc,
        widget = lock_animation_widget_rotate
    },
    lock_animation_icon,
    layout = wibox.layout.stack
}

-- Lock helper functions
local characters_entered = 0
local function reset()
    characters_entered = 0;
    lock_animation_icon.markup = helpers.colorize_text(lock_screen_symbol, x.color7)
    lock_animation_widget_rotate.direction = "north"
    lock_animation_arc.bg = "#00000000"
end

local function fail()
    characters_entered = 0;
    lock_animation_icon.text = lock_screen_fail_symbol
    lock_animation_widget_rotate.direction = "north"
    lock_animation_arc.bg = "#00000000"
end

local animation_colors = {
    -- Rainbow sequence =)
    x.color1,
    x.color5,
    x.color4,
    x.color6,
    x.color2,
    x.color3,
}

local animation_directions = {"north", "west", "south", "east"}

-- Function that "animates" every key press
local function key_animation(char_inserted)
    local color
    local direction = animation_directions[(characters_entered % 4) + 1]
    if char_inserted then
        color = animation_colors[(characters_entered % 6) + 1]
        lock_animation_icon.text = lock_screen_symbol
    else
        if characters_entered == 0 then
            reset()
        else
            color = x.color7 .. "55"
        end
    end

    lock_animation_arc.bg = color
    lock_animation_widget_rotate.direction = direction
end

-- Get input from user
local function grab_password()
    awful.prompt.run {
        hooks = {
            -- Custom escape behaviour: Do not cancel input with Escape
            -- Instead, this will just clear any input received so far.
            {{ }, 'Escape',
                function(_)
                    reset()
                    grab_password()
                end
            }
        },
        keypressed_callback  = function(mod, key, cmd)
            -- Only count single character keys (thus preventing
            -- "Shift", "Escape", etc from triggering the animation)
            if #key == 1 then
                characters_entered = characters_entered + 1
                key_animation(true)
            elseif key == "BackSpace" then
                if characters_entered > 0 then
                    characters_entered = characters_entered - 1
                end
                key_animation(false)
            end

            -- Debug
            -- naughty.notify { title = 'You pressed:', text = key }
        end,
        exe_callback = function(input)
            -- Check input
            if input == password then
                -- YAY
                reset()
                set_visibility(false)
            else
                -- NAY
                fail()
                grab_password()
            end
        end,
        textbox = some_textbox,
    }
end

function lock_screen_show()
    set_visibility(true) 
    grab_password()
end

-- Item placement
lock_screen:setup {
    -- Horizontal centering
    nil,
    {
        -- Vertical centering
        nil,
        {
            {
                {
                    {
                        month,
                        day_of_the_week,
                        layout = wibox.layout.stack
                    },
                    {
                        nil,
                        {
                            -- Small circle
                            {
                                forced_height = dpi(5),
                                forced_width = dpi(5),
                                shape = gears.shape.circle,
                                bg = x.color3,
                                widget = wibox.container.background
                            },
                            time,
                            -- Small circle
                            {
                                forced_height = dpi(5),
                                forced_width = dpi(5),
                                shape = gears.shape.circle,
                                bg = x.color3,
                                widget = wibox.container.background
                            },
                            spacing = dpi(4),
                            layout = wibox.layout.fixed.horizontal
                        },
                        expand = "none",
                        layout = wibox.layout.align.horizontal
                    },
                    spacing = dpi(20),
                    -- spacing = dpi(10),
                    layout = wibox.layout.fixed.vertical
                },
                lock_animation_widget,
                spacing = dpi(40),
                layout = wibox.layout.fixed.vertical

            },
            bottom = dpi(60),
            widget = wibox.container.margin
        },
        expand = "none",
        layout = wibox.layout.align.vertical
    },
    expand = "none",
    layout = wibox.layout.align.horizontal
}
