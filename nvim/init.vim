" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: mzwart <mzwart@student.codam.nl>           +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2024/01/28 14:52:02 by mzwart            #+#    #+#              "
"    Updated: 2024/01/28 14:52:02 by mzwart           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" [BASIC SETTIGNS]
set number 
syntax enable
set nocompatible
set mouse=r
" [COPY AND PASTE]
if $xdg_session_type == "wayland"
	" make copy to system clipboard work on wayland with wl-copy 
	set clipboard=unnamedplus
	nnoremap "+y y:call system("wl-copy", @")<cr>
endif
" use yc to copy to system clipboard
nnoremap yc "+y
vnoremap yc "+y
nnoremap Yc "+Y
" [AUTOSAVE]
" map <Esc> <Esc>:w<cr> doesnt work for changes outside of insert mode
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype == "" | silent write | endif
augroup END

" [BRACKET MATCHING]
" add following options to default match pairs: "< >", "; next ;", "[ ]" 
" (only for specified filetypes)
au Filetype c,cpp set matchpairs += ";:;,<:>,[:]"
" [TAB BEHAVIOUR]
set noexpandtab " never expand tab to spaces
set tabstop=6 " tab width (the amount of spaces a tab visually represents)
set shiftwidth=6 "tab width but for shifting tabs with cmd's like: >>, <<, ==

set hlsearch " highlight search
set ignorecase
set incsearch
" set visualbell
set ruler
set showcmd
" [LINE AT CURSOR]
" ?
set cursorline
highlight CursorLine cterm=bold
highlight CursorLineNr ctermbg=red ctermfg=white cterm=bold
set modeline
set modelines=5

" nnoremap ,main :-1read ~/.config/nvim/.skeleton.main.c<CR>2ji
" add the ability to see the full path with some color highlighting in bar?
" commenting keybinds...

" Formatting for kitty scrollback with nvim
if $TERM == "xterm-kitty"
	function! KittyBufferHistoryClean()
	  set modifiable
	  set noconfirm
	  " clean ascii/ansi code  (starts with ^[)
	  silent! %s/\e\[[0-9:;]*m//g
	  silent! %s/[^[:alnum:][:punct:][:space:]]//g
	  silent! %s/\e\[[^\s]*\s//g
	  " remove empty spaces from end
	  silent! %s/\s*$//
	  let @/ = ""
	  set rnu
	  " map q to force quit
	  cnoremap q q!
	endfunction
	command! KittyBufferHistoryClean call KittyBufferHistoryClean()
endif

"let g:user42 = 'mzwart'
"let g:mail42 = 'mzwart@student.codam.nl'
lua require ('plugins')
source stdheader.vim
colorscheme solarized-osaka
