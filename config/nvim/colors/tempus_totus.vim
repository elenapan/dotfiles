" Name: Tempus Totus
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Light theme for prose or for coding in an open space (WCAG AAA compliant)

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_totus"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#f4f1f0 guifg=#52505e ctermbg=none ctermfg=0
hi Visual guibg=#52505e guifg=#f4f1f0 ctermbg=0 ctermfg=15
hi Search gui=underline,bold,italic guibg=#0b5d46 guifg=#f4f1f0 cterm=underline,bold,italic ctermbg=2 ctermfg=15
hi IncSearch gui=underline,bold,italic guibg=#575050 guifg=#f4f1f0 term=none cterm=underline,bold,italic ctermbg=8 ctermfg=15

hi StatusLine gui=none,bold guibg=#52505e guifg=#f4f1f0 cterm=none,bold ctermbg=0 ctermfg=15
hi StatusLineNC gui=none guibg=#ecf3f3 guifg=#575050 cterm=none ctermbg=7 ctermfg=8
hi StatusLineTerm gui=none,bold guibg=#0b5d46 guifg=#f4f1f0 cterm=none,bold ctermbg=2 ctermfg=15
hi StatusLineTermNC gui=none guibg=#ecf3f3 guifg=#0b5d46 cterm=none ctermbg=7 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#ecf3f3 guifg=#575050 cterm=none ctermbg=7 ctermfg=8
hi TabLineSel gui=none guibg=#52505e guifg=#f4f1f0 cterm=none ctermbg=0 ctermfg=15
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#575050 cterm=italic ctermfg=8
hi Todo gui=bold guibg=#ecf3f3 guifg=#774611 cterm=bold ctermbg=7 ctermfg=11

hi Warning gui=none guibg=#545422 guifg=#f4f1f0 cterm=none ctermbg=3 ctermfg=15
hi WarningMsg gui=none guibg=#545422 guifg=#f4f1f0 cterm=none ctermbg=3 ctermfg=15
hi Error gui=none guibg=#a01c10 guifg=#f4f1f0 cterm=none ctermbg=1 ctermfg=15
hi ErrorMsg gui=none guibg=#a01c10 guifg=#f4f1f0 cterm=none ctermbg=1 ctermfg=15

hi MatchParen gui=underline,bold guibg=#8d0e9b guifg=#f4f1f0 cterm=underline,bold ctermbg=13 ctermfg=15

hi ToolbarLine guibg=#575050 guifg=#f4f1f0 term=none ctermbg=8 ctermfg=15
hi ToolbarButton gui=bold guibg=#575050 guifg=#f4f1f0 term=none cterm=bold ctermbg=8 ctermfg=15

hi WildMenu guibg=#f4f1f0 guifg=#52505e term=standout ctermbg=15 ctermfg=0

hi Terminal guibg=#f4f1f0 guifg=#52505e term=none ctermbg=15 ctermfg=0

" Constructs
" -----------------
hi Constant guifg=#1c4f9f ctermfg=4
hi Number guifg=#1c4f9f ctermfg=4
hi Float guifg=#1c4f9f ctermfg=4
hi String guifg=#5440a7 ctermfg=12

hi Function guifg=#942166 ctermfg=5
hi Identifier guifg=#8d0e9b term=none ctermfg=13
hi Label guifg=#942166 ctermfg=5
hi Tag guifg=#942166 ctermfg=5
hi Keyword gui=bold guifg=#8d0e9b gui=bold ctermfg=13

hi Character gui=bold guifg=#0e577b cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#185870 term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#185870 ctermfg=6
hi StorageClass guifg=#185870 ctermfg=6
hi Structure guifg=#185870 ctermfg=6
hi Typedef gui=bold guifg=#0e577b cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#0b5d46 cterm=bold ctermfg=2
hi Statement gui=none guifg=#2a5d08 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#2a5d08 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#52505e cterm=bold ctermfg=0
hi Exception gui=bold guifg=#a01c10 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#913210 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#913210 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#913210 cterm=bold ctermfg=9
hi Include guifg=#913210 ctermfg=9
hi Define guifg=#913210 ctermfg=9

