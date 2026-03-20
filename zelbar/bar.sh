#!/bin/bash

bar=""

while [ true ]; do
    bar+="%{l}"
    bar+="$(~/config/zelbar/workspaces.py HDMI-A-1)"

    bar+="%{c}"
    # bar+="$(~/config/zelbar/window.py)"
    bar+="$(~/config/zelbar/date.sh)"

    bar+="%{r}"
    bar+="$(~/config/zelbar/kb.py)"

    echo "$bar"
    bar=""
    sleep 0.25
done
