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
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info } # precmd gets executed before prompt is displayed
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{8}on%f %F{2}%b%f'
UP_PROMPT='%F{6}%~ %f${vcs_info_msg_0_}'
PROMPT=$UP_PROMPT$'\n''%B%(?.%F{2}ム%f.%F{1}マ%f)%F{8} ~> %f%b'
#PROMPT=' %F{6}Φ%~ %f'
#RPROMPT='%F{6}%~' #right side prompt
# info about git: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# command for displaying 256term colors: curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | bash

# [SYSTEM ALIASES]
alias -g c='clear' # -g are global aliases (all users)
alias -g ls="ls --color=auto"
alias -g sys='systemctl'
alias -g vi='nvim' # gets overwritten by codam.sh

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

# [CODAM SPECIFIC CONFIGURATION]
# source codam.sh if the file exists
if [[ -a $HOME/.config/zsh/codam.sh ]]; then
	source $HOME/.config/zsh/codam.sh
fi

# [SYNTAX HIGHLIGHTING]
# Color syntax highlighting according to dracula color scheme
source $HOME/.config/zsh/dracula-zsh-highlighting.sh
# comment out line below if you don't like SYNTAX HIGHLIGHTING
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

