#!/bin/bash
# Noodle Cleanup Script
#   Some of my widgets (mpd, volume) rely on scripts that have to be
#   run persistently in the background.
#   They sleep until mpd/volume state changes, in an infinite loop.
#   As a result when awesome restarts, they keep running in background, along with the new ones that are created after the restart.
#   This script cleans up the old processes.

# Mpd widget
ps aux | grep "mpc idleloop player" | grep -v grep | awk '{print $2}' | xargs kill
#ps aux | grep "mpc idle player" | grep -v grep | awk '{print $2}' | xargs kill
# Volume widget
ps aux | grep "pactl subscribe" | grep -v grep | awk '{print $2}' | xargs kill
