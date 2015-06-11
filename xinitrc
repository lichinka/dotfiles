#
# Correct monitor orientation
#
xrandr --output DP2-2 --mode 1920x1200 --output DP2-1 --mode 1920x1200 --right-of DP2-2 --output eDP1 --mode 1920x1080 --right-of DP2-1

#
# start several applications
#
davmail &
sudo modprobe vboxdrv
VirtualBox &
claws-mail &

#
# PulseAudio server
#
/usr/bin/start-pulseaudio-x11

#
# Wacom settings
#
for id in 20 21 22 23; do xsetwacom --set $id Rotate cw; done
xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Constant Deceleration" 1.25                                                          
xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Adaptive Deceleration" 1.25                                                          
xinput set-prop "Wacom Wireless Bamboo PAD Finger touch" --type=float "Device Accel Velocity Scaling" 1.0

#
# Wacom settings - invert scroll direction
#
xmodmap -e "pointer = 1 2 3 5 4"
synclient VertScrollDelta=-99

#
# keyboard layout switch (both Shifts)
#
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,es,si

#
# i3wm
#
exec i3
