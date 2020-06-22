#!/bin/bash
# -----
# Window switcher for AwesomeWM
# Uses rofi for fuzzy matching based on window name, class and tag.
# Author: elenapan @ github
# -----
# TODO: Sort by most recently used order
# -----

# Prints all windows in this specific format, one line per window:
# <window ID> [<tag>] ~ <class> ~ <name>
# The first column <window ID> will not be displayed in rofi
awesome_get_client_list() {
    awesome-client "
    local list = '\n'
    local capi = { screen = screen, client = client }
    for _, c in ipairs(capi.client.get()) do
        if c.class then
            list = list..c.window..' ['..c.first_tag.index..'] ~ '..c.class..' ~ '..c.name..'\n'
        end
    end
    return list
    " | sed '1,1d; $d'
}

# Jumps to the client which corresponds to the given window ID
awesome_jump_to_client() {
    awesome-client "
    local awful = require('awful')
    local win = function (c)
        return awful.rules.match(c, {window = $1})
    end
    for c in awful.client.iterate(win) do
        c:jump_to()
        break
    end
    "
}

# Save list of clients in a variable
clients="$(awesome_get_client_list)"

# Pass client list to rofi (except the first column which represents the
# window ID) and get the index of the user's choice
index="$(echo "$clients" | cut -f2- -d ' ' | rofi -p '❯' -dmenu -i -fuzzy -format d)"

# If user has not picked anything, exit
if [ ! $? -eq 0 ]; then
    exit 1
fi

# Get the window ID (first column) of the selected window and pass it to
# awesome_jump_to_client
awesome_jump_to_client "$(echo "$clients" | sed "${index}q;d" | awk '{print $1}')"
