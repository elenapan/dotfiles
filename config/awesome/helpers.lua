-- Functions that you use more than once and in different files would
-- be nice to define here.

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local naughty = require("naughty")

local helpers = {}

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

helpers.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
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
            instance = awful.menu.clients({ theme = { width = dpi(250) } })
        end
    end
end

-- Escapes a string so that it can be displayed inside pango markup
-- tags. Modified from:
-- https://github.com/kernelsauce/turbo/blob/master/turbo/escape.lua
function helpers.pango_escape(s)
    return (string.gsub(s, "[&<>]", {
        ["&"] = "&amp;",
        ["<"] = "&lt;",
        [">"] = "&gt;"
    }))
end

function helpers.vertical_pad(height)
    return wibox.widget{
        forced_height = height,
        layout = wibox.layout.fixed.vertical
    }
end

function helpers.horizontal_pad(width)
    return wibox.widget{
        forced_width = width,
        layout = wibox.layout.fixed.horizontal
    }
end

-- Maximizes client and also respects gaps
function helpers.maximize(c)
    c.maximized = not c.maximized
    if c.maximized then
        awful.placement.maximize(c, { honor_padding = true, honor_workarea = true, margins = beautiful.useless_gap * 2 })
        
    end
    c:raise()
end

function helpers.move_to_edge(c, direction)
    -- local workarea = awful.screen.focused().workarea
    -- local client_geometry = c:geometry()
    if direction == "up" then
        local old_x = c:geometry().x
        awful.placement.top(c, {honor_padding = true, honor_workarea = true, honor_padding = true})
        c.x = old_x
        -- c:geometry({ nil, y = workarea.y + beautiful.screen_margin * 2, nil, nil })
    elseif direction == "down" then 
        local old_x = c:geometry().x
        awful.placement.bottom(c, {honor_padding = true, honor_workarea = true, honor_padding = true})
        c.x = old_x
        -- c:geometry({ nil, y = workarea.height + workarea.y - client_geometry.height - beautiful.screen_margin * 2 - beautiful.border_width * 2, nil, nil })
    elseif direction == "left" then 
        local old_y = c:geometry().y
        awful.placement.left(c, {honor_padding = true, honor_workarea = true, honor_padding = true})
        c.y = old_y
        -- c:geometry({ x = workarea.x + beautiful.screen_margin * 2, nil, nil, nil })
    elseif direction == "right" then 
        local old_y = c:geometry().y
        awful.placement.right(c, {honor_padding = true, honor_workarea = true, honor_padding = true})
        c.y = old_y
        -- c:geometry({ x = workarea.width + workarea.x - client_geometry.width - beautiful.screen_margin * 2 - beautiful.border_width * 2, nil, nil, nil })
    end
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
            if single_tap_function then
                single_tap_function()
            end
            return false
        end)
end


-- Used as a custom command in rofi to move a window into the current tag
-- instead of following it.
-- Rofi has access to the X window id of the client.
function helpers.rofi_move_client_here(window)
    local win = function (c)
        return awful.rules.match(c, {window = window})
    end

    for c in awful.client.iterate(win) do
        c.minimized = false
        c:move_to_tag(mouse.screen.selected_tag)
        client.focus = c
        c:raise()
    end
end

-- Add a hover cursor to a widget by changing the cursor on
-- mouse::enter and mouse::leave
-- You can find the names of the available cursors by opening any
-- cursor theme and looking in the "cursors folder"
-- For example: "hand1" is the cursor that appears when hovering over
-- links
function helpers.add_hover_cursor(w, hover_cursor)
    local original_cursor = "left_ptr"

    w:connect_signal("mouse::enter", function ()
        local w = _G.mouse.current_wibox
        if w then
            w.cursor = hover_cursor
        end
    end)

    w:connect_signal("mouse::leave", function ()
        local w = _G.mouse.current_wibox
        if w then
            w.cursor = original_cursor
        end
    end)
end

-- Tag back and forth:
-- If you try to focus the tag you are already at, go back to the previous tag.
-- Useful for quick switching after for example checking an incoming chat
-- message at tag 2 and coming back to your work at tag 1 with the same
-- keypress.
-- Also focuses urgent clients if they exist in the tag. This fixes the issue
-- (visual mismatch) where after switching to a tag which includes an urgent
-- client, the urgent client is unfocused but still covers all other windows
-- (even the currently focused window).
function helpers.tag_back_and_forth(tag_index)
    local s = mouse.screen
    local tag = s.tags[tag_index]
    if tag then
        if tag == s.selected_tag then
            awful.tag.history.restore()
        else
            tag:view_only()
        end

        local urgent_clients = function (c)
          return awful.rules.match(c, {urgent = true, first_tag = tag})
        end

        for c in awful.client.iterate(urgent_clients) do
            client.focus = c
            c:raise()
        end
    end
