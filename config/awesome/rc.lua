-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- TODO: Tidy up this place. God, it's a mess...

-- {{{ Third party stuff
-- None for now
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
-- Themes define colours, icons, font and wallpapers.

local theme_name = "reasons"
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
beautiful.init( theme_dir .. theme_name .. "/theme.lua" )
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "st"
tmux = terminal .. " -e tmux new "
floating_tmux = terminal .. " -c st_floating -e tmux new "
editor = "vim"
--editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    --awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    awful.layout.suit.corner.nw,
    awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end

-- }}}


-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Hotkeys", function() return false, hotkeys_popup.show_help end},
   { "Manual", terminal .. " -e man awesome" },
   { "Edit config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", tmux }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget that shows date
mytextdate = wibox.widget.textclock(beautiful.date_prefix .. beautiful.date_format)
-- Create a textclock widget
mytextclock = wibox.widget.textclock(beautiful.clock_prefix .. beautiful.clock_format)
   
-- Create keyboard layout prefix
keyboardlayout_prefix = wibox.widget.textbox("")

-- Create item seperator
mytextseperator = wibox.widget.textbox()
mytextseperator.text = beautiful.seperator_text

-- Create focus indicator
-- Useful when titles are disabled
myfocusindicator = wibox.widget.textbox()
myfocusindicator.text = beautiful.focus_indicator

-- Create padding
pad = wibox.widget.textbox(" ")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, 
                        function (c)
                            if c == client.focus then
                                c.minimized = true
                            else
                                -- Without this, the following
                                -- :isvisible() makes no sense
                                c.minimized = false
                                if not c:isvisible() and c.first_tag then
                                    c.first_tag:view_only()
                                end
                                -- This will also un-minimize
                                -- the client, if needed
                                client.focus = c
                                c:raise()
                            end
                        end),
                     -- Middle mouse button closes the window
                     awful.button({ }, 2, function (c) c:kill() end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(-1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(1)
                    end))

-- Writes a string representation of the current layout in a textbox widget
function updatelayoutbox(l, s)
    local screen = s or 1
    l.text = beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(screen))]
end

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        -- Built in method to set wallpaper
        --gears.wallpaper.maximized(wallpaper, s, true)
        -- Set theme's wallpaper with feh
        awful.spawn.with_shell("feh --bg-scale " .. wallpaper)
        -- Set last wallpaper
        --awful.spawn.with_shell(os.getenv("HOME") .. ".fehbg")
    end
end

-- Create rounded rectangle shape
local rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end



