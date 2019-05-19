" William Brendaw's dotfiles
" 
" author:  brendaw <williambrendaw@protonmail.com>
" code:    https://github.com/brendaw/dotfiles
" version: 0.1.0
"
" description: vim configuration

" Vim default config
set nocompatible
set hidden
set shell=/bin/zsh

" Vim Format
setlocal ruler
set columns=78
set number
set cursorline
set title
set titlelen=73

" Save & Temp file (swap)
set autowrite
set updatecount=100
set updatetime=8000
set undolevels=1000
set noerrorbells

" Fix chars on save file
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" Save read-only file as sudo
cmap w!! w !sudo tee % >/dev/null

" Tab & Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set showcmd
syntax on

set backspace=indent,eol,start

" Auto closing braces, brackets, parentheses and quotes
imap ( ()<Esc>i
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
"inoremap { {<Return><Tab><Return><Space>}<Up><End><Esc>i
inoremap {<Char-13> {<Char-13><Char-32><Char-13>}<Up><End><Esc>i
inoremap [ []<esc>i
inoremap " ""<Esc>i

" Customizing cursor line layout
hi CursorLine cterm=NONE ctermbg=darkgrey

" Always show status bar
set laststatus=2
