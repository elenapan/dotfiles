#!/usr/bin/env python
import i3ipc
import os

eww_manage=os.environ['HOME']+"/.config/eww/scripts/manage"

i3 = i3ipc.Connection()

def on_mode(i3, e):
    # 'default' means no mode is active
    # We also ignore modes that start with underscore
    if e.change == 'default' or e.change[:1] == '_':
        os.system(f"{eww_manage} hide mode-indicator")
    elif e.change[:1] != '_':
        os.system(f"eww update mode-current='{e.change}' && {eww_manage} show mode-indicator")

i3.on("mode", on_mode)

# For filtering per mode this could work too.
# def on_mode_apps(i3, e):
#     print('aaaaaaaaapps')
# i3.on("mode::apps", on_mode_apps)

i3.main()
