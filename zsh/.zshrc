# [STUFF] ¯\_(ツ)_/¯
unsetopt BEEP
bindkey -e	# emacs mode
# move over words and delete with ctrl + arrows / backspace
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
#expand previous command(fetched for example w/ !!)
bindkey ' ' magic-space 

# [CODAM_SPECIFIC]
# Make sure the USER42 variable is set to make the comparison true
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
# -g are global aliases (all users)
alias -g c='clear'
alias -g ls="ls --color=auto"
# system stuff
alias sys ='systemctl'

# git aliases
alias gs = 'git status'
alias gl = 'git log'
# compile flags
alias ccc ='cc -Wall -Werror -Wextra'
alias cccc ='ccc -lbsd'
alias gdb ='gdb --args' #always using args flag seems to have no downsides
alias val ='valgrind --leak-check=full --track-origins=yes'
cval() {
	ccc $1 $2 $3 $4 $5 $6 && valgrind ./a.out --leak-check=full --track-origins=yes
}

export LD_LIBRARY_PATH=/home/mzwart/.capt/root/lib/x86_64-linux-gnu:/home/mzwart/.capt/root/usr/lib/x86_64-linux-gnu:
export PATH=/home/mzwart/.capt:/home/mzwart/.capt/root/usr/local/sbin:/home/mzwart/.capt/root/usr/local/bin:/home/mzwart/.capt/root/usr/sbin:/home/mzwart/.capt/root/usr/bin:/home/mzwart/.capt/root/sbin:/home/mzwart/.capt/root/bin:/home/mzwart/.capt/root/usr/games:/home/mzwart/.capt/root/usr/local/games:/home/mzwart/.capt/snap/bin:/home/mzwart/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/mzwart/.dotnet/tools

#add nvim tar to path
export PATH="$PATH:$HOME/bin/nvim-linux64/bin"
# add kitty custom install path
export PATH="$PATH:$HOME/.local/kitty.app/bin"
