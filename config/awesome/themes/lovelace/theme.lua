--
--   ██                            ██                          
--  ░██                           ░██                          
--  ░██  ██████  ██    ██  █████  ░██  ██████    █████   █████ 
--  ░██ ██░░░░██░██   ░██ ██░░░██ ░██ ░░░░░░██  ██░░░██ ██░░░██
--  ░██░██   ░██░░██ ░██ ░███████ ░██  ███████ ░██  ░░ ░███████
--  ░██░██   ░██ ░░████  ░██░░░░  ░██ ██░░░░██ ░██   ██░██░░░░ 
--  ███░░██████   ░░██   ░░██████ ███░░████████░░█████ ░░██████
--  ░░░  ░░░░░░     ░░     ░░░░░░ ░░░  ░░░░░░░░  ░░░░░   ░░░░░░

local theme_name = "lovelace"
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/icons/"
local layout_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/layout/"
local titlebar_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/titlebar/"
local weather_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/weather/"
local taglist_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/taglist/"
local tip = titlebar_icon_path --alias to save time/space
local xrdb = xresources.get_current_theme()
-- local theme = dofile(themes_path.."default/theme.lua")
local theme = {}

-- theme.tip = titlebar_icon_path -- NOT local so that scripts can access it

-- This is used to make it easier to align the panels in specific monitor positions
local awful = require("awful")
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Set theme wallpaper.
-- It won't change anything if you are using feh to set the wallpaper like I do.
theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wall.png"

-- Set the theme font. This is the font that will be used by default in menus, bars, titlebars etc.
-- theme.font          = "sans 11"
theme.font          = "monospace 11"

-- Get colors from .Xresources and set fallback colors
theme.xbackground = xrdb.background or "#1D1F28"
theme.xforeground = xrdb.foreground or "#FDFDFD"
theme.xcolor0 = xrdb.color0 or "#282A36"
theme.xcolor1 = xrdb.color1 or "#F37F97"
theme.xcolor2 = xrdb.color2 or "#5ADECD"
theme.xcolor3 = xrdb.color3 or "#F2A272"
theme.xcolor4 = xrdb.color4 or "#8897F4"
theme.xcolor5 = xrdb.color5 or "#C574DD"
theme.xcolor6 = xrdb.color6 or "#79E6F3"
theme.xcolor7 = xrdb.color7 or "#FDFDFD"
theme.xcolor8 = xrdb.color8 or "#414458"
theme.xcolor9 = xrdb.color9 or "#FF4971"
theme.xcolor10 = xrdb.color10 or  "#18E3C8"
theme.xcolor11 = xrdb.color11 or  "#FF8037"
theme.xcolor12 = xrdb.color12 or  "#556FFF"
theme.xcolor13 = xrdb.color13 or  "#B043D1"
theme.xcolor14 = xrdb.color14 or  "#3FDCEE"
theme.xcolor15 = xrdb.color15 or  "#BEBEC1"

-- Set some colors that are used frequently as local variables
local accent_color = theme.xcolor14
local focused_color = theme.xcolor14
local unfocused_color = theme.xcolor7
local urgent_color = theme.xcolor9

-- This is how to get other .Xresources values (beyond colors 0-15, or custom variables)
-- local cool_color = awesome.xrdb_get_value("", "color16")

theme.bg_dark       = theme.xbackground
theme.bg_normal     = theme.xbackground
theme.bg_focus      = theme.xbackground
theme.bg_urgent     = theme.xbackground
theme.bg_minimize   = theme.xcolor8
theme.bg_systray    = theme.xbackground

theme.fg_normal     = theme.xcolor7
theme.fg_focus      = focused_color
theme.fg_urgent     = urgent_color
theme.fg_minimize   = theme.xcolor8

-- Gaps
theme.useless_gap   = dpi(3)
-- This could be used to manually determine how far away from the
-- screen edge the bars / notifications should be.
theme.screen_margin = dpi(3)

-- Borders
theme.border_width  = dpi(0)
theme.border_color = theme.xcolor0
theme.border_normal = theme.xcolor0
theme.border_focus  = theme.xcolor0
-- Rounded corners
theme.border_radius = dpi(6)

-- Titlebars
-- (Titlebar items can be customized in titlebars.lua)
theme.titlebars_enabled = true
theme.titlebar_size = dpi(35)
theme.titlebar_title_enabled = false
theme.titlebar_font = theme.font
-- Window title alignment: left, right, center
theme.titlebar_title_align = "center"
-- Titlebar position: top, bottom, left, right
theme.titlebar_position = "top"
-- Use 4 titlebars around the window to imitate borders
theme.titlebars_imitate_borders = false
theme.titlebar_bg = theme.xcolor0
-- theme.titlebar_bg_focus = theme.xcolor5
-- theme.titlebar_bg_normal = theme.xcolor13
theme.titlebar_fg_focus = theme.xcolor7
theme.titlebar_fg_normal = theme.xcolor15
--theme.titlebar_fg = theme.xcolor7

