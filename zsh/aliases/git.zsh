#[ALIASES used for CODING]
alias lg='lazygit'
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend -m'
alias ccc='cc -Wall -Werror -Wextra'
alias cccbsd='ccc -lbsd'
alias val='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all'
alias gdb='gdb --args'
gdbv() {
	gdb -ex "target extended-remote:$1" -ex "set remote exec-file $2" -ex "set args $3"
} # crazy gdb and valgrind setup: https://www.redhat.com/en/blog/valgrind-and-gdb-close-cooperation
cval() {
	ccc $@ && valgrind ./a.out --leak-check=full --track-origins=yes --show-leak-kinds=all
} # compile and run valgrind

