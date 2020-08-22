local awful = require("awful")

local lock_screen = {}

local lua_pam_path = os.getenv("HOME").."/.config/awesome/liblua_pam.so"

lock_screen.init = function ()
    -- Initialize authentication method based on whether lua-pam has been
    -- installed or not
    awful.spawn.easy_async_with_shell("stat "..lua_pam_path.." >/dev/null 2>&1", function (_, __, ___, exitcode)
        if exitcode == 0 then
            local pam = require("liblua_pam")
            -- lua-pam was installed.
            -- Authenticate with PAM
            lock_screen.authenticate = function (password)
                return pam.auth_current_user(password)
            end
        else
            -- lua-pam was NOT installed.
            -- Authenticate with user.lock_screen_custom_password
            lock_screen.authenticate = function (password)
                return password == user.lock_screen_custom_password
            end
        end

        -- Load the lock_screen element
        require("elemental.lock_screen.lock_screen")
    end)
end

return lock_screen
