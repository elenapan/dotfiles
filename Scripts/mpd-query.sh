#!/bin/bash

# Get mpd state
MPDSTATE="$(mpc | head -2 | tail -1 | awk '{print $1}')"

if [[ "$MPDSTATE" != "[playing]" ]]; then
	# echo " ·| "
	echo ""
else
	# echo " ·> "
	echo ""
	# echo ""
	SONG="$(mpc | head -1)"
	notify-send "Now playing:" "$SONG" -i ~/.icons/oomox-wally-flat/actions/scalable/player_play.svg --replace-file /tmp/mpd_notification_id
fi