"Show line numbers
set number

" Only works in vim
set t_Co=256

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" noctu only uses the 16 terminal colors ^_^
colorscheme noctu
"colorscheme mynoctu

"colorscheme DarkDefault 
"colorscheme 3dglasses
"colorscheme LightDefault 
"colorscheme base16-ateliercave


" ~~~ Plugins ~~~
call plug#begin('$HOME/.config/nvim/plugged')
" Updating every startup costs time, there's no need for that.
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete.nvim' 
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

" ~~~ Plugin Configuration ~~~
" vim-airline
"let g:airline_powerline_fonts = 1
"let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <esc> :noh<return><esc>

" NerdCommenter
" Change <leader> bind from default \
let mapleader=","
set notimeout

" vim-devicons
let g:webdevicons_enable = 1
set encoding=utf8
set guifont=FuraCode\ Nerd\ Font\ 9
