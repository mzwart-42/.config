" [BASIC SETTIGNS]
set number 
syntax enable
set nocompatible
set mouse=a
" pluginsless vim? ↓
set path+=**
set wildmenu
" configure the wildmenu

" [COPY AND PASTE]
if $xdg_session_type == "wayland"
	" make copy to system clipboard work on wayland with wl-copy 
	set clipboard=unnamedplus
	nnoremap "+y y:call system("wl-copy", @")<cr>
endif
" use CTRL+Y to copy to system clipboard
vnoremap <S-C-C> "+y<cr>
nnoremap <C-Y> "+y<cr>
vnoremap <C-Y> "+y
nnoremap <C-S-Y> "+Y 

" Quickfix list
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" [AUTOSAVE]
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype == "" | silent write | endif
augroup END
" [BRACKET MATCHING]
" add following options to default match pairs: "< >", "; and the following ;", "[ ]"
" allows switching between matching chars with % sign, (for specified filetypes: c, cpp)
au Filetype c,cpp set matchpairs += ";:;,<:>,[:]"

" [CODE FORMATTING]
set noexpandtab " never expand tab to spaces
set tabstop=6 " tab width (the amount of spaces a tab visually represents)
set shiftwidth=6 "tab width but for shifting tabs with cmd's like: >>, <<, ==
set nowrap
set scrolloff=8

" [SEARCHING]
set hlsearch " highlight all matching text from search
set ignorecase
set smartcase
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


" [COMMENTING]
"let commented = match(getline('.'), ' *--.*')
"vnoremap <leader>i <C-v>^I//<ESC>
let g:commentChar = "//"
function! ToggleComment()
 " Get the current line and its content
 let l:currentLine = getline('.')

 " Check if the line starts with the comment character
 if l:currentLine =~ '^' . g:commentChar
    " If it does, remove the comment character
    call setline('.', substitute(l:currentLine, '^' . g:commentChar, '', ''))
 else
    " Otherwise, add the comment character at the beginning of the line
    call setline('.', g:commentChar . l:currentLine)
 endif
endfunction
" Map the function to a key combination, for example, '<leader>c'
nnoremap <leader>c :call ToggleComment()<CR>
vnoremap <leader>c :call ToggleComment()<CR>


" [THINGS FORM OTHER FILES]
lua require ('plugins')
"lua require('leap').create_default_mappings()
"lua require ('lsp_setup')
lua require('flash').toggle()

" 42 Header
source $HOME/.config/nvim/stdheader.vim
" runtime doesnt require absolute path like source
source 
colorscheme catppuccin

" TODO
" 1. create a keymap that changes file path in statusbar to $PWD/file or some
" other sutff
" 2. completely working commenting keybinds
"

" dim colors

