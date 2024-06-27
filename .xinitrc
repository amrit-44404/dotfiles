#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

while true; do
                time="$(date +"%I:%M %p")"
                date="$(date +"%a, %B %d")"
                battery=$(cat /sys/class/power_supply/BAT0/capacity)
                xsetroot -name "[ 📅 $date ][ 🧭 $time ][ 💀 $battery% ]"
		sleep 60
done &

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 300 50 &
sxhkd &
picom &
feh --bg-fill $HOME/.local/share/wallpapers/dwm.jpg &
exec dwm
