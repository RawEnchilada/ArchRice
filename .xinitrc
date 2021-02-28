#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

file=$(find /home/enchilada/Pictures/Backgrounds/ -type f | shuf -n 1)

xsetroot -cursor_name left_ptr &
numlockx &
setxkbmap hu &
nitrogen --set-zoom-fill $file --save &
sxhkd &
picom --experimental-backends &
fusuma &
mpd &
twmnd &


if echo "$file" | grep 'dark'; then
  polybar main -c $HOME/.config/polybar/light.ini &
else
  polybar main -c $HOME/.config/polybar/dark.ini &
fi

betterlockscreen --lock &
betterlockscreen -u $HOME/Pictures/Lockscreens &
exec bspwm
