" Vim C64 color scheme
" Author: Aaron Maupin <maupin@pastrytech.com>
" Base grouping come from Gerardo Galindez's <gerardo.galindez@gmail.com> 
" Vim color scheme template
"
" Feel free to edit and redistribute as you like!
"

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="C64"

" Commodore 64 colors (using the "wanja" palette)
"
" 0 #000000 black
" 1 #ffffff white
" 2 #ad524a red
" 3 #73f7f7 cyan
" 4 #bd6bbd purple
" 5 #73e773 green 
" 6 #181090 blue
" 7 #ffff7b yellow
" 8 #c88e2f orange
" 9 #846339 brown
" 10 #ff9c9c light red
" 11 #7b7b7b dark gray
" 12 #949494 gray
" 13 #a5ffa5 light green
" 14 #9c9cf7 light blue
" 15 #cecece light gray

" --------------------------------
" Editor settings
" --------------------------------

hi Normal          guifg=#cecece    guibg=#4242c6    guisp=#4242c6    gui=NONE    ctermfg=252 ctermbg=62    cterm=NONE
hi Cursor          guifg=NONE    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=NONE ctermbg=147    cterm=NONE
hi CursorLine      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi LineNr          guifg=#4242c6    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=62 ctermbg=147    cterm=NONE
hi CursorLineNR    guifg=#ffffff    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=15 ctermbg=147    cterm=NONE

" -----------------
" - Number column -
" -----------------
hi CursorColumn    guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi FoldColumn      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi SignColumn      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Folded          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE

" -------------------------
" - Window/Tab delimiters - 
" -------------------------

hi VertSplit       guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=15 ctermbg=NONE    cterm=NONE
hi ColorColumn     guifg=#4242c6    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=62 ctermbg=147    cterm=NONE
hi TabLine         guifg=#cecece    guibg=#7b7b7b    guisp=#7b7b7b    gui=NONE    ctermfg=252 ctermbg=8    cterm=NONE
hi TabLineFill     guifg=NONE    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=NONE ctermbg=147    cterm=NONE
hi TabLineSel      guifg=#ffffff    guibg=#949494    guisp=#949494    gui=NONE    ctermfg=15 ctermbg=246    cterm=NONE

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       guifg=#73f7f7    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE
hi Search          guifg=#ffffff    guibg=#73e773    guisp=#73e773    gui=NONE    ctermfg=15 ctermbg=77    cterm=NONE
hi IncSearch       guifg=#ffff7b    guibg=#846339    guisp=#846339    gui=NONE    ctermfg=228 ctermbg=101    cterm=NONE

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      guifg=#ffffff    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=15 ctermbg=147    cterm=NONE
hi StatusLineNC    guifg=#4242c6    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=62 ctermbg=147    cterm=NONE
hi WildMenu        guifg=#ffffff    guibg=#73e773    guisp=#73e773    gui=NONE    ctermfg=NONE ctermbg=77    cterm=NONE
hi Question        guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Title           guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi ModeMsg         guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi MoreMsg         guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE

" --------------
" - Visual aid -
" --------------
hi MatchParen      guifg=#4242c6    guibg=#9c9cf7   guisp=#9c9cf7    gui=NONE    ctermfg=62 ctermbg=147    cterm=NONE
hi Visual          guifg=NONE    guibg=#7b7b7b    guisp=#7b7b7b    gui=NONE    ctermfg=NONE ctermbg=8    cterm=NONE
hi VisualNOS       guifg=NONE    guibg=#bd6bbd    guisp=#bd6bbd    gui=NONE    ctermfg=NONE ctermbg=133    cterm=NONE
hi NonText         guifg=#7b7b7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=8 ctermbg=NONE    cterm=NONE

hi Todo            guifg=#ffffff    guibg=#bd6bbd    guisp=#bd6bbd    gui=NONE    ctermfg=15 ctermbg=133    cterm=NONE
hi Underlined      guifg=NONE    guibg=#7b7b7b    guisp=#7b7b7b    gui=NONE    ctermfg=NONE ctermbg=8    cterm=NONE
hi Error           guifg=#000000    guibg=#ad524a    guisp=#ad524a    gui=NONE    ctermfg=NONE ctermbg=131    cterm=NONE
hi ErrorMsg        guifg=#000000    guibg=#ad524a    guisp=#ad524a    gui=NONE    ctermfg=NONE ctermbg=131    cterm=NONE
hi WarningMsg      guifg=#000000    guibg=#ffff7b    guisp=#ffff7b    gui=NONE    ctermfg=NONE ctermbg=228    cterm=NONE
hi Ignore          guifg=#7b7b7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=8 ctermbg=NONE    cterm=NONE
hi SpecialKey      guifg=#7b7b7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=8 ctermbg=NONE    cterm=NONE

