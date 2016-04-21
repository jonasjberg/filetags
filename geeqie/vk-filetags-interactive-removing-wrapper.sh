#!/usr/bin/env bash
# Modified wrapper for filetags

# Get absolute path
SCRIPT_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
cd "$SCRIPT_PATH" && FILETAGS=$(readlink -f "../filetags.py") 
[ -x "$FILETAGS" ] || { echo "Resolve path failed. Exiting." 2>&1 ; exit 1 ; }


/usr/bin/xfce4-terminal     \
    --geometry=73x5+330+5   \
    --hide-menubar          \
    --hide-toolbar          \
    --command="${FILETAGS} --interactive --remove "${@}""

#end
