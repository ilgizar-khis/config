#!/bin/bash

output=$(playerctl metadata 2>&1)
print_text=""
if [[ "$output" != "No player could handle this command" ]]; then
    button1="%{A1:playerctl previous:}<=%{A1}"
    button2="%{A1:playerctl play-pause:}$(playerctl status)%{A1}"
    button3="%{A1:playerctl mext:}=>%{A1}"
    print_text+="$button1$button2$button3 "
fi
print_text+="   $(date '+%a, %d %b %Y, %H:%M:%S')"
echo "$print_text"
