" Tayra: Vim color scheme
" Designed to be used in terminal mode only. GUI is not supported.
" Based on wombat256 color scheme by bmdavll.

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tayra"

hi Cursor       ctermfg=235     ctermbg=228     cterm=none
hi DiffAdd      ctermfg=40      ctermbg=236     cterm=bold
hi DiffChange   ctermfg=184     ctermbg=236     cterm=bold
hi DiffDelete   ctermfg=160     ctermbg=236     cterm=bold
hi DiffText     ctermfg=236     ctermbg=184     cterm=bold
hi ErrorMsg     ctermfg=196     ctermbg=235     cterm=bold
hi Folded       ctermfg=175     ctermbg=236     cterm=none
hi IncSearch    ctermfg=140     ctermbg=240     cterm=bold
hi LineNr       ctermfg=238     ctermbg=235     cterm=none
hi MatchParen   ctermfg=110     ctermbg=240     cterm=bold
hi ModeMsg      ctermfg=175     ctermbg=235     cterm=none
hi MoreMsg      ctermfg=175     ctermbg=235     cterm=none
hi Normal       ctermfg=252     ctermbg=235     cterm=none
hi Pmenu        ctermfg=150     ctermbg=237     cterm=none
hi PmenuSel     ctermfg=237     ctermbg=150     cterm=none
hi Search       ctermfg=140     ctermbg=240     cterm=none
hi StatusLine   ctermfg=115     ctermbg=233     cterm=none
hi StatusLineNC ctermfg=243     ctermbg=233     cterm=none
hi TabLine      ctermfg=243     ctermbg=233     cterm=none
hi TabLineSel   ctermfg=180     ctermbg=233     cterm=none
hi VertSplit    ctermfg=238     ctermbg=233     cterm=none
hi WarningMsg   ctermfg=196     ctermbg=235     cterm=none
hi WildMenu     ctermfg=233     ctermbg=115     cterm=none

hi Title        ctermfg=254     cterm=bold
hi Directory    ctermfg=254     cterm=bold
hi NonText      ctermfg=238     cterm=none
hi SpecialKey   ctermfg=238     cterm=none

hi ColorColumn  ctermbg=235     cterm=none
hi CursorLine   ctermbg=237     cterm=none
hi TabLineFill  ctermbg=233     cterm=none
hi Visual       ctermbg=237     cterm=none

hi link CursorColumn CursorLine
hi link FoldColumn Folded

" syntax

hi Comment      ctermfg=244     cterm=none

hi Statement    ctermfg=185     cterm=none
hi Constant     ctermfg=179     cterm=none
hi Identifier   ctermfg=173     cterm=none
hi Type         ctermfg=167     cterm=none

hi PreProc      ctermfg=186     cterm=none
hi Special      ctermfg=174     cterm=none

hi String       ctermfg=149     cterm=none

hi Todo         ctermfg=61      ctermbg=235      cterm=bold

" syntax: diff

hi link diffAdded DiffAdd
hi link diffChanged DiffChange
hi link diffRemoved DiffDelete