end


-- Resize DWIM (Do What I Mean)
-- Resize client or factor
-- Constants --
local floating_resize_amount = dpi(20)
local tiling_resize_factor= 0.05
---------------
function helpers.resize_dwim(c, direction)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating or (c and c.floating) then
        if direction == "up" then
            c:relative_move(  0,  0, 0, -floating_resize_amount)
        elseif direction == "down" then
            c:relative_move(  0,  0, 0,  floating_resize_amount)
        elseif direction == "left" then
            c:relative_move(  0,  0, -floating_resize_amount, 0)
        elseif direction == "right" then
            c:relative_move(  0,  0,  floating_resize_amount, 0)
        end
    else
        if direction == "up" then
            awful.client.incwfact(-tiling_resize_factor)
        elseif direction == "down" then
            awful.client.incwfact( tiling_resize_factor)
        elseif direction == "left" then
            awful.tag.incmwfact(-tiling_resize_factor)
        elseif direction == "right" then
            awful.tag.incmwfact( tiling_resize_factor)
        end
    end
end

-- Move client to screen edge, respecting the screen workarea
function helpers.move_to_edge(c, direction)
    local workarea = awful.screen.focused().workarea
    if direction == "up" then
        c:geometry({ nil, y = workarea.y + beautiful.useless_gap * 2, nil, nil })
    elseif direction == "down" then 
        c:geometry({ nil, y = workarea.height + workarea.y - c:geometry().height - beautiful.useless_gap * 2 - beautiful.border_width * 2, nil, nil })
    elseif direction == "left" then 
        c:geometry({ x = workarea.x + beautiful.useless_gap * 2, nil, nil, nil })
    elseif direction == "right" then 
        c:geometry({ x = workarea.width + workarea.x - c:geometry().width - beautiful.useless_gap * 2 - beautiful.border_width * 2, nil, nil, nil })
    end
end

-- Move client DWIM (Do What I Mean)
-- Move to edge if the client / layout is floating
-- Swap by index if maximized
-- Else swap client by direction
function helpers.move_client_dwim(c, direction)
    if c.floating or (awful.layout.get(mouse.screen) == awful.layout.suit.floating) then
        helpers.move_to_edge(c, direction)
    elseif awful.layout.get(mouse.screen) == awful.layout.suit.max then
        if direction == "up" or direction == "left" then
            awful.client.swap.byidx(-1, c)
        elseif direction == "down" or direction == "right" then
            awful.client.swap.byidx(1, c)
        end
    else
        awful.client.swap.bydirection(direction, c, nil)
    end
end

-- Make client floating and snap to the desired edge
function helpers.float_and_edge_snap(c, direction)
    -- if not c.floating then
    --     c.floating = true
    -- end
    naughty.notify({ text = "double tap"})
    c.floating = true
    local workarea = awful.screen.focused().workarea
    if direction == "up" then
        local axis = 'horizontally'
        local f = awful.placement.scale
            + awful.placement.top
            + (axis and awful.placement['maximize_'..axis] or nil)
        local geo = f(client.focus, {honor_padding = true, honor_workarea=true, to_percent = 0.5})
    elseif direction == "down" then 
        local axis = 'horizontally'
        local f = awful.placement.scale
            + awful.placement.bottom
            + (axis and awful.placement['maximize_'..axis] or nil)
        local geo = f(client.focus, {honor_padding = true, honor_workarea=true, to_percent = 0.5})
    elseif direction == "left" then 
        local axis = 'vertically'
        local f = awful.placement.scale
            + awful.placement.left
            + (axis and awful.placement['maximize_'..axis] or nil)
        local geo = f(client.focus, {honor_padding = true, honor_workarea=true, to_percent = 0.5})
    elseif direction == "right" then 
        local axis = 'vertically'
        local f = awful.placement.scale
            + awful.placement.right
            + (axis and awful.placement['maximize_'..axis] or nil)
        local geo = f(client.focus, {honor_padding = true, honor_workarea=true, to_percent = 0.5})
    end
end

