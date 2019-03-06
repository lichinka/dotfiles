#
# correct Qt5 font sizes
#
export QT_QPA_PLATFORMTHEME=qt5ct
unset QT_STYLE_OVERRIDE

#
# PulseAudio server
#
/usr/bin/start-pulseaudio-x11

#
# Wacom settings
#
#for id in $( xsetwacom --list devices | egrep -o '[0-9]+' ); do xsetwacom --set $id Rotate cw; done
#xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Constant Deceleration" 1.25
#xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Adaptive Deceleration" 1.25
#xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Velocity Scaling" 1.0
#
##
## Wacom settings - adjust scroll direction and speed
##
#xmodmap -e "pointer = 1 2 3 5 4"
#synclient VertScrollDelta=-99
#xsetwacom --set "Wacom Wireless Bamboo PAD Finger touch" ScrollDistance 50

##
## keyboard layout switch (both Shifts) and speed
##
#setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,es,si
#xset r rate 200 40

#
# Correct monitor orientation
#
xrandr --output DP2-2 --mode 1920x1200 --output DP2-1 --mode 1920x1200 --right-of DP2-2 --output eDP1 --mode 1920x1080 --right-of DP2-1

#
# Tiling window manager
#
exec i3
