#!/bin/sh


if [ -z "$1" ]; then
    echo "Не передан аргумент"
    exit 1
fi

VALUE=$1
NUM="$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')"

if [ $NUM == $VALUE ]; then
    i3-msg move container to workspace $(( $VALUE+5 ))
else
    i3-msg move container to workspace $VALUE
fi

