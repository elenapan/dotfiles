#!/usr/bin/env bash
# This script assumes you are saving your favorite songs in text files like a
# caveman.
rofi="$HOME/.config/eww/scripts/rofi-with-mode-restore sidebar"
playlists_dir="$HOME/mus/playlists"
if [ "$1" == "select-playlist" ]; then
    selected="$(find "$playlists_dir" -mindepth 1 -type f -exec basename {} \; | $rofi -dmenu -p "Select playlist to save to >")"
    if [[ "$selected" == "" ]]; then
        exit 1
    fi
else
    selected="songs"
fi

full_path="$playlists_dir/$selected"

# Get current media information displayed in eww
eww_media_json="$(eww get media-json)"
artist="$(jq -r '.artist' <<< "$eww_media_json")"
title="$(jq -r '.title' <<< "$eww_media_json")"

line="${artist} - ${title}"
echo "$line" >> "$full_path"

notify-send.sh -u low -R /tmp/eww-media-favorites-notif "Added to $selected playlist" "$line"
