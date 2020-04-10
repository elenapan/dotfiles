#!/usr/bin/env bash
# Rofi menu for quickly editing a file in some directory
# Requires ripgrep
# I use it for editing dotfiles in my ~/.config directory

# Directory to search in
dir="$HOME/.config"
# Ignore files or directories relative to the directory you want to search
ignore="
chromium
enchant
mpv/watch_later
ncmpcpp/lyrics
transmission/torrents
transmission/resume
Ganache"

ignore_file="/tmp/rofi_edit_ignore_file"
# Write ignore file in tmpfs
echo "$ignore" > "$ignore_file"

# Rofi prompt
rofi_prompt="Edit dotfile"

# Change directory so that the paths are shorter in rofi
cd "$dir" || exit
choice="$(rg --files --color=never --ignore-file "$ignore_file" | rofi -no-disable-history -sort -i -p "$rofi_prompt" -dmenu -fuzzy)"

# If the search is cancelled by the user (e.g. Escape button)
if [[ -z "${choice// }" ]]; then
    exit 1
fi

# Edit the selected file
kitty -1 -e nvim "$choice"
