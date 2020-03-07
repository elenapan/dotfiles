local awful = require("awful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme_name = "manta"
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/icons/"
local titlebar_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/titlebar/"
local tip = titlebar_icon_path --alias to save time
local xrdb = xresources.get_current_theme()
local theme = dofile(themes_path.."default/theme.lua")
--local theme = {}

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wall.png"
theme.font          = "monospace 12"
--theme.font          = "sans-serif 12"

local accent_color = x.color14
local focused_color = x.color14
local unfocused_color = x.color7
local urgent_color = x.color11
local backdrop_color = x.color16

theme.bg_dark       = x.background
theme.bg_normal     = x.background
theme.bg_focus      = x.background
theme.bg_urgent     = x.background
theme.bg_minimize   = x.color8
theme.bg_systray    = bg_dark

theme.fg_normal     = x.color7
theme.fg_focus      = focused_color
theme.fg_urgent     = urgent_color
theme.fg_minimize   = x.color8

-- Gaps
theme.useless_gap   = dpi(5)
-- This is used to manually determine how far away from the
-- screen edge the bars should be (if they are detached)
theme.screen_margin = dpi(5)

-- Borders
theme.border_width  = dpi(0)
theme.border_normal = x.color0
theme.border_focus  = x.color0
-- Rounded corners
theme.border_radius = dpi(6)

-- Titlebars
theme.titlebars_enabled = true
theme.titlebar_size = dpi(32)
theme.titlebar_title_enabled = false
theme.titlebar_font = theme.font -- BUG: Uses theme.font regardless
-- Window title alignment: left, right, center
theme.titlebar_title_align = "center"
-- Titlebar position: top, bottom, left, right
theme.titlebar_position = "top"
theme.titlebar_bg = x.color7
-- theme.titlebar_bg_focus = x.color5
-- theme.titlebar_bg_normal = x.color13
theme.titlebar_fg_focus = x.color7
theme.titlebar_fg_normal = x.color15
--theme.titlebar_fg = x.color7

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Values: bottom_left, bottom_right, bottom_middle,
--         top_left, top_right, top_middle
theme.notification_position = "top_right"
theme.notification_border_width = 0
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = x.color10
theme.notification_bg = x.color7
theme.notification_fg = x.color0
theme.notification_crit_bg = urgent_color
theme.notification_crit_fg = x.color0
theme.notification_margin = dpi(15)
theme.notification_icon_size = dpi(50)
--theme.notification_height = dpi(80)
--theme.notification_width = dpi(300)
--theme.notification_opacity = 0.7
theme.notification_font = theme.font
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 2

-- Edge snap
theme.snap_bg = theme.bg_focus
if theme.border_width == 0 then
    theme.snap_border_width = dpi(8)
else
    theme.snap_border_width = theme.border_width * 2
end

-- Tag names
-- Symbols:           
local symb = "  "
theme.tagnames = { symb, symb, symb, symb, symb, symb, symb, symb, symb, symb }
-- Substitutes:   
-- Nature:         
--theme.tagnames = { "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }
--theme.tagnames = { " i ", " ii ", " iii ", " iv ", " v ", " vi ", " vii ", " viii ", " ix ", " x " }

-- Widget separator
--theme.separator_text = " / "
--theme.separator_text = " / "
--theme.separator_text = " ) ( "
--theme.separator_text = "  "
--theme.separator_text = " | "
--theme.separator_text = " "
--theme.separator_text = " :: "
--theme.separator_text = " ⠐ "
--theme.separator_text = " • "
--theme.separator_text = " •• "
--theme.separator_text = "  "
theme.separator_text = "  "
theme.separator_fg = x.color8

-- Wibar
theme.wibar_position = "bottom"
theme.wibar_height = dpi(40)
theme.wibar_fg = x.color0
theme.wibar_bg = x.color7
--theme.wibar_opacity = 0.7
theme.wibar_border_color = x.color0
theme.wibar_border_width = 0
theme.wibar_border_radius = theme.border_radius
--theme.wibar_width = screen_width - theme.screen_margin * 4 -theme.wibar_border_width * 2
theme.wibar_width = 885
--theme.wibar_x = screen_width / 2 - theme.wibar_width - theme.screen_margin * 2
--theme.wibar_x = theme.screen_margin * 2
--theme.wibar_x = screen_width - theme.wibar_width - theme.wibar_border_width * 2 - theme.screen_margin * 2
--theme.wibar_y = theme.screen_margin * 2

-- Widgets
theme.prefix_fg = x.color8

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
theme.tasklist_bg_focus = x.color0 .. "00"
theme.tasklist_fg_focus = focused_color
theme.tasklist_bg_normal = x.color0 .. "00"
theme.tasklist_fg_normal = unfocused_color
theme.tasklist_bg_minimize = x.color0 .. "00"
theme.tasklist_fg_minimize = theme.fg_minimize
theme.tasklist_bg_urgent = x.color0 .. "00"
theme.tasklist_fg_urgent = urgent_color
theme.tasklist_spacing = 5
theme.tasklist_align = "center"

-- Prompt
theme.prompt_fg = accent_color

-- Taglist
theme.taglist_font = theme.font
theme.taglist_bg_focus = x.color0 .. "00"
theme.taglist_fg_focus = x.color9
theme.taglist_bg_occupied = x.color0 .. "00"
theme.taglist_fg_occupied = x.color1
theme.taglist_bg_empty = x.color0 .. "00"
theme.taglist_fg_empty = x.color15
theme.taglist_bg_urgent = x.color0 .. "00"
theme.taglist_fg_urgent = urgent_color
theme.taglist_disable_icon = true
theme.taglist_spacing = dpi(0)
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = icon_path.."submenu.svg"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(200)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the images to load
theme.titlebar_close_button_normal = tip .. "button_normal.svg"
theme.titlebar_close_button_focus  = tip .. "button_focus.svg"
theme.titlebar_minimize_button_normal = tip .. "button_normal.svg"
theme.titlebar_minimize_button_focus  = tip .. "button_focus.svg"
theme.titlebar_ontop_button_normal_inactive = tip .. "button_normal.svg"
theme.titlebar_ontop_button_focus_inactive  = tip .. "button_focus.svg"
theme.titlebar_ontop_button_normal_active = tip .. "button_normal.svg"
theme.titlebar_ontop_button_focus_active  = tip .. "button_focus.svg"
theme.titlebar_sticky_button_normal_inactive = tip .. "button_normal.svg"
theme.titlebar_sticky_button_focus_inactive  = tip .. "button_focus.svg"
theme.titlebar_sticky_button_normal_active = tip .. "button_normal.svg"
theme.titlebar_sticky_button_focus_active  = tip .. "button_focus.svg"
theme.titlebar_floating_button_normal_inactive = tip .. "button_normal.svg"
theme.titlebar_floating_button_focus_inactive  = tip .. "button_focus.svg"
theme.titlebar_floating_button_normal_active = tip .. "button_normal.svg"
theme.titlebar_floating_button_focus_active  = tip .. "button_focus.svg"
theme.titlebar_maximized_button_normal_inactive = tip .. "button_normal.svg"
theme.titlebar_maximized_button_focus_inactive  = tip .. "button_focus.svg"
theme.titlebar_maximized_button_normal_active = tip .. "button_normal.svg"
theme.titlebar_maximized_button_focus_active  = tip .. "button_focus.svg"
-- (hover)
theme.titlebar_close_button_normal_hover = tip .. "button_hover.svg"
theme.titlebar_close_button_focus_hover  = tip .. "button_hover.svg"
theme.titlebar_minimize_button_normal_hover = tip .. "button_hover.svg"
theme.titlebar_minimize_button_focus_hover  = tip .. "button_hover.svg"
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "button_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = tip .. "button_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "button_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = tip .. "button_hover.svg"
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "button_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = tip .. "button_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "button_hover.svg"
theme.titlebar_sticky_button_focus_active_hover  = tip .. "button_hover.svg"
theme.titlebar_floating_button_normal_inactive_hover = tip .. "button_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover  = tip .. "button_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "button_hover.svg"
theme.titlebar_floating_button_focus_active_hover  = tip .. "button_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "button_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "button_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "button_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = tip .. "button_hover.svg"

-- You can use your own layout icons like this:
theme.layout_fairh = icon_path .. "fairh.png"
theme.layout_fairv = icon_path .. "fairv.png"
theme.layout_floating  = icon_path .. "floating.png"
theme.layout_magnifier = icon_path .. "magnifier.png"
theme.layout_max = icon_path .. "max.png"
theme.layout_fullscreen = icon_path .. "fullscreen.png"
theme.layout_tilebottom = icon_path .. "tilebottom.png"
theme.layout_tileleft   = icon_path .. "tileleft.png"
theme.layout_tile = icon_path .. "tile.png"
theme.layout_tiletop = icon_path .. "tiletop.png"
theme.layout_spiral  = icon_path .. "spiral.png"
theme.layout_dwindle = icon_path .. "dwindle.png"
theme.layout_cornernw = icon_path .. "cornernw.png"
theme.layout_cornerne = icon_path .. "cornerne.png"
theme.layout_cornersw = icon_path .. "cornersw.png"
theme.layout_cornerse = icon_path .. "cornerse.png"

-- Recolor layout icons
--theme = theme_assets.recolor_layout(theme, x.color1)

-- Desktop mode widget variables
-- Symbols     
theme.desktop_mode_color_floating = x.color4
theme.desktop_mode_color_tile = x.color4
theme.desktop_mode_color_max = x.color3
theme.desktop_mode_text_floating = ""
theme.desktop_mode_text_tile = ""
theme.desktop_mode_text_max = ""
-- Minimal tasklist widget variables
theme.minimal_tasklist_visible_clients_color = focused_color
theme.minimal_tasklist_visible_clients_text = "  "
theme.minimal_tasklist_hidden_clients_color = x.color8
theme.minimal_tasklist_hidden_clients_text = "  "

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Numix"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
