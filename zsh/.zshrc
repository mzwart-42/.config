# [STUFF] ¯\_(ツ)_/¯
unsetopt BEEP
bindkey -e	# emacs mode
# move over words and delete with ctrl + arrows / backspace
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey ' ' magic-space #expand previous command(fetched for example w/ !!)

# [PROMPT]
# git: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%B%F{magenta}%~%f${vcs_info_msg_0_} -> '
#RPROMPT='${vcs_info_msg_0_} ' #right side prompt
zstyle ':vcs_info:git:*' formats '%F{yellow}_%s(%F{green}%b%F{yellow}%)%f'

# [ALIASES]
# global aliases (all users)
alias -g c='clear'
alias -g ls="ls --color=auto"
alias sudo='sudo ' # make all other aliases work in sudo ??
alias sys='systemctl'
alias vi='nvim'
# compile flags
alias ccc='cc -Wall -Werror -Wextra'
alias cccc='ccc -lbsd'
alias gdb='gdb --args' #always using args flag seems to have no downsides

cval() {
	ccc $1 $2 $3 $4 $5 $6 && valgrind ./a.out --leak-check=full --track-origins=yes
}
# francinette
alias francinette=$HOME/francinette/tester.sh
alias paco=$HOME/francinette/tester.sh
