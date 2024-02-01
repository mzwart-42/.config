# [REQUIRED FOR NVIM NEWEST VERSION ON CODAM MACHINES]
# follow the README.md to install the newest version of nvim to have support for lazy plugin manager
# add nvim tar to path
export PATH="$PATH:$HOME/bin/nvim-linux64/bin"
# Make sure the USER42 environment variable is set to make the comparison true
 if [[ $USER == $USER42 ]] 
then
	#use the tar version for up to date vim, check PATH for location
	alias vi='nvim_tar'
	alias nvim='nvim_tar'
fi
alias francinette=$HOME/francinette/tester.sh
alias paco=$HOME/francinette/tester.sh

