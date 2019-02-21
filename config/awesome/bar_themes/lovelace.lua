local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
--local xrdb = xresources.get_current_theme()

local helpers = require("helpers")
local keys = require("keys")

-- {{{ Widgets
local desktop_control = require("noodle.desktop_control")
local minimal_tasklist = require("noodle.minimal_tasklist")
local icon_taglist = require("noodle.icon_taglist")

-- Start button widget (can toggle sidebar, tray, scratchpad)
start_widget = wibox.widget.imagebox(beautiful.start_icon)
start_widget:buttons(gears.table.join(
                         -- Left click - Toggle sidebar
                         awful.button({ }, 1, function ()
                             sidebar.visible = not sidebar.visible
                         end),
                         -- Middle click - Toggle scratchpad
                         awful.button({ }, 2, function ()
                             helpers.toggle_scratchpad()
                         end),
                         -- Right click - Toggle tray
                         awful.button({ }, 3, function ()
                             local traybox = awful.screen.focused().traybox
                             traybox.visible = not traybox.visible
                         end)
))

-- Keyboard map indicator and switcher
-- keyboardlayout_prefix = wibox.widget.textbox(" ")
-- keyboardlayout_prefix.markup = helpers.colorize_text(keyboardlayout_prefix.text, beautiful.prefix_fg)
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget that shows date
-- date_prefix = wibox.widget.textbox(" ")
-- date_prefix.markup = helpers.colorize_text(date_prefix.text, beautiful.prefix_fg)
--mytextdate = wibox.widget.textclock("%a %d %B")
-- mytextdate = wibox.widget.textclock("%j days around the sun") --HAHA very useful
-- Create a textclock widget
-- clock_prefix = wibox.widget.textbox(" ")
-- clock_prefix.markup = helpers.colorize_text(clock_prefix.text, beautiful.prefix_fg)
-- mytextclock = wibox.widget.textclock("%H:%M")
   
-- Create item separator
textseparator = wibox.widget.textbox()
textseparator.text = beautiful.separator_text
textseparator.font = "hurmit nerd font bold 14"
textseparator.markup = helpers.colorize_text(textseparator.text, beautiful.separator_fg)

-- Create padding
pad = wibox.widget.textbox(" ")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t)
                        -- Tag back and forth
                        local current_tag = awful.screen.focused().selected_tag
                        if t == current_tag then
                          awful.tag.history.restore()
                        else
                          t:view_only()
                        end
                        -- t:view_only()
                    end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    -- awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ }, 3, function(t)
                        if client.focus then
                          client.focus:move_to_tag(t)
                        end
                    end),
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
                     awful.button({ }, 3, helpers.client_menu_toggle()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(-1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(1)
                    end)
)
-- }}}

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    -- s.mypromptbox = awful.widget.prompt({prompt = " Run: ", fg = beautiful.prompt_fg})
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    -- s.mylayoutbox = awful.widget.layoutbox(s)
    -- s.mylayoutbox:buttons(gears.table.join(
    --            awful.button({ }, 1, function () awful.layout.inc( 1) end),
    --            awful.button({ }, 3, function () awful.layout.inc(-1) end),
    --            awful.button({ }, 4, function () awful.layout.inc( 1) end),
    --            awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.noempty, taglist_buttons)
    -- s.mytaglist.font = beautiful.font

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist {
    --     screen   = s,
    --     filter   = awful.widget.tasklist.filter.currenttags,
    --     buttons  = tasklist_buttons,
    --     layout   = {
    --         spacing_widget = {
    --             {
    --                 forced_width  = 5,
    --                 forced_height = 24,
    --                 thickness     = 1,
    --                 color         = '#777777',
    --                 widget        = wibox.widget.separator
    --             },
    --             valign = 'center',
    --             halign = 'center',
    --             widget = wibox.container.place,
    --         },
    --         spacing = 1,
    --         layout  = wibox.layout.fixed.horizontal
    --     },
    --     -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    --     -- not a widget instance.
    --     widget_template = {
    --         {
    --             wibox.widget.base.make_widget(),
    --             forced_height = 5,
    --             id            = 'background_role',
    --             widget        = wibox.container.background,
    --         },
    --         {
    --             {
    --                 id     = 'clienticon',
    --                 widget = awful.widget.clienticon,
    --             },
    --             margins = 5,
    --             color         = '#777777',
    --             widget  = wibox.container.margin
    --         },
    --         nil,
    --         create_callback = function(self, c, index, objects) --luacheck: no unused args
    --             self:get_children_by_id('clienticon')[1].client = c
    --         end,
    --         layout = wibox.layout.align.vertical,
    --     },
    -- }

  --   s.mytasklist = awful.widget.tasklist {
  --     screen   = s,
  --     filter   = awful.widget.tasklist.filter.currenttags,
  --     buttons  = tasklist_buttons,
  --     style    = {
  --         shape_border_width = 4,
  --         shape_border_color = beautiful.bg_minimize,
  --         shape  = gears.shape.rounded_bar,
  --     },
  --     layout   = {
  --         spacing = 10,
  --         spacing_widget = {
  --             {
  --                 forced_width = 5,
  --                 shape        = gears.shape.circle,
  --                 widget       = wibox.widget.separator
  --             },
  --             valign = 'center',
  --             halign = 'center',
  --             widget = wibox.container.place,
  --         },
  --         layout  = wibox.layout.flex.horizontal
  --     },
  --     -- Notice that there is *NO* wibox.wibox prefix, it is a template,
  --     -- not a widget instance.
  --     widget_template = {
  --         {
  --             {
  --                 {
  --                     {
  --                         id     = 'icon_role',
  --                         widget = wibox.widget.imagebox,
  --                     },
  --                     margins = 5,
  --                     widget  = wibox.container.margin,
  --                 },
  --                 {
  --                     id     = 'text_role',
  --                     widget = wibox.widget.textbox,
  --                 },
  --                 layout = wibox.layout.fixed.horizontal,
  --             },
  --             left  = 10,
  --             right = 10,
  --             widget = wibox.container.margin
  --         },
  --         id     = 'background_role',
  --         widget = wibox.container.background,
  --     },
  -- }


    -- Outer gaps
    --awful.screen.padding(awful.screen.focused(),{left = 28, right = 28, top = 28, bottom = 28})

    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Wibar detached - Method: Transparent useless bar
    -- Requires compositor
    if beautiful.wibar_detached then
        s.useless_wibar = awful.wibar({ position = beautiful.wibar_position, screen = s, height = beautiful.screen_margin * 2, opacity = 0 })
        --TODO
        --s.useless_wibar:buttons(keys.desktopbuttons)
    end
    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            pad,
            start_widget,
            textseparator,
            -- s.mytaglist,
            icon_taglist,
            textseparator
            -- minimal_tasklist
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mypromptbox,
            -- textseparator,
            -- s.mytasklist,
            -- minimal_tasklist
            desktop_control
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mpdarc_widget,
            --textseparator,
            --volumebar_prefix,
            --volumebar_widget,
            --textseparator,
            --keyboardlayout_prefix,
            --mykeyboardlayout,
            --textseparator,
            -- s.systray,
            --minimal_tasklist,
            -- textseparator,
            --date_prefix,
            -- mytextdate,
            -- textseparator,
            --clock_prefix,
            -- mytextclock,
            -- textseparator,
            -- s.mylayoutbox,
            pad
        },
    }

    -- Only set them if they exist, else they overwrite the position variable
    if beautiful.wibar_x then
        s.mywibox.x = beautiful.wibar_x
    end
    if beautiful.wibar_y then
        s.mywibox.y = beautiful.wibar_y
    end

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = helpers.rbar(), type = "dock"})
    s.traybox.width = dpi(150)
    s.traybox.height = dpi(38)
    s.traybox.x = beautiful.screen_margin * 2
    -- s.traybox.x = s.geometry.width - s.traybox.width - beautiful.screen_margin * 2
    s.traybox.y = s.geometry.height - s.traybox.height - beautiful.screen_margin * 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
      -- wibox.widget.textbox("test"),
      pad,
      s.systray,
      pad,
      layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
                        -- Middle click - Hide traybox
                        awful.button({ }, 2, function ()
                            s.traybox.visible = false
                        end)
    ))

    -- TODO
--     s.mytaskwibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
--     s.mytaskwibox.x = s.mywibox.x
--     s.mytaskwibox.y = s.mywibox.y
--     s.mytaskwibox.visible = false
--     s.mytaskwibox:setup {
--       layout = wibox.layout.align.horizontal,
--       { -- Left widgets
--         layout = wibox.layout.fixed.horizontal,
--         s.mytasklist
--       },
--       { -- Middle widgets
--         layout = wibox.layout.fixed.horizontal,
--       },
--       { -- Right widgets
--         layout = wibox.layout.fixed.horizontal,
--         textseparator,
--         mytextclock,
--         textseparator,
--         pad
--       },
--     }

    -- awesome.connect_signal("dummy", function (c)
--                              if s.mywibox.visible then
--                                s.mytaskwibox.visible = true
--                                s.mywibox.visible = false
--                              else
--                                s.mywibox.visible = true
--                                s.mytaskwibox.visible = false
--                              end
--     end)
end)

