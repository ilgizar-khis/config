#!/bin/bash

window_id=$(bspc query -N -n .active.window -m $1)

if [ -n "$window_id" ]; then
    window=$(xdotool getwindowname $window_id)
    echo "${window:0:50}"
else
    echo "bspwm"
fi
