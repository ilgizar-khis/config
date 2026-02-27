#!/bin/bash

output=$(playerctl metadata 2>&1)
if [[ "$output" != "No player could handle this command" ]]; then
    button1="%{A1:playerctl previous:}<=%{A1}"
    button2="%{A1:playerctl play-pause:}$(playerctl status)%{A1}"
    button3="%{A1:playerctl mext:}=>%{A1}"
    echo "$button1    $button2    $button3 "
else
    echo "No player"
fi
