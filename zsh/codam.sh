# [KITTY]
# add the binary executable of kitty installed at .local to the PATH
export PATH="$PATH:$HOME/.local/kitty.app/bin"

# [NVIM]
# follow the README.md to install the newest version of nvim to have support for lazy plugin manager
# add the binary executable of the installed tar package to the PATH
export PATH="$PATH:$HOME/bin/nvim-linux64/bin"
 if [[ $USER == $USER42 ]] 
then
	alias vi='nvim_tar'
	alias nvim='nvim_tar'
	export EDITOR="nvim_tar"
fi
alias francinette=$HOME/francinette/tester.sh
alias paco=$HOME/francinette/tester.sh

