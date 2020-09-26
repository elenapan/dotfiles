--[[
   ___       ___       ___       ___       ___       ___       ___
  /\  \     /\__\     /\  \     /\  \     /\  \     /\__\     /\  \
 /::\  \   /:/\__\   /::\  \   /::\  \   /::\  \   /::L_L_   /::\  \
/::\:\__\ /:/:/\__\ /::\:\__\ /\:\:\__\ /:/\:\__\ /:/L:\__\ /::\:\__\
\/\::/  / \::/:/  / \:\:\/  / \:\:\/__/ \:\/:/  / \/_/:/  / \:\:\/  /
  /:/  /   \::/  /   \:\/  /   \::/  /   \::/  /    /:/  /   \:\/  /
  \/__/     \/__/     \/__/     \/__/     \/__/     \/__/     \/__/

-- >> The file that binds everything together.
--]]


local themes = {
    "manta",        -- 1 --
    "lovelace",     -- 2 --
    "skyfall",      -- 3 --
    "ephemeral",    -- 4 --
    "amarena",      -- 5 --
}
-- Change this number to use a different theme
local theme = themes[5]
-- ===================================================================
-- Affects the window appearance: titlebar, titlebar buttons...
local decoration_themes = {
    "lovelace",       -- 1 -- Standard titlebar with 3 buttons (close, max, min)
    "skyfall",        -- 2 -- No buttons, only title
    "ephemeral",      -- 3 -- Text-generated titlebar buttons
}
local decoration_theme = decoration_themes[3]
-- ===================================================================
-- Statusbar themes. Multiple bars can be declared in each theme.
local bar_themes = {
    "manta",        -- 1 -- Taglist, client counter, date, time, layout
    "lovelace",     -- 2 -- Start button, taglist, layout
    "skyfall",      -- 3 -- Weather, taglist, window buttons, pop-up tray
    "ephemeral",    -- 4 -- Taglist, start button, tasklist, and more buttons
    "amarena",      -- 5 -- Minimal taglist and dock with autohide
}
local bar_theme = bar_themes[5]

-- ===================================================================
-- Affects which icon theme will be used by widgets that display image icons.
local icon_themes = {
    "linebit",        -- 1 -- Neon + outline
    "drops",          -- 2 -- Pastel + filled
}
local icon_theme = icon_themes[2]
-- ===================================================================
local notification_themes = {
    "lovelace",       -- 1 -- Plain with standard image icons
    "ephemeral",      -- 2 -- Outlined text icons and a rainbow stripe
    "amarena",        -- 3 -- Filled text icons on the right, text on the left
}
local notification_theme = notification_themes[3]
-- ===================================================================
local sidebar_themes = {
    "lovelace",       -- 1 -- Uses image icons
    "amarena",        -- 2 -- Text-only (consumes less RAM)
}
local sidebar_theme = sidebar_themes[2]
-- ===================================================================
local dashboard_themes = {
    "skyfall",        -- 1 --
    "amarena",        -- 2 -- Displays coronavirus stats
}
local dashboard_theme = dashboard_themes[2]
-- ===================================================================
local exit_screen_themes = {
    "lovelace",      -- 1 -- Uses image icons
    "ephemeral",     -- 2 -- Uses text-generated icons (consumes less RAM)
}
local exit_screen_theme = exit_screen_themes[2]
-- ===================================================================
-- User variables and preferences
user = {
    -- >> Default applications <<
    -- Check apps.lua for more
    terminal = "kitty -1",
    floating_terminal = "kitty -1",
    browser = "firefox",
    file_manager = "kitty -1 --class files -e ranger",
    editor = "kitty -1 --class editor -e vim",
    email_client = "kitty -1 --class email -e neomutt",
    music_client = "kitty -o font_size=12 --class music -e ncmpcpp",

    -- >> Web Search <<
    web_search_cmd = "xdg-open https://duckduckgo.com/?q=",
    -- web_search_cmd = "xdg-open https://www.google.com/search?q=",

    -- >> User profile <<
    profile_picture = os.getenv("HOME").."/.config/awesome/profile.png",

    -- Directories with fallback values
    dirs = {
        downloads = os.getenv("XDG_DOWNLOAD_DIR") or "~/Downloads",
        documents = os.getenv("XDG_DOCUMENTS_DIR") or "~/Documents",
        music = os.getenv("XDG_MUSIC_DIR") or "~/Music",
        pictures = os.getenv("XDG_PICTURES_DIR") or "~/Pictures",
        videos = os.getenv("XDG_VIDEOS_DIR") or "~/Videos",
        -- Make sure the directory exists so that your screenshots
        -- are not lost
        screenshots = os.getenv("XDG_SCREENSHOTS_DIR") or "~/Pictures/Screenshots",
    },

    -- >> Sidebar <<
    sidebar = {
        hide_on_mouse_leave = true,
        show_on_mouse_screen_edge = true,
    },

    -- >> Lock screen <<
    -- This password will ONLY be used if you have not installed
    -- https://github.com/RMTT/lua-pam
    -- as described in the README instructions
    -- Leave it empty in order to unlock with just the Enter key.
    -- lock_screen_custom_password = "",
    lock_screen_custom_password = "awesome",

    -- >> Battery <<
    -- You will receive notifications when your battery reaches these
    -- levels.
    battery_threshold_low = 20,
    battery_threshold_critical = 5,

    -- >> Weather <<
    -- Get your key and find your city id at
    -- https://openweathermap.org/
    -- (You will need to make an account!)
    openweathermap_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    openweathermap_city_id = "yyyyyy",
    -- > Use "metric" for Celcius, "imperial" for Fahrenheit
    weather_units = "metric",

    -- >> Coronavirus <<
    -- Country to check for corona statistics
    -- Uses the https://corona-stats.online API
    coronavirus_country = "germany",
}
-- ===================================================================


