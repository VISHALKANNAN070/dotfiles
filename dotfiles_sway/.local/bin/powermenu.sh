#!/bin/sh

CHOICE="$(printf "Lock\nLogout\nReboot\nShutdown" | \
rofi -dmenu \
-theme ~/.config/rofi/powermenu.rasi)"

case "$CHOICE" in
  Lock) swaylock -f ;;
  Logout) swaymsg exit ;;
  Reboot) loginctl reboot ;;
  Shutdown) loginctl poweroff ;;
  *) exit 0 ;;
esac
