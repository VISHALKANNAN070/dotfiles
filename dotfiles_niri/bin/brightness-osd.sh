#!/bin/sh

# Read actual brightness % from brightnessctl
get_bri() {
    brightnessctl -m | awk -F, '{print $4}' | tr -d '%'
}

# Clamp 0–100
safe_set() {
    new="$1"
    [ "$new" -lt 0 ] && new=0
    [ "$new" -gt 100 ] && new=100
    brightnessctl set "${new}%"
}

# Apply brightness change safely
case "$1" in
    up)
        cur=$(get_bri)
        safe_set $((cur + 5))
        ;;
    down)
        cur=$(get_bri)
        safe_set $((cur - 5))
        ;;
    *)
        exit 1
        ;;
esac

# Let sysfs update brightness value properly
sleep 0.05

bri=$(get_bri)

notify-send -a "brightness-osd" -t 2000 -r 998 "Bright: ${bri}%" "$bar"
