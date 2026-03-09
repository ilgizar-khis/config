#!/bin/bash

wifi="$(iwctl station wlan0 show | grep 'Connected network')"
wifi=${wifi/Connected network/}
wifi=${wifi// /}

audio_source="$(wpctl get-volume @DEFAULT_SOURCE@)"
audio_source=${audio_source/Volume:/}
audio_sink="$(wpctl get-volume @DEFAULT_SINK@)"
audio_sink=${audio_sink/Volume:/}

yad --form \
    --title="INFO window" \
    --columns=1 \
    --field="wifi: $wifi:BTN" "kitty --title impala impala" \
    --field="vol: $audio_source/$audio_sink:BTN" "kitty --title wiremix wiremix" \
    --no-buttons \
    --buttons-layout=edge \
