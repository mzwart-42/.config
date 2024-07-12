# [STUFF]
#unsetopt BEEP # remove annoying *beep* (only in shell)
#unsetopt LIST_BEEP
bindkey -e	# emacs mode
# move over words with ctrl + arrows and delete with ctrl + backspace (kinda finicky with nvim term)
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey ' ' magic-space #expand previous command (for example: sudo !!)

# [ALIASES]
alias_dir="$ZDOTDIR/aliases"
source $alias_dir/git.zsh
source $alias_dir/system.zsh
source $alias_dir/codam.zsh

# source all files from aliases_dir ending in .zsh:
# find "$alias_dir" -type f  -name "*.zsh" -exec zsh -c 'source "{}"' \;

# [HISTORY]
# manual page 'zshparam' for info about these options
HISTFILE=$ZDOTDIR/.histfile
SAVEHIST=1000
HISTSIZE=1000
# info about these options can be found in manual page 'zshoptions'
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

#bindkey '\e[A'	history-beginning-search-backward
#bindkey '\e[B'	history-beginning-search-backward

# [PROMPT]
# git prompt stuff: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info } # precmd gets executed before prompt is displayed
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{8}on%f %F{2}%b%f' 
UP_PROMPT='%F{6}%~ %f${vcs_info_msg_0_}'
PROMPT=$UP_PROMPT$'\n''%B%(?.%F{2}ム%f.%F{1}マ%f)%F{12} ~> %f%b'

# TIP: you can load a preinstalled theme with the following setup (useful when no internet)



# [42 SPECIFIC CONFIGURATION]
# for making kitty and nvim work on 42 machine
source $ZDOTDIR/codam.sh --quiet

# [SYNTAX HIGHLIGHTING]
# remove isntalling later
if [[ ! -d $ZDOTDIR/zsh-syntax-highlighting ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZDOTDIR/zsh-syntax-highlighting
fi
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh --quiet

# [AUTO COMPLETION]
autoload -U compinit; compinit

# fzf tab completion( copy pasted from github repo)

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Disable bell for command completions
zstyle ':completion:*' completion-list-bell 'none'

# Disable bell for error messages
zstyle ':main:' error-message-bell 'none'


