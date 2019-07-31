local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local helpers = require("helpers")

-- Appearance
-- Helper function that creates buttons given a text symbol, color, hover_color
-- and the command to run on click.
local function create_button(symbol, color, hover_color, cmd)
    local icon = wibox.widget {
        markup = helpers.colorize_text(symbol, color),
        align = "center",
        valign = "center",
        font = "icomoon 50",
        forced_width = dpi(180),
        forced_height = dpi(200),
        widget = wibox.widget.textbox
    }

    -- Press "animation"
    icon:connect_signal("button::press", function(_, _, __, button)
        if button == 3 then
            icon.markup = helpers.colorize_text(symbol, hover_color.."55")
        end
    end)
    icon:connect_signal("button::release", function ()
        icon.markup = helpers.colorize_text(symbol, hover_color)
    end)

    -- Hover "animation"
    icon:connect_signal("mouse::enter", function ()
        icon.markup = helpers.colorize_text(symbol, hover_color)
    end)
    icon:connect_signal("mouse::leave", function ()
        icon.markup = helpers.colorize_text(symbol, color)
    end)

    -- Change cursor on hover
    helpers.add_hover_cursor(icon, "hand1")

    -- Adds mousebinds if cmd is provided
    if cmd then
        icon:buttons(gears.table.join(
            awful.button({ }, 1, function ()
                cmd()
            end),
            awful.button({ }, 3, function ()
                cmd()
            end)
        ))
    end

    return icon
end

-- Commands
local browser_command = function ()
    awful.spawn(user.browser, {switchtotag = true})
end
local file_manager_command = function ()
    awful.spawn(user.file_manager)
end
local telegram_command = function ()
    helpers.run_or_raise({class = 'TelegramDesktop'}, false, "telegram")
end
local discord_command = function ()
    -- Run or raise Discord running on the browser, spawned with Chromium browser's app mode
    helpers.run_or_raise({instance = 'discordapp.com__channels_@me'}, false, "chromium-browser --app=\"https://discordapp.com/channels/@me\"")
    -- Run or raise Discord app
    -- helpers.run_or_raise({class = 'discord'}, false, "discord")
end
local mail_command = function ()
    helpers.run_or_raise({class = 'email'}, false, user.email_client, {switchtotag = true})
end
local gimp_command = function ()
    helpers.run_or_raise({class = 'Gimp'}, false, "gimp")
end
local steam_command = function ()
    helpers.run_or_raise({class = 'Steam'}, false, "steam")
end
local lutris_command = function ()
    helpers.run_or_raise({class = 'Lutris'}, false, "lutris", {switchtotag = true})
end
local youtube_command = function ()
    awful.spawn.with_shell("~/scr/Rofi/rofi_mpvtube")
end
local networks_command = function ()
    awful.spawn.with_shell("~/bin/networks-rofi")
end
local passwords_command = function ()
    helpers.run_or_raise({class = 'keepassxc'}, true, "keepassxc")
end

local performance_mode_command = function ()
    awful.spawn.with_shell("performance_mode")
end

local night_mode_command = function ()
    helpers.toggle_night_mode()
end

local record_command = function ()
    awful.spawn.with_shell("screenrec.sh")
end

-- I only use emacs for org mode :)
-- (Remacs is a rewrite of emacs in Rust)
local org_command = function ()
    helpers.run_or_raise({class = 'Remacs'}, false, "remacs")
end

-- Create app buttons
local browser = create_button("", beautiful.xcolor3, beautiful.xcolor11, browser_command)
local discord = create_button("", beautiful.xcolor5, beautiful.xcolor13, discord_command)
local telegram = create_button("", beautiful.xcolor4, beautiful.xcolor12, telegram_command)
local mail = create_button("", beautiful.xcolor6, beautiful.xcolor14, mail_command)
local files = create_button("", beautiful.xcolor3, beautiful.xcolor11, file_manager_command)
local gimp = create_button("", beautiful.xcolor5, beautiful.xcolor13, gimp_command)
local youtube = create_button("", beautiful.xcolor1, beautiful.xcolor9, youtube_command)
local networks = create_button("", beautiful.xcolor3, beautiful.xcolor11, networks_command)
local passwords = create_button("", beautiful.xcolor1, beautiful.xcolor9, passwords_command)
local night_mode = create_button("", beautiful.xcolor1, beautiful.xcolor9, night_mode_command)
local record = create_button("", beautiful.xcolor4, beautiful.xcolor12, record_command)
local lutris = create_button("", beautiful.xcolor6, beautiful.xcolor14, lutris_command)
local steam = create_button("", beautiful.xcolor2, beautiful.xcolor10, steam_command)
local org = create_button("", beautiful.xcolor2, beautiful.xcolor10, org_command)
local performance = create_button("", beautiful.xcolor5, beautiful.xcolor13, performance_mode_command)

