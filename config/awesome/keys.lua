local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local helpers = require("helpers")

local keys = {}

-- Mod keys
modkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

-- {{{ Mouse bindings
keys.desktopbuttons = gears.table.join(
    awful.button({ }, 1, function () 
        mymainmenu:hide()
        uc = awful.client.urgent.get()
        -- If there is no urgent client, go back to last tag
        if uc == nil then
            awful.tag.history.restore()
        else
            awful.client.urgent.jumpto()
        end
    end),
    awful.button({ }, 3, function () mymainmenu:toggle() end),

    -- Side buttons - Minimize and restore minimized client
    awful.button({ }, 8, function()
        if client.focus ~= nil then
            client.focus.minimized = true
        end
    end),
    awful.button({ }, 9, function()
          local c = awful.client.restore()
          -- Focus restored client
          if c then
              client.focus = c
              c:raise()
          end
    end),
        
    -- Middle click and scrolling - Control volume
    awful.button({ }, 2, function () awful.spawn.with_shell("volume-control.sh toggle") end),
    awful.button({ }, 4, function () awful.spawn.with_shell("volume-control.sh up") end),
    awful.button({ }, 5, function () awful.spawn.with_shell("volume-control.sh down") end)

    -- Switch tags with sidebuttons
    --awful.button({ }, 8, awful.tag.viewprev),
    --awful.button({ }, 9, awful.tag.viewnext)
)
-- }}}

