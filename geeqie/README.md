# `geeqie`-integration README

Added by Jonas Sjöberg 2016-04-01.
This directory contains the files described in the main documentation
`README.org`.


## Usage notes
The target user group do not need this info, but for sake of completeness:

* The example scripts assumes that `gnome-terminal` is installed.
    * This is not the case in for example default Xubuntu and others.
    * You must modify as to match your specific setup, .

* The path to the script `filetags.py` must be modified to reflect the actual
  location on your machine.



Below follows a markdown-formatted version of `README.org` from
<https://github.com/novoid/filetags>


--------------------------------------------------------------------------------


Bonus: integrating into Geeqie (or similar file browsers)

I am using geeqie for browsing/presenting image files.
After I mark a set of images for adding one or more tags,
I just have to press `t` and I get asked for the tags.
After entering the tags and RETURN, the tags are added to the image files.
With `T` I can remove tags accordingly.

Using GNU/Linux, this is quite easy accomplished.
The only thing that is not straight forward is the need for a wrapper script.
The wrapper script does provide a shell window for entering the tags.


`vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh` looks like:

```bash
#!/bin/sh

/usr/bin/gnome-terminal \
    --geometry=73x5+330+5  \
    --tab-with-profile=big \
    --hide-menubar \
    -x /home/vk/src/filetags/filetags.py --interactive "${@}"

#end
```


`vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh` looks like:

```bash
#!/bin/sh

/usr/bin/gnome-terminal \
    --geometry=73x5+330+5  \
    --tab-with-profile=big \
    --hide-menubar \
    -x /home/vk/src/filetags/filetags.py --interactive --remove "${@}"

#end
```


In `$HOME/.config/geeqie/applications` I wrote two desktop files such that
geeqie shows the wrapper scripts as external editors to its image files:


`$HOME/.config/geeqie/applications/add-tags.desktop` looks like:

```
[Desktop Entry]
Name=filetags
GenericName=filetags
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;
```


`$HOME/.config/geeqie/applications/remove-tags.desktop` looks like:

```
[Desktop Entry]
Name=filetags
GenericName=filetags
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;
```


In order to be able to use the keyboard shortcuts
`t` (adding tags) and `T` (removing tags), you can define them in geeqie:

Edit > Preferences > Preferences ... > Keyboard.

Scroll to the bottom of the list.
Double click in the KEY-column of `filetags` and `filetags-remove` and choose
your desired keyboard shortcut accordingly.


I hope this method is as handy for you as it is for me :-)

