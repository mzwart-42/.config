# My terminal setup 🍚
## Install kitty on codam machine
_(source https://sw.kovidgoyal.net/kitty/binary/)_
This installs kitty in the home folder, specificly at `~/.local/kitty.app`
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
For convienently launching the app add the desktop icon to gnome.
You can copy the `kitty.desktop` file form `~/.local/kitty.app/share/applications`

_(source https://wiki.archlinux.org/title/Desktop_entries#Application_entry)_

## use the fonts_in_config
copy(or move) the folder `fonts_in_config` to the user specific font directory `~/.local/share/fonts`
```
mkdir -p ~/.local/share/fonts && cp ~/.config/fonts_in_config ~/.local/share/fonts/comic_code
```
