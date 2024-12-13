#!/usr/bin/env bash
# Requires: wget, playerctl
# playerctl bugs that affect this script:
# - Wrong position sometimes due to https://github.com/altdesktop/playerctl/issues/58
# - Wrong position sometimes due to https://github.com/altdesktop/playerctl/issues/102
# - Firefox position retrieved through playerctl is often wrong, especially
#   after seeking / skipping. It could be because Firefox is re-using the same
#   player instance even if playing different media in different tabs.
#   https://github.com/altdesktop/playerctl/issues/289
# - If using mpv + yt-dlp, and a video is loading, position starts moving before
#   the video has started playing

eww_media_dir=/tmp/eww-media
mkdir -p $eww_media_dir
art=$eww_media_dir/art

last_art_url="-1"

# Helper
duration_to_seconds() {
    colons="${1//[^:]}"
    colon_count="${#colons}"
    tokens="$(tr ':' ' ' <<< $1)"
    # It can only be 0, 1 or 2
    if [[ $colon_count -eq 2 ]]; then
        hours="$(awk '{printf "%d", $1;}' <<< "$tokens")"
        minutes="$(awk '{printf "%d", $2;}' <<< "$tokens")"
        seconds="$(awk '{printf "%d", $3;}' <<< "$tokens")"
    elif [[ $colon_count -eq 1 ]]; then
        hours=0
        minutes="$(awk '{printf "%d", $1;}' <<< "$tokens")"
        seconds="$(awk '{printf "%d", $2;}' <<< "$tokens")"
    else
        hours=0
        minutes=0
        seconds=0
    fi
    total_seconds=$((hours * 3600 + minutes * 60 + seconds))
    echo $total_seconds
}

update_art() {
    art_path="$1"
    # Crop biggest square from the center
    magick "$art_path" -gravity Center -extent 1:1 "$art_path"
    cp "$art_path" "$art"
    eww update media-art="$art"
}

# Get info in this weird format
# - @@property@@value@@property@@ is highly unlikely to be used inside artist or
#   title names
# - JSON format would be tricky with quotes that need to be escaped
playerctl --follow metadata --format '@@playerName@@{{playerName}}@@playerName@@ @@volume@@{{volume * 100}}@@volume@@ @@status@@{{lc(status)}}@@status@@ @@position@@{{duration(position)}}@@position@@ @@length@@{{duration(mpris:length)}}@@length@@ @@artUrl@@{{mpris:artUrl}}@@artUrl@@ @@artist@@{{artist}}@@artist@@ @@title@@{{title}}@@title@@ @@url@@{{url}}@@url@@' | while read -r line; do
    player_name="$(sed 's/.*@@playerName@@\(.*\)@@playerName@@.*/\1/' <<< "$line")"
    volume="$(sed 's/.*@@volume@@\(.*\)@@volume@@.*/\1/' <<< "$line")"
    status="$(sed 's/.*@@status@@\(.*\)@@status@@.*/\1/' <<< "$line")"
    url="$(sed 's/.*@@url@@\(.*\)@@url@@.*/\1/' <<< "$line")"
    position="$(sed 's/.*@@position@@\(.*\)@@position@@.*/\1/' <<< "$line")"
    length="$(sed 's/.*@@length@@\(.*\)@@length@@.*/\1/' <<< "$line")"
    art_url="$(sed 's/.*@@artUrl@@\(.*\)@@artUrl@@.*/\1/' <<< "$line")"

    artist="$(sed 's/.*@@artist@@\(.*\)@@artist@@.*/\1/' <<< "$line")"
    title="$(sed 's/.*@@title@@\(.*\)@@title@@.*/\1/' <<< "$line")"

    if [ "$artist" == "" ]; then
        artist="N/A"
    fi

    if [ "$title" == "" ]; then
        title="N/A"
    fi

    if [[ "$title" == "ytsearch:'"* ]]; then
        # Remove final quote
        title=${title::-1}
        # Remove ^ytsearch:'
        title=${title:10}
    fi

    if [[ "$artist" == *" - Topic" ]]; then
        artist=${artist::-8}
    fi

    # Escape double quotes and backslashes
    artist="$(sed 's/\\/\\\\/g;s/"/\\"/g' <<< "$artist")"
    title="$(sed 's/\\/\\\\/g;s/"/\\"/g' <<< "$title")"

    # >>> Progress
    position_seconds="$(duration_to_seconds "$position")"
    length_seconds="$(duration_to_seconds "$length")"
    if [[ $length_seconds -eq 0 ]]; then
        length_seconds=1
    fi
    progress="$(awk 'BEGIN { printf "%.f", '"$((position_seconds*100))"'/'"${length_seconds}"' }')"
    if [[ $progress -gt 100 ]]; then
        progress=100
    fi

    # Update media-json and media-progress variables together
    # Art is updated separately only if needed
    eww update media-progress="$progress" media-json="{
        \"player_name\": \"$player_name\",
        \"volume\": \"$volume\",
        \"status\": \"$status\",
        \"artist\": \"$artist\",
        \"title\": \"$title\",
        \"position\": \"$position\",
        \"length\": \"$length\",
        \"length_seconds\": \"$length_seconds\",
        \"url\": \"$url\"
    }"

    # >>> Art
    if [ "$art_url" == "$last_art_url" ]; then
      # echo skipping
      continue
    fi

    if [ -n "$art_url" ] && [ "$art_url" != "" ]; then
        # Chromium flatpak stores files in a different directory
        if [[ "$art_url" =~ ^file:///tmp/.org.chromium.Chromium ]]; then
            art_path="$(sed 's@file://@'$XDG_RUNTIME_DIR'/.flatpak/org.chromium.Chromium@' <<< "$art_url")"
            update_art "$art_path"
        # Local file
        elif [[ "$art_url" =~ ^file:/// ]]; then
            art_path="$(sed 's@file://@@' <<< "$art_url")"
            update_art "$art_path"
        else
            # Do not redownload with every update
            # Store art in "$art_path" and check if it exists before redownloading
            art_path=$eww_media_dir/"$(base64 <<< "$art_url")"
            if [ ! -f "$art_path" ]; then
                # Set art to placeholder here because the download might take a while
                eww update media-art=""
                # Note: You can also use curl instead of wget, but I noticed it
                # occasionally fails to download thumbnails from ytimg.com
                # if curl -sf $art_url --output "$art_path"; then
                if wget --quiet "$art_url" -O "$art_path"; then
                    update_art "$art_path"
                fi
            else
                # Art has been downloaded and processed before
                cp "$art_path" "$art"
                eww update media-art="$art"
            fi
        fi
    else
        eww update media-art=""
    fi
    last_art_url="$art_url"
done
