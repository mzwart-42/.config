# [STUFF]
unsetopt BEEP
bindkey -e	# emacs mode
# move over words with ctrl + arrows and delete with ctrl + backspace
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
#expand previous command (for example: sudo !!)
bindkey ' ' magic-space 

# [HISTORY]
# 'man zshparams' for info about options
HISTFILE=$ZDOTDIR/.histfile
SAVEHIST=1000
HISTSIZE=1000

# info about these options can be found in the manual page 'zshoptions'
setopt append_history         # Allow multiple sessions to append to one Zsh command history.
setopt extended_history       # Show timestamp in history.
setopt hist_expire_dups_first # Expire A duplicate event first when trimming history.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_all_dups   # Remove older duplicate entries from history.
setopt hist_ignore_dups       # Do not record an event that was just recorded again.
setopt hist_ignore_space      # Do not record an Event Starting With A Space.
setopt hist_reduce_blanks     # Remove superfluous blanks from history items.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt inc_append_history     # Write to the history file immediately, not when the shell exits.
setopt share_history          # Share history between different instances of the shell.

bindkey '\e[A'	history-beginning-search-backward
bindkey '\e[A'	history-beginning-search-backward

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
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m' "$1"
alias gm='git commit --amend -m' "$1"
alias ccc='cc -Wall -Werror -Wextra'
alias cccc='ccc -lbsd'
alias val='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all'
gdbv() {
	gdb -ex "target extended-remote:$1" -ex "set remote exec-file $2" -ex "set args $3"
} # crazy gdb and valgrind setup: https://www.redhat.com/en/blog/valgrind-and-gdb-close-cooperation
cval() {
	ccc $@ && valgrind ./a.out --leak-check=full --track-origins=yes --show-leak-kinds=all
} # compile and run valgrind

# [CODAM SPECIFIC CONFIGURATION]
# for codam configuration to work properly set the environment variable USER42 to intra login
if [[ -a $HOME/.config/zsh/codam.sh ]]; then
	source $HOME/.config/zsh/codam.sh
fi


# [SYNTAX HIGHLIGHTING]
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Color syntax highlighting according to dracula color scheme...
# Recommend to only use it with the complimentary color theming
#	source $HOME/.config/zsh/dracula-zsh-highlighting.sh

# [DEVICE SPECIFIC STUFF]
if [[ -a $HOME/.config/zsh/specific.sh ]]; then
	source $HOME/.config/zsh/specific.sh
fi