-- Jit
--pcall(function() jit.on() end)

-- Initialization
-- ===================================================================
-- Theme handling library
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()
-- Make dpi function global
dpi = beautiful.xresources.apply_dpi
-- Make xresources colors global
x = {
    --           xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color1     = xrdb.color1,
    color2     = xrdb.color2,
    color3     = xrdb.color3,
    color4     = xrdb.color4,
    color5     = xrdb.color5,
    color6     = xrdb.color6,
    color7     = xrdb.color7,
    color8     = xrdb.color8,
    color9     = xrdb.color9,
    color10    = xrdb.color10,
    color11    = xrdb.color11,
    color12    = xrdb.color12,
    color13    = xrdb.color13,
    color14    = xrdb.color14,
    color15    = xrdb.color15,
}

-- Load AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Default notification library
local naughty = require("naughty")

-- Load theme
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")

-- Error handling
-- ===================================================================
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

-- Features
-- ===================================================================
-- Initialize icons array and load icon theme
local icons = require("icons")
icons.init(icon_theme)
-- Keybinds and mousebinds
local keys = require("keys")
-- Load notification daemons and notification theme
local notifications = require("notifications")
notifications.init(notification_theme)
-- Load window decoration theme and custom decorations
local decorations = require("decorations")
decorations.init(decoration_theme)
-- Load helper functions
local helpers = require("helpers")

-- >> Elements - Desktop components
-- Statusbar(s)
require("elemental.bar."..bar_theme)
-- Exit screen
require("elemental.exit_screen."..exit_screen_theme)
-- Sidebar
require("elemental.sidebar."..sidebar_theme)
-- Dashboard (previously called: Start screen)
require("elemental.dashboard."..dashboard_theme)
-- Lock screen
-- Make sure to install lua-pam as described in the README or configure your
-- custom password in the 'user' section above
local lock_screen = require("elemental.lock_screen")
lock_screen.init()
-- App drawer
require("elemental.app_drawer")
-- Window switcher
require("elemental.window_switcher")
-- Toggle-able microphone overlay
require("elemental.microphone_overlay")

-- >> Daemons
-- Most widgets that display system/external info depend on evil.
-- Make sure to initialize it last in order to allow all widgets to connect to
-- their needed evil signals.
require("evil")
-- ===================================================================
-- ===================================================================

-- Get screen geometry
-- I am using a single screen setup and I assume that screen geometry will not
-- change during the session.
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Layouts
-- ===================================================================
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
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

-- Wallpaper
-- ===================================================================
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        -- local wallpaper = beautiful.wallpaper
        -- -- If wallpaper is a function, call it with the screen
        -- if type(wallpaper) == "function" then
        --     wallpaper = wallpaper(s)
        -- end

        -- >> Method 1: Built in wallpaper function
        -- gears.wallpaper.fit(wallpaper, s, true)
        -- gears.wallpaper.maximized(wallpaper, s, true)

        -- >> Method 2: Set theme's wallpaper with feh
        --awful.spawn.with_shell("feh --bg-fill " .. wallpaper)

        -- >> Method 3: Set last wallpaper with feh
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
    end
