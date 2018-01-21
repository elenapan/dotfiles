"--------------------------------------------------------------------
" Name Of File: erez.vim.
" Description: Gvim colorscheme for LCDs, designed against VIM 7.0 GUI
" By: Erez Shinan
" Contact: erezshin@gmail.com
" Created: 2007 Jan
" Last Change: 3/1/13
"--------------------------------------------------------------------



set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "erez"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Search     guifg=Black	guibg=Yellow	gui=bold
highlight Visual     guifg=Grey25			gui=bold
highlight Cursor     guifg=Black	guibg=Grey80	gui=bold
highlight Special    guifg=lightmagenta
highlight Comment    guifg=darkgrey
"highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=lightyellow			gui=NONE
highlight Type		 guifg=white				gui=NONE
highlight Function	 guifg=orange
highlight pythonPreString guifg=lightgreen
highlight String	 guifg=lightgreen
highlight Builtin	 guifg=white
highlight Pmenu guibg=white guifg=black
highlight PMenuSel gui=bold guibg=DarkGreen guifg=honeydew2
highlight PMenuSbar  gui=bold guibg=LightSkyBlue4
highlight PMenuThumb gui=bold guibg=DarkGreen
highlight SpellBad   gui=undercurl guisp=Red
highlight SpellRare  gui=undercurl guisp=Orange
highlight SpellLocal gui=undercurl guisp=Orange
highlight SpellCap   gui=undercurl guisp=Yellow
highlight ExtraWhiteSpace   guibg=darkred
match ExtraWhiteSpace /\s\+$/


hi VertSplit       gui=none       guibg=#000000  guifg=#ffffff
hi Folded		guibg=grey30		guifg=orange
hi Todo            gui=none       guibg=#000000  guifg=#ff0000
hi Title           gui=none                      guifg=cyan
hi StatusLine      gui=none       guibg=darkgreen  guifg=black
hi StatusLineNC    gui=none       guibg=darkgrey  guifg=black
hi PreProc         gui=none                      guifg=lightblue
hi cDefine                                       guifg=darkgreen
hi cInclude                                      guifg=green
hi CursorLine                   guibg=#333333



" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=yellow	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=lightmagenta
highlight Comment    ctermfg=darkgrey
highlight Statement  ctermfg=yellow			cterm=NONE
highlight Type		 ctermfg=darkcyan				cterm=NONE
highlight Function	 ctermfg=brown
highlight String	 ctermfg=green
highlight Builtin	 ctermfg=white
hi PreProc               ctermfg=cyan
hi CursorLine                   ctermbg=darkblue cterm=None

hi VertSplit       ctermbg=black ctermfg=white
