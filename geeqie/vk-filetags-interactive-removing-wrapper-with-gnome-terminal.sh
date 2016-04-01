#!/bin/sh

/usr/bin/gnome-terminal \
    --geometry=73x5+330+5  \
    --tab-with-profile=big \
    --hide-menubar \
    -x /home/vk/src/filetags/filetags.py --interactive --remove "${@}"

#end