" This must be first, because it changes other options as side effect
set nocompatible

" fix for mac osx copy/paste issue
set clipboard=unnamed

" vim plugins
" -----------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
" color scheme
"Plug 'https://github.com/morhetz/gruvbox'
"Plug 'crusoexia/vim-monokai'
"Plug 'jacoborus/tender'
Plug 'w0ng/vim-hybrid'
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

" behavior
" -----------------------------------------------------------------

syn on
syntax enable

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

" show ruler
set ru
" show line numbers
set number
set showcmd

" leader key mappings
" -----------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

map <leader>s :nohlsearch<CR>

map <leader>e :TagbarToggle<CR>

" toggle NERDTree
map <leader>d :NERDTreeToggle<CR>

" ag a.k.a silver searcher
map <leader>a :Ag<space>

" vimux mappings
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vx :VimuxClosePanes<CR>

" other key mappings
" -----------------------------------------------------------------

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

" history / backup
" -----------------------------------------------------------------

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=~/.vimbackup

" tell vim where to put swap files
set directory=~/.vimswap

set history=1000

" graphics / look and feel / layout
" -----------------------------------------------------------------

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set bg=dark
colorscheme hybrid

" can't tell if t_Co is working or not
set t_Co=256

" always show statusline, never realized how useful this is
set laststatus=2

" show trailing white spaces
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" auto adjust win height
set winwidth=95
set winminwidth=10

" files / file system
" -----------------------------------------------------------------

" Syntax Highlighting
au BufNewFile,BufRead *.hbs.erb set ft=mustache
au BufNewFile,BufRead *.scss.erb set ft=scss

au FileType python setl sw=4 sts=4 et

" detect jsx
autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" plugin specific
" -----------------------------------------------------------------

" don't let fugitive buffers pile up
autocmd BufReadPost fugitive://* set bufhidden=delete
" default fugitive into vertial splits
set diffopt+=vertical

" ctrlp for buffers
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_match_window = 'max:25,results:25'

" jsx linting
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" powerline settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" taglist plugin
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:tagbar_usearrows = 1

" ignore somd folders from fuzzy search
set wildignore+=bower_components,node_modules,tmp

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Credit: thoughtbot dotfiles
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore,
  " ignores hidden files
  " 
  let g:ctrlp_user_command = 'ag -Q -l --nocolor -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" my unique preferences
" -----------------------------------------------------------------

" insert capybara screenshot
imap <c-l> save_and_open_page

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:h") . "/" <CR>

" hacks / fixes
" -----------------------------------------------------------------

"  Temporary fix for neovim/neovim#2048 - ctrl-h treated as back sp
if has('nvim')
  nmap <BS> <C-W>h
endif

" experimental
" -----------------------------------------------------------------

"colorscheme hybrid

" Inserts the start of rspec script
" Command mode: Ctrl+P
"cmap <C-R> <C-R>="map ,t :w \|!clear && rspec --tag r" . expand("%:h") . "/" <CR>

" remove trailing white spaces on :w
" hold off on this - a bit too aggressive
"autocmd BufWritePre * :%s/\s\+$//e
