#!/usr/bin/env bash

outputs=$(xrandr --query) || exit 1

if awk '$2 == "connected" && $1 != "eDP-1" { found = 1 } END { exit !found }' <<< "$outputs"; then
    echo ">>> External monitor connected"
    $HOME/.screenlayout/external.sh
else
    echo ">>> Internal display only"
    $HOME/.screenlayout/internal.sh
fi
