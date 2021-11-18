packloadall
set spell spelllang=en_us

syntax on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set softtabstop=0 noexpandtab
set shiftwidth=4
set smartindent
set nu
set incsearch
let &t_ut=''
call plug#begin('~/.vim/plugged')

Plug 'vim-autoformat/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier', { 'do': 'yarn-install'}
Plug 'morhetz/gruvbox'
call plug#end()