-- {{{ Key bindings
keys.globalkeys = gears.table.join(
    --awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              --{description="show help", group="awesome"}),
    --awful.key({ modkey,           }, "comma",   awful.tag.viewprev,
              --{description = "view previous", group = "tag"}),
    --awful.key({ modkey,           }, "period",  awful.tag.viewnext,
              --{description = "view next", group = "tag"}),

    -- Focus client by direction
    awful.key({ modkey }, "Down",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "Up",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "Left",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "Right",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    awful.key({ modkey, altkey }, "j",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey, altkey }, "k",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey, altkey }, "h",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey, altkey }, "l",
        function()
            awful.client.focus.bydirection("right")
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
    awful.key({ modkey,        }, "g",
        function ()
            awful.tag.incgap(5, nil)
        end,
        {description = "increment gaps size for the current tag", group = "gaps"}
    ),
    awful.key({ modkey, shiftkey }, "g",
        function ()
            awful.tag.incgap(-5, nil)
        end,
        {description = "decrement gap size for the current tag", group = "gaps"}
    ),
    -- Kill all visible clients
    awful.key({ modkey, altkey }, "q",
        function ()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
               c:kill()
            end
        end,
        {description = "kill all visible clients for the current tag", group = "gaps"}
    ),
    -- Main menu
    --awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              --{description = "show main menu", group = "awesome"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Layout manipulation
    awful.key({ modkey, shiftkey   }, "j", function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move(  0,  40,   0,   0)
            helpers.move_to_edge(c, "down")
        else
            --awful.client.swap.byidx(  1)
            awful.client.swap.bydirection("down", c, nil)

        end
    end,
    --{description = "swap with next client by index", group = "client"}),
    {description = "swap with direction down", group = "client"}),
    awful.key({ modkey, shiftkey   }, "k", function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move(  0,  -40,   0,   0)
            helpers.move_to_edge(c, "up")
        else
            --awful.client.swap.byidx( -1)
            awful.client.swap.bydirection("up", c, nil)
        end
    end,
    {description = "swap with direction up", group = "client"}),
    -- No need for these (single screen setup)
    --awful.key({ modkey, ctrlkey }, "j", function () awful.screen.focus_relative( 1) end,
              --{description = "focus the next screen", group = "screen"}),
    --awful.key({ modkey, ctrlkey }, "k", function () awful.screen.focus_relative(-1) end,
              --{description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u",
        function ()
            uc = awful.client.urgent.get()
            -- If there is no urgent client, go back to last tag
            if uc == nil then
                awful.tag.history.restore()
            else
                awful.client.urgent.jumpto()
            end
        end,
          {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey }, "Tab", function() awful.spawn.with_shell("~/scr/Rofi/rofi_combi") end,
              {description = "window switcher", group = "launcher"}),
    --awful.key({ modkey,           }, "Tab",
        --function ()
            --awful.client.focus.history.previous()
            --if client.focus then
                --client.focus:raise()
            --end
        --end,
        --{description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "t", function () awful.spawn(tmux) end,
              {description = "open a terminal with tmux", group = "launcher"}),
    -- Spawn floating terminal (see awful.rules below)
    awful.key({ modkey, shiftkey }, "Return", function()
        awful.spawn(floating_terminal)
    end,
              {description = "spawn floating terminal", group = "launcher"}),
    awful.key({ modkey, shiftkey }, "t", function() awful.spawn(floating_tmux) end,
              {description = "spawn floating terminal with tmux", group = "launcher"}),
    awful.key({ modkey, shiftkey }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey   }, "x", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey, ctrlkey }, "h",     function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: resize client
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0, -20, 0)
        else
            awful.tag.incmwfact(-0.05)
        end
    end,
      {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, ctrlkey }, "l",     function ()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: resize client
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  20, 0)
        else
            awful.tag.incmwfact( 0.05)
        end
    end,
      {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, shiftkey   }, "h",   
    function () 
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move( -40,  0,   0,   0)
            helpers.move_to_edge(c, "left")
        else
            awful.client.swap.bydirection("left", c, nil)
        end
    end,
    {description = "swap with direction left", group = "client"}),
    awful.key({ modkey, shiftkey   }, "l",   
    function () 
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client to edge
        if c ~= nil and (current_layout == "floating" or c.floating) then
            --c:relative_move(  40,  0,   0,   0)
            helpers.move_to_edge(c, "right")
        else
            awful.client.swap.bydirection("right", c, nil)
        end
    end,
    {description = "swap with direction right", group = "client"}),
    awful.key({ modkey }, "h",   
    function () 
        awful.tag.incnmaster( 1, nil, true) 
    end,
    {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey }, "l",   
    function () 
        awful.tag.incnmaster(-1, nil, true) 
    end,
    {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, shiftkey, ctrlkey }, "h",     function () 
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client
        if c ~= nil and (current_layout == "floating" or c.floating) then
            c:relative_move( -20,  0,  0,   0)
        else
            awful.tag.incncol( 1, nil, true)    
        end
    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, shiftkey, ctrlkey }, "l",     function () 
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        -- Floating: move client
        if c ~= nil and (current_layout == "floating" or c.floating) then
            c:relative_move(  20,  0,  0,   0)
        else
            awful.tag.incncol(-1, nil, true)    
        end
    end),
    --awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              --{description = "select next", group = "layout"}),
    --awful.key({ modkey, shiftkey   }, "space", function () awful.layout.inc(-1)                end,
              --{description = "select previous", group = "layout"}),

    awful.key({ modkey, shiftkey }, "n",
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
    --awful.key({ modkey },            "d",     function () awful.screen.focused().mypromptbox:run() end,
              --{description = "run prompt", group = "launcher"}),
    awful.key({ modkey }, "d", function() awful.spawn.with_shell("~/scr/Rofi/rofi_launch") end,
              {description = "rofi launcher", group = "launcher"}),

    -- Run lua code
    --awful.key({ modkey }, "r",
              --function ()
                  --awful.prompt.run {
                    --prompt       = " Lua: ",
                    --textbox      = awful.screen.focused().mypromptbox.widget,
                    --exe_callback = awful.util.eval,
                    --history_path = awful.util.get_cache_dir() .. "/history_eval"
                  --}
              --end,
              --{description = "lua execute prompt", group = "awesome"}),

    -- Dismiss notifications
    awful.key( { ctrlkey }, "space", function()
        naughty.destroy_all_notifications()
    end,
              {description = "dismiss notification", group = "notifications"}),

    -- Menubar
    --awful.key({ modkey, ctrlkey }, "b", function() menubar.show() end,
              --{description = "show the menubar", group = "launcher"}),
    -- Volume Control
    awful.key( { }, "XF86AudioMute", function()
        awful.spawn.with_shell("volume-control.sh toggle")
    end,
              {description = "(un)mute volume", group = "volume"}),
    awful.key( { }, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell("volume-control.sh down")
    end,
              {description = "lower volume", group = "volume"}),
    awful.key( { }, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell("volume-control.sh up")
    end,
              {description = "raise volume", group = "volume"}),
    -- Screenshots
    awful.key( { }, "Print", function() awful.spawn.with_shell("screenshot.sh") end,
              {description = "take full screenshot", group = "screenshots"}),
    awful.key( { modkey, shiftkey }, "c", function() awful.spawn.with_shell("screenshot.sh -s") end,
              {description = "select area to capture", group = "screenshots"}),
    awful.key( { modkey, ctrlkey }, "c", function() awful.spawn.with_shell("screenshot.sh -c") end,
              {description = "select area to copy to clipboard", group = "screenshots"}),
    awful.key( { modkey }, "Print", function() awful.spawn.with_shell("screenshot.sh -b") end,
              {description = "browse screenshots", group = "screenshots"}),
    awful.key( { modkey, shiftkey }, "Print", function() awful.spawn.with_shell("screenshot.sh -e") end,
              {description = "edit most recent screenshot with gimp", group = "screenshots"}),
    -- Toggle tray visibility
    awful.key({ modkey }, "=", function ()
        awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
    end,
    {description = "toggle systray visibility", group = "custom"}),
    -- Toggle night light
    awful.key({ modkey }, "x", function() awful.spawn.with_shell("flux") end,
              {description = "toggle night light", group = "launcher"}),
    -- Toggle compositor
    awful.key({ modkey }, "z", function() awful.spawn.with_shell("compositor") end,
              {description = "toggle compositor", group = "launcher"}),
    -- Media keys
    awful.key({ modkey }, "period", function() awful.spawn.with_shell("mpc next") end,
    {description = "next song", group = "media"}),
    awful.key({ modkey }, "comma", function() awful.spawn.with_shell("mpc prev") end,
    {description = "previous song", group = "media"}),
    awful.key({ modkey }, "space", function() awful.spawn.with_shell("mpc toggle") end,
    {description = "toggle pause/play", group = "media"}),
    awful.key({ modkey, shiftkey }, "period", function() awful.spawn.with_shell("mpvc next") end,
    {description = "mpv next song", group = "media"}),
    awful.key({ modkey, shiftkey }, "comma", function() awful.spawn.with_shell("mpvc prev") end,
    {description = "mpv previous song", group = "media"}),
    awful.key({ modkey, shiftkey}, "space", function() awful.spawn.with_shell("mpvc toggle") end,
    {description = "mpv toggle pause/play", group = "media"}),
    awful.key({ modkey, shiftkey}, "F8", function() awful.spawn.with_shell("mpvc quit") end,
    {description = "mpv quit", group = "media"}),
    awful.key({ modkey }, "q", function()
        if client.focus ~= nil and client.focus.class == "scratchpad" then
            client.focus.minimized = true
            return
        end
        local matcher = function (c)
            return awful.rules.match(c, {class = 'scratchpad'})
        end
        awful.client.run_or_raise( "scratchpad" , matcher)
    end,
              {description = "scratchpad", group = "launcher"}),
    -- Set max layout
    awful.key({ modkey }, "w", function()
        awful.layout.set(awful.layout.suit.max)
    end,
              {description = "set max layout", group = "tag"}),
    -- Set tiled layout
    awful.key({ modkey }, "s", function()
        awful.layout.set(awful.layout.suit.tile)
    end,
              {description = "set tiled layout", group = "tag"}),
    -- Set floating layout
    awful.key({ modkey, shiftkey }, "s", function()
        awful.layout.set(awful.layout.suit.floating)
    end,
              {description = "set floating layout", group = "tag"}),
    -- Run or raise or minimize calcurse
    awful.key({ modkey }, "F1", function()
        if client.focus ~= nil and client.focus.class == "calendar" then
            client.focus.minimized = true
            return
        end
        local matcher = function (c)
            return awful.rules.match(c, {class = 'calendar'})
        end
        awful.client.run_or_raise( terminal .. " --class calendar -e calcurse", matcher)
    end,
              {description = "calcurse", group = "launcher"}),
    -- Spawn ranger in a terminal
    awful.key({ modkey }, "F2", function() awful.spawn(terminal .. " -e ranger") end,
              {description = "ranger", group = "launcher"}),
    -- Spawn ncmpcpp in a terminal
    awful.key({ modkey }, "F3", function() awful.spawn(terminal .. " -e ncmpcpp") end,
              {description = "ncmpcpp", group = "launcher"}),
    -- Spawn cava in a terminal
    awful.key({ modkey }, "F4", function() awful.spawn(terminal .. " -e cava") end,
              {description = "cava", group = "launcher"}),
    -- Show system info (cpu, ram, battery, temp)
    awful.key({ modkey }, "grave", function() awful.spawn.with_shell("~/scr/info/stats") end,
              {description = "current system info", group = "launcher"}),
    -- Quick edit config file
    awful.key({ modkey }, "e", function() awful.spawn.with_shell("~/scr/Rofi/rofi_quickedit") end,
              {description = "quick edit", group = "launcher"}),
    -- mpvtube
    awful.key({ modkey }, "y", function() awful.spawn.with_shell("~/scr/Rofi/rofi_mpvtube") end,
              {description = "mpvtube", group = "launcher"}),
    -- mpvtube song
    awful.key({ modkey, shiftkey }, "y", function() awful.spawn.with_shell("~/scr/info/mpv-query.sh") end,
              {description = "show mpv media title", group = "launcher"}),
    -- Spawn htop in a terminal
    awful.key({ modkey }, "p", function() awful.spawn(terminal .. " -e htop") end,
              {description = "htop", group = "launcher"})
)

