set spell spelllang=en_us

syntax on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set softtabstop=0 noexpandtab
set shiftwidth=4
set smartindent
set nu
set incsearch
let &t_ut=''
:set number
:set t_Co=256

call plug#begin()
Plug 'bfrg/vim-cpp-modern'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'justinj/vim-react-snippets'
call plug#end()

let gruvbox_bold=1
let gruvbox_italic=1
let gruvbox_underline=1
let g:airline_theme='gruvbox'

:colorscheme gruvbox
:set bg=dark

if (getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

ino " ""<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino < <><left>

syntax enable
filetype plugin indent on
