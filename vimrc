
"imap jj <Esc>
" map ESC to jj which is easier/quicker to reach
" map! jj <Esc>
" <Esc> is currently mapped to CapsLock - used external mac app to
" accomplish this

" This must be first, because it changes other options as side effect
set nocompatible

" vim plugin manager. needs to run before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syn on

set hidden " hide buffers instead of closing
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode

filetype plugin indent on
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab

set ru
set number 	" show line numbers

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" open tabs with command-<tab number>
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

" for navigating split windows easily
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" hit space to enter commands in vim
noremap <space> :
" goto next line (useful when linewrap is on)
noremap j gj
noremap k gk

" toggle NERDTree
" nmap <silent> <F7> :NERDTreeToggle<CR>
map <leader>d :NERDTreeToggle<CR>

map <leader>b :CommandTFlush<CR>
map <leader>f :CommandT<CR>

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=~/.vimbackup

" tell vim where to put swap files
set dir=~/.vimswap

" fix for rvm
set shell=/bin/sh

colorscheme BusyBee
