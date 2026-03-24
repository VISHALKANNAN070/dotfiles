#!/bin/sh
CHOICE=$(printf "Lock\nLogout\nReboot\nShutdown" | dmenu -p "Session:")

case "$CHOICE" in
  Lock)
    betterlockscreen -l blur
    ;;
  Logout)
    loginctl terminate-session self
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac
