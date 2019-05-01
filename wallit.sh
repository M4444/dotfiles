#!/bin/bash

if [ $# -lt 1 -o ! -f $1 ]; then
	echo "Specify the wallpaper picture."
else
	cp $1 /home/mc/.config/wall.png && i3-msg restart
fi
