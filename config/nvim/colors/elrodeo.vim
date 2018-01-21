" Vim color file
" Name: elrodeo
" Maintainer: Christian Müller (@gravitydenier))
" Version: 2.0

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="elrodeo"

" the nexz block is copied from the wombat theme:
" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif
" General colors
hi Normal      guibg=#404040 guifg=#d0d0d0
hi Cursor 		guifg=#656565 guibg=#d0d0d0
hi NonText 		guifg=#808080 guibg=#404040
hi LineNr 		guifg=#666666 guibg=#383838
hi StatusLine 	guifg=#f6f3e8 guibg=#444444
hi StatusLineNC guifg=#857b6f guibg=#444444
hi VertSplit 	guifg=#444444 guibg=#444444
hi Folded 		guibg=#384048 guifg=#a0a8b0
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444
hi SpecialKey	guifg=#808080 guibg=#343434

" Syntax highlighting
hi Comment 		guifg=#677c99
hi Operator		guifg=#a080f0
hi Todo 		guifg=#333333 guibg=#cccccc
hi Constant 	guifg=white
hi String 		guifg=#bbddff
hi Identifier 	guifg=#8ac6f2
hi Define    	guifg=#30c080
hi Macro        guifg=#30c080
hi Function 	guifg=#30c080
hi Number		guifg=#319899
hi Special		guifg=#30c080
hi Boolean      guifg=#99dd99
hi Delimiter    guifg=#999999
hi Character    guifg=#55d2ee
hi Search       guifg=black guibg=#30c080
hi Visual       guibg=#303030

" not used in Clojure (left as in wombat)
hi Type 		guifg=#cae682
hi Statement 	guifg=#8ac6f2
hi Keyword		guifg=#a080e9
hi PreProc 		guifg=#e5786d