-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Layouts
    -- Each screen has its own tag table.
    local names={"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}
    --local names={"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "}
    --local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
    local l = awful.layout.suit -- Alias to save time :)
    local layouts = { l.max, l.tile, l.tile, l.tile , l.fair,
        l.tile, l.tile, l.tile, l.tile}
    awful.tag(names, s, layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt({prompt = " Run: ", fg = beautiful.accent})
    -- Create a textbox widget which will contain a short string representing
    -- the layout we're using.  We need one layoutbox per screen.
    s.mytextlayoutbox = wibox.widget.textbox()
    s.mytextlayoutbox.font = beautiful.layoutbox_font
    s.mytextlayoutbox.forced_width = beautiful.layoutbox_forced_width
    s.mytextlayoutbox.align = beautiful.layoutbox_align
    --s.mytextlayoutbox.valign = "center"
    s.mytextlayoutbox.text = beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] 
    awful.tag.attached_connect_signal(s, "property::selected", function ()
        updatelayoutbox(s.mytextlayoutbox, s)
    end)
    awful.tag.attached_connect_signal(s, "property::layout", function ()
        updatelayoutbox(s.mytextlayoutbox, s)
    end)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
               awful.button({ }, 1, function () awful.layout.inc( 1) end),
               awful.button({ }, 3, function () awful.layout.inc(-1) end),
               awful.button({ }, 4, function () awful.layout.inc( 1) end),
               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Text layoutbox buttons
    s.mytextlayoutbox:buttons(gears.table.join(
               awful.button({ }, 1, function () awful.layout.inc( 1) end),
               awful.button({ }, 3, function () awful.layout.inc(-1) end),
               awful.button({ }, 4, function () awful.layout.inc( 1) end),
               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    -- Show all clients
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)
    -- Show only focused client
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, tasklist_buttons)
    -- Show only minimized clients
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.minimizedcurrenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = rrect(beautiful.border_radius)})
    if beautiful.wibar_detached then
    -- Resize the screen so that it seems like the wibar is detached
    -- from the edge (by using theme's useless_gap setting)
        local screen_width = s.geometry.width
        local screen_height = s.geometry.height
        if s.mywibox.position == "bottom" then
            s:fake_resize(0, 0, screen_width, screen_height - beautiful.useless_gap * 2)
        elseif s.mywibox.position == "top" then
            s:fake_resize(0, beautiful.useless_gap * 2, screen_width, screen_height - beautiful.useless_gap * 2)
        end
    end
        
    --s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Panel items
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            --mylauncher,
            s.mytaglist
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytasklist,
            s.mypromptbox
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- TODO: battery widget
            -- TODO: cpu widget
            -- TODO: ram widget
            keyboardlayout_prefix,
            mykeyboardlayout,
            mytextdateprefix,
            mytextdate,
            pad,
            mytextclock,
            wibox.widget.systray(),
            s.mytextlayoutbox
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    --awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    --awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              --{description = "view previous", group = "tag"}),
    --awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              --{description = "view next", group = "tag"}),

    -- Focus client by direction
    awful.key({ modkey }, "Down",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "Up",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "Left",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "Right",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    awful.key({ modkey, altkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey, altkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey, altkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey, altkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    -- Focus client by index (cycle through clients)
    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    -- No need for these (single screen setup)
    --awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              --{description = "focus the next screen", group = "screen"}),
    --awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              --{description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "t", function () awful.spawn(tmux) end,
              {description = "open a terminal with tmux", group = "launcher"}),
    -- Spawn floating terminal
    -- (There is a rule below that makes class "st_floating" float)
    awful.key({ modkey, "Shift" }, "Return", function() awful.spawn(terminal .. " -c st_floating") end,
              {description = "spawn floating terminal", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "t", function() awful.spawn(floating_tmux) end,
              {description = "spawn floating terminal with tmux", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "x", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    -- Vertical resize
    awful.key({ modkey, "Control" }, "j",     function () awful.client.incwfact( 0.15)    end),
    awful.key({ modkey, "Control" }, "k",     function () awful.client.incwfact(-0.15)    end),

    awful.key({ modkey }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Shift" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    -- Run program (d for dmenu ;)
    awful.key({ modkey },            "d",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    -- Run lua code
    awful.key({ modkey }, "r",
              function ()
                  awful.prompt.run {
                    prompt       = " Lua: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- TODO keybinds for dismissing notifications

    -- Menubar
    --awful.key({ modkey }, "p", function() menubar.show() end,
              --{description = "show the menubar", group = "launcher"})
    -- Volume Control
    awful.key( { }, "XF86AudioMute", function()
        awful.spawn.with_shell("pactl set-sink-mute 0 toggle")
    end,
              {description = "(un)mute volume", group = "volume"}),
    awful.key( { }, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell("pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ -5%")
    end,
              {description = "lower volume", group = "volume"}),
    awful.key( { }, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell("pactl set-sink-mute 0 0 && pactl set-sink-volume @DEFAULT_SINK@ +5%")
    end,
              {description = "raise volume", group = "volume"}),
    -- Screenshots
    awful.key( { }, "Print", function() awful.spawn.with_shell( os.getenv("HOME") .. "/Scripts/screenshot.sh") end,
              {description = "take full screenshot", group = "screenshots"}),
    awful.key( { modkey, "Shift" }, "c", function() awful.spawn.with_shell( os.getenv("HOME") .. "/Scripts/screenshot.sh -s") end,
              {description = "select area to capture", group = "screenshots"}),
    awful.key( { modkey, "Control" }, "c", function() awful.spawn.with_shell( os.getenv("HOME") .. "/Scripts/screenshot.sh -c") end,
              {description = "select area to copy to clipboard", group = "screenshots"}),
    awful.key( { modkey }, "Print", function() awful.spawn.with_shell("cd ~/Pictures/Screenshots ; feh --title feh_preview $(ls -t | head -n1) * &") end,
              {description = "browse screenshots", group = "screenshots"}),
    awful.key( { modkey, "Shift" }, "Print", function() awful.spawn.with_shell("cd ~/Pictures/Screenshots; gimp $(ls -t | head -n1) & notify-send 'Opening last screenshot with GIMP' --urgency low -i ~/.icons/oomox-only_icons/categories/scalable/applications-painting.svg" ) end,
              {description = "open most recent screenshot with gimp", group = "screenshots"}),
    -- Toggle night light
    awful.key({ modkey }, "x", function() awful.spawn.with_shell("flux") end,
              {description = "toggle night light", group = "launcher"}),
    -- Toggle compositor
    awful.key({ modkey }, "z", function() awful.spawn.with_shell("~/Scripts/compositor") end,
              {description = "toggle compositor", group = "launcher"}),
    -- Spawn ncmpcpp in a terminal
    awful.key({ modkey }, "F1", function() awful.spawn(terminal .. " -e ncmpcpp") end,
              {description = "ncmpcpp", group = "launcher"}),
    -- Spawn cava in a terminal
    awful.key({ modkey }, "F2", function() awful.spawn(terminal .. " -e cava") end,
              {description = "cava", group = "launcher"}),
    -- Spawn htop in a terminal
    awful.key({ modkey }, "p", function() awful.spawn(terminal .. " -e htop") end,
              {description = "htop", group = "launcher"})
)

clientkeys = gears.table.join(
    -- Move floating client (relative)
    awful.key({ modkey, "Shift"   }, "Down",   function (c) c:relative_move(  0,  40,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Up",     function (c) c:relative_move(  0, -40,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Left",   function (c) c:relative_move(-40,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Right",  function (c) c:relative_move( 40,   0,   0,   0) end),
    awful.key({ modkey }, "c",  function (c)
        awful.placement.centered(c,nil)
    end),
    -- Toggle fullscreen
    awful.key({ modkey,           }, "f",
        function (c)
            -- Disable titlebar if fullscreen will be enabled
            -- and vice versa
            if beautiful.titlebars_enabled then
                if c.fullscreen then
                    awful.titlebar.show(c, top)
                else
                    awful.titlebar.hide(c, top)
                end
            end
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    --awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
    -- Toggle floating + ontop and center client
    awful.key({ modkey, "Control" }, "space",
        function(c)
            --client.focus = c
            awful.client.floating.toggle()
            c.ontop = not c.ontop
            awful.placement.centered(c,nil)
            c:raise()
        end,
        {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey, "Control" }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        local current_tag = screen.selected_tag
                        -- Tag back and forth:
                        -- If you try to focus the same tag you are at,
                        -- go back to the previous tag.
                        -- Useful for quick switching after for example
                        -- checking an incoming chat message at tag 2
                        -- and coming back to your work at tag 1
                        if tag then
                           if tag == current_tag then
                               awful.tag.history.restore()
                           else
                               tag:view_only()
                           end
                        end
                        -- Simple tag view
                        --if tag then
                           --tag:view_only()
                        --end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Mouse buttons on the client (whole window, not just titlebar)
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, function(c)
      awful.mouse.resize(c, nil, {jump_to_corner=false})
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     -- Disable WM_NORMAL_HINTS so that terminals are resized freely
                     size_hints_honor = false,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Galculator",
          "st_floating", -- Floating terminal
          "Gpick",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
          "feh_preview",  -- title for feh used by some scripts for previewing.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, ontop = true }},

    -- Add titlebars to normal clients and dialogs, if required by theme.lua
    -- Center them (if they are floating)
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = beautiful.titlebars_enabled },
      callback = function (c)
        -- TODO: center only if there is no other client visible on the screen
        awful.placement.centered(c,nil)
      end
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
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
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        -- Middle mouse button on the titlebar closes the window
        awful.button({ }, 2, function ()
                                window_to_kill = mouse.object_under_pointer()
                                window_to_kill:kill()
                             end),
        -- Right button - resize
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end),
        -- Scrolling
        -- Scroll up -> toggle maximize
        awful.button({ }, 4, function()
            c = mouse.object_under_pointer()
            c.maximized = not c.maximized
            c:raise()
        end),
        -- Scroll down -> minimize
        awful.button({ }, 5, function()
            c = mouse.object_under_pointer()
            c.minimized = true
        end),
        -- Side buttons
        -- Toggle sticky
        awful.button({ }, 8, function()
            c = mouse.object_under_pointer()
            c.sticky = not c.sticky
        end),
        -- Toggle floating + on top
        awful.button({ }, 9, function()
            client.focus = c
            awful.client.floating.toggle()
            c.ontop = not c.ontop
            awful.placement.centered(c,nil)
            c:raise()
        end)
    )

    awful.titlebar(c, {font = beautiful.titlebar_font}) : setup {
        { -- Left
            --awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            --{ -- Title
                --align  = "center",
                --widget = awful.titlebar.widget.titlewidget(c)
            --},
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            -- Titlebar buttons
            --awful.titlebar.widget.floatingbutton (c),
            --awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            --awful.titlebar.widget.closebutton    (c),
            myfocusindicator,

            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
--        and awful.client.focus.filter(c) then
--        client.focus = c
--    end
--end)

-- Rounded corners
-- TODO: Rounded internal norder (see actionless' config)
client.connect_signal("property::geometry", function (c)
  -- Only apply shape to non fullscreen clients
  if not c.fullscreen then
      gears.timer.delayed_call(function()
        gears.surface.apply_shape_bounding(c, gears.shape.rounded_rect, beautiful.border_radius)
      end)
  end
end)

beautiful.notification_shape = rrect(beautiful.border_radius)
beautiful.snap_shape = rrect(beautiful.border_radius * 2)
beautiful.taglist_shape = rrect(beautiful.border_radius)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Startup applications
awful.spawn.with_shell( os.getenv("HOME") .. "/.config/awesome/autostart.sh")

-- }}}