keys.clientkeys = gears.table.join(
    -- Move floating client (relative)
    awful.key({ modkey, shiftkey   }, "Down",   function (c) c:relative_move(  0,  40,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Up",     function (c) c:relative_move(  0, -40,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Left",   function (c) c:relative_move(-40,   0,   0,   0) end),
    awful.key({ modkey, shiftkey   }, "Right",  function (c) c:relative_move( 40,   0,   0,   0) end),
    -- Center client
    awful.key({ modkey }, "c",  function (c)
        awful.placement.centered(c,{honor_workarea=true})
        --awful.placement.centered(c,nil)
    end),
    -- Resize client
    awful.key({ modkey, ctrlkey }, "j",     function (c)
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  0, 20)
        else
            awful.client.incwfact(0.15)    
        end
    end),
    awful.key({ modkey, ctrlkey }, "k",     function (c)
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        if current_layout == "floating" or c.floating == true then
            c:relative_move(  0,  0,  0, -20)
        else
            awful.client.incwfact(-0.15)    
        end
    end),
    awful.key({ modkey, shiftkey, ctrlkey }, "j", function (c) 
        -- Relative move
        c:relative_move(0,  20, 0, 0)
    end),
    awful.key({ modkey, shiftkey, ctrlkey }, "k", function (c) 
        -- Relative move
        c:relative_move(0, -20, 0, 0)
    end),
    -- Toggle titlebar (for focused client only)
    awful.key({ modkey,           }, "b",
        function (c)
            -- Don't toggle if titlebars are used as borders
            if not beautiful.titlebars_imitate_borders then
                awful.titlebar.toggle(c, beautiful.titlebar_position)
            end
        end,
        {description = "toggle titlebar", group = "client"}),
    -- Toggle titlebar (for all visible clients in selected tag)
    awful.key({ modkey, shiftkey }, "b",
        function (c)
            --local s = awful.screen.focused()
            local clients = awful.screen.focused().clients
            for _, c in pairs(clients) do
                -- Don't toggle if titlebars are used as borders
                if not beautiful.titlebars_imitate_borders then
                    awful.titlebar.toggle(c, beautiful.titlebar_position)
                end
            end
        end,
        {description = "toggle titlebar", group = "client"}),
    -- Toggle fullscreen
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    -- Resize and set floating
    -- F for focused view
    awful.key({ modkey, shiftkey  }, "f",
        function (c)
            c.width = 950
            c.height = 600
            --c.width = 750
            --c.height = 500
            c.floating = true
            awful.placement.centered(c,{honor_workarea=true})
            c:raise()
        end,
        {description = "focus mode", group = "client"}),
    -- Resize and set floating 2: Electric Boogaloo
    -- F for focused view
    awful.key({ modkey, ctrlkey  }, "f",
        function (c)
            c.width = 600
            c.height = 600
            --c.width = 750
            --c.height = 500
            c.floating = true
            awful.placement.centered(c,{honor_workarea=true})
            c:raise()
        end,
        {description = "focus mode", group = "client"}),
    -- T for tiny window
    awful.key({ modkey, ctrlkey  }, "t",
        function (c)
            c.width = 400
            c.height = 260
            c.floating = true
            awful.placement.centered(c,{honor_workarea=true})
            c:raise()
        end,
        {description = "tiny mode", group = "client"}),
    -- N for normal window
    awful.key({ modkey, ctrlkey  }, "n",
        function (c)
            c.width = 640
            c.height = 400
            c.floating = true
            awful.placement.centered(c,{honor_workarea=true})
            c:raise()
        end,
        {description = "normal mode", group = "client"}),
    awful.key({ modkey, shiftkey   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    --awful.key({ modkey, ctrlkey }, "space",  awful.client.floating.toggle                     ,
    -- Toggle floating
    awful.key({ modkey, ctrlkey }, "space",
        function(c)
            local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
            if current_layout ~= "floating" then
                awful.client.floating.toggle()
            end
            --c:raise()
        end,
        {description = "toggle floating", group = "client"}),
    awful.key({ modkey, ctrlkey }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    -- P for pin: keep on top OR sticky
    -- On top
    awful.key({ modkey, shiftkey }, "p",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    -- Sticky
    awful.key({ modkey, ctrlkey }, "p",      function (c) c.sticky = not c.sticky            end,
              {description = "toggle sticky", group = "client"}),
    -- Minimize
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
    awful.key({ modkey, ctrlkey }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, shiftkey   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
local ntags = 10
for i = 1, ntags do
    keys.globalkeys = gears.table.join(keys.globalkeys,
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
        awful.key({ modkey, ctrlkey }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, shiftkey }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
        {description = "move focused client to tag #"..i, group = "tag"}),
        -- Move all visible clients to tag and focus that tag
        awful.key({ modkey, altkey }, "#" .. i + 9,
                  function ()
                    local tag = client.focus.screen.tags[i]
                    local clients = awful.screen.focused().clients
                    if tag then
                        for _, c in pairs(clients) do
                           c:move_to_tag(tag)
                        end
                        tag:view_only()
                    end
                  end,
        {description = "move all visible clients to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, ctrlkey, shiftkey }, "#" .. i + 9,
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
keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, function(c)
        awful.mouse.resize(c, nil, {jump_to_corner=true})
    end)
)
-- }}}

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)







return keys
