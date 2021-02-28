#!/bin/bash

twmnc `mpc current`

relpa=`mpc current --format %file%`
path="$(dirname "/home/enchilada/Music/$relpa")"
path="$path/cover.jpg"

if [ -f "$path" ]; then
	nitrogen --set-auto $path
else
	nitrogen --restore
fi

