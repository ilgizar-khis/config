#!/bin/bash

yad --form \
    --title="exit window" \
    --columns=1 \
    --field="выключить:BTN" "systemctl poweroff" \
    --field="перезагрузить:BTN" "systemctl reboot" \
    --field="выйти:BTN" "niri quit" \
    --no-buttons \
    --buttons-layout=edge \
