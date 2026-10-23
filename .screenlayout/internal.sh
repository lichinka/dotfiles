#!/bin/sh
xrandr --output eDP-1 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off

# Normal mouse buttons
xmodmap -e "pointer = 1 2 3"

# General font size
echo "Xft.dpi: 144" > ${HOME}/.Xresources
xrdb -merge ~/.Xresources

# Polybar
pkill polybar
${HOME}/.config/polybar/launch.sh --blocks

# Wallpaper
${HOME}/.fehbg
