" Vim color file - neverland-darker.vim
" Eyes are sober, this is the plan
" I'm sitting in a car heading Neverland
" Author: Magnus Woldrich <trapd00r@trapd00r.se>

set background=dark
hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="neverland-darker"

hi Normal          guifg=#ffd7ff guibg=#080808
set background=dark

hi Boolean         guifg=#af5fff
hi Character       guifg=#afaf5f
hi Number          guifg=#0087ff
hi String          guifg=#d7af5f
hi Conditional     guifg=#ff0000               gui=bold
hi Constant        guifg=#87af00               gui=bold
hi Cursor          guifg=#afd787 guibg=#dadada
hi Debug           guifg=#ffd7ff               gui=bold
hi Define          guifg=#5fd7ff
hi Delimiter       guifg=#626262

hi DiffAdd                       guibg=#005f87
hi DiffChange      guifg=#d7afaf guibg=#4e4e4e
hi DiffDelete      guifg=#d70087 guibg=#5f005f
hi DiffText                      guibg=#878787 gui=bold

hi Directory       guifg=#87ff00               gui=bold
hi Error           guifg=#ffafff guibg=#87005f
hi ErrorMsg        guifg=#ff00af guibg=#000000 gui=bold
hi Exception       guifg=#87ff00               gui=bold
hi Float           guifg=#af5fff
hi FoldColumn      guifg=#5f87af guibg=#121212 gui=none
hi Folded          guifg=#585858 guibg=#262626 gui=bold
hi Function        guifg=#87ff00
hi Identifier      guifg=#afd75f
hi Ignore          guifg=#808080 guibg=#080808
hi IncSearch       guifg=#d7ffaf guibg=#000000

hi Keyword         guifg=#87afff               gui=bold
hi Label           guifg=#ffffaf               gui=none
hi Macro           guifg=#d7ffaf
hi SpecialKey      guifg=#5fd7ff

hi MatchParen      guifg=#ff0000 guibg=#1c1c1c gui=bold
hi ModeMsg         guifg=#ffaf5f
hi MoreMsg         guifg=#ffaf5f
hi Operator        guifg=#afd700

" complete menu
hi Pmenu           guifg=#af875f guibg=#000000 gui=none
hi PmenuSel        guifg=#ff0000 guibg=#262626 gui=bold
hi PmenuSbar       guifg=#000000 guibg=#121212 gui=none
hi PmenuThumb      guifg=#af875f guibg=#000000 gui=none

hi PreCondit       guifg=#87ff00               gui=bold
hi PreProc         guifg=#ffafd7
hi Question        guifg=#5fd7ff
hi Repeat          guifg=#d7005f               gui=bold
hi Search          guifg=#1c1c1c guibg=#ffd787

" marks column
hi SignColumn      guifg=#87ff00 guibg=#262626
hi SpecialChar     guifg=#d7005f               gui=bold
hi SpecialComment  guifg=#8a8a8a               gui=bold
hi Special         guifg=#5fd7ff guibg=#080808
hi SpecialKey      guifg=#8a8a8a

hi SpellBad        guifg=#ff0000 guibg=#121212 gui=bold
hi SpellCap        guifg=#875f00 guibg=#121212 gui=bold
hi SpellRare       guifg=#875f87 guibg=#121212 gui=bold
hi SpellLocal      guifg=#af0000 guibg=#121212 gui=bold

hi Statement       guifg=#d78700               gui=bold
hi StatusLine      guifg=#121212 guibg=#af8700
hi StatusLineNC    guifg=#080808 guibg=#878700
hi StorageClass    guifg=#ff8700
hi Structure       guifg=#5fd7ff
hi Tag             guifg=#d7005f
hi Title           guifg=#5faf5f
hi Todo            guifg=#d70000 guibg=#080808 gui=bold

hi Typedef         guifg=#5fd7ff
hi Type            guifg=#d75f00               gui=none
hi Underlined      guifg=#87af00               gui=none

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#444444
hi Visual                        guibg=#262626
hi WarningMsg      guifg=#0000ff guibg=#444444 gui=bold
hi WildMenu        guifg=#5fd7ff guibg=#000000

hi Comment         guifg=#af875f
hi ColorColumn                   guibg=#262626
hi CursorLine                    guibg=#121212 gui=none
hi CursorColumn                  guibg=#080808
hi LineNr          guifg=#626262 guibg=#080808
hi NonText         guifg=#080808 guibg=#080808

hi TabLine         guifg=#878700 guibg=#080808
hi TabLineFill     guifg=#080808 guibg=#121212
hi TabLineSel      guifg=#ffd700 guibg=#1c1c1c

if &t_Co > 255
   hi Normal          ctermfg=225 ctermbg=232
   set background=dark

   hi Boolean         ctermfg=135
   hi Character       ctermfg=143
   hi Number          ctermfg=33
   hi String          ctermfg=179
   hi Conditional     ctermfg=196               cterm=bold
   hi Constant        ctermfg=106               cterm=bold
   hi Cursor          ctermfg=150 ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102   cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67   ctermbg=233 cterm=none
   hi Folded          ctermfg=240  ctermbg=235 cterm=bold
   hi Function        ctermfg=118
   hi Identifier      ctermfg=149
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=111               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=196 ctermbg=234   cterm=bold
   hi ModeMsg         ctermfg=215
   hi MoreMsg         ctermfg=215
   hi Operator        ctermfg=148

   " complete menu
   hi Pmenu           ctermfg=137 ctermbg=233 cterm=none
   hi PmenuSel        ctermfg=196 ctermbg=234 cterm=bold
   hi PmenuSbar       ctermfg=000 ctermbg=233 cterm=none
   hi PmenuThumb      ctermfg=137 ctermbg=235 cterm=none

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=218
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=234 ctermbg=222

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi SpellBad        ctermfg=196 ctermbg=233 cterm=bold
   hi SpellCap        ctermfg=094 ctermbg=233 cterm=bold
   hi SpellRare       ctermfg=096 ctermbg=233 cterm=bold
   hi SpellLocal      ctermfg=124 ctermbg=233 cterm=bold

   hi Statement       ctermfg=172               cterm=bold
   hi StatusLine      ctermfg=233 ctermbg=136
   hi StatusLineNC    ctermfg=232 ctermbg=100
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=71
   hi Todo            ctermfg=160 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=166               cterm=none
   hi Underlined      ctermfg=106               cterm=none

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=21  ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Comment         ctermfg=137
   hi ColorColumn                 ctermbg=235
   hi CursorLine                  ctermbg=233   cterm=none
   hi CursorColumn                ctermbg=232
   hi LineNr          ctermfg=241 ctermbg=232
   hi NonText         ctermfg=232 ctermbg=232

   hi TabLine         ctermfg=100 ctermbg=232
   hi TabLineFill     ctermfg=232 ctermbg=233
   hi TabLineSel      ctermfg=220 ctermbg=234
end
