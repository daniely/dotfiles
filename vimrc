" This must be first, because it changes other options as side effect
set nocompatible

" fix for mac osx copy/paste issue
set clipboard=unnamed

" vim plugins
" -----------------------------------------------------------------
"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
" color scheme
"Plug 'https://github.com/morhetz/gruvbox'
"Plug 'crusoexia/vim-monokai'
"Plug 'jacoborus/tender'

" colorscheme
"Plug 'w0ng/vim-hybrid'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
" git plugin
Plug 'tpope/vim-fugitive'
" rails specific
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
" ctrlp - but use ripgrep for doing the actual search
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" a wrapper for searching and displaying in quickfix window
"Plug 'mileszs/ack.vim'
" make things look nice
Plug 'vim-airline/vim-airline'

" for running tests in separate window
Plug 'janko/vim-test'
"Plug 'vim-test/vim-test'
Plug 'christoomey/vim-tmux-runner'
" maybe replace vim-tmux-runner with https://github.com/kassio/neoterm ??

" seamless vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'
"Plug 'pechorin/any-jump.vim'

Plug 'junegunn/fzf'
" syntax highlight requirement for fzf
Plug 'sharkdp/bat'
" Add the fzf.vim plugin to wrap fzf:
Plug 'junegunn/fzf.vim'

" telescope dependencies
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'
" alternative to fzf?
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'sheerun/vim-polyglot'
"Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'skywind3000/asyncrun.vim'
"Plug 'jgdavey/tslime.vim'

" tig-explorer is slowing down ag.vim. disable for now and just use from
" command line
"Plug 'iberianpig/tig-explorer.vim'
" tig-explorer dependency for neovim
"Plug 'rbgrouleff/bclose.vim'

" Add plugins to &runtimepath
call plug#end()

lua require('gitsigns').setup()

" behavior
" -----------------------------------------------------------------

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

" fzf.vim for buffers
map <leader>b :Buffers<CR>
" trying out telescope for managing buffers
"map <leader>b :Telescope buffers<CR>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({ sort_lastused = true })<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

map <leader>p :GFiles<CR>

map <leader>s :nohlsearch<CR>

map <leader>e :TagbarToggle<CR>

" toggle NERDTree
map <leader>d :NERDTreeToggle<CR>

" use ripgrep for search
map <leader>a :Rg<space>

" test runner settings - vim-test which is using vim-tmux-runner (vtr) underneath
let test#strategy = "vtr"
map <leader>vn :TestNearest<CR>
map <leader>vf :TestFile<CR>
map <leader>vs :TestSuite<CR>
map <leader>vl :TestLast<CR>
map <leader>vv :TestVisit<CR>
" vim-tmux-runner settings
map <leader>vx :VtrKillRunner<CR>
map <leader>vo :VtrOpenRunner<CR>

" gitsigns
map <leader>gn :Gitsigns next_hunk<CR>
map <leader>gp :Gitsigns prev_hunk<CR>
map <leader>gr :Gitsigns preview_hunk<CR>

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



if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif


syn on
syntax enable
let g:onedark_termcolors = 256
"set bg=dark
colorscheme onedark
"colorscheme OceanicNext
"let $BAT_THEME='gruvbox'

" fix neovim popup window color scheme
"hi CocFloating guibg=none guifg=none
hi Quote ctermbg=109 guifg=#83a598

" can't tell if t_Co is working or not
set t_Co=256

" always show statusline, never realized how useful this is
set laststatus=2

" show trailing white spaces
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
" make it red (match error message)
match errorMsg /\s\+$/

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

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_COMMAND='rg --files'
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
" fzf.vim - Popup window
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9, 'highlight': 'Comment' } }

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

" CtrlP settings
let g:ctrlp_match_window = 'max:25,results:25'
if executable('rg')
  " default ripgrep settings
  set grepprg=rg\ -H\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" old CtrlP settings that used Ack
"if executable('ag')
"  " Use Ag over ack
"  let g:ackprg = 'ag --nocolor --column --vimgrep --nogroup --ignore sorbet --ignore node_modules --ignore log --ignore "./public/stylesheets/*"'
"  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore,
"  " ignores hidden files
"  "
"  let g:ctrlp_user_command = 'ag -Q -l --nocolor -g "" %s'
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif

" Navigate quickfix list with ease
nnoremap <silent> [q :previous<CR>
nnoremap <silent> ]q :cnext<CR>c

" my unique preferences
" -----------------------------------------------------------------

" insert capybara screenshot
"imap <c-l> save_and_open_page
imap <c-l> div(class="")

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
