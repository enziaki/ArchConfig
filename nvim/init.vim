" Basic settings
" ================================
filetype plugin indent on
set nowrap
set relativenumber
set number
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse+=a
set scrolloff=8

set ignorecase
set smartcase
set smartindent

set sidescrolloff=8
set splitbelow
set splitright
set termguicolors

set undofile

set updatetime=300 " Faster completions

set showtabline=2

set signcolumn=yes " related to some git line shit

set cursorline

set pumblend=30 " idk why 30
set pumheight=8

set cmdheight=2 " More space for cli to display messages

let mapleader = " "
" nnoremap <SPACE> <Nop> " Set leader to space

" Cursor stuff
set guicursor=

" ================================

" Plugins
" Loads and setups plugins
lua require('user') 



" Color Scheme
" =============================
let g:catppuccin_flavour = "mocha"
" colorscheme catppuccin
colorscheme kanagawa
" colorscheme tokyonight

" =============================


" Basic Keybinds
" ==========================================

" Convert CapsLock to Esc
autocmd VimEnter * silent !esc-capslock.sh 1
autocmd VimLeave * silent !esc-capslock.sh 0

" Clear search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" Split window
nnoremap <C-s> :vsplit<CR>

" Navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize window
nnoremap <C-UP> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>


" Navigating buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprev<CR>

" Close the buffer
nnoremap <S-d> :Bdelete<CR>


" Map Esc to terminal mode
tnoremap <Esc> <C-\><C-n>

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv


" Plugins based keybinds

" Telescope
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <leader><S-q> :Telescope tagstack<CR>

" Dir Tree
nnoremap <C-t> :NvimTreeToggle<CR>
" inoremap <C-t> <ESC>:NvimTreeFocus<CR>

" Lazygit
nnoremap <leader>g :LazyGit<CR>

" Open terminal (also ctrl-\)
" nnoremap <leader>t :terminal<CR> 
" Open terminal vertical
nnoremap <leader>t <Cmd>exe v:count1 . "ToggleTerm size=40 direction=vertical"<CR>

" closes/open all the terminals
nnoremap <leader><S-t> :ToggleTermToggleAll<CR> 


" ==========================================


" GUI nvim settings (neovide)
"======================================================

set guifont=Source\ Code\ Pro:h8
inoremap <C-S-v> "+p
"======================================================

