#!/usr/bin/env bash

OPTIONS="REBOOT\nSHUTDOWN\nSUSPEND\nHIBERNATE"
LAUNCHER="rofi -theme ~/.config/rofi/topbar-custom.rasi -dmenu -i -p system:"
USE_LOCKER="false"
LOCKER="i3lock-fancy -p"

# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="Exit window manager\n$OPTIONS"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval $1
        ;;
      REBOOT)
        systemctl reboot
        ;;
      SHUTDOWN)
        systemctl poweroff
        ;;
      SUSPEND)
        $($USE_LOCKER) && "$LOCKER"; systemctl suspend
        ;;
      HIBERNATE)
        $($USE_LOCKER) && "$LOCKER"; systemctl hibernate
        ;;
      *)
        ;;
    esac
fi