end

-- Set wallpaper
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tags
-- ===================================================================
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Alias to save time :)
    -- Tag layouts
    local layouts = {
        l.max,
        l.max,
        l.max,
        l.max,
        l.tile,
        l.max,
        l.max,
        l.max,
        l.tile,
        l.max
    }

    -- Tag names
    local tagnames = beautiful.tagnames or { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
    -- Create all tags at once (without seperate configuration for each tag)
    awful.tag(tagnames, s, layouts)

    -- Create tags with seperate configuration for each tag
    -- awful.tag.add(tagnames[1], {
    --     layout = layouts[1],
    --     screen = s,
    --     master_width_factor = 0.6,
    --     selected = true,
    -- })
    -- ...
end)

-- Determines how floating clients should be placed
local floating_client_placement = function(c)
    -- If the layout is floating or there are no other visible
    -- clients, center client
    if awful.layout.get(mouse.screen) ~= awful.layout.suit.floating or #mouse.screen.clients == 1 then
        return awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
    end

    -- Else use this placement
    local p = awful.placement.no_overlap + awful.placement.no_offscreen
    return p(c, {honor_padding = true, honor_workarea=true, margins = beautiful.useless_gap * 2})
end

local centered_client_placement = function(c)
    return gears.timer.delayed_call(function ()
        awful.placement.centered(c, {honor_padding = true, honor_workarea=true})
    end)
end

