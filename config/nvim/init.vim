set number
set t_Co=256

colorscheme DarkDefault 

call plug#begin('$HOME/.config/nvim/plugged')
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete.nvim' 
Plug 'tpope/vim-sensible'
call plug#end()

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <esc> :noh<return><esc>

