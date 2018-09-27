#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# Load terminal colorscheme and settings
#xrdb ~/.Xresources

# Urxvt daemon
#run urxvtd -q -o -f

# Mpv input file
mkfifo /tmp/mpv.fifo

# Volume notification daemon
#run volume-daemon

# For desktop effects
run compton --config ~/.config/compton/compton.conf

# Enable numlock on login
run numlockx

# For battery notifications
run xfce4-power-manager

# Network manager tray icon
run nm-applet

# Keyboard
setxkbmap -layout "us,gr" -option "grp:alt_shift_toggle"
#setxkbmap -layout "us,gr,ru" -option "grp:alt_shift_toggle"

# Kill redshift processes
#pkill redshift

# Music
run mpd ~/.config/mpd/mpd.conf

# Scratchpad
#scratchpad
