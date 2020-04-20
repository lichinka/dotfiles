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
# keyboard layout switch (both Shifts) and speed
#
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,es,si
xset r rate 200 40

#
# Correct monitor orientation
#
xrandr --output DP2-2 --mode 1920x1200 --output DP2-1 --mode 1920x1200 --right-of DP2-2 --output eDP1 --mode 1920x1080 --right-of DP2-1

#
# Tiling window manager
#
exec i3
