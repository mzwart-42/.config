#!/bin/bash

# [KITTY]
# To add something to the path variable you append the path you want to add to $PATH: (':' is the delimiter for the paths)
# Add the binary executable of kitty installed at .local to the PATH
export PATH="$PATH:$HOME/.local/kitty.app/bin"

# NVIM:
# Follow the README.md to install the newest version of nvim to have support for lazy plugin manager
# Add the binary executable of the installed tar package to the PATH
export PATH="$PATH:$HOME/bin/nvim-linux64/bin"

# Checking if working on a 42 machine
# check if the USER42 environment variable matches the current user
 if grep -q "Ubuntu" /etc/os-release &&  [[ $USER == $USER42 ]] ; then
	echo "codam_pc"
	alias vi='nvim_tar'
	alias nvim='nvim_tar'
	export EDITOR="nvim_tar"
	# Used for Codam apt. A program to install packages that are present in "apt-cache"
		export LD_LIBRARY_PATH=/home/$USER42/.capt/root/lib/x86_64-linux-gnu:/home/$USER42/.capt/root/usr/lib/x86_64-linux-gnu:
		export PATH=$PATH:/home/$USER42/.capt:/home/$USER42/.capt/root/usr/local/sbin:/home/$USER42/.capt/root/usr/local/bin:/home/$USER42/.capt/root/usr/sbin:/home/$USER42/.capt/root/usr/bin:/home/$USER42/.capt/root/sbin:/home/$USER42/.capt/root/bin:/home/$USER42/.capt/root/usr/games:/home/$USER42/.capt/root/usr/local/games:/home/$USER42/.capt/snap/bin:/home/$USER42/bin:/home/$USER42/.local/kitty.app/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/$USER42/.dotnet/tools:/home/$USER42/.local/kitty.app/bin:/home/$USER42/bin/nvim-linux64/bin

	alias francinette=$HOME/francinette/tester.sh
	alias paco=$HOME/francinette/tester.sh
fi