-- Rules
-- ===================================================================
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    {
        -- All clients will match this rule.
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            -- screen = awful.screen.preferred,
            screen = awful.screen.focused,
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            maximized = false,
            titlebars_enabled = beautiful.titlebars_enabled,
            maximized_horizontal = false,
            maximized_vertical = false,
            placement = floating_client_placement
        },
    },

    -- Floating clients
    {
        rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "floating_terminal",
                "riotclientux.exe",
                "leagueclientux.exe",
                "Devtools", -- Firefox devtools
            },
            class = {
                "Gpick",
                "Lxappearance",
                "Nm-connection-editor",
                "File-roller",
                "fst",
                "Nvidia-settings",
            },
            name = {
                "Event Tester",  -- xev
                "MetaMask Notification",
            },
            role = {
                "AlarmWindow",
                "pop-up",
                "GtkFileChooserDialog",
                "conversation",
            },
            type = {
                "dialog",
            }
        },
        properties = { floating = true }
    },

    -- TODO why does Chromium always start up floating in AwesomeWM?
    -- Temporary fix until I figure it out
    {
        rule_any = {
            class = {
                "Chromium-browser",
                "Chromium",
            }
        },
        properties = { floating = false }
    },

    -- Fullscreen clients
    {
        rule_any = {
            class = {
                "lt-love",
                "portal2_linux",
                "csgo_linux64",
                "EtG.x86_64",
                "factorio",
                "dota2",
                "Terraria.bin.x86",
                "dontstarve_steam",
            },
            instance = {
                "synthetik.exe",
            },
        },
        properties = { fullscreen = true }
    },

    -- -- Unfocusable clients (unless clicked with the mouse)
    -- -- If you want to prevent focusing even when clicking them, you need to
    -- -- modify the left click client mouse bind in keys.lua
    -- {
    --     rule_any = {
    --         class = {
    --             "scratchpad"
    --         },
    --     },
    --     properties = { focusable = false }
    -- },

    -- Centered clients
    {
        rule_any = {
            type = {
                "dialog",
            },
            class = {
                "Steam",
                "discord",
                "music",
                "markdown_input",
                "scratchpad",
            },
            instance = {
                "music",
                "markdown_input",
                "scratchpad",
            },
            role = {
                "GtkFileChooserDialog",
                "conversation",
            }
        },
        properties = { placement = centered_client_placement },
    },

    -- Titlebars OFF (explicitly)
    {
        rule_any = {
            instance = {
                "install league of legends (riot client live).exe",
                "gw2-64.exe",
                "battle.net.exe",
                "riotclientservices.exe",
                "leagueclientux.exe",
                "riotclientux.exe",
                "leagueclient.exe",
                "^editor$",
                "markdown_input"
            },
            class = {
                "qutebrowser",
                "Sublime_text",
                "Subl3",
                --"discord",
                --"TelegramDesktop",
                "firefox",
                "Nightly",
                "Steam",
                "Lutris",
                "Chromium",
                "^editor$",
                "markdown_input"
                -- "Thunderbird",
            },
            type = {
              "splash"
            },
            name = {
                "^discord.com is sharing your screen.$" -- Discord (running in browser) screen sharing popup
            }
        },
        callback = function(c)
            decorations.hide(c)
        end
    },

    -- Titlebars ON (explicitly)
    {
        rule_any = {
            type = {
                "dialog",
            },
            role = {
                "conversation",
            }
        },
        callback = function(c)
            decorations.show(c)
        end
    },

    -- "Needy": Clients that steal focus when they are urgent
    {
        rule_any = {
            class = {
                "TelegramDesktop",
                "firefox",
                "Nightly",
            },
            type = {
                "dialog",
            },
        },
        callback = function (c)
            c:connect_signal("property::urgent", function ()
                if c.urgent then
                    c:jump_to()
                end
            end)
        end
    },

    -- Fixed terminal geometry for floating terminals
    {
        rule_any = {
            class = {
                "Alacritty",
                "Termite",
                "mpvtube",
                "kitty",
                "st-256color",
                "st",
                "URxvt",
            },
        },
        properties = { width = screen_width * 0.45, height = screen_height * 0.5 }
    },

    -- Visualizer
    {
        rule_any = { class = { "Visualizer" } },
        properties = {
            floating = true,
            maximized_horizontal = true,
            sticky = true,
            ontop = false,
            skip_taskbar = true,
            below = true,
            focusable = false,
            height = screen_height * 0.40,
            opacity = 0.6,
            titlebars_enabled = false,
        },
        callback = function (c)
            awful.placement.bottom(c)
        end
    },

    -- File chooser dialog
    {
        rule_any = { role = { "GtkFileChooserDialog" } },
        properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.65 }
    },

    -- Pavucontrol
    {
        rule_any = { class = { "Pavucontrol" } },
        properties = { floating = true, width = screen_width * 0.45, height = screen_height * 0.8 }
    },

    -- Galculator
    {
        rule_any = { class = { "Galculator" } },
        except_any = { type = { "dialog" } },
        properties = { floating = true, width = screen_width * 0.2, height = screen_height * 0.4 }
    },

    -- File managers
    {
        rule_any = {
            class = {
                "Nemo",
                "Thunar"
            },
        },
        except_any = {
            type = { "dialog" }
        },
        properties = { floating = true, width = screen_width * 0.45, height = screen_height * 0.55}
    },

    -- Screenruler
    {
        rule_any = { class = { "Screenruler" } },
        properties = { border_width = 0, floating = true, ontop = true, titlebars_enabled = false },
        callback = function (c)
            awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
        end
    },

    -- Keepass
    {
        rule_any = { class = { "KeePassXC" } },
        except_any = { name = { "KeePassXC-Browser Confirm Access" }, type = { "dialog" } },
        properties = { floating = true, width = screen_width * 0.7, height = screen_height * 0.75},
    },

    -- Scratchpad
    {
        rule_any = {
            instance = {
                "scratchpad",
                "markdown_input"
            },
            class = {
                "scratchpad",
                "markdown_input"
            },
        },
        properties = {
            skip_taskbar = false,
            floating = true,
            ontop = false,
            minimized = true,
            sticky = false,
            width = screen_width * 0.7,
            height = screen_height * 0.75
        }
    },

    -- Markdown input
    {
        rule_any = {
            instance = {
                "markdown_input"
            },
            class = {
                "markdown_input"
            },
        },
        properties = {
            skip_taskbar = false,
            floating = true,
            ontop = false,
            minimized = true,
            sticky = false,
            width = screen_width * 0.5,
            height = screen_height * 0.7
        }
    },

    -- Music clients (usually a terminal running ncmpcpp)
    {
        rule_any = {
            class = {
                "music",
            },
            instance = {
                "music",
            },
        },
        properties = {
            floating = true,
            width = screen_width * 0.45,
            height = screen_height * 0.50
        },
    },

    -- Image viewers
    {
        rule_any = {
            class = {
                "feh",
                "Sxiv",
            },
        },
        properties = {
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75
        },
        callback = function (c)
            awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
        end
    },

    -- Dragon drag and drop utility
    {
        rule_any = {
            class = {
                "Dragon-drag-and-drop",
                "Dragon",
            },
        },
        properties = {
            floating = true,
            ontop = true,
            sticky = true,
            width = screen_width * 0.3,
        },
        callback = function (c)
            awful.placement.bottom_right(c, {
                honor_padding = true,
                honor_workarea = true,
                margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2}
            })
        end
    },

    -- Magit window
    {
        rule = { instance = "Magit" },
        properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.6 }
    },

    -- Steam guard
    {
        rule = { name = "Steam Guard - Computer Authorization Required" },
        properties = { floating = true },
        -- Such a stubborn window, centering it does not work
        -- callback = function (c)
        --     gears.timer.delayed_call(function()
        --         awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
        --     end)
        -- end
    },

    -- MPV
    {
        rule = { class = "mpv" },
        properties = {},
        callback = function (c)
            -- Make it floating, ontop and move it out of the way if the current tag is maximized
            if awful.layout.get(awful.screen.focused()) == awful.layout.suit.max then
                c.floating = true
                c.ontop = true
                c.width = screen_width * 0.30
                c.height = screen_height * 0.35
                awful.placement.bottom_right(c, {
                    honor_padding = true,
                    honor_workarea = true,
                    margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2}
                })
            end

            -- Restore `ontop` after fullscreen is disabled
            -- Sorta tries to fix: https://github.com/awesomeWM/awesome/issues/667
            c:connect_signal("property::fullscreen", function ()
                if not c.fullscreen then
                    c.ontop = true
                end
            end)
        end
    },

    -- "Fix" games that minimize on focus loss.
    -- Usually this can be fixed by launching them with
    -- SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0 but not all games use SDL
    {
        rule_any = {
            instance = {
                "synthetik.exe"
            },
        },
        properties = {},
        callback = function (c)
            -- Unminimize automatically
            c:connect_signal("property::minimized", function()
                if c.minimized then
                    c.minimized = false
                end
            end)
        end
    },

    -- League of Legends client QoL fixes
    {
        rule = { instance = "league of legends.exe" },
        properties = {},
        callback = function (c)
            local matcher = function (c)
                return awful.rules.match(c, { instance = "leagueclientux.exe" })
            end
            -- Minimize LoL client after game window opens
            for c in awful.client.iterate(matcher) do
                c.urgent = false
                c.minimized = true
            end

            -- Unminimize LoL client after game window closes
            c:connect_signal("unmanage", function()
                for c in awful.client.iterate(matcher) do
                    c.minimized = false
                end
            end)
        end
    },

    ---------------------------------------------
    -- Start application on specific workspace --
    ---------------------------------------------
    -- Browsing
    {
        rule_any = {
            class = {
                "firefox",
                "Nightly",
                -- "qutebrowser",
            },
        },
        except_any = {
            role = { "GtkFileChooserDialog" },
            instance = { "Toolkit" },
            type = { "dialog" }
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[1] },
    },

    -- Games
    {
        rule_any = {
            class = {
                "underlords",
                "lt-love",
                "portal2_linux",
                "deadcells",
                "csgo_linux64",
                "EtG.x86_64",
                "factorio",
                "dota2",
                "Terraria.bin.x86",
                "dontstarve_steam",
                "Wine",
                "trove.exe"
            },
            instance = {
                "love.exe",
                "synthetik.exe",
                "pathofexile_x64steam.exe",
                "leagueclient.exe",
                "glyphclientapp.exe"
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[2] }
    },

    -- Chatting
    {
        rule_any = {
            class = {
                "Chromium",
                "Chromium-browser",
                "discord",
                "TelegramDesktop",
                "Signal",
                "Slack",
                "TeamSpeak 3",
                "zoom",
                "weechat",
                "6cord",
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[3] }
    },

    -- Editing
    {
        rule_any = {
            class = {
                "^editor$",
                -- "Emacs",
                -- "Subl3",
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[4] }
    },

    -- System monitoring
    {
        rule_any = {
            class = {
                "htop",
            },
            instance = {
                "htop",
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[5] }
    },

    -- Image editing
    {
        rule_any = {
            class = {
                "Gimp",
                "Inkscape",
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[6] }
    },

    -- Mail
    {
        rule_any = {
            class = {
                "email",
            },
            instance = {
                "email",
            },
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[7] }
    },

    -- Game clients/launchers
    {
        rule_any = {
            class = {
                "Steam",
                "battle.net.exe",
                "Lutris",
            },
            name = {
                "Steam",
            }
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[8] }
    },

    -- Miscellaneous
    -- All clients that I want out of my way when they are running
    {
        rule_any = {
            class = {
                "torrent",
                "Transmission",
                "Deluge",
                "VirtualBox Manager",
                "KeePassXC"
            },
            instance = {
                "torrent",
                "qemu",
            }
        },
        except_any = {
            type = { "dialog" }
        },
        properties = { screen = 1, tag = awful.screen.focused().tags[10] }
    },

}
-- (Rules end here) ..................................................
-- ===================================================================

-- Signals
-- ===================================================================
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- For debugging awful.rules
    -- print('c.class = '..c.class)
    -- print('c.instance = '..c.instance)
    -- print('c.name = '..c.name)

    -- Set every new window as a slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    -- if awesome.startup
    -- and not c.size_hints.user_position
    -- and not c.size_hints.program_position then
    --     -- Prevent clients from being unreachable after screen count changes.
    --     awful.placement.no_offscreen(c)
    --     awful.placement.no_overlap(c)
    -- end

end)

-- When a client starts up in fullscreen, resize it to cover the fullscreen a short moment later
-- Fixes wrong geometry when titlebars are enabled
client.connect_signal("manage", function(c)
    if c.fullscreen then
        gears.timer.delayed_call(function()
            if c.valid then
                c:geometry(c.screen.geometry)
            end
        end)
    end
end)

if beautiful.border_width > 0 then
    client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
    client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
end

-- Set mouse resize mode (live or after)
awful.mouse.resize.set_mode("live")

-- Restore geometry for floating clients
-- (for example after swapping from tiling mode to floating mode)
-- ==============================================================
tag.connect_signal('property::layout', function(t)
    for k, c in ipairs(t:clients()) do
        if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
            local cgeo = awful.client.property.get(c, 'floating_geometry')
            if cgeo then
                c:geometry(awful.client.property.get(c, 'floating_geometry'))
            end
        end
    end
end)

client.connect_signal('manage', function(c)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
        awful.client.property.set(c, 'floating_geometry', c:geometry())
    end
end)

client.connect_signal('property::geometry', function(c)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
        awful.client.property.set(c, 'floating_geometry', c:geometry())
    end
end)

-- ==============================================================
-- ==============================================================

-- When switching to a tag with urgent clients, raise them.
-- This fixes the issue (visual mismatch) where after switching to
-- a tag which includes an urgent client, the urgent client is
-- unfocused but still covers all other windows (even the currently
-- focused window).
awful.tag.attached_connect_signal(s, "property::selected", function ()
    local urgent_clients = function (c)
        return awful.rules.match(c, { urgent = true })
    end
    for c in awful.client.iterate(urgent_clients) do
        if c.first_tag == mouse.screen.selected_tag then
            client.focus = c
        end
    end
end)

-- Raise focused clients automatically
client.connect_signal("focus", function(c) c:raise() end)

-- Focus all urgent clients automatically
-- client.connect_signal("property::urgent", function(c)
--     if c.urgent then
--         c.minimized = false
--         c:jump_to()
--     end
-- end)

-- Disable ontop when the client is not floating, and restore ontop if needed
-- when the client is floating again
-- I never want a non floating client to be ontop.
client.connect_signal('property::floating', function(c)
    if c.floating then
        if c.restore_ontop then
            c.ontop = c.restore_ontop
        end
    else
        c.restore_ontop = c.ontop
        c.ontop = false
    end
end)

-- Disconnect the client ability to request different size and position
-- Breaks fullscreen and maximized
-- client.disconnect_signal("request::geometry", awful.ewmh.client_geometry_requests)
-- client.disconnect_signal("request::geometry", awful.ewmh.geometry)

-- Show the dashboard on login
-- Add `touch /tmp/awesomewm-show-dashboard` to your ~/.xprofile in order to make the dashboard appear on login
local dashboard_flag_path = "/tmp/awesomewm-show-dashboard"
-- Check if file exists
awful.spawn.easy_async_with_shell("stat "..dashboard_flag_path.." >/dev/null 2>&1", function (_, __, ___, exitcode)
    if exitcode == 0 then
      -- Show dashboard
      if dashboard_show then dashboard_show() end
      -- Delete the file
      awful.spawn.with_shell("rm "..dashboard_flag_path)
    end
end)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================

-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
