#!/bin/sh
xrandr --output eDP-1 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off

# Normal mouse buttons
xmodmap -e "pointer = 3 2 1"

# General font size
echo "Xft.dpi: 144" > ${HOME}/.Xresources
xrdb -merge ~/.Xresources

# Polybar
pkill polybar
${HOME}/.config/polybar/launch.sh --shapes

# Wallpaper
${HOME}/.fehbg
