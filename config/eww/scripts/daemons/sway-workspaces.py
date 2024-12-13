#!/usr/bin/env python
import i3ipc
import os
import sys

i3 = i3ipc.Connection()

def on_workspace_init(i3, e):
    # when change is "init" the current obj shows which ws was initialized
    os.system("eww update ws%s=''" % (e.current.name))

def on_workspace_empty(i3, e):
    # when change is "empty" the current obj shows which ws became empty
    os.system("eww update ws%s='empty'" % (e.current.name))

def on_workspace_focus(i3, e):
    os.system("eww update ws%s='' ws%s='focused'" % (e.old.name, e.current.name))

# TODO: 'urgent' state
# When change is "urgent" the current obj shows which workspace became
# urgent/non-urgent. We can probably get the state from the event itself.

# https://i3wm.org/docs/ipc.html#_workspace_event
# i3.on("workspace", on_workspace)
i3.on("workspace::focus", on_workspace_focus)
i3.on("workspace::empty", on_workspace_empty)
i3.on("workspace::init", on_workspace_init)

# Initial update
for ws in i3.get_workspaces():
    # It only returns non-empty workspaces
    # That is why we initialize workspace state as 'empty' in our eww config
    if (ws.focused):
        os.system("eww update ws%s='focused'" % (ws.num))
    else:
        os.system("eww update ws%s=''" % (ws.num))

if len(sys.argv) > 1 and sys.argv[1] == "oneshot":
    exit(0)

i3.main()
