#!/bin/bash

window_id=$(bspc query -N -n .active.window -m $1)

if [ -n "$window_id" ]; then
    xdotool getwindowname $window_id
else
    echo "bspwm"
fi