-- Notifications
-- Position: bottom_left, bottom_right, bottom_middle,
--         top_left, top_right, top_middle
theme.notification_position = "top_right" -- BUG: some notifications appear at top_right regardless
theme.notification_border_width = dpi(0)
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = theme.xcolor10
theme.notification_bg = theme.xbackground
theme.notification_fg = theme.xcolor7
theme.notification_crit_bg = urgent_color
theme.notification_crit_fg = theme.xcolor0
theme.notification_icon_size = dpi(100)
-- theme.notification_height = dpi(80)
-- theme.notification_width = dpi(300)
theme.notification_margin = dpi(15)
theme.notification_opacity = 1
theme.notification_font = theme.font
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 2

-- Edge snap
theme.snap_bg = theme.bg_focus
if theme.border_width == 0 then
    theme.snap_border_width = dpi(8)
else
    theme.snap_border_width = dpi(theme.border_width * 2)
end
-- Doesnt work with 4.2, need awesome-git?
--theme.snapper_gap = theme.useless_gap

-- Tag names
theme.tagnames = {
  "1",    -- tag 1
  "2",    -- tag 2
  "3",    -- tag 3
  "4",    -- tag 4
  "5",    -- tag 5
  "6",    -- tag 6
  "7",    -- tag 7
  "8",    -- tag 8
  "9",    -- tag 9
  "10"    -- tag 10
}

-- Widget separator
theme.separator_text = "|"
--theme.separator_text = " :: "
--theme.separator_text = " • "
-- theme.separator_text = " •• "
theme.separator_fg = theme.xcolor8

-- Wibar(s)
-- (Bar items can be customized in bars.lua)
theme.wibar_position = "bottom"
theme.wibar_detached = false
theme.wibar_height = dpi(45)
theme.wibar_fg = theme.xcolor7
theme.wibar_bg = theme.xcolor0 .. "00"
--theme.wibar_opacity = 0.7
theme.wibar_border_color = theme.xcolor0
theme.wibar_border_width = dpi(0)
theme.wibar_border_radius = dpi(0)
theme.wibar_border_radius = theme.border_radius
--theme.wibar_width = screen_width - theme.screen_margin * 4 -theme.wibar_border_width * 2
theme.wibar_width = dpi(565)
--theme.wibar_x = screen_width / 2 - theme.wibar_width - theme.screen_margin * 2
--theme.wibar_x = theme.screen_margin * 2
--theme.wibar_x = screen_width - theme.wibar_width - theme.wibar_border_width * 2 - theme.screen_margin * 2
--theme.wibar_y = theme.screen_margin * 2

-- Widgets
theme.prefix_fg = theme.xcolor8

 --There are other variable sets
 --overriding the default one when
 --defined, the sets are:
 --taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
 --tasklist_[bg|fg]_[focus|urgent]
 --titlebar_[bg|fg]_[normal|focus]
 --tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
 --mouse_finder_[color|timeout|animate_timeout|radius|factor]
 --prompt_[fg|bg|fg_cursor|bg_cursor|font]
 --hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
 --Example:
--theme.taglist_bg_focus = "#ff0000"

 --Tasklist
theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = theme.xcolor0 .. "00"
theme.tasklist_fg_focus = focused_color
theme.tasklist_bg_normal = theme.xcolor0 .. "00"
theme.tasklist_fg_normal = unfocused_color
theme.tasklist_bg_minimize = theme.xcolor0 .. "00"
theme.tasklist_fg_minimize = theme.fg_minimize
theme.tasklist_bg_urgent = theme.xcolor0 .. "00"
theme.tasklist_fg_urgent = urgent_color
theme.tasklist_spacing = dpi(5)
theme.tasklist_align = "center"

-- Sidebar
-- (Sidebar items can be customized in sidebar.lua)
theme.sidebar_bg = theme.xbackground
theme.sidebar_bg_alt = theme.xcolor0
theme.sidebar_fg = theme.xcolor7
theme.sidebar_opacity = 1
theme.sidebar_position = "left" -- left or right
theme.sidebar_width = dpi(300)
theme.sidebar_height = screen_height
theme.sidebar_y = 0
theme.sidebar_border_radius = dpi(0)
theme.sidebar_hide_on_mouse_leave = true
theme.sidebar_show_on_mouse_edge = true

