#!/bin/sh

# xinitrc runs automatically when you run startx.

xrdb ${XDG_CONFIG_HOME:-$HOME/.config}/Xresources
. ~/.xprofile

while :; do
    ssh-agent dwm
done
