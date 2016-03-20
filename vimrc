" This must be first, because it changes other options as side effect
set nocompatible

" vim plugins
" -----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'scrooloose/nerdcommenter'

" color scheme
Plug 'https://github.com/morhetz/gruvbox'

" git plugin
Plug 'tpope/vim-fugitive'

" rails specific
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" ctrlp - replacement for commandT
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" ag / silver searcher - ack replacement
Plug 'rking/ag.vim'

" make things look nice
Plug 'vim-airline/vim-airline'

" Add plugins to &runtimepath
call plug#end()


syn on

set hidden " hide buffers instead of closing
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" use incremental search
set incsearch
" ignore case but be smart about it
set ignorecase
set smartcase

filetype plugin indent on
set autoindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set smarttab

set ru

" show line numbers
set number

" key mappings
" -----------------------------------------------------------------

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

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=~/.vimbackup

" tell vim where to put swap files
set directory=~/.vimswap

syntax enable
set bg=dark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" powerline settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

colorscheme gruvbox
"colorscheme hybrid
" can't tell if t_Co is working or not
set t_Co=256

" always show statusline, never realized how useful this is
set laststatus=2

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:h") . "/" <CR>

" Inserts the start of rspec script
" Command mode: Ctrl+P
"cmap <C-R> <C-R>="map ,t :w \|!clear && rspec --tag r" . expand("%:h") . "/" <CR>

set showcmd

set history=1000

" don't let fugitive buffers pile up
autocmd BufReadPost fugitive://* set bufhidden=delete
" default fugitive into vertial splits
set diffopt+=vertical

" remove trailing white spaces on :w
" hold off on this - a bit too aggressive
"autocmd BufWritePre * :%s/\s\+$//e

" show trailing white spaces
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" auto adjust win height
set winwidth=95
set winminwidth=10

" leader key mappings

" taglist plugin
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:tagbar_usearrows = 1
map <leader>e :TagbarToggle<CR>

" toggle NERDTree
map <leader>d :NERDTreeToggle<CR>

" ag a.k.a silver searcher
map <leader>a :Ag<space>

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" vimux mappings
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vx :VimuxClosePanes<CR>

" Syntax Highlighting
au BufNewFile,BufRead *.hbs.erb set ft=mustache
au BufNewFile,BufRead *.scss.erb set ft=scss

au FileType python setl sw=4 sts=4 et

" detect jsx
autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" jsx linting
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" ignore somd folders from fuzzy search
set wildignore+=bower_components,node_modules,tmp

" insert capybara screenshot
imap <c-l> save_and_open_page

" hacks / fixes
" -----------------------------------------------------------------

"  Temporary fix for neovim/neovim#2048 - ctrl-h treated as back sp
if has('nvim')
  nmap <BS> <C-W>h
endif

" experimental
" -----------------------------------------------------------------