-- Rounds a number to any number of decimals
function helpers.round(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end

function helpers.volume_control(step)
    local cmd
    if step == 0 then
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    else
        sign = step > 0 and "+" or ""
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ "..sign..tostring(step).."%"
    end
    awful.spawn.with_shell(cmd)
end

-- TODO: notification action buttons
-- https://github.com/awesomeWM/awesome/issues/3017
local capture_notif = nil
function helpers.screenshot(action, delay)
    local cmd
    local timestamp = os.date("%Y.%m.%d-%H.%M.%S")
    local filename = user.screenshot_dir..timestamp..".screenshot.png"
    -- local filename = user.screenshot_dir.."screenshot"..timestamp..".png"
    local maim_args = "-u -b 3 -m 5"
    local icon = icons.screenshot

    local prefix
    if delay then
        prefix = "sleep "..tostring(delay).." && "
    else
        prefix = ""
    end

    if action == "full" then
        cmd = prefix.."maim "..maim_args.." "..filename
        awful.spawn.easy_async_with_shell(cmd, function()
            naughty.notification({ title = "Screenshot", message = "Screenshot taken", icon = icon })
        end)
    elseif action == "selection" then
        cmd = "maim "..maim_args.." -s "..filename
        capture_notif = naughty.notification({ title = "Screenshot", message = "Select area to capture.", icon = icon, timeout = 1 })
        awful.spawn.easy_async_with_shell(cmd, function(_, __, ___, exit_code)
            if exit_code == 0 then
                capture_notif = notifications.notify_dwim({ title = "Screenshot", message = "Selection captured", icon = icon }, capture_notif)
            else
                naughty.destroy(capture_notif)
            end
        end)
    elseif action == "clipboard" then
        capture_notif = naughty.notification({ title = "Screenshot", message = "Select area to copy to clipboard", icon = icon })
        cmd = "maim "..maim_args.." -s /tmp/maim_clipboard && xclip -selection clipboard -t image/png /tmp/maim_clipboard &>/dev/null && rm /tmp/maim_clipboard"
        awful.spawn.easy_async_with_shell(cmd, function(_, __, ___, exit_code)
            if exit_code == 0 then
                capture_notif = notifications.notify_dwim({ title = "Screenshot", message = "Copied selection to clipboard", icon = icon }, capture_notif)
            else
                naughty.destroy(capture_notif)
            end
        end)
    elseif action == "browse" then
        awful.spawn.with_shell("cd "..user.screenshot_dir.." && feh $(ls -t)")
    elseif action == "gimp" then
        awful.spawn.with_shell("cd "..user.screenshot_dir.." && gimp $(ls -t | head -n1)")
        naughty.notification({ message = "Opening last screenshot with GIMP", icon = icon })
    end

end

function helpers.fake_escape()
    root.fake_input('key_press', "Escape")
    root.fake_input('key_release', "Escape")
end

local prompt_font = beautiful.prompt_font or "sans bold 8"
function helpers.prompt(action, textbox, prompt, callback)
    if action == "run" then
        awful.prompt.run {
            prompt       = prompt,
            -- prompt       = "<b>Run: </b>",
            textbox      = textbox,
            font = prompt_font,
            done_callback = callback,
            exe_callback = awful.spawn,
            completion_callback = awful.completion.shell,
            history_path = awful.util.get_cache_dir() .. "/history"
        }
    elseif action == "web_search" then
        awful.prompt.run {
            prompt       = prompt,
            -- prompt       = '<b>Web search: </b>',
            textbox      = textbox,
            font = prompt_font,
            history_path = awful.util.get_cache_dir() .. "/history_web",
            done_callback = callback,
            exe_callback = function(input)
                if not input or #input == 0 then return end
                awful.spawn(user.web_search_cmd.."\""..input.."\"")
                naughty.notify { title = "Searching the web for", text = input, icon = icons.firefox }
            end
        }
    end
end

function helpers.run_or_raise(match, move, spawn_cmd, spawn_args)
    local matcher = function (c)
        return awful.rules.match(c, match)
    end

    -- Find and raise
    local found = false
    for c in awful.client.iterate(matcher) do
        found = true
        c.minimized = false
        if move then
            c:move_to_tag(mouse.screen.selected_tag)
            client.focus = c
            c:raise()
        else
            c:jump_to()
        end
        break
    end

    -- Spawn if not found
    if not found then
        awful.spawn(spawn_cmd, spawn_args)
    end
end

function helpers.float_and_resize(c, width, height)
    c.width = width
    c.height = height
    awful.placement.centered(c,{honor_workarea=true, honor_padding = true})
    awful.client.property.set(c, 'floating_geometry', c:geometry())
    c.floating = true
    c:raise()
end

return helpers
