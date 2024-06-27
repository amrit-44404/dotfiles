#!/bin/sh

xset r rate 300 50 &
slstatus &
sxhkd &
picom &
feh --bg-fill $HOME/.local/share/wallpapers/dwm.jpg &
exec dwm
