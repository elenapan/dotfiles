" Vim color file
"
" Name:       burnttoast256.vim
" Version:    1.2
" Maintainer:  Francois Labelle <quantum.omega@gmail.com>
" Based on:   xoria256.vim 1.1 by Dmitriy Y. Zotikov (xio) <xio@ungrund.org>
"
" Should work in recent 256 color terminals.  88-color terms like urxvt are
" unsupported.
"
" Don't forget to install 'ncurses-term' and set TERM to xterm-256color or
" similar value.
"
" Color numbers (0-255) see:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html



" Bla-bla ----------------------------------------------------------------------

if &t_Co != 256 && ! has("gui_running")
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "burnttoast256"

" now set it up to change the status line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif



" The real part ----------------------------------------------------------------

"" General colors
hi Normal       ctermfg=252 guifg=#d0d0d0 ctermbg=16  guibg=#000000 cterm=none gui=none
hi ColorColumn                            ctermbg=233 guibg=#121212
hi CursorColumn                           ctermbg=238 guibg=#444444
hi Cursor                                 ctermbg=214 guibg=#ffaf00
hi CursorLine                             ctermbg=235 guibg=#262626 cterm=none gui=none
hi CursorLineNr ctermfg=7   guifg=#e5e5e5 ctermbg=233 guibg=#121212 cterm=bold gui=bold
hi FoldColumn   ctermfg=248 guifg=#a8a8a8 ctermbg=bg  guibg=bg
hi Folded       ctermfg=255 guifg=#eeeeee ctermbg=60  guibg=#5f5f87
hi IncSearch    ctermfg=0   guifg=#000000 ctermbg=223 guibg=#ffdfaf cterm=none gui=none
hi LineNr       ctermfg=8   guifg=#7f7f7f ctermbg=233 guibg=#121212
hi NonText      ctermfg=237 guifg=#3a3a3a
hi Pmenu        ctermfg=0   guifg=#000000 ctermbg=246 guibg=#949494
hi PmenuSbar                              ctermbg=243 guibg=#767676
hi PmenuSel     ctermfg=0   guifg=#000000 ctermbg=243 guibg=#767676
hi PmenuThumb                             ctermbg=252 guibg=#d0d0d0
hi Search       ctermfg=0   guifg=#000000 ctermbg=149 guibg=#afd75f
hi SignColumn   ctermfg=248 guifg=#a8a8a8
hi SpecialKey   ctermfg=237 guifg=#3a3a3a
hi StatusLine                             ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC                           ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi TabLine      ctermfg=fg  guifg=fg      ctermbg=242 guibg=#6c6c6c cterm=underline gui=underline
hi TabLineFill  ctermfg=fg  guifg=fg      ctermbg=242 guibg=#6c6c6c cterm=underline gui=underline
hi VertSplit    ctermfg=237 guifg=#3a3a3a ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi Visual       ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afd7ff
hi VIsualNOS    ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afd7ff cterm=none gui=none
hi WildMenu     ctermfg=0   guifg=#000000 ctermbg=184 guibg=#d7d700 cterm=bold gui=bold
hi LineNr       ctermfg=8   guifg=#7f7f7f ctermbg=233 guibg=#121212

"" Syntax highlighting
hi Comment      ctermfg=36  guifg=#00af87
hi Constant     ctermfg=227 guifg=#ffff5f
hi Error        ctermfg=15  guifg=#ffffff ctermbg=1   guibg=#cd0000
hi ErrorMsg     ctermfg=15  guifg=#ffffff ctermbg=1   guibg=#cd0000
hi Identifier   ctermfg=134 guifg=#af5fd7                           cterm=none gui=none
hi Ignore       ctermfg=238 guifg=#444444
hi MatchParen   ctermfg=188 guifg=#d7d7d7 ctermbg=68  guibg=#5f87d7 cterm=bold gui=bold
hi Number       ctermfg=180 guifg=#d7af87
hi PreProc      ctermfg=150 guifg=#afd787
hi Special      ctermfg=174 guifg=#d78787
hi Statement    ctermfg=75  guifg=#5fafff                           cterm=none gui=none
hi String       ctermfg=217 guifg=#ffafaf
hi Todo         ctermfg=0   guifg=#000000 ctermbg=36  guibg=#00af87
hi Type         ctermfg=146 guifg=#afafd7                           cterm=none gui=none
hi Underlined   ctermfg=39  guifg=#00afff                           cterm=underline gui=underline

"" Special
""" .diff
hi diffAdded    ctermfg=150 guifg=#afd787
hi diffRemoved  ctermfg=174 guifg=#d78787
""" vimdiff
hi diffAdd      ctermfg=bg  guifg=bg      ctermbg=151 guibg=#afd7af
hi diffDelete   ctermfg=bg  guifg=bg      ctermbg=246 guibg=#949494 cterm=none gui=none
hi diffChange   ctermfg=bg  guifg=bg      ctermbg=181 guibg=#d7afaf
hi diffText     ctermfg=bg  guifg=bg      ctermbg=174 guibg=#d78787 cterm=none gui=none

"" To highlight lines that are too long
hi OverLength                             ctermbg=130 guibg=#af5f00

"" Omni-completion menu
hi Pmenu        ctermfg=0   guifg=#000000 ctermbg=104 guibg=#8787d7
hi PmenuSel     ctermfg=0   guifg=#000000 ctermbg=223 guibg=#ffdfaf

"" Spelling and compiling errors
hi SpellBad                               ctermbg=52  guibg=#5f0000

"" Colors for unit testing.
hi RedBar                                 ctermbg=52  guibg=#5f0000
hi GreenBar                               ctermbg=22  guibg=#005f00

" For indentation
hi IndentGuidesOdd   ctermbg=235 guibg=#262626 ctermfg=237 guifg=#3a3a3a
hi IndentGuidesEven  ctermbg=233 guibg=#121212 ctermfg=237 guifg=#3a3a3a

