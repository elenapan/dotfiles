" Maintainer:	 Roly Fentanes (https://github.com/fent)
" Version:     1.0
" Last Change: May 4 2014

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "frozen"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine                   guibg=#2d2d2d
  hi ColorColumn                  guibg=#2d2d2d
  hi CursorColumn                 guibg=#2d2d2d
  hi MatchParen    guifg=#d0ffc0  guibg=#2f2f2f gui=bold
  hi Pmenu		     guifg=#e1eaf9  guibg=#444444
  hi PmenuSel		   guifg=#000000  guibg=#b1d631
endif

" General colors
hi Cursor       guifg=NONE    guibg=#626262 gui=none
hi Normal       guifg=#adc7dc guibg=#202020 gui=none 
hi NonText      guifg=#808080 guibg=#202020 gui=none
hi LineNr       guifg=#808080 guibg=#202020 gui=none
hi StatusLine   guifg=#d3d3d5 guibg=#444444 gui=italic
hi StatusLineNC guifg=#939395 guibg=#444444 gui=none
hi VertSplit    guifg=#444444 guibg=#444444 gui=none
hi Folded       guifg=#a0a8b0 guibg=#202020 gui=none
hi Title        guifg=#b6cbf2 guibg=NONE	  gui=bold
hi Visual       guifg=#faf4c6 guibg=#3c414c gui=none
hi SpecialKey   guifg=#808080 guibg=#202020 gui=none

" Syntax highlighting
hi Comment    guifg=#808080 gui=italic
hi Boolean    guifg=#7fb2e5 gui=bold
hi String     guifg=#7aa6c7 gui=italic
hi Identifier guifg=#7fb2e5 gui=none
hi Function   guifg=#5a90b9 gui=bold
hi Type       guifg=#7e8aa2 gui=none
hi Statement  guifg=#7e8aa2 gui=none
hi Keyword    guifg=#7b9c9c gui=none
hi Constant   guifg=#7b9c9c gui=none 
hi Number     guifg=#89ba63 gui=none
hi Special    guifg=#5b8484 gui=none
hi PreProc    guifg=#faf4c6 gui=none
hi Todo       guifg=#808080 guibg=#e6ea50 gui=italic
