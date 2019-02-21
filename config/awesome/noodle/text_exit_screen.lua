local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helpers = require("helpers")
local pad = helpers.pad
local keygrabber = require("awful.keygrabber")

-- Appearance
local icon_size = beautiful.exit_screen_icon_size or 140
local text_font = beautiful.exit_screen_font or "sans 14"
local icon_font = "Typicons 90"
local poweroff_text_icon = ""
local reboot_text_icon = ""
local suspend_text_icon = ""
local exit_text_icon = ""
local lock_text_icon = ""

-- Commands
local poweroff_command = function()
  awful.spawn.with_shell("poweroff")
  awful.keygrabber.stop(exit_screen_grabber)
end
local reboot_command = function()
  awful.spawn.with_shell("reboot")
  awful.keygrabber.stop(exit_screen_grabber)
end
local suspend_command = function()
  awful.spawn.with_shell("systemctl suspend")
  -- awful.spawn.with_shell("i3lock & systemctl suspend")
  exit_screen_hide()
end
local exit_command = function()
  awesome.quit()
end
local lock_command = function()
  awful.spawn.with_shell("i3lock")
  exit_screen_hide()
end

local username = os.getenv("USER")
-- Capitalize username
local goodbye_widget = wibox.widget.textbox("Goodbye " .. username:sub(1,1):upper()..username:sub(2))
goodbye_widget.font = "sans 70"

local poweroff_icon = wibox.widget.textbox(poweroff_text_icon)
poweroff_icon.font = icon_font
poweroff_icon.markup = helpers.colorize_text(poweroff_icon.text, beautiful.xcolor1)
local poweroff_text = wibox.widget.textbox("Poweroff")
poweroff_text.font = text_font

local poweroff = wibox.widget{
  {
    nil,
    poweroff_icon,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  {
    pad(1),
    poweroff_text,
    pad(1),
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  -- forced_width = 100,
  layout = wibox.layout.fixed.vertical
}
poweroff:buttons(gears.table.join(
                 awful.button({ }, 1, function ()
                     poweroff_command()
                 end)
))

local reboot_icon = wibox.widget.textbox(reboot_text_icon)
reboot_icon.font = icon_font
reboot_icon.markup = helpers.colorize_text(reboot_icon.text, beautiful.xcolor2)
local reboot_text = wibox.widget.textbox("Reboot")
reboot_text.font = text_font

local reboot = wibox.widget{
  {
    nil,
    reboot_icon,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  {
    nil,
    reboot_text,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  -- forced_width = 100,
  layout = wibox.layout.fixed.vertical
}
reboot:buttons(gears.table.join(
                   awful.button({ }, 1, function ()
                       reboot_command()
                   end)
))

local suspend_icon = wibox.widget.textbox(suspend_text_icon)
suspend_icon.font = icon_font
suspend_icon.markup = helpers.colorize_text(suspend_icon.text, beautiful.xcolor3)
local suspend_text = wibox.widget.textbox("Suspend")
suspend_text.font = text_font

local suspend = wibox.widget{
  {
    nil,
    suspend_icon,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  {
    nil,
    suspend_text,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  -- forced_width = 100,
  layout = wibox.layout.fixed.vertical
}
suspend:buttons(gears.table.join(
                 awful.button({ }, 1, function ()
                     suspend_command()
                 end)
))


local exit_icon = wibox.widget.textbox(exit_text_icon)
exit_icon.font = icon_font
exit_icon.markup = helpers.colorize_text(exit_icon.text, beautiful.xcolor4)
local exit_text = wibox.widget.textbox("Exit")
exit_text.font = text_font

local exit = wibox.widget{
  {
    nil,
    exit_icon,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  {
    nil,
    exit_text,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  -- forced_width = 100,
  layout = wibox.layout.fixed.vertical
}
exit:buttons(gears.table.join(
                  awful.button({ }, 1, function ()
                      exit_command()
                  end)
))

local lock_icon = wibox.widget.textbox(lock_text_icon)
lock_icon.font = icon_font
lock_icon.markup = helpers.colorize_text(lock_icon.text, beautiful.xcolor5)
local lock_text = wibox.widget.textbox("Lock")
lock_text.font = text_font

local lock = wibox.widget{
  {
    nil,
    lock_icon,
    nil,
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  {
    pad(1),
    lock_text,
    pad(1),
    expand = "none",
    layout = wibox.layout.align.horizontal
  },
  -- forced_width = 100,
  layout = wibox.layout.fixed.vertical
}
lock:buttons(gears.table.join(
                   awful.button({ }, 1, function ()
                       lock_command()
                   end)
))

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Create the widget
exit_screen = wibox({x = 0, y = 0, visible = false, ontop = true, type = "dock", height = screen_height, width = screen_width})

exit_screen.bg = beautiful.exit_screen_bg or beautiful.wibar_bg or "#111111"
exit_screen.fg = beautiful.exit_screen_fg or beautiful.wibar_fg or "#FEFEFE"

-- Create an container box
-- local exit_screen_box = wibox.container.background()
-- exit_screen_box.bg = exit_screen.bg
-- exit_screen_box.shape = gears.shape.rounded_rect
-- exit_screen_box.shape_border_radius = 20

local exit_screen_grabber
function exit_screen_hide()
  awful.keygrabber.stop(exit_screen_grabber)
  exit_screen.visible = false
end
function exit_screen_show()
  exit_screen_grabber = awful.keygrabber.run(function(_, key, event)
      if event == "release" then return end

      if     key == 's'    then
        suspend_command()
      -- 'e' for exit
      elseif key == 'e'    then
        exit_command()
      elseif key == 'l'    then
        lock_command()
      elseif key == 'p'    then
        poweroff_command()
      elseif key == 'r'    then
        reboot_command()
      elseif key == 'Escape' or key == 'q' or key == 'x' then
        exit_screen_hide()
      -- else awful.keygrabber.stop(exit_screen_grabber)
      end
  end)
  exit_screen.visible = true
end

exit_screen:buttons(gears.table.join(
                 -- Middle click - Hide exit_screen
                 awful.button({ }, 2, function ()
                     exit_screen_hide()
                 end),
                 -- Right click - Hide exit_screen
                 awful.button({ }, 3, function ()
                     exit_screen_hide()
                 end)
))

-- Item placement
exit_screen:setup {
  nil,
  {
    {
      nil,
      goodbye_widget,
      nil,
      expand = "none",
      layout = wibox.layout.align.horizontal
    },
    {
      nil,
      {
        -- {
          poweroff,
          reboot,
          suspend,
          exit,
          lock,
          spacing = dpi(70),
          layout = wibox.layout.fixed.horizontal
        -- },
        -- widget = exit_screen_box
      },
      nil,
      expand = "none",
      layout = wibox.layout.align.horizontal
      -- layout = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.fixed.vertical
  },
  nil,
  expand = "none",
  layout = wibox.layout.align.vertical
}
