#!/bin/bash

bar=""

while [ true ]; do
    bar+="%{l}"
    bar+="$(~/config/zelbar/workspaces.py HDMI-A-1)"

    bar+="%{c}"
    bar+="$(~/config/zelbar/window.py)"

    bar+="%{r}"
    bar+="$(~/config/zelbar/kb.py)"
    bar+="$(~/config/zelbar/date.sh)"

    echo "$bar"
    bar=""
    sleep 0.3
done
