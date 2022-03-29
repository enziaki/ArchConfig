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
Plug 'prettier/vim-prettier', { 'do': 'yarn-install'}
Plug 'morhetz/gruvbox'
call plug#end()


" The escape. Copied from kami.
autocmd VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
autocmd VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


