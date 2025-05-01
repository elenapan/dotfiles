#!/usr/bin/env bash

# Terminal window with class/app_id = 'scratchpad' needs to exist already
SCRATCHPAD_SESSION="$(tmux ls | grep '^sway-scratchpad')"

# If the session does not exist, create a new one
if [ ${#SCRATCHPAD_SESSION} -eq "0" ]; then
    tmux -2 new-session -s sway-scratchpad
else
    # Else attach to the session
    tmux -2 attach -t sway-scratchpad
fi
