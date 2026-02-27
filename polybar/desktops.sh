#!/bin/bash

readarray -t ALL_WORKSPACES <<< $(bspc query -D -m $1 --names)
current=$(bspc query -D -d .active -m $1 --names)
output=""
for wokspace in "${ALL_WORKSPACES[@]}"; do
    action="%{A1:bspc desktop -f $wokspace:}" 
    if [[ "$wokspace" == "$current" ]]; then
        output+="${action}%{B#AAAAAA}%{F#000000}  $wokspace  %{A1}"
    else
        output+="${action}%{B#454545}%{F#FFFFFF}  $wokspace  %{A1}"
    fi
done
echo "$1: $output"
