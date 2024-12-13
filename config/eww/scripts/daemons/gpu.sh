#!/bin/bash
# Not sure if this works on NVIDIA cards
update() {
    eww update gpu="$(cat /sys/class/drm/card0/device/gpu_busy_percent)"

    # Alternatively: With amdgpu_top
    # eww update gpu="$(amdgpu_top -gm --single | awk '/average_gfx_activity/ {print substr($2, 1, length($2)-1)}')"
}

while true; do
    update
    sleep 5
done