hi Title gui=bold guibg=#f4f1f0 guifg=#185870 cterm=bold ctermbg=15 ctermfg=6

hi Special gui=bold guifg=#774611 term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#774611 ctermfg=11
hi SpecialChar gui=bold guifg=#774611 cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#942166 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#942166 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#942166 cterm=bold ctermfg=5

hi Debug guifg=#8d0e9b ctermfg=13

" Other
" -----------------
hi LineNr guibg=#ecf3f3 guifg=#575050 term=none ctermbg=7 ctermfg=8
hi Cursor guibg=#52505e guifg=#f4f1f0 ctermbg=0 ctermfg=15
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#ecf3f3 term=none cterm=none ctermbg=7
hi CursorLineNr gui=bold guibg=#575050 guifg=#f4f1f0 cterm=bold ctermbg=8 ctermfg=15
hi ColorColumn guibg=#ecf3f3 guifg=#52505e term=none ctermbg=7 ctermfg=0

hi Folded guibg=#ecf3f3 guifg=#575050 ctermbg=7 ctermfg=8
hi FoldColumn guibg=#ecf3f3 guifg=#575050 ctermbg=7 ctermfg=8

hi NonText gui=bold guibg=NONE guifg=#575050 cterm=bold ctermbg=none ctermfg=8

hi Directory gui=none guifg=#0b5d46 term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#774611 cterm=bold ctermfg=11
hi MoreMsg guifg=#2a5d08 ctermfg=10
hi ModeMsg gui=bold guifg=#0b5d46 cterm=bold ctermfg=2

hi VimOption guifg=#942166 ctermfg=5
hi VimGroup guifg=#942166 ctermfg=5

hi Underlined gui=underline,bold guifg=#52505e cterm=underline,bold ctermfg=0
hi Ignore guibg=#ecf3f3 guifg=#575050 ctermbg=7 ctermfg=8
hi Conceal guibg=#575050 guifg=#ecf3f3 ctermbg=8 ctermfg=7

hi SpellBad guibg=#a01c10 guifg=#f4f1f0 ctermbg=1 ctermfg=15
hi SpellCap guibg=#545422 guifg=#f4f1f0 ctermbg=3 ctermfg=15
hi SpellRare guibg=#8d0e9b guifg=#f4f1f0 ctermbg=13 ctermfg=15
hi SpellLocal guibg=#0e577b guifg=#f4f1f0 ctermbg=14 ctermfg=15

hi Pmenu gui=italic guibg=#ecf3f3 guifg=#52505e cterm=italic ctermbg=7 ctermfg=0
hi PmenuSel gui=none,bold guibg=#575050 guifg=#f4f1f0 cterm=none,bold ctermbg=8 ctermfg=15
hi PmenuSbar guibg=#ecf3f3 ctermbg=7
hi PmenuThumb guibg=#575050 ctermbg=8

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#0b5d46 guifg=#f4f1f0 cterm=bold ctermbg=10 ctermfg=15
hi DiffDelete gui=none guibg=#a01c10 guifg=#f4f1f0 cterm=none ctermbg=9 ctermfg=15
hi DiffChange gui=bold guibg=#ecf3f3 guifg=#575050 cterm=bold ctermbg=7 ctermfg=8
hi DiffText gui=bold guibg=#ecf3f3 guifg=#913210 cterm=bold ctermbg=7 ctermfg=1

hi diffAdded guifg=#0b5d46 ctermfg=2
hi diffRemoved guifg=#a01c10 ctermfg=1
hi diffNewFile gui=none guifg=#1c4f9f ctermfg=4
hi diffFile gui=none guifg=#545422 cterm=none ctermfg=3
