"Show line numbers
set number
"set relativenumber

" Copy / paste to and from clipboard with leader+key then y or p with their
" arguments
nnoremap <leader>l "*
vnoremap <leader>l "*

" tabs
set expandtab
set tabstop=4
set shiftwidth=4

" indentation
set smartindent
set autoindent
set cindent
" Auto braces, brackets and quotes closing
"inoremap { {<CR>}<up><end><CR><Tab>
inoremap { {<CR>}<up><end><CR>
inoremap ( ()<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>

" Create new terminal in current path
nnoremap <leader>n :!st -e & disown<CR><CR>

" Write buffer through sudo
cnoreabbrev w!! w !sudo tee % >/dev/null

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
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

" ~~~ Plugin Configuration ~~~
" vim-airline
"let g:airline_powerline_fonts = 1
"let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Clear search highlighting
nnoremap <silent><esc> :noh<return><esc>

" NerdCommenter
" Change <leader> bind from default \
let mapleader=","
set notimeout

" vim-devicons
"let g:webdevicons_enable = 1
"set encoding=utf8
"set guifont=FuraCode\ Nerd\ Font\ 9

" different cursor in insert mode
" doesnt work :(
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

" javacomplete2
let g:JavaComplete_ClosingBrace = 1