local restart_awesome = create_button("", beautiful.xcolor4, beautiful.xcolor12)
restart_awesome:buttons(gears.table.join(
    awful.button({ }, 1, awesome.restart)
))

-- Create the widget
app_drawer = wibox({visible = false, ontop = true, type = "dock"})
awful.placement.maximize(app_drawer)

app_drawer.bg = "#00000000"
-- app_drawer.bg = beautiful.app_drawer_bg or beautiful.xbackground or "#111111"
app_drawer.fg = beautiful.app_drawer_fg or beautiful.xforeground or "#FEFEFE"

local app_drawer_grabber
function app_drawer_hide()
    awful.keygrabber.stop(app_drawer_grabber)
    app_drawer.visible = false
end

function app_drawer_show()
    -- naughty.notify({text = "starting the keygrabber"})
    app_drawer_grabber = awful.keygrabber.run(function(_, key, event)
        local invalid_key = false

        -- naughty.notify({ title = event, text = key })
        -- if event == "press" and key == "Alt_L" or key == "Alt_R" then
        --     naughty.notify({ title = "you pressed alt" })
        -- end
        -- if event == "release" and key == "Alt_L" or key == "Alt_R" then
        --     naughty.notify({ title = "you released alt" })
        -- end

        if event == "release" then return end

        if     key == 'w' then
            browser_command()
        elseif key == 'f' then
            file_manager_command()
        elseif key == 't' then
            telegram_command()
        elseif key == 'd' then
            discord_command()
        elseif key == 'm' then
            mail_command()
        elseif key == 'y' then
            youtube_command()
        elseif key == 'o' then
            org_command()
        elseif key == 'p' then
            passwords_command()
        elseif key == 'g' then
            gimp_command()
        elseif key == 'r' then
            record_command()
        elseif key == 'l' then
            lutris_command()
        elseif key == 's' then
            steam_command()
        elseif key == 'n' then
            networks_command()
        elseif key == 'x' then
            night_mode_command()
        elseif key == 'z' then
            performance_mode_command()
        else
            invalid_key = true
        end

        if not invalid_key or key == 'Escape' then
            app_drawer_hide()
        end
    end)

    app_drawer.visible = true
end

app_drawer:buttons(gears.table.join(
    -- Left click - Hide app_drawer
    awful.button({ }, 1, function ()
        app_drawer_hide()
    end),
    -- Middle click - Hide app_drawer
    awful.button({ }, 2, function ()
        app_drawer_hide()
    end)
))

local function create_stripe(widgets, bg)
    local buttons = wibox.widget {
        -- spacing = dpi(20),
        layout = wibox.layout.fixed.horizontal
    }

    for _, widget in ipairs(widgets) do
        buttons:add(widget)
    end

    local stripe = wibox.widget {
        {
            nil,
            {
                nil,
                buttons,
                expand = "none",
                layout = wibox.layout.align.horizontal
            },
            expand = "none",
            layout = wibox.layout.align.vertical
        },
        bg = bg,
        widget = wibox.container.background
    }

    return stripe
end

app_drawer:setup {
    -- Background
    {
        -- Stripes
        create_stripe({browser, youtube, discord, telegram}, "#00000000"),
        create_stripe({mail, org, files, passwords}, beautiful.xcolor8.."20"),
        create_stripe({gimp, record, lutris, steam}, beautiful.xcolor8.."40"),
        create_stripe({networks, night_mode, performance, restart_awesome}, beautiful.xcolor8.."60"),
        layout = wibox.layout.flex.vertical
    },
    bg = beautiful.xbackground,
    -- bg = beautiful.xbackground.."AA",
    -- bg = "#00000000",
    widget = wibox.container.background
}

