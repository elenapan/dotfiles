#!/usr/bin/env bash
rofi="$HOME/.config/eww/scripts/rofi-with-mode-restore sidebar"
# Select a player from all available players reported by `playerctl --list-all`
# using rofi. The selected player's volume will be adjusted very very very
# slightly so that `playerctl --follow` will detect it as the the currently
# active player.
# Note: Sadly this does not work with players that do not implement the mpris
# volume interface (e.g. Firefox, Chromium).
players="$(playerctl --ignore-player=firefox,chromium --list-all)"
players_array=()
for player in $players; do
    if ! title="$(playerctl --player="$player" --format='{{title}}' metadata 2>/dev/null)"; then
        # Failed to get title, skip
        continue
    fi
    players_array+=("$player")
    rofi_input+="$title"$'\n'
done

rofi_input=${rofi_input::-1} # Remove last new line
choice="$(echo "$rofi_input" | $rofi -dmenu -format d -i -p "> Select player")"

if [[ -z "$choice" ]]; then
    exit 1
fi

selected_player="${players_array[$((choice - 1))]}"
tiny_amount="0.000001"
playerctl --player="$selected_player" volume "$tiny_amount"+ &
playerctl --player="$selected_player" volume "$tiny_amount"-
