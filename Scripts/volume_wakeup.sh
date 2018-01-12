#!/bin/bash
VOLUME_PID="$(cat /tmp/volume_pid)"

pkill -P $VOLUME_PID sleep
