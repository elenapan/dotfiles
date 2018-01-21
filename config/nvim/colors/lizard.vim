" Maintainer:   Gilson Filho (contato@gilsondev.com)
" Last Change:  September 26 2012

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "lizard"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine         guibg=#2D2D2D
  hi CursorColumn       guibg=#2D2D2D
  hi ColorColumn        guibg=#2D2D2D
  hi MatchParen         guifg=#F6F3E8 guibg=#857B6F gui=BOLD
  hi Pmenu              guifg=#F6F3E8 guibg=#444444
  hi PmenuSel           guifg=#000000 guibg=#CAE682
endif

" General colors
hi Cursor               guifg=NONE    guibg=#656565 gui=NONE
hi Normal               guifg=#E0E0E0 guibg=#242424 gui=NONE
hi NonText              guifg=#808080 guibg=#242424 gui=NONE
hi LineNr               guifg=#857B6F guibg=#242424 gui=NONE
hi StatusLine           guifg=#F6F3E8 guibg=#444444 gui=ITALIC
hi StatusLineNC         guifg=#857B6F guibg=#444444 gui=NONE
hi VertSplit            guifg=#444444 guibg=#444444 gui=NONE
hi Folded               guibg=#2B2B2B guifg=#A0A8B0 gui=NONE
hi Title                guifg=#F6F3E8 guibg=NONE    gui=BOLD
hi Visual               guifg=#A0A8B0 guibg=#303030 gui=NONE
hi SpecialKey           guifg=#808080 guibg=#343434 gui=NONE

" Syntax highlighting
hi Comment              guifg=#99968B gui=ITALIC
hi Todo                 guibg=NONE    guifg=#8F8F8F gui=ITALIC,BOLD
hi Constant             guifg=#E5786D gui=NONE
hi String               guifg=#95E454 gui=ITALIC
hi Identifier           guifg=#CAE682 gui=NONE
hi Function             guifg=#CAE682 gui=NONE
hi Type                 guifg=#CAE682 gui=NONE
hi Statement            guifg=#8AC6F2 gui=NONE
hi Keyword              guifg=#8AC6F2 gui=NONE
hi PreProc              guifg=#E5786D gui=NONE
hi Number               guifg=#FFAFAF gui=NONE
hi Special              guifg=#E7F6DA gui=NONE
hi Boolean              guifg=#FFAFAF gui=NONE

" Python syntax
hi pythonCoding         guifg=#99968B gui=ITALIC
hi pythonNumber         guifg=#FFAFAF gui=NONE
