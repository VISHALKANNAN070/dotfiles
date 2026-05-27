#!/bin/sh

CHOICE="$(printf "Shutdown\nLock\nLogout\nReboot" | \
rofi -dmenu \
-theme ~/.config/rofi/powermenu.rasi)"

case "$CHOICE" in
  Shutdown) loginctl poweroff ;;
  Lock) swaylock -f ;;
  Logout) swaymsg exit ;;
  Reboot) loginctl reboot ;;
  *) exit 0 ;;
esac
