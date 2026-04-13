#!/bin/bash

pkill zelbar

~/.config/zelbar/bar.sh | zelbar \
    -B 0x343434 \
    -F 0xFFFFFF \
    -fn "Husklug Nerd Font Mono:size=16" \
    -o HDMI-A-1 \
    &
