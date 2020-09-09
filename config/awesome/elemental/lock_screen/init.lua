local awful = require("awful")

local lock_screen = {}

local lua_pam_path = os.getenv("HOME").."/.config/awesome/liblua_pam.so"

lock_screen.authenticate = function (password)
    return password == user.lock_screen_custom_password
end

-- Switch authentication method to PAM if lua-pam has been
-- installed correctly
awful.spawn.easy_async_with_shell("stat "..lua_pam_path.." >/dev/null 2>&1", function (_, __, ___, exitcode)
    if exitcode == 0 then
        local pam = require("liblua_pam")
        -- lua-pam was installed.
        -- Authenticate with PAM
        lock_screen.authenticate = function (password)
            return pam.auth_current_user(password)
        end
    end
end)

lock_screen.init = function ()
    -- Load the lock_screen element
    require("elemental.lock_screen.lock_screen")
end

return lock_screen
