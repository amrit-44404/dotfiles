#!/bin/sh
xset r rate 300 50 &
slstatus &
sxhkd &
picom &
xwallpaper --maximize .local/share/wall/1.png &&
exec dwm
