#!/usr/bin/env python3
# Adapted from: https://github.com/altdesktop/i3ipc-python/blob/master/examples/tiling-indicator.py
import i3ipc
import os
import threading

i3 = i3ipc.Connection()
last = ""

eww_manage=os.environ['HOME']+"/.config/eww/scripts/manage"

def eww_split_indicator_hide():
    os.system(eww_manage+" hide split-indicator")

autohide_delay = 1.5 # seconds
timer = threading.Timer(autohide_delay, eww_split_indicator_hide)
def reset_timer():
    global timer
    timer.cancel()
    timer = threading.Timer(autohide_delay, eww_split_indicator_hide)
    timer.start()
reset_timer()

def eww_split_indicator_show():
    global timer
    reset_timer()
    os.system(eww_manage+" show split-indicator")

def on_event(i3, e):
    global last
    focused = i3.get_tree().find_focused()
    if not (hasattr(focused, "parent")):
        return
    layout = focused.parent.layout
    if layout == "output":
        # Empty workspace
        layout = focused.workspace().layout
    if layout != last:
        os.system("eww update split-direction='%s'" % layout)
        reset_timer()
    last = layout

def on_tick(i3, e):
    if e.payload == "split":
        eww_split_indicator_show()
        on_event(i3, e)

# Subscribe to events
i3.on("window::focus", on_event)
# i3.on("binding", on_event)
# Custom event emitted by splitting keybings and scripts
i3.on("tick", on_tick)

# Start the main loop and wait for events to come in.
i3.main()

