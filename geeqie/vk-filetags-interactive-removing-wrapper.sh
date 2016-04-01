#!/usr/bin/env bash
# Modified wrapper for filetags

# Get absolute path
FILETAGS=$(readlink -f ../filetags.py)
[ -x "$FILETAGS" ] || { echo "Resolve path failed. Exiting." 2>&1 ; exit 1 ; }


/usr/bin/x-terminal-emulator \
    --geometry=73x5+330+5    \
    --hide-menubar           \
    --hide-toolbar           \
    --execute "$FILETAGS" --interactive --remove "${@}"

#end
