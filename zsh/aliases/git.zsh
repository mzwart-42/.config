#[ALIASES used for CODING]
alias lg='lazygit'
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m' "$1"
alias gm='git commit --amend -m' "$1"
alias ccc='cc -Wall -Werror -Wextra'
alias cccc='ccc -lbsd'
alias val='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all'
alias gdb='gdb --args'
gdbv() {
	gdb -ex "target extended-remote:$1" -ex "set remote exec-file $2" -ex "set args $3"
} # crazy gdb and valgrind setup: https://www.redhat.com/en/blog/valgrind-and-gdb-close-cooperation
cval() {
	ccc $@ && valgrind ./a.out --leak-check=full --track-origins=yes --show-leak-kinds=all
} # compile and run valgrind

