"Maintainer:    Greg Sexton <gregsexton@gmail.com>
"Last Change:   2011-03-24
"Version:       1.0
"URL:           http://www.gregsexton.org/vim-color-schemes/gravity-color/

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "gravity"


" General colors
hi Normal       guifg=#404040   guibg=#f0f0f0 gui=NONE
hi NonText      guifg=#f0f0f0   guibg=#f0f0f0 gui=NONE
hi Cursor       guifg=white     guibg=black   gui=NONE
hi LineNr       guifg=#ffffff   guibg=#c0d0e0 gui=NONE
hi VertSplit    guifg=#4b5e81   guibg=#4b5e81 gui=NONE
hi StatusLine   guifg=#ffffff   guibg=#2a3a57 gui=NONE
hi StatusLineNC guifg=#ffffff   guibg=#4b5e81 gui=NONE
hi Folded       guifg=#404040   guibg=#dcdcdc gui=NONE
hi Title        guifg=#101010   guibg=NONE    gui=BOLD
hi Visual       guifg=white     guibg=#A00000 gui=NONE
hi SpecialKey   guifg=#808080   guibg=#343434 gui=NONE
hi WildMenu     guifg=green     guibg=yellow  gui=NONE
hi PmenuSbar    guifg=black     guibg=white   gui=NONE
hi Error        guifg=NONE      guibg=NONE    gui=undercurl
hi ErrorMsg     guifg=white     guibg=#FF0000 gui=BOLD
hi WarningMsg   guifg=white     guibg=#FF0000 gui=BOLD
hi ModeMsg      guifg=#ff8a00   guibg=#f0f0f0 gui=BOLD
hi IncSearch    guifg=orangered guibg=white
hi Directory    guifg=#CB1014

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#c0d0e0     gui=NONE
  hi CursorColumn   guifg=NONE        guibg=#c0d0e0     gui=NONE
  hi MatchParen	    guifg=red         guibg=#f0f0f0     gui=BOLD
  hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE
  hi PmenuSel       guifg=#ffffff     guibg=#7d0000     gui=NONE
  hi Search	    guifg=white	      guibg=orangered   gui=NONE
endif

" Diff highlighting
hi DiffAdd          guifg=NONE    guibg=#b4de85 gui=NONE
hi DiffDelete       guifg=#9c9c9c guibg=#7c7c7c gui=NONE
hi DiffChange       guifg=NONE    guibg=#87c5dc gui=NONE
hi DiffText         guifg=#ffffff guibg=#a40004 gui=NONE

" Syntax highlighting
hi Comment          guifg=#909090     guibg=NONE        gui=NONE
hi String           guifg=#c40020     guibg=NONE        gui=NONE
hi Number           guifg=#c40020     guibg=NONE        gui=NONE
hi Keyword          guifg=#2a9400     guibg=NONE        gui=NONE
hi PreProc          guifg=#2a9400     guibg=NONE        gui=NONE
hi Conditional      guifg=#001ac4     guibg=NONE        gui=NONE
hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE
hi Todo		    guifg=orangered
hi Constant         guifg=#c40020     guibg=NONE        gui=NONE
hi Identifier       guifg=#7800c4     guibg=NONE        gui=NONE
hi Function         guifg=#d8008e     guibg=NONE        gui=NONE
hi Type             guifg=#00A0A0     guibg=NONE        gui=NONE
hi Statement        guifg=#001ac4     guibg=NONE        gui=NONE
hi Special          guifg=#007958     guibg=NONE        gui=NONE
hi Delimiter        guifg=#000557     guibg=NONE        gui=NONE
hi Operator         guifg=#404040     guibg=NONE        gui=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

"vim: sw=4
