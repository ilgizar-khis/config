#!/bin/bash

sxhkd &
~/.config/polybar/launch.sh &
picom &
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --output eDP-1 --mode 1920x1080 --pos 0x0 &
feh --bg-scale /home/razigli/Pictures/.bg/{6.jpeg,33.png} &
setxkbmap -layout "us,ru" -option "grp:win_space_toggle" &
xset s off &
xset s noblank &
xset -dmps &
# bspc rule -a * title="TLauncher" state=floating &
bspc rule -a '*:*:calcurse' state=floating rectangle=800x600+560+240 & 
bspc rule -a 'org-tlauncher-tlauncher-rmo-TLauncher' desktop=6 state=floating
bspc monitor HDMI-1 -d  "6" "7" "8" "9" "0"
bspc monitor eDP-1 -d "1" "2" "3" "4" "5"
