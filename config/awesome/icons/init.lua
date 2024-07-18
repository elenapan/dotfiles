local gears = require("gears")

local function file_exists(path)
    -- Try to open it
    local f = io.open(path)
    if f then
        f:close()
        return true
    end
    return false
end

local icons = {}
icons.image = {}
icons.text = {}

-- 'Icomoon' font (filled variant)
local sun_icon = ""
local moon_icon = ""
local dcloud_icon = ""
local ncloud_icon = ""
local cloud_icon = ""
local rain_icon = ""
local storm_icon = ""
local snow_icon = ""
local mist_icon = ""
local whatever_icon = ""

-- Icon codes of openweathermap
icons.text.weather = {
    ["01d"] = { symbol = sun_icon, color = x.color3 },
    ["01n"] = { symbol = moon_icon, color = x.color4 },
    ["02d"] = { symbol = dcloud_icon, color = x.color3 },
    ["02n"] = { symbol = ncloud_icon, color = x.color6 },
    ["03d"] = { symbol = cloud_icon, color = x.color1 },
    ["03n"] = { symbol = cloud_icon, color = x.color1 },
    ["04d"] = { symbol = cloud_icon, color = x.color1 },
    ["04n"] = { symbol = cloud_icon, color = x.color1 },
    ["09d"] = { symbol = rain_icon, color = x.color4 },
    ["09n"] = { symbol = rain_icon, color = x.color4 },
    ["10d"] = { symbol = rain_icon, color = x.color4 },
    ["10n"] = { symbol = rain_icon, color = x.color4 },
    ["11d"] = { symbol = storm_icon, color = x.color1 },
    ["11n"] = { symbol = storm_icon, color = x.color1 },
    ["13d"] = { symbol = snow_icon, color = x.color6 },
    ["13n"] = { symbol = snow_icon, color = x.color6 },
    ["40d"] = { symbol = mist_icon, color = x.color5 },
    ["40n"] = { symbol = mist_icon, color = x.color5 },
    ["50d"] = { symbol = mist_icon, color = x.color5 },
    ["50n"] = { symbol = mist_icon, color = x.color5 },
    ["_"] = { symbol = whatever_icon, color = x.color2 }
}

icons.text.get_weather_icon = function(code)
    return icons.text.weather[code] or icons.text.weather["_"]
end

-- Set up text symbols and accent colors to be used in tasklists or docks
-- instead of awful.widget.clienticon
-- Based on the client's `class` property
-- TODO Ability to match using rules instead of just class
icons.text.by_class = {
    -- Terminals
    ['kitty'] = { symbol = "", color = x.color5 },
    ['Alacritty'] = { symbol = "", color = x.color5 },
    ['Termite'] = { symbol = "", color = x.color5 },
    ['URxvt'] = { symbol = "", color = x.color5 },
    ['st'] = { symbol = "", color = x.color5 },
    ['st-256color'] = { symbol = "", color = x.color5 },

    -- Image viewers
    ['feh'] = { symbol = "", color = x.color1 },
    ['Sxiv'] = { symbol = "", color = x.color1 },

    -- General
    ['TelegramDesktop'] = { symbol = "", color = x.color4 },
    ['Firefox'] = { symbol = "", color = x.color3 },
    ['firefox'] = { symbol = "", color = x.color3 },
    ['Nightly'] = { symbol = "", color = x.color4 },
    ['Chromium'] = { symbol = "", color = x.color4 },
    ['Chromium-browser'] = { symbol = "", color = x.color4 },
    ['Steam'] = { symbol = "", color = x.color2 },
    ['Lutris'] = { symbol = "", color = x.color6 },
    ['editor'] = { symbol = "", color = x.color5 },
    ['Emacs'] = { symbol = "", color = x.color2 },
    ['email'] = { symbol = "", color = x.color6 },
    ['music'] = { symbol = "", color = x.color6 },
    ['mpv'] = { symbol = "", color = x.color6 },
    ['KeePassXC'] = { symbol = "", color = x.color1 },
    ['Gucharmap'] = { symbol = "", color = x.color6 },
    ['Pavucontrol'] = { symbol = "", color = x.color4 },
    ['htop'] = { symbol = "", color = x.color2 },
    ['Screenruler'] = { symbol = "", color = x.color3 },
    ['Galculator'] = { symbol = "", color = x.color2 },
    ['Zathura'] = { symbol = "", color = x.color2 },
    ['Qemu-system-x86_64'] = { symbol = "", color = x.color3 },
    ['Wine'] = { symbol = "", color = x.color1 },
    ['markdown_input'] = { symbol = "", color = x.color2 },
    ['scratchpad'] = { symbol = "", color = x.color1 },
    ['weechat'] = { symbol = "", color = x.color5 },
    ['discord'] = { symbol = "", color = x.color5 },
    ['6cord'] = { symbol = "", color = x.color3 },
    ['libreoffice-writer'] = { symbol = "", color = x.color4 },
    ['libreoffice-calc'] = { symbol = "", color = x.color2 },
    ['libreoffice-impress'] = { symbol = "", color = x.color1 },
    ['Godot'] = { symbol = "", color = x.color4 },

    -- File managers
    ['Thunar'] = { symbol = "", color = x.color3 },
    ['Nemo'] = { symbol = "", color = x.color3 },
    ['files'] = { symbol = "", color = x.color3 },

    ['Gimp'] = { symbol = "", color = x.color4 },
    ['Inkscape'] = { symbol = "", color = x.color2 },
    ['Gpick'] = { symbol = "", color = x.color6 },

    -- Default
    ['_'] = { symbol = "", color = x.color7.."99" }
}

-- Available icons
local image_icon_names = {
    "playerctl_toggle",
    "playerctl_prev",
    "playerctl_next",
    "stats",
    "search",
    "volume",
    "muted",
    "firefox",
    "youtube",
    "reddit",
    "discord",
    "telegram",
    "steam",
    "games",
    "files",
    "manual",
    "keyboard",
    "appearance",
    "editor",
    "redshift",
    "gimp",
    "terminal",
    "mail",
    "music",
    "temperature",
    "battery",
    "battery_charging",
    "cpu",
    "compositor",
    "start",
    "ram",
    "screenshot",
    "home",
    "alarm",
    "alarm_off",
    "alert",
    "submenu",
    -- Weather icons
    "cloud",
    "dcloud",
    "ncloud",
    "sun",
    "star",
    "rain",
    "snow",
    "mist",
    "storm",
    "whatever",
    -- Exit screen icons
    "exit",
    "poweroff",
    "reboot",
    "suspend",
    "lock",
}

-- Path to icons
local p

-- Assumes all the icon files end in .png
-- TODO maybe automatically detect icons in icon theme directory
local function set_image_icon(icon_name)
    local i = p..icon_name..".png"
    icons.image[icon_name] = i
end

-- Set all the icon variables
function icons.init(theme_name)
    -- Set the path to image icons
    p = gears.filesystem.get_configuration_dir().."icons/"..theme_name.."/"

    for i = 1, #image_icon_names do
        set_image_icon(image_icon_names[i])
    end

    -- Set symbols and accent colors for text icons
end

return icons
