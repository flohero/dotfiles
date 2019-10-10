#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

xrandr --output HDMI-1-1 --auto --left-of eDP-1-1

hc pad 1 25 0 0 0
hc pad 0  0 0 0 0

pkill polybar
polybar hwm-hdmi &
