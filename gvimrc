set guioptions-=L
set guioptions-=r
set guioptions-=T
set guifont=Menlo:h15

"set transp=4	" transparency only works in macvim's experimental render mode

colorscheme DY_railscasts2

" set highlight on
set cursorline 

" colored statusline with some useful info
"sample with color:
"hi User1 term=underline cterm=bold ctermfg=Cyan ctermbg=Blue guifg=#40ffff guibg=#0000aa
"set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)

"hi User1 ctermbg=red ctermfg=red   guibg=#bbbbbb guifg=red
hi StatusLineNC gui=reverse,bold cterm=NONE ctermbg=black ctermfg=lightgrey

set laststatus=2                          " always show status line
set statusline=                           " start with blank statusline
set statusline+=%<\                      " cut at start
set statusline+=[%n]
set statusline+=%#error#%m%r%h%w%*        " modified, help file, and other flags
"set statusline+=%{expand(\"\%\%\")}      " another way for file name
set statusline+=\ %t                      " file name
"set statusline+=\ \ ff:%{&ff}             " file format
set statusline+=\ \ ft:%{&ft}             " file type
"set statusline+=\ \ fe:%{&fenc}           " file encoding
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=\ \ line:\ %l/%L,\ col:\ %v\ (%c)\ %P " line number, column, etc
let g:rails_statusline=0                  " hide rails.vim status
