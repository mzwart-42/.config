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
set cursorline
highlight CursorLine cterm=bold
highlight CursorLineNr ctermbg=red ctermfg=white cterm=bold
" ?
set modeline
set modelines=5

" nnoremap ,main :-1read ~/.config/nvim/.skeleton.main.c<CR>2ji
" add the ability to see the full path with some color highlighting in bar?
" commenting keybinds...
"
lua require ('plugins')
colorscheme solarized-osaka
