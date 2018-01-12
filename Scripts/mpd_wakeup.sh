#!/bin/bash
MPDINFO_PID="$(cat /tmp/mpdinfo_pid)"

pkill -P $MPDINFO_PID sleep