" --------------------------------
" Variable types
" --------------------------------
hi Constant        guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi String          guifg=#73f7f7    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE
hi StringDelimiter guifg=#73f7f7    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE
hi Character       guifg=#73f7f7    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE
hi Number          guifg=#ffff7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE
hi Boolean         guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi Float           guifg=#ffff7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=228 ctermbg=NONE    cterm=NONE

hi Identifier      guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Function        guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Conditional     guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Repeat          guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Label           guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Operator        guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Keyword         guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi Exception       guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi Comment         guifg=#a5ffa5    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=157 ctermbg=NONE    cterm=NONE

hi Special         guifg=#4242c6    guibg=#cecece    guisp=#cecece    gui=NONE    ctermfg=62 ctermbg=252    cterm=NONE
hi SpecialChar     guifg=#4242c6    guibg=#cecece    guisp=#cecece    gui=NONE    ctermfg=62 ctermbg=252    cterm=NONE
hi Tag             guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Delimiter       guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi SpecialComment  guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Debug           guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE

" ----------
" - C like -
" ----------
hi PreProc         guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Include         guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Define          guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi Macro           guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi PreCondit       guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE

hi Type            guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE
hi StorageClass    guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi Structure       guifg=#ff9c9c    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=217 ctermbg=NONE    cterm=NONE
hi Typedef         guifg=#ffffff    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=NONE ctermbg=NONE    cterm=NONE

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         guifg=#181090    guibg=#73e773    guisp=#73e773    gui=NONE    ctermfg=15 ctermbg=77    cterm=NONE
hi DiffChange      guifg=NONE    guibg=#c88e2f    guisp=#c88e2f    gui=NONE    ctermfg=NONE ctermbg=179    cterm=NONE
hi DiffDelete      guifg=NONE    guibg=#ad524a    guisp=#ad524a    gui=NONE    ctermfg=NONE ctermbg=131    cterm=NONE
hi DiffText        guifg=#ffffff    guibg=#bd6bbd    guisp=#bd6bbd    gui=NONE    ctermfg=15 ctermbg=133    cterm=NONE

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           guifg=#cecece    guibg=#7b7b7b    guisp=#7b7b7b    gui=NONE    ctermfg=252 ctermbg=8    cterm=NONE
hi PmenuSel        guifg=#ffffff    guibg=#949494    guisp=#949494    gui=NONE    ctermfg=15 ctermbg=246    cterm=NONE
hi PmenuSbar       guifg=NONE    guibg=#9c9cf7    guisp=#9c9cf7    gui=NONE    ctermfg=NONE ctermbg=147    cterm=NONE
hi PmenuThumb      guifg=NONE    guibg=#bd6bbd    guisp=#bd6bbd    gui=NONE    ctermfg=NONE ctermbg=133    cterm=NONE

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        guifg=NONE    guibg=#ad524a    guisp=#ad524a    gui=NONE    ctermfg=NONE ctermbg=131    cterm=NONE
hi SpellCap        guifg=NONE    guibg=#c88e2f    guisp=#c88e2f    gui=NONE    ctermfg=NONE ctermbg=179    cterm=NONE
hi SpellLocal      guifg=NONE    guibg=#c88e2f    guisp=#c88e2f    gui=NONE    ctermfg=NONE ctermbg=179    cterm=NONE
hi SpellRare       guifg=NONE    guibg=#bd6bbd    guisp=#bd6bbd    gui=NONE    ctermfg=NONE ctermbg=133    cterm=NONE

" --------------------------------
" Language Specific (add your own here)
" --------------------------------

hi javaScriptNumber          guifg=#ffff7b    guibg=NONE    guisp=NONE    gui=NONE    ctermfg=123 ctermbg=NONE    cterm=NONE



