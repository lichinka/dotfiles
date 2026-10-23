#!/bin/sh
xrandr --output eDP-1 --mode 2560x1600 --pos 5120x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-1-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1-2 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --output DP-1-3 --off

# Invert mouse buttons
xmodmap -e "pointer = 3 2 1"

# General font size
echo "Xft.dpi: 96" > ${HOME}/.Xresources
xrdb -merge ~/.Xresources

# Polybar
pkill polybar
${HOME}/.config/polybar/launch.sh --blocks

# Wallpaper
${HOME}/.fehbg
