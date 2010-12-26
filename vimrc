
"imap jj <Esc>
" map ESC to jj which is easier/quicker to reach
" map! jj <Esc>
" <Esc> is currently mapped to CapsLock - used external mac app to
" accomplish this

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

syn on

filetype plugin indent on
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab

set ru
set number 	" show line numbers

" for navigating split windows easily
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" hit space to enter commands in vim
noremap <space> :

" toggle NERDTree
" nmap <silent> <F7> :NERDTreeToggle<CR>
map <leader>d :NERDTreeToggle<CR>

" FuzzyFinder settings
"let g:fuzzy_matching_limit = 70
"map <leader>f :FufFile **/<CR>
"map <leader>b :FufBuffer<CR>
"map <leader>t :FuzzyFinderTextMate<CR>
"map <leader>r :FufRenewCache<CR>

map <leader>f :CommandTFlush<CR>
map <leader>t :CommandT<CR>

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=~/.vimbackup

" tell vim where to put swap files
set dir=~/.vimswap
