#!/bin/bash

if [[ "$ROFI_RETV" == "2" ]]; then
    # echo "$(trans -no-ansi $1)"
    lang="$(echo "$1" | cut -d' ' -f1)"
    text="$(echo "$1" | cut -d' ' -f2-)"
    # echo "$lang"
    # echo "$text"
    echo "$(trans -no-ansi :$lang "$text")"
elif [[ "$ROFI_RETV" == "1" ]]; then
    wl-copy $1
fi

