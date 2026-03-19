#!/bin/bash

pkill zelbar

~/config/zelbar/bar.sh | zelbar -o HDMI-A-1 -F 0xFFFFFF -B 0x333333 -fn "FiraCode Nerd Font Mono:style=Bold:size=16" &
