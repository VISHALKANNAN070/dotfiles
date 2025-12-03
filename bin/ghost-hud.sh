#!/bin/bash
# 1. Get TIME
TIME=$(date +'%H:%M  %A')
# 2. Get WIFI Name
# Uses 'nmcli' to find the active wireless connection name
WIFI=$(nmcli -t -f name,type connection show --active | grep wireless | cut -d: -f1)
if [ -z "$WIFI" ]; then
    WIFI="Offline"
fi

# 3. Get BATTERY
# Tries 'upower' first (standard), falls back to reading the file directly
if command -v upower &> /dev/null; then
    BAT=$(upower -i $(upower -e | grep 'BAT' | head -n 1) | grep percentage | awk '{print $2}')
else
    # Fallback: Find the first battery folder and read capacity
    BAT_PATH=$(ls /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -n 1)
    if [ -n "$BAT_PATH" ]; then
        BAT="$(cat $BAT_PATH)%"
    else
        BAT="No Bat"
    fi
fi
# 4. MPD INFO (safe for notification body)
MPD_SONG=$(mpc current 2>/dev/null)
MPD_STATE=$(mpc status 2>/dev/null | awk 'NR==2 {print $1}')

if [[ -z "$MPD_SONG" ]]; then
    MUSIC="No music"
else
    if [[ "$MPD_STATE" == "[playing]" ]]; then
        MUSIC="🎵 $MPD_SONG"
    elif [[ "$MPD_STATE" == "[paused]" ]]; then
        MUSIC="⏸ $MPD_SONG"
    else
        MUSIC="$MPD_SONG"
    fi
fi


# 5. Send Notification
# Title: Time
# Body: Wifi | Battery
notify-send \
    -a "ghost-hud" \
    -h string:x-canonical-private-synchronous:ghost-hud \
    "$TIME" \
    "$WIFI | $BAT"$'\n'"$MUSIC"
