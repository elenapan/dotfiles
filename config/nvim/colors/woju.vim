" my very unfinished Vim colour scheme, loosely based on default and holokai
" Version:      1.0
" Maintainer:   Wojtek Porczyk <woju@invisiblethingslab.com>
" License:      MIT

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "woju"

" greyscale:
" - Normal
" - Comment (fg)
" - ColorColumn
" - CursorColumn, CursorLine
" - LineNr (fg)
" - Visual
"
" Normal (fg) > Comment >> Visual > CursorLine >= ColorColumn > Normal (bg)
"               Comment > LineNr

" TODO: dumb term
" TODO: 8-colours
" TODO: 16-colours
" TODO: 88-colours

"
" 256 colours
"
hi PreProc      cterm=bold ctermfg=75
hi Statement    cterm=bold ctermfg=220
hi Constant     cterm=NONE ctermfg=140
hi Type         cterm=bold ctermfg=112
hi Function     cterm=NONE ctermfg=117
hi Identifier   cterm=bold ctermfg=117

hi Special      cterm=bold ctermfg=203
hi Delimiter    cterm=NONE ctermfg=203

hi Comment      cterm=NONE ctermfg=245
hi Todo         cterm=bold ctermfg=203 ctermbg=NONE

hi ColorColumn  cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
hi CursorLine   cterm=NONE ctermbg=235
hi CursorLineNr cterm=NONE ctermfg=184
hi LineNr       cterm=NONE ctermfg=240
hi Visual       cterm=NONE ctermbg=237

hi Pmenu        cterm=NONE ctermfg=NONE ctermbg=240
hi PmenuSel     cterm=NONE ctermfg=16 ctermbg=220
hi PmenuSbar    cterm=NONE ctermbg=237
hi PmenuThumb   cterm=NONE ctermbg=239

hi StatusLine   cterm=NONE ctermfg=NONE ctermbg=242
hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=239
hi WildMenu     cterm=NONE ctermfg=16 ctermbg=220

hi Search       cterm=reverse ctermfg=NONE ctermbg=NONE
hi IncSearch    cterm=reverse ctermfg=NONE ctermbg=NONE

hi DiffAdd      cterm=NONE ctermfg=NONE ctermbg=22
hi DiffDelete   cterm=NONE ctermfg=52 ctermbg=52
hi DiffChange   cterm=NONE ctermfg=NONE ctermbg=235
hi DiffText     cterm=NONE ctermfg=NONE ctermbg=235

hi Folded       cterm=NONE ctermfg=111 ctermbg=NONE
hi FoldColumn   cterm=NONE ctermfg=111 ctermbg=NONE

" misc fixes
hi link xmlEndTag Function
"hi link pythonBuiltin Identifier
