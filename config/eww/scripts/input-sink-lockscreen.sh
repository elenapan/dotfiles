#!/usr/bin/env bash
eww="$HOME/.config/eww/scripts"

if [[ -z "$1" ]]; then
    echo You did not specify a key
    exit 1
fi

key=$1
current_input="$(eww get screen-lock-input)"
current_input_length=${#current_input}
if [[ "$key" == "backspace" ]]; then
    if (( current_input_length == 0 )); then
        exit 1
    fi
    eww update \
        screen-lock-input="${current_input::-1}" \
        screen-lock-input-masked="$(printf '%*s\n' "$((current_input_length - 1))" '' | tr ' ' '*')" \
        screen-lock-input-last-action="$([[ $((current_input_length - 1)) == 0 ]] && echo clear || echo delete)" \
        screen-lock-auth-failed=false
elif [[ "$key" == "c-backspace" || "$key" == "escape" ]]; then
    eww update \
        screen-lock-input= \
        screen-lock-input-masked= \
        screen-lock-input-last-action=clear \
        screen-lock-auth-failed=false
elif [[ "$key" == "return" ]]; then
    if [[ "$(eww get screen-lock-input)" == "$(eww get screen-lock-password)" ]]; then
        "${eww}/manage" hide powermenu
        eww update screen-locked=false screen-lock-input-last-action=clear
    else
        eww update screen-lock-auth-failed=true
    fi
elif (( current_input_length < 16 )); then
    eww update \
        screen-lock-input="${current_input}${key}" \
        screen-lock-input-masked="$(printf '%*s\n' "$((current_input_length + 1))" '' | tr ' ' '*')" \
        screen-lock-input-last-action=insert \
        screen-lock-auth-failed=false
fi
