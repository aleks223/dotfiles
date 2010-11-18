#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
setxkbmap ch fr &
xrdb -override .Xdefaults &
xbindkeys &
sh ~/.fehbg &
urxvtd -q -f -o &
alsactl restore &
case $1 in
fluxbox)
	xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
#	(sleep 2 && conky -c /home/alex/.conky/conky_flux) &
#	wicd-client &
	exec ck-launch-session fluxbox
	;;
wmfs)
	xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
	sh ~/.config/wmfs/autostart.sh &
	exec ck-launch-session wmfs
	;;
echinus)
	exec ck-launch-session echinus
	;;
esac	
