# My terminal setup 🍚

## Install Kitty - without root permissions
_(source https://sw.kovidgoyal.net/kitty/binary/)_
This installs kitty in the home folder, specificly at `~/.local/kitty.app`
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
For convienently launching the app add the desktop icon to gnome.
You can copy the `kitty.desktop` file form `~/.local/kitty.app/share/applications`

_(source https://wiki.archlinux.org/title/Desktop_entries#Application_entry)_

## Installing the fonts
copy(or move) the folder `fonts_in_config` to the user specific font directory `~/.local/share/fonts`
```
mkdir -p ~/.local/share/fonts && cp ~/.config/fonts_in_config ~/.local/share/fonts/comic_code
```
than reload the system's cache and verify its presence
```
fc-cache
fc-list
```

## choice of terminal
What do I need from my terminal?
- font ligatures (the font also needs to support this btw)
- 24bit color support
- transparent background
Font ligature support is the most scarce among terminals, but here are a few that do support them:
- Kitty
- Alacritty
- Wezterm
Kitty was easiest to install, it has a decent out of the box
configuration, nice looking too and the pretty good documentation
