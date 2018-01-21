" Maintainer:	Jaime Buelta (jaime.buelta@gmail.com)
" Last Change:	March 27 2013

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jaime"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#ffcb69
  hi CursorColumn guibg=#ffcb69
  hi MatchParen   guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 	      guifg=#f6f3e8 guibg=#888888
  hi PmenuSel 	  guifg=#000000 guibg=#95ab64
endif

" General colors
hi Cursor 		    guifg=NONE    guibg=#de8544 gui=none
hi Normal 		    guifg=#000000 guibg=#fefefe gui=none
hi NonText 		    guifg=#303030 guibg=#eeeeee gui=none
hi LineNr 		    guifg=#99968b guibg=#ffffff gui=none
hi StatusLine       guifg=#ffcc66 guibg=#888888 gui=italic
hi StatusLineNC 	guifg=#f6f3e8 guibg=#888888 gui=none
hi VertSplit 		guifg=#444444 guibg=#888888 gui=none
hi Folded 		    guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		    guifg=#464542 guibg=NONE    gui=bold
hi Visual		    guifg=#000000 guibg=#ffcb69 gui=none
hi SpecialKey		guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment 		        guifg=#99968b gui=italic
hi Todo 		        guifg=#8f8f8f gui=italic
hi Constant 		    guifg=#800000 gui=none
hi String 		        guifg=#00aa00 gui=italic
hi Identifier 		    guifg=#95ab64 gui=none
hi Function 	    	guifg=#000000 gui=bold
hi Type 		        guifg=#95ab64 gui=none
hi Statement 		    guifg=#0000ff gui=none
hi Keyword		        guifg=#0000ff gui=none
hi PreProc 		        guifg=#e5786d gui=none
hi Number		        guifg=#800000 gui=none
hi Special		        guifg=#008040 gui=none
hi Structure            guifg=#5b6d44 gui=none
hi pythonDecorator      guifg=#99968b gui=italic
hi pythonDottedName     guifg=#99968b gui=italic
hi pythonBuiltinFunc    guifg=#408080 gui=none
hi pythonBuiltinObj     guifg=#0000ff gui=italic
hi pythonSelf           guifg=#000000 gui=italic
