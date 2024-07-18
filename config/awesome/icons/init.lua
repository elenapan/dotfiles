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

local symbols = {
    -- 'Icomoon' font (filled variant)
    filled = {
        sun = "",
        moon = "",
        dcloud = "",
        ncloud = "",
        cloud = "",
        rain = "",
        storm = "",
        snow = "",
        mist = "",
        whatever = ""
    },
    -- 'Icomoon' font (outline variant)
    outline = {
        sun = "",
        moon = "",
        dcloud = "",
        ncloud = "",
        cloud = "",
        rain = "",
        storm = "",
        snow = "",
        mist = "",
        whatever = ""
    }
}

icons.text.weather = {}

-- Icon codes of openweathermap
icons.text.weather.outline = {
    ["01d"] = { symbol = symbols.outline.sun, color = x.color3 },
    ["01n"] = { symbol = symbols.outline.moon, color = x.color4 },
    ["02d"] = { symbol = symbols.outline.dcloud, color = x.color3 },
    ["02n"] = { symbol = symbols.outline.ncloud, color = x.color6 },
    ["03d"] = { symbol = symbols.outline.cloud, color = x.color1 },
    ["03n"] = { symbol = symbols.outline.cloud, color = x.color1 },
    ["04d"] = { symbol = symbols.outline.cloud, color = x.color1 },
    ["04n"] = { symbol = symbols.outline.cloud, color = x.color1 },
    ["09d"] = { symbol = symbols.outline.rain, color = x.color4 },
    ["09n"] = { symbol = symbols.outline.rain, color = x.color4 },
    ["10d"] = { symbol = symbols.outline.rain, color = x.color4 },
    ["10n"] = { symbol = symbols.outline.rain, color = x.color4 },
    ["11d"] = { symbol = symbols.outline.storm, color = x.color1 },
    ["11n"] = { symbol = symbols.outline.storm, color = x.color1 },
    ["13d"] = { symbol = symbols.outline.snow, color = x.color6 },
    ["13n"] = { symbol = symbols.outline.snow, color = x.color6 },
    ["40d"] = { symbol = symbols.outline.mist, color = x.color5 },
    ["40n"] = { symbol = symbols.outline.mist, color = x.color5 },
    ["50d"] = { symbol = symbols.outline.mist, color = x.color5 },
    ["50n"] = { symbol = symbols.outline.mist, color = x.color5 },
    ["_"] = { symbol = symbols.outline.whatever, color = x.color2 }
}

icons.text.weather.filled = {
    ["01d"] = { symbol = symbols.filled.sun, color = x.color3 },
    ["01n"] = { symbol = symbols.filled.moon, color = x.color4 },
    ["02d"] = { symbol = symbols.filled.dcloud, color = x.color3 },
    ["02n"] = { symbol = symbols.filled.ncloud, color = x.color6 },
    ["03d"] = { symbol = symbols.filled.cloud, color = x.color1 },
    ["03n"] = { symbol = symbols.filled.cloud, color = x.color1 },
    ["04d"] = { symbol = symbols.filled.cloud, color = x.color1 },
    ["04n"] = { symbol = symbols.filled.cloud, color = x.color1 },
    ["09d"] = { symbol = symbols.filled.rain, color = x.color4 },
    ["09n"] = { symbol = symbols.filled.rain, color = x.color4 },
    ["10d"] = { symbol = symbols.filled.rain, color = x.color4 },
    ["10n"] = { symbol = symbols.filled.rain, color = x.color4 },
    ["11d"] = { symbol = symbols.filled.storm, color = x.color1 },
    ["11n"] = { symbol = symbols.filled.storm, color = x.color1 },
    ["13d"] = { symbol = symbols.filled.snow, color = x.color6 },
    ["13n"] = { symbol = symbols.filled.snow, color = x.color6 },
    ["40d"] = { symbol = symbols.filled.mist, color = x.color5 },
    ["40n"] = { symbol = symbols.filled.mist, color = x.color5 },
    ["50d"] = { symbol = symbols.filled.mist, color = x.color5 },
    ["50n"] = { symbol = symbols.filled.mist, color = x.color5 },
    ["_"] = { symbol = symbols.filled.whatever, color = x.color2 }
}

icons.text.get_weather_icon = function(code, variant)
    return icons.text.weather[variant][code] or icons.text.weather[variant]["_"]
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
