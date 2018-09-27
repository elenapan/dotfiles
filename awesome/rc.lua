--                         ████                      
--                        ▒▒███                      
--   ████████   ██████     ▒███  █████ ████  ██████  
--  ▒▒███▒▒███ ███▒▒███    ▒███ ▒▒███ ▒███  ▒▒▒▒▒███ 
--   ▒███ ▒▒▒ ▒███ ▒▒▒     ▒███  ▒███ ▒███   ███████ 
--   ▒███     ▒███  ███    ▒███  ▒███ ▒███  ███▒▒███ 
--   █████    ▒▒██████  ██ █████ ▒▒████████▒▒████████
--  ▒▒▒▒▒      ▒▒▒▒▒▒  ▒▒ ▒▒▒▒▒   ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒ 
--                                                   
--------------------------------------------------------------------------------

local theme_collection = {
    "manta",        -- 1 -- 
  --"whatever",     -- 2 -- 
  -- Add more themes here
}

-- Change this number to use a different theme
local theme_name = theme_collection[1]

--------------------------------------------------------------------------------

-- Jit
--pcall(function() jit.on() end)

-- Theme handling library
local beautiful = require("beautiful")
-- Themes define colours, icons, font and wallpapers.
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
beautiful.init( theme_dir .. theme_name .. "/theme.lua" )
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Default notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Initialize stuff
local helpers = require("helpers")
local bars = require("bars")
local keys = require("keys")
local titlebars = require("titlebars")
-- }}}

