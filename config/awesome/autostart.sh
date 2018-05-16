#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# Load terminal colorscheme and settings
xrdb ~/.Xresources

# For desktop effects
run compton --config ~/.config/compton/config

# Enable numlock on login
run numlockx

# For battery notifications
run xfce4-power-manager

# Keyboard
setxkbmap -layout "us,gr,ru" -option "grp:alt_shift_toggle"

# Music
mpd ~/.config/mpd/mpd.conf
