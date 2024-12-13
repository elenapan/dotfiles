#!/usr/bin/env bash
eww="$HOME/.config/eww/scripts"

if [[ -z "$1" ]]; then
    echo You did not specify a key
    exit 1
fi

declare -A next_field
next_field=(
    ["hours"]="minutes"
    ["minutes"]="label"
    ["label"]="hours"
)

declare -A previous_field
previous_field=(
    ["hours"]="label"
    ["minutes"]="hours"
    ["label"]="minutes"
)

declare -A field_char_limit
field_char_limit=(
    ["hours"]=2
    ["minutes"]=2
    ["label"]=16
)

declare -A field_max
field_max=(
    ["hours"]=23
    ["minutes"]=59
)

format_field() {
    field_type=$1
    input=$2
    if [[ "$field_type" =~ ^(hours|minutes)$ ]]; then
        printf "%02d" "${input}"
    else
        echo "$input"
    fi
}

key=$1

declare -A inputs
inputs["hours"]="$(eww get alarms-input-hours)"
inputs["minutes"]="$(eww get alarms-input-minutes)"
inputs["label"]="$(eww get alarms-input-label)"

selected_field="$(eww get alarms-input-selected-field)"
char_limit="${field_char_limit[$selected_field]}"
total_minutes="$(eww get alarms-total-minutes)"
current_input="${inputs[$selected_field]}"
input_length=${#current_input}

if [[ "$key" == "backspace" ]]; then
    if [[ "$input_length" == "0" ]]; then
        exit 1
    fi

    inputs[$selected_field]="${current_input::-1}"

    hours=${inputs["hours"]}
    minutes=${inputs["minutes"]}
    total_minutes=$((hours * 60 + minutes))

    eww update \
        alarms-input-"${selected_field}"="${inputs[$selected_field]}" \
        alarms-preview-"${selected_field}"="$(format_field "$selected_field" "${inputs[$selected_field]}")" \
        alarms-total-minutes="$total_minutes"
elif [[ "$key" == "c-backspace" ]]; then
    eww update \
        alarms-input-"${selected_field}"= \
        alarms-preview-"${selected_field}"=
elif [[ "$key" == "escape" ]]; then
    "${eww}/do-alarms-action" cancel
elif [[ "$key" == "return" ]]; then
    "${eww}/do-alarms-action" confirm
elif [[ "$key" == "s-tab" ]]; then
    eww update \
        alarms-input-selected-field="${previous_field[$selected_field]}"
elif [[ "$key" == "tab" ]]; then
    eww update \
        alarms-input-selected-field="${next_field[$selected_field]}"
elif (( input_length < char_limit )); then
    new_input="${current_input}${key}"
    if [[ "$selected_field" =~ ^(hours|minutes)$ ]]; then
        if [[ ! $key =~ [0-9] ]]; then
            exit 1
        fi

        if (( new_input > field_max[$selected_field] )); then
            inputs[$selected_field]="${field_max[$selected_field]}"
        else
            inputs[$selected_field]="$new_input"
        fi
    else
        inputs[$selected_field]=$new_input
    fi

    hours=${inputs["hours"]}
    minutes=${inputs["minutes"]}
    total_minutes=$((hours * 60 + minutes))

    eww update \
        alarms-input-"${selected_field}"="${inputs[$selected_field]}" \
        alarms-preview-"${selected_field}"="$(format_field "$selected_field" "${inputs[$selected_field]}")" \
        alarms-total-minutes="$total_minutes"
fi