-- {{{ Third party stuff
--local volumebar_widget = require("third_party.awesome-wm-widgets.volumebar-widget.volumebar")
--local mpdarc_widget = require("third_party.awesome-wm-widgets.mpdarc-widget.mpdarc")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
terminal = "termite"
floating_terminal = "termite --class Diptera"
tmux = terminal .. " -e tmux new "
floating_tmux = terminal .. " --class Diptera -e tmux new "
editor = "vim"
--editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor .. " "

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- I only ever use these
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Notifications
-- TODO: some options are not respected when the notification is created
-- through lib-notify. Naughty works as expected.

-- Icon size
naughty.config.defaults['icon_size'] = beautiful.notification_icon_size

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 2
naughty.config.presets.critical.timeout = 12

-- Apply theme variables
naughty.config.padding = beautiful.notification_padding
naughty.config.spacing = beautiful.notification_spacing
naughty.config.defaults.margin = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width

naughty.config.presets.normal = {
    font         = beautiful.font,
    fg           = beautiful.notification_fg,
    bg           = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    position     = beautiful.notification_position 
}

naughty.config.presets.low = {
    font         = beautiful.font,
    fg           = beautiful.notification_fg,
    bg           = beautiful.notification_bg,
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    position     = beautiful.notification_position 
}

naughty.config.presets.ok = naughty.config.presets.low
naughty.config.presets.info = naughty.config.presets.low
naughty.config.presets.warn = naughty.config.presets.normal

naughty.config.presets.critical = {
    font         = beautiful.font,
    fg           = beautiful.notification_crit_fg, 
    bg           = beautiful.notification_crit_bg, 
    border_width = beautiful.notification_border_width,
    margin       = beautiful.notification_margin,
    position     = beautiful.notification_position 
}

-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e \"man awesome\"" },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}
mymusicmenu = {
       { "mpd toggle", function() awful.spawn.with_shell("mpc toggle") end},
       { "mpd next", function() awful.spawn.with_shell("mpc next") end},
       { "mpd previous", function() awful.spawn.with_shell("mpc prev") end},
       { "ncmpcpp", function() awful.spawn.with_shell(terminal .. " -e ncmpcpp") end},
       { "--------------", nil},
       { "mpv toggle", function() awful.spawn.with_shell("mpvc toggle") end},
       { "mpv next", function() awful.spawn.with_shell("mpvc next") end},
       { "mpv previous", function() awful.spawn.with_shell("mpvc prev") end},
       { "mpvtube", function() awful.spawn.with_shell("~/scr/Rofi/rofi_mpvtube") end}
}



-- Need to allow these commands to be run without password
-- Or if you are using systemd: systemctl [suspend|hibernate]
mypowermenu = {
   { "reboot", "reboot" },
   { "suspend", "sudo pm-suspend" }, 
   { "hibernate", "sudo pm-hibernate" },
   { "poweroff", "poweroff" }
}

--mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    --{ "music", mymusicmenu, beautiful.awesome_icon },
                                    --{ "power", mypowermenu, beautiful.awesome_icon },
mymainmenu = awful.menu({ items = { 
                                    { "awesome", myawesomemenu },
                                    { "music", mymusicmenu },
                                    { "firefox", "firefox" },
                                    { "files", "nemo" },
                                    { "discord", "discord" },
                                    { "gimp", "gimp" },
                                    { "appearance", "lxappearance" },
                                    { "volume", "pavucontrol" },
                                    { "games", "lutris" },
                                    { "steam", "steam" },
                                    { "terminal", terminal },
                                    { "power", mypowermenu }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        -- Method 1: Built in function
        --gears.wallpaper.maximized(wallpaper, s, true)

        -- Method 2: Set theme's wallpaper with feh
        --awful.spawn.with_shell("feh --bg-fill " .. wallpaper)

        -- Method 3: Set last wallpaper with feh
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tag Names
local tagnames = beautiful.tagnames or { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Layouts
    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Alias to save time :)
    local layouts = { l.max, l.floating, l.max, l.tile , l.tile,
        l.max, l.floating, l.max, l.floating, l.floating}
    awful.tag(tagnames, s, layouts)
end)

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     size_hints_honor = false,
                     honor_workarea = true,
                     honor_padding = true,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Galculator",
          "feh",
          "Gpick",
          "Diptera",  -- Floating Termite
        },

        name = {
          "Event Tester",  -- xev
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, ontop = false }},

    -- Add titlebars to normal clients and dialogs
    -- Not needed anymore --
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }--,
      --callback = function (c)
      --end
    },

    -- Centered clients
    { rule_any = {
        type = {
          "dialog",
          },
        class = {
          "feh",
          },
        name = {
          "Save As",
        },
        role = {
          "GtkFileChooserDialog", 
        }
      }, properties = {},
      callback = function (c)
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- Titlebars OFF (explicitly)
    -- Titlebars of these clients will be hidden regardless of the theme setting
    { rule_any = {
        class = {
          "qutebrowser",
          "feh",
          "Gimp",
          "Sublime_text",
          --"discord",
          --"TelegramDesktop",
          "Firefox",
          "Chromium-browser",
          "Rofi",
          },
      }, properties = {},
      callback = function (c)
        if not beautiful.titlebars_imitate_borders then
            awful.titlebar.hide(c, beautiful.titlebar_position)
        end
      end
    },


    -- Titlebars ON (explicitly)
    -- Titlebars of these clients will be shown regardless of the theme setting
    { rule_any = {
        class = {
          --"feh",
          --"qutebrowser",
          --"Firefox",
          --"Rofi"
          },
      }, properties = {},
      callback = function (c)
        awful.titlebar.show(c, beautiful.titlebar_position)
      end
    },

      -- Skip taskbar
    { rule_any = {
        class = {
          --"feh",
          },

      }, properties = {},
      callback = function (c)
        c.skip_taskbar = true
      end
    },

    -- Fixed terminal geometry
    { rule_any = {
        class = {
          "Termite",
          "Diptera",
          "mpvtube",
          "kitty",
          "st-256color",
          "st",
          "URxvt",
          "XTerm",
          },
      }, properties = { width = 640, height = 400 }
    },

    -- File managers
    { rule_any = {
        class = {
          "Nemo",
          "Thunar"
          },
      }, properties = { floating = true, width = 580, height = 440 }
    },

    -- Rofi configuration
    -- Needed only if option "-normal-window" is used
    { rule_any = {
        class = {
          "Rofi",
          },
      }, properties = { floating = true, ontop = true, sticky = true },
      callback = function (c)
        c.skip_taskbar = true
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- Screenruler
    { rule_any = {
        class = {
          "Screenruler",
          },
      }, properties = { floating = true, ontop = true },
      callback = function (c)
        c.border_width = 0
        awful.titlebar.hide(c, beautiful.titlebar_position)
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- On screen keyboard
    --{ rule_any = {
        --class = {
          --"Onboard",
          --},
      --}, properties = { floating = true, ontop = false, sticky = false, focusable = false },
      --callback = function (c)
        ----c.skip_taskbar = true
        ----awful.placement.centered(c,{honor_workarea=true})
      --end
    --},

    -- Scratchpad and calendar (calcurse)
    { rule_any = {
        class = {
          "scratchpad",
          "calendar",
          },
      }, properties = { tag = awful.screen.focused().tags[10], floating = true, ontop = false, sticky = true },
      callback = function (c)
        c.skip_taskbar = true
        c.minimized = true
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    ---------------------------------------------
    -- Start application on specific workspace --
    ---------------------------------------------
    -- Example:
    -- Set Firefox to always map on the tag named "2" on screen 1.
     --{ rule = { class = "Firefox" },
       --properties = { screen = 1, tag = "2" } },
    -- Browsing
    { rule_any = {
        class = {
          "Firefox",
          "Chromium-browser",
          "qutebrowser",
          },
    --local clients = 
     }, properties = { screen = 1, tag = awful.screen.focused().tags[1] } },

    -- Chatting
    { rule_any = {
        class = {
          "discord",
          "TelegramDesktop",
          "TeamSpeak 3",
          },
    --local clients = 
     }, properties = { screen = 1, tag = awful.screen.focused().tags[3] } },

    -- Photo editing
    { rule_any = {
        class = {
          "Gimp",
          "Inkscape",
          },
     }, properties = { screen = 1, tag = awful.screen.focused().tags[6] } },

    -- Gaming
    { rule_any = {
        class = {
          "Steam",
          "battle.net.exe",
          "Lutris",
          },
     }, properties = { screen = 1, tag = awful.screen.focused().tags[8] } },

    -- Music
    { rule_any = {
        class = {
          "mpvtube",
          },
        --name = {
          --"mpvtube",
        --},
        
     }, properties = { screen = 1, tag = awful.screen.focused().tags[10] },
      callback = function (c)
        awful.placement.centered(c,{honor_workarea=true})
        gears.timer.delayed_call(function()
            c.urgent = false
        end)
      end
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set every new window as a slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- Hide titlebars if required by the theme
    if not beautiful.titlebars_enabled then
        awful.titlebar.hide(c, beautiful.titlebar_position)
    end

    -- If the layout is not floating, every floating client that appears is centered
    if awful.layout.get(mouse.screen) ~= awful.layout.suit.floating then
        awful.placement.centered(c,{honor_workarea=true})
    else
        -- If the layout is floating, and there is no other client visible, center it
        if #mouse.screen.clients == 1 then
            awful.placement.centered(c,{honor_workarea=true})
        end
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
--        and awful.client.focus.filter(c) then
--        client.focus = c
--    end
--end)

-- Rounded corners
if beautiful.border_radius ~= 0 then
    client.connect_signal("manage", function (c, startup)
        if not c.fullscreen then
            c.shape = helpers.rrect(beautiful.border_radius)
        end
    end)

    -- Make sure fullscreen clients do not have rounded corners
    client.connect_signal("property::fullscreen", function (c)
        if c.fullscreen then
            -- Use delayed_call in order to avoid flickering when corners
            -- change shape
            gears.timer.delayed_call(function()
                c.shape = helpers.rect()
            end)
        else
            c.shape = helpers.rrect(beautiful.border_radius)
        end
    end)
end

-- When a client starts up in fullscreen, resize it to cover the fullscreen a short moment later
-- Fixes wrong geometry when titlebars are enabled
client.connect_signal("property::fullscreen", function(c)
  if c.fullscreen then
    gears.timer.delayed_call(function()
      if c.valid then
        c:geometry(c.screen.geometry)
      end
    end)
  end
end)

-- Center client when floating property changes
--client.connect_signal("property::floating", function(c)
    --awful.placement.centered(c,{honor_workarea=true})
--end)

-- Apply shapes
-- beautiful.notification_shape = helpers.infobubble(beautiful.notification_border_radius)
beautiful.notification_shape = helpers.rrect(beautiful.notification_border_radius)
beautiful.snap_shape = helpers.rrect(beautiful.border_radius * 2)
beautiful.taglist_shape = helpers.rrect(beautiful.taglist_item_roundness)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Scratchpad gets minimized when it loses focus
--client.connect_signal("unfocus", function(c) 
    --if c.class == "scratchpad" or c.class == "calendar" then
        --c.minimized = true
    --end
--end)

-- Scratchpad gets minimized if it is focused and tag changes
awful.tag.attached_connect_signal(s, "property::selected", function ()    
    local c = client.focus
    if c ~= nil then
        if c.class == "scratchpad" or c.class == "calendar" then
            c.minimized = true
        end
    end
end)

-- Test signal
-- Use the following line to trigger it:
--      awesome.emit_signal("dummy")
--awesome.connect_signal("dummy", function(c)
    --naughty.notify({ preset = naughty.config.presets.normal,
                     --title = "bitch",
                     --text = "dummy" })
--end)

-- Floating: restore geometry
tag.connect_signal('property::layout',
    function(t)
        for k, c in ipairs(t:clients()) do
            if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
                -- Geometry x = 0 and y = 0 most probably means that the
                -- clients have been spawned in a non floating layout, and thus
                -- they don't have their floating_geometry set properly.
                -- If that is the case, don't change their geometry
                local cgeo = awful.client.property.get(c, 'floating_geometry')
                if cgeo ~= nil then
                    if not (cgeo.x == 0 and cgeo.y == 0) then
                        c:geometry(awful.client.property.get(c, 'floating_geometry'))
                    end
                end
                --c:geometry(awful.client.property.get(c, 'floating_geometry'))
            end
        end
    end
)

client.connect_signal('manage',
    function(c)
        if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
            awful.client.property.set(c, 'floating_geometry', c:geometry())
        end
    end
)

client.connect_signal('property::geometry',
    function(c)
        if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
            awful.client.property.set(c, 'floating_geometry', c:geometry())
        end
    end
)

-- Make rofi possible to raise minimized clients
-- Note: causes clients to unminimize after restarting awesome
client.connect_signal("request::activate",
    function(c, context, hints)
        if c.minimized then
            c.minimized = false
        end
        awful.ewmh.activate(c, context, hints)
    end
)

-- Startup applications
awful.spawn.with_shell( os.getenv("HOME") .. "/.config/awesome/autostart.sh")

-- }}}
