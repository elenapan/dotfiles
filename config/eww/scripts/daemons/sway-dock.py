#!/usr/bin/env python3
import i3ipc
import os
import json
import sys

window_information = {
    "firefox": { "symbol": "", "color": "3" },
    "kitty": { "symbol": "", "color": "5" },
    "htop": { "symbol": "", "color": "2" },
    "btop": { "symbol": "", "color": "2" },
    "Sxiv": { "symbol": "", "color": "1" },
    "Nsxiv": { "symbol": "", "color": "1" },
    "nemo": { "symbol": "", "color": "3" },
    "chrome-discordapp.com__channels_@me-Default": { "symbol": "", "color": "4" },
    "chrome-chatgpt.com__-Default": { "symbol": "", "color": "2" },
    "lutris": { "symbol": "", "color": "6" },
    "net.lutris.Lutris": { "symbol": "", "color": "6" },
    "editor": { "symbol": "", "color": "5" },
    "scratchpad": { "symbol": "", "color": "1" },
    "scratchpad_input": { "symbol": "", "color": "3" },
    "gucharmap": { "symbol": "", "color": "2" },
    "steam": { "symbol": "", "color": "2" },
    "mpv": { "symbol": "", "color": "6" },
    "chromium-browser": { "symbol": "", "color": "4" },
    "org.chromium.Chromium": { "symbol": "", "color": "4" },
    "org.pwmt.zathura": { "symbol": "", "color": "3" },
    "Emacs": { "symbol": "", "color": "2" },
    "org": { "symbol": "", "color": "2" },
    "explorer.exe": { "symbol": "", "color": "4" },
    "appimagekit_3a48058ef277d45ae2228089429c0259-Telegram_Desktop": { "symbol": "", "color": "4" },
    "org.telegram.desktop": { "symbol": "", "color": "4" },
    "pavucontrol": { "symbol": "", "color": "4" },
    "org.pulseaudio.pavucontrol": { "symbol": "", "color": "4" },
    "chrome-open.spotify.com__-Default": { "symbol": "", "color": "2" },
    "Wine": { "symbol": "", "color": "1" },
    "chrome-mail.proton.me__-Default": { "symbol": "", "color": "6" },
    "Gimp": { "symbol": "", "color": "4" },
    "gimp": { "symbol": "", "color": "4" },
    "org.inkscape.Inkscape": { "symbol": "", "color": "2" },
    "deluge": { "symbol": "", "color": "1" },
    "___default___": { "symbol": "", "color": "10" },
}

# Key: window identifier
# Value: command to run
# Order matters
pinned_apps = {
    "firefox": "firefox",
    "chrome-discordapp.com__channels_@me-Default": "discord",
    "org": "org",
    "editor": "swaymsg exec '$cmd_editor'",
    "nemo": "nemo",
    "lutris": "lutris",
    "steam": "steam",
}

# ----------------------------------------

i3 = i3ipc.Connection()
eww_manage=os.environ['HOME']+"/.config/eww/scripts/manage"
window_counter = {}
dock_items = []
focused = ""
last = ""
recently_used = {}

def update_eww():
    dock_representation = []
    for window_identifier in pinned_apps:
        item = window_information.get(window_identifier) or window_information.get("___default___")
        if (window_identifier == focused):
            state = "focused"
        elif (window_counter.get(window_identifier) == None or window_counter.get(window_identifier) == 0):
            state = "empty"
        else:
            state = "unfocused"
        dock_representation.append({
            'identifier': window_identifier,
            'symbol': item['symbol'],
            'color': item['color'],
            'launcher': pinned_apps.get(window_identifier) or None,
            'recently_used_con_id': recently_used.get(window_identifier) or None,
            'state': state
        })

    for window_identifier in dock_items:
        if window_identifier in pinned_apps:
            continue
        item = window_information.get(window_identifier) or window_information.get("___default___")
        dock_representation.append({
            'identifier': window_identifier,
            'symbol': item['symbol'],
            'color': item['color'],
            'recently_used_con_id': recently_used.get(window_identifier) or None,
            'state': "focused" if (window_identifier == focused) else "unfocused"
        })
    os.system("eww update dock-items-json='%s'" % (json.dumps(dock_representation)))

def on_focus(i3, e):
    global focused
    window_identifier = e.container.app_id or e.container.window_class
    focused = window_identifier if window_identifier else ''
    recently_used[window_identifier] = e.container.id
    update_eww()

def on_workspace_focus(i3, e):
    global focused
    # If workspace is empty
    if (len(e.current.focus) == 0):
        focused = ""
    update_eww()

def on_new(i3, e):
    window_identifier = e.container.app_id or e.container.window_class
    window_counter[window_identifier] = (window_counter.get(window_identifier) or 0) + 1
    if (window_counter[window_identifier] == 1):
        dock_items.append(window_identifier)
    update_eww()

def on_close(i3, e):
    global focused
    window_identifier = e.container.app_id or e.container.window_class
    window_counter[window_identifier] = (window_counter.get(window_identifier) or 1) - 1
    if (window_counter[window_identifier] == 0 and window_identifier in dock_items):
        dock_items.remove(window_identifier)

    # If the container was focused before it died
    if (e.container.focused):
        focused = ""

    update_eww()

i3.on("window::focus", on_focus)
i3.on("window::new", on_new)
i3.on("window::close", on_close)
i3.on("workspace::focus", on_workspace_focus)

# Initial update
for con in i3.get_tree():
    window_identifier = con.app_id or con.window_class
    if (not window_identifier):
        continue
    window_counter[window_identifier] = (window_counter.get(window_identifier) or 0) + 1
    if (window_counter[window_identifier] > 1):
        continue
    dock_items.append(window_identifier)

update_eww()

if len(sys.argv) > 1 and sys.argv[1] == "oneshot":
    exit(0)

# Start the main loop and wait for events to come in.
i3.main()

