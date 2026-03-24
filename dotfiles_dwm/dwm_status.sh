#!/bin/bash
while true; do
    # Use full paths for binaries
    SONG=$(/usr/bin/mpc current -f "[%artist% - ]%title%")
    VOL=$(/usr/bin/amixer get Master | grep -Po '\[\d+%\]' | head -n1 | tr -d '[]%')
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    TIME=$(date +"%H:%M")

    /usr/bin/xsetroot -name " $SONG | VOL $VOL% | BAT $BAT% | $TIME "
    sleep 1s
done
