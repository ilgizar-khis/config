#!/bin/bash

bar=""

while true; do

    bar+="%{l}"
    bar+="$(~/.config/zelbar/workspaces.py HDMI-A-1)"

    bar+="%{c}"

    bar+="%{r}"
    bar+="$(~/.config/zelbar/keyboard.py HDMI-A-1) |"
    bar+="$(date +' %d.%m.%Y | %H:%M:%S')  "

    echo "$bar"

    bar=""

    sleep 0.2
done
