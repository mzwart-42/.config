# [SYSTEM ALIASES]
# dont need an alias for clear, CTRL-L is a superior method of clearing the screen
alias -g ls="ls --color=auto"
alias -g sys='systemctl'
alias -g vi='nvim' # possibly gets overwritten by codam.sh

alias gdb='gdb -q --args'

function killjobs () {
    JOBS="$(jobs -p)";
    if [ -n "${JOBS}" ]; then;
        kill -KILL ${JOBS};
    fi
}
