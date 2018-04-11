" Name: Tempus Warp
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with a vibrant palette (WCAG AA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_warp"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#141a19 guifg=#928f90 ctermbg=none ctermfg=15
hi Visual guibg=#928f90 guifg=#141a19 ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#009600 guifg=#141a19 cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#927b80 guifg=#141a19 term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#928f90 guifg=#141a19 cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#201428 guifg=#927b80 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#009600 guifg=#141a19 cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#201428 guifg=#009600 cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#201428 guifg=#927b80 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#928f90 guifg=#141a19 cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#927b80 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#201428 guifg=#b38a00 cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#928100 guifg=#141a19 cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#928100 guifg=#141a19 cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#ff1414 guifg=#141a19 cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#ff1414 guifg=#141a19 cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#d159fd guifg=#141a19 cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#927b80 guifg=#141a19 term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#927b80 guifg=#141a19 term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#141a19 guifg=#928f90 term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#141a19 guifg=#928f90 term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#4f76ff ctermfg=4
hi Number guifg=#4f76ff ctermfg=4
hi Float guifg=#4f76ff ctermfg=4
hi String guifg=#8082ff ctermfg=12

hi Function guifg=#dd38bc ctermfg=5
hi Identifier guifg=#d159fd term=none ctermfg=13
hi Label guifg=#dd38bc ctermfg=5
hi Tag guifg=#dd38bc ctermfg=5
hi Keyword gui=bold guifg=#d159fd gui=bold ctermfg=13

hi Character gui=bold guifg=#1da190 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#358aaa term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#358aaa ctermfg=6
hi StorageClass guifg=#358aaa ctermfg=6
hi Structure guifg=#358aaa ctermfg=6
hi Typedef gui=bold guifg=#1da190 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#009600 cterm=bold ctermfg=2
hi Statement gui=none guifg=#3aa43a cterm=none ctermfg=10
hi Repeat gui=bold guifg=#3aa43a cterm=bold ctermfg=10
hi Operator gui=bold guifg=#928f90 cterm=bold ctermfg=15
hi Exception gui=bold guifg=#ff1414 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#ff5500 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#ff5500 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#ff5500 cterm=bold ctermfg=9
hi Include guifg=#ff5500 ctermfg=9
hi Define guifg=#ff5500 ctermfg=9

hi Title gui=bold guibg=#141a19 guifg=#358aaa cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#b38a00 term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#b38a00 ctermfg=11
hi SpecialChar gui=bold guifg=#b38a00 cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#dd38bc cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#dd38bc cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#dd38bc cterm=bold ctermfg=5

hi Debug guifg=#d159fd ctermfg=13

" Other
" -----------------
hi LineNr guibg=#201428 guifg=#927b80 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#928f90 guifg=#141a19 ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#201428 term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#927b80 guifg=#141a19 cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#201428 guifg=#928f90 term=none ctermbg=8 ctermfg=15

hi Folded guibg=#201428 guifg=#927b80 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#201428 guifg=#927b80 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#927b80 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#009600 term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#b38a00 cterm=bold ctermfg=11
hi MoreMsg guifg=#3aa43a ctermfg=10
hi ModeMsg gui=bold guifg=#009600 cterm=bold ctermfg=2

hi VimOption guifg=#dd38bc ctermfg=5
hi VimGroup guifg=#dd38bc ctermfg=5

hi Underlined gui=underline,bold guifg=#928f90 cterm=underline,bold ctermfg=15
hi Ignore guibg=#201428 guifg=#927b80 ctermbg=8 ctermfg=7
hi Conceal guibg=#927b80 guifg=#201428 ctermbg=7 ctermfg=8

hi SpellBad guibg=#ff1414 guifg=#141a19 ctermbg=1 ctermfg=0
hi SpellCap guibg=#928100 guifg=#141a19 ctermbg=3 ctermfg=0
hi SpellRare guibg=#d159fd guifg=#141a19 ctermbg=13 ctermfg=0
hi SpellLocal guibg=#1da190 guifg=#141a19 ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#201428 guifg=#928f90 cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#927b80 guifg=#141a19 cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#201428 ctermbg=8
hi PmenuThumb guibg=#927b80 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#009600 guifg=#141a19 cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#ff1414 guifg=#141a19 cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#201428 guifg=#927b80 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#201428 guifg=#ff5500 cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#009600 ctermfg=2
hi diffRemoved guifg=#ff1414 ctermfg=1
hi diffNewFile gui=none guifg=#4f76ff ctermfg=4
hi diffFile gui=none guifg=#928100 cterm=none ctermfg=3
