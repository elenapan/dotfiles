""" VIM STONEWASHED 
" A low-rent color-scheme for Vim
"
set background=light
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name = ""

hi ColorColumn ctermbg=250
hi Comment ctermfg=242
hi Conditional ctermfg=94 cterm=underline
hi Constant ctermfg=52 
hi CursorColumn ctermbg=231
hi CursorLine ctermbg=231 cterm=none
hi Define ctermfg=94 cterm=underline
hi Error ctermfg=124 ctermbg=255 cterm=bold,undercurl
hi Exception ctermfg=94 cterm=underline
hi Float ctermfg=94
hi Function ctermfg=62
hi Identifier ctermfg=62
hi Include ctermfg=94 cterm=underline
hi LineNr ctermfg=240 ctermbg=144
hi Macro ctermfg=94 cterm=underline
hi MatchParen ctermbg=185 cterm=bold
hi NonText ctermfg=244 ctermbg=254
hi Normal ctermfg=0 ctermbg=255
hi Number ctermfg=23 
hi Pmenu ctermbg=75 ctermfg=253 cterm=reverse 
hi PmenuSel ctermfg=253 ctermbg=75
hi PreConduit ctermfg=94
hi PreProc ctermfg=94
hi Repeat ctermfg=60
hi Search ctermbg=217 cterm=bold
hi Special ctermfg=57
hi SpecialKey ctermbg=254 ctermfg=248
hi Statement ctermfg=52
hi StatusLine ctermfg=144 ctermbg=140
hi StatusLineNC ctermbg=144 ctermfg=144
hi StorageClass ctermfg=17 
hi String ctermfg=22
hi Structure ctermfg=64 cterm=underline
hi Title ctermfg=52
hi Todo ctermbg=226 ctermfg=238 cterm=bold
hi Type ctermfg=17
hi Typedef ctermfg=64 cterm=underline
hi Underlined ctermfg=40 cterm=underline
hi VertSplit ctermfg=195 ctermbg=195
hi Visual  ctermbg=117 
hi Wildmenu ctermbg=120 cterm=underline

""" REFERENCE
" Color Chart http://i.stack.imgur.com/UQVe5.png
" Vim Color Names http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" Syntax higlighting http://vimdoc.sourceforge.net/htmldoc/syntax.html#:highlight
" Make Vim Pretty http://andrewradev.com/2011/08/06/making-vim-pretty-with-custom-colors/