-- Exit screen
theme.exit_screen_bg = theme.xcolor0 .. "CC"
theme.exit_screen_fg = theme.xcolor7
theme.exit_screen_font = "sans 20"
theme.exit_screen_icon_size = dpi(180)

-- Other icons (mostly used in sidebar and menu)
theme.playerctl_toggle_icon = icon_path .. "playerctl_toggle.png"
theme.playerctl_prev_icon = icon_path .. "playerctl_prev.png"
theme.playerctl_next_icon = icon_path .. "playerctl_next.png"
theme.stats_icon = icon_path .. "stats.png"
theme.search_icon = icon_path .. "search.png"
theme.volume_icon = icon_path .. "volume.png"
theme.muted_icon = icon_path .. "muted.png"
theme.mpd_icon = icon_path .. "mpd.png"
theme.firefox_icon = icon_path .. "firefox.png"
theme.youtube_icon = icon_path .. "youtube.png"
theme.reddit_icon = icon_path .. "reddit.png"
theme.discord_icon = icon_path .. "discord.png"
theme.telegram_icon = icon_path .. "telegram.png"
theme.steam_icon = icon_path .. "steam.png"
theme.lutris_icon = icon_path .. "lutris.png"
theme.files_icon = icon_path .. "files.png"
theme.manual_icon = icon_path .. "manual.png"
theme.keyboard_icon = icon_path .. "keyboard.png"
theme.appearance_icon = icon_path .. "appearance.png"
theme.editor_icon = icon_path .. "editor.png"
theme.redshift_icon = icon_path .. "redshift.png"
theme.gimp_icon = icon_path .. "gimp.png"
theme.terminal_icon = icon_path .. "terminal.png"
theme.mail_icon = icon_path .. "mail.png"
theme.music_icon = icon_path .. "music.png"
theme.temperature_icon = icon_path .. "temperature.png"
theme.battery_icon = icon_path .. "battery.png"
theme.battery_charging_icon = icon_path .. "battery_charging.png"
theme.cpu_icon = icon_path .. "cpu.png"
theme.compositor_icon = icon_path .. "compositor.png"
theme.start_icon = icon_path .. "start.png"
theme.ram_icon = icon_path .. "ram.png"
theme.screenshot_icon = icon_path .. "screenshot.png"
theme.home_icon = icon_path .. "home.png"
theme.alarm_icon = icon_path .. "alarm.png"

-- Weather icons
theme.cloud_icon = weather_icon_path .. "cloud.png"
theme.dcloud_icon = weather_icon_path .. "dcloud.png"
theme.ncloud_icon = weather_icon_path .. "ncloud.png"
theme.sun_icon = weather_icon_path .. "sun.png"
theme.star_icon = weather_icon_path .. "star.png"
theme.rain_icon = weather_icon_path .. "rain.png"
theme.snow_icon = weather_icon_path .. "snow.png"
theme.mist_icon = weather_icon_path .. "mist.png"
theme.storm_icon = weather_icon_path .. "storm.png"
theme.whatever_icon = weather_icon_path .. "whatever.png"

-- Exit screen icons
theme.exit_icon = icon_path .. "exit.png"
theme.poweroff_icon = icon_path .. "poweroff.png"
theme.reboot_icon = icon_path .. "reboot.png"
theme.suspend_icon = icon_path .. "suspend.png"
theme.lock_icon = icon_path .. "lock.png"
-- theme.hibernate_icon = icon_path .. "hibernate.png"

-- Icon taglist
local ntags = 10
theme.taglist_icons_empty = {}
theme.taglist_icons_occupied = {}
theme.taglist_icons_focused = {}
theme.taglist_icons_urgent = {}
-- table.insert(tag_icons, tag)
for i = 1, ntags do
  theme.taglist_icons_empty[i] = taglist_icon_path .. tostring(i) .. "_empty.png"
  theme.taglist_icons_occupied[i] = taglist_icon_path .. tostring(i) .. "_occupied.png"
  theme.taglist_icons_focused[i] = taglist_icon_path .. tostring(i) .. "_focused.png"
  theme.taglist_icons_urgent[i] = taglist_icon_path .. tostring(i) .. "_urgent.png"
end

-- Prompt
theme.prompt_fg = accent_color

