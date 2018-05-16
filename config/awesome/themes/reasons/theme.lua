----------------------
-- My awesome theme --
----------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local icon_path = os.getenv("HOME") .. "/.config/awesome/themes/reasons/icons/"
local xrdb = xresources.get_current_theme()
local theme = dofile(themes_path.."default/theme.lua")
--local theme = {}

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/reasons/wall.png"
--theme.font          = "FantasqueSansMono NerdFont Bold 13"
theme.font          = "Mononoki NerdFont Bold 12"
--theme.font          = "Iosevka NerdFont Bold 12"
--theme.font          = "Input Mono Narrow Bold 12"
--theme.font          = "sans 8"

theme.bg_dark       = xrdb.background
theme.bg_normal     = xrdb.background
theme.bg_focus      = xrdb.background
theme.bg_urgent     = xrdb.background
theme.bg_minimize   = xrdb.color8
theme.bg_systray    = bg_dark

theme.accent = xrdb.color7

theme.fg_normal     = xrdb.color0
theme.fg_focus      = xrdb.color8
theme.fg_urgent     = xrdb.color1
theme.fg_minimize   = xrdb.color8

-- Titlebars
theme.titlebars_enabled = true
theme.titlebar_bg = xrdb.color0
--theme.titlebar_fg = xrdb.color7
-- Font size also changes titlebar height
theme.titlebar_font = "Mononoki NerdFont 15"

theme.focus_indicator = "  "

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(0)
theme.base_border_width  = theme.border_width
theme.border_normal = xrdb.background
theme.border_focus  = xrdb.background
theme.border_marked = xrdb.color3

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_border_width = theme.border_width
theme.notification_border_color = theme.bg_normal
theme.notification_bg = theme.bg_normal
theme.notification_fg = xrdb.color7
theme.notification_margin = dpi(20)
--theme.notification_opacity = 0.7
theme.notification_font = theme.font

-- Edge snap
theme.snap_bg = theme.bg_focus
if theme.border_width == 0 then
    theme.snap_border_width = dpi(8)
else
    theme.snap_border_width = theme.border_width	
end

-- Rounded corners
theme.border_radius = dpi(2)
theme.client_border_radius = theme.border_radius

-- Seperator
--theme.seperator_text = " | "
theme.seperator_text = " ~ "

-- Wibar
theme.wibar_position = "top"
theme.wibar_detached = true
theme.wibar_fg = xrdb.color7
--theme.wibar_opacity = 0.7
--theme.wibar_border_color = accent
--theme.wibar_border_width = dpi(2)
local screen_width = 1366
theme.wibar_width = screen_width - theme.useless_gap * 4
theme.wibar_height = dpi(35)
--theme.wibar_x = 
--theme.wibar_y = 

-- Widgets
theme.date_format = "%a %d %B"
theme.date_prefix = " "
theme.date_prefix_fg = xrdb.color8

theme.clock_format = "%H:%M"
theme.clock_prefix = " "
theme.clock_prefix_fg = xrdb.color8

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_minimize = theme.bg_normal
theme.tasklist_fg_minimize = theme.fg_minimize

-- Taglist
theme.taglist_bg_focus = theme.accent
theme.taglist_fg_focus = xrdb.background
theme.taglist_bg_occupied = bg_normal
theme.taglist_fg_occupied = xrdb.color7
theme.taglist_bg_empty = bg_normal
theme.taglist_fg_empty = xrdb.color8
theme.taglist_bg_urgent = bg_normal
theme.taglist_fg_urgent = xrdb.color1
theme.taglist_disable_icon = true
--theme.taglist_spacing = dpi(2)
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
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

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
theme = theme_assets.recolor_layout(theme, theme.accent)

-- Text instead of icons
-- Some nice symbols
--                         ﰦ
theme.layoutbox_font = "Iosevka NerdFont 15"
theme.layoutbox_forced_width = dpi(42)
theme.layoutbox_align = "right"
theme.layout_txt_tile       =   "  " 
theme.layout_txt_tileleft   =   "  "
theme.layout_txt_tilebottom =   "  "
theme.layout_txt_tiletop    =   "  "
theme.layout_txt_fairv      =   "  " --todo
theme.layout_txt_fairh      =   "  "
theme.layout_txt_spiral     =   "  " --todo
theme.layout_txt_dwindle    =   "  "
theme.layout_txt_max        =   "  "
theme.layout_txt_fullscreen =   "  " 
theme.layout_txt_magnifier  =   "  "
theme.layout_txt_floating   =   "  "
theme.layout_txt_cornernw   =   "  "
theme.layout_txt_cornerne   =   "  "
theme.layout_txt_cornersw   =   "  "
theme.layout_txt_cornerse   =   "  "

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
