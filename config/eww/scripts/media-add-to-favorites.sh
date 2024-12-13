#!/usr/bin/env bash
# This script assumes you are saving your favorite songs in a text file like a
# caveman.
favorites_file="$HOME/mus/playlists/songs"

# Get current media information displayed in eww
eww_media_json="$(eww get media-json)"
artist="$(jq -r '.artist' <<< "$eww_media_json")"
title="$(jq -r '.title' <<< "$eww_media_json")"

line="${artist} - ${title}"
echo "$line" >> "$favorites_file"

notify-send.sh -u low -R /tmp/eww-media-favorites-notif "Added to favorites" "$line"