-- Text Taglist
theme.taglist_font = "Iosevka Nerd Font 12"
-- theme.taglist_font = theme.font
theme.taglist_bg_focus = theme.xcolor0 .. "00"
theme.taglist_fg_focus = theme.xcolor14
theme.taglist_bg_occupied = theme.xcolor0 .. "00"
theme.taglist_fg_occupied = theme.xcolor4
theme.taglist_bg_empty = theme.xcolor0 .. "00"
theme.taglist_fg_empty = theme.xcolor8
theme.taglist_bg_urgent = theme.xcolor0 .. "00"
theme.taglist_fg_urgent = urgent_color
theme.taglist_disable_icon = true
theme.taglist_spacing = dpi(0)
--theme.taglist_item_roundness = 0
theme.taglist_item_roundness = theme.border_radius
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming the menu:
theme.menu_submenu_icon = icon_path.."submenu.png"
theme.menu_height = dpi(35)
theme.menu_width  = dpi(180)
theme.menu_bg_normal = theme.xcolor0
theme.menu_fg_normal= theme.xcolor7
theme.menu_bg_focus = theme.xcolor8 .. "55"
theme.menu_fg_focus= theme.xcolor7
theme.menu_border_width = dpi(0)
theme.menu_border_color = theme.xcolor0

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Titlebar buttons
-- Define the images to load
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus  = tip .. "close_focus.svg"
theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus  = tip .. "minimize_focus.svg"
theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = tip .. "ontop_focus_active.svg"
theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = tip .. "sticky_focus_active.svg"
theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = tip .. "floating_focus_active.svg"
theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = tip .. "maximized_focus_active.svg"
-- (hover)
theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover  = tip .. "close_focus_hover.svg"
theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover  = tip .. "minimize_focus_hover.svg"
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = tip .. "ontop_focus_active_hover.svg"
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover  = tip .. "sticky_focus_active_hover.svg"
theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover  = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover  = tip .. "floating_focus_active_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = tip .. "maximized_focus_active_hover.svg"

-- You can use your own layout icons like this:
theme.layout_fairh = layout_icon_path .. "fairh.png"
theme.layout_fairv = layout_icon_path .. "fairv.png"
theme.layout_floating  = layout_icon_path .. "floating.png"
theme.layout_magnifier = layout_icon_path .. "magnifier.png"
theme.layout_max = layout_icon_path .. "max.png"
theme.layout_fullscreen = layout_icon_path .. "fullscreen.png"
theme.layout_tilebottom = layout_icon_path .. "tilebottom.png"
theme.layout_tileleft   = layout_icon_path .. "tileleft.png"
theme.layout_tile = layout_icon_path .. "tile.png"
theme.layout_tiletop = layout_icon_path .. "tiletop.png"
theme.layout_spiral  = layout_icon_path .. "spiral.png"
theme.layout_dwindle = layout_icon_path .. "dwindle.png"
theme.layout_cornernw = layout_icon_path .. "cornernw.png"
theme.layout_cornerne = layout_icon_path .. "cornerne.png"
theme.layout_cornersw = layout_icon_path .. "cornersw.png"
theme.layout_cornerse = layout_icon_path .. "cornerse.png"

-- Recolor layout icons
--theme = theme_assets.recolor_layout(theme, theme.xcolor1)

-- Noodle widgets customization --
-- Desktop mode widget variables
-- Symbols     
-- theme.desktop_mode_color_floating = theme.xcolor4
-- theme.desktop_mode_color_tile = theme.xcolor3
-- theme.desktop_mode_color_max = theme.xcolor1
-- theme.desktop_mode_text_floating = "f"
-- theme.desktop_mode_text_tile = "t"
-- theme.desktop_mode_text_max = "m"

-- Minimal tasklist widget variables
theme.minimal_tasklist_visible_clients_color = focused_color
theme.minimal_tasklist_visible_clients_text = "+ "
theme.minimal_tasklist_hidden_clients_color = theme.xcolor8
theme.minimal_tasklist_hidden_clients_text = " - "

-- Mpd song
theme.mpd_song_title_color = theme.xcolor7
theme.mpd_song_artist_color = theme.xcolor7
theme.mpd_song_paused_color = theme.xcolor8

-- Volume bar
theme.volume_bar_active_color = theme.xcolor6
theme.volume_bar_active_background_color = theme.xcolor6 .. "33"
theme.volume_bar_muted_color = theme.xcolor8
theme.volume_bar_muted_background_color = theme.xcolor8 .. "33"

-- Temperature bar
theme.temperature_bar_active_color = theme.xcolor1
theme.temperature_bar_background_color = theme.xcolor1 .. "33"

-- Battery bar
theme.battery_bar_active_color = theme.xcolor5
theme.battery_bar_background_color = theme.xcolor5 .. "33"

-- CPU bar
theme.cpu_bar_active_color = theme.xcolor2
theme.cpu_bar_background_color = theme.xcolor2 .. "33"

-- RAM bar
theme.ram_bar_active_color = theme.xcolor12
theme.ram_bar_background_color = theme.xcolor12 .. "33"

-- Brightness bar
theme.brightness_bar_active_color = theme.xcolor11
theme.brightness_bar_background_color = theme.xcolor11 .. "33"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Numix"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
