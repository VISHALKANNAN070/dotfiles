#!/bin/sh

# Get current volume as number
get_vol() {
    pactl get-sink-volume @DEFAULT_SINK@ \
        | grep -o "[0-9]*%" \
        | head -1 \
        | tr -d '%'
}

# Clamp 0–100 and apply
safe_set() {
    new="$1"
    [ "$new" -lt 0 ] && new=0
    [ "$new" -gt 100 ] && new=100
    pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
}

case "$1" in
    up)
        cur=$(get_vol)
        safe_set $((cur + 5))
        ;;
    down)
        cur=$(get_vol)
        safe_set $((cur - 5))
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        exit 1
        ;;
esac

muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$muted" = "yes" ]; then
    notify-send -a "volume-osd" -t 2000 -r 999 "Muted"
else
    vol=$(get_vol)
    notify-send -a "volume-osd" -t 2000 -r 999 "Volume: ${vol}%"
fi
