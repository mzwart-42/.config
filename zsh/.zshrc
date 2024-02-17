# [STUFF]
unsetopt BEEP
bindkey -e	# emacs mode
# move over words and delete with ctrl + arrows / backspace
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
#expand previous command(fetched for example w/ !!)
bindkey ' ' magic-space 

# [PROMPT]
# git: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# command for displaying 256term colors: curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | bash
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats 'on %F{2}%b%f'
# precmd gets executed before prompt is displayed
UP_PROMPT='%F{6}%~ %f${vcs_info_msg_0_}'
PROMPT=$UP_PROMPT$'\n''%B%(?.%F{2}ム%f.%F{1}マ%f) ~> %b'
#PROMPT=' %F{6}Φ%~ %f'
#RPROMPT='%F{6}%~' #right side prompt

# [SYSTEM ALIASES]
alias -g c='clear' # -g are global aliases (all users)
alias -g ls="ls --color=auto"
alias sys ='systemctl'

#[ALIASES used for CODING]
alias gs='git status'
alias gl='git log'

alias ccc='cc -Wall -Werror -Wextra'
alias cccc='ccc -lbsd'
alias val='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all'
gdbv() {
	gdb -ex "target extended-remote:$1" -ex "set remote exec-file $2" -ex "set args $3"
}
cval() {
	ccc $@ && valgrind ./a.out --leak-check=full --track-origins=yes --show-leak-kinds=all
}
#alias gdb='gdb --args' #always using args flag seems to have no downsides
# [EXTERNAL STUFF]
#add nvim tar to path
export PATH="$PATH:$HOME/bin/nvim-linux64/bin"
# add kitty custom install path
export PATH="$PATH:$HOME/.local/kitty.app/bin"

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
else
	alias vi='nvim'
fi
alias francinette=$HOME/francinette/tester.sh
alias paco=$HOME/francinette/tester.sh

# git completion
# fpath=($ZDOT_DIR $fpath)
