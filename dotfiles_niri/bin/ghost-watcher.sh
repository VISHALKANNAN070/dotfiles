#!/bin/bash

# --- CONFIGURATION ---
BAT_LIMIT=25
CHECK_INTERVAL=5

# Initialize state variables
last_ssid="INITIAL_STATE"
bat_warned=false

while true; do
    # ==========================================
    # 1. WI-FI MONITOR
    # ==========================================
    # Get current SSID (returns empty string if disconnected)
    current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    
    # Check for change
    if [ "$current_ssid" != "$last_ssid" ]; then
        # Ignore the very first run to prevent startup spam
        if [ "$last_ssid" != "INITIAL_STATE" ]; then
            if [ -z "$current_ssid" ]; then
                notify-send -u critical -t 3000 "Wi-Fi" "Disconnected"
            else
                notify-send -u low -t 3000 "Wi-Fi" "Connected to: $current_ssid"
            fi
        fi
        last_ssid="$current_ssid"
    fi

    # ==========================================
    # 2. BATTERY MONITOR
    # ==========================================
    # Find battery path (auto-detects BAT0 or BAT1)
    BAT_PATH=$(ls /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -n 1)
    
    if [ -n "$BAT_PATH" ]; then
        capacity=$(cat "$BAT_PATH")
        status=$(cat "${BAT_PATH%/*}/status") # Discharging / Charging

        # If Discharging AND below limit AND we haven't warned yet
        if [ "$status" = "Discharging" ] && [ "$capacity" -le "$BAT_LIMIT" ]; then
            if [ "$bat_warned" = "false" ]; then
                notify-send -u critical "Low Battery" "${capacity}% remaining"
                bat_warned=true
            fi
        # Reset warning flag if we charge up or go above limit
        elif [ "$capacity" -gt "$BAT_LIMIT" ] || [ "$status" = "Charging" ]; then
            bat_warned=false
        fi
    fi

    sleep $CHECK_INTERVAL
done
