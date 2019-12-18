#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

xrandr --output HDMI-1-1 --auto --left-of eDP-1-1

hc detect_monitors

hc pad 1 25 0 0 0
hc pad 0  0 0 0 0

pkill polybar
MONITOR=HDMI-1-1 polybar hwm &
