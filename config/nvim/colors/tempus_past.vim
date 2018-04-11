" Name: Tempus Past
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Light theme inspired by old vaporwave concept art (WCAG AA compliant)

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_past"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#dadce8 guifg=#63606b ctermbg=none ctermfg=0
hi Visual guibg=#63606b guifg=#dadce8 ctermbg=0 ctermfg=15
hi Search gui=underline,bold,italic guibg=#2a7000 guifg=#dadce8 cterm=underline,bold,italic ctermbg=2 ctermfg=15
hi IncSearch gui=underline,bold,italic guibg=#80565d guifg=#dadce8 term=none cterm=underline,bold,italic ctermbg=8 ctermfg=15

hi StatusLine gui=none,bold guibg=#63606b guifg=#dadce8 cterm=none,bold ctermbg=0 ctermfg=15
hi StatusLineNC gui=none guibg=#e0dcd6 guifg=#80565d cterm=none ctermbg=7 ctermfg=8
hi StatusLineTerm gui=none,bold guibg=#2a7000 guifg=#dadce8 cterm=none,bold ctermbg=2 ctermfg=15
hi StatusLineTermNC gui=none guibg=#e0dcd6 guifg=#2a7000 cterm=none ctermbg=7 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#e0dcd6 guifg=#80565d cterm=none ctermbg=7 ctermfg=8
hi TabLineSel gui=none guibg=#63606b guifg=#dadce8 cterm=none ctermbg=0 ctermfg=15
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#80565d cterm=italic ctermfg=8
hi Todo gui=bold guibg=#e0dcd6 guifg=#91520a cterm=bold ctermbg=7 ctermfg=11

hi Warning gui=none guibg=#825a0a guifg=#dadce8 cterm=none ctermbg=3 ctermfg=15
hi WarningMsg gui=none guibg=#825a0a guifg=#dadce8 cterm=none ctermbg=3 ctermfg=15
hi Error gui=none guibg=#c01c10 guifg=#dadce8 cterm=none ctermbg=1 ctermfg=15
hi ErrorMsg gui=none guibg=#c01c10 guifg=#dadce8 cterm=none ctermbg=1 ctermfg=15

hi MatchParen gui=underline,bold guibg=#ba166b guifg=#dadce8 cterm=underline,bold ctermbg=13 ctermfg=15

hi ToolbarLine guibg=#80565d guifg=#dadce8 term=none ctermbg=8 ctermfg=15
hi ToolbarButton gui=bold guibg=#80565d guifg=#dadce8 term=none cterm=bold ctermbg=8 ctermfg=15

hi WildMenu guibg=#dadce8 guifg=#63606b term=standout ctermbg=15 ctermfg=0

hi Terminal guibg=#dadce8 guifg=#63606b term=none ctermbg=15 ctermfg=0

" Constructs
" -----------------
hi Constant guifg=#025ccd ctermfg=4
hi Number guifg=#025ccd ctermfg=4
hi Float guifg=#025ccd ctermfg=4
hi String guifg=#5046eb ctermfg=12

hi Function guifg=#a43878 ctermfg=5
hi Identifier guifg=#ba166b term=none ctermfg=13
hi Label guifg=#a43878 ctermfg=5
hi Tag guifg=#a43878 ctermfg=5
hi Keyword gui=bold guifg=#ba166b gui=bold ctermfg=13

hi Character gui=bold guifg=#076c76 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#49628d term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#49628d ctermfg=6
hi StorageClass guifg=#49628d ctermfg=6
hi Structure guifg=#49628d ctermfg=6
hi Typedef gui=bold guifg=#076c76 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#2a7000 cterm=bold ctermfg=2
hi Statement gui=none guifg=#007214 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#007214 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#63606b cterm=bold ctermfg=0
hi Exception gui=bold guifg=#c01c10 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#b43036 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#b43036 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#b43036 cterm=bold ctermfg=9
hi Include guifg=#b43036 ctermfg=9
hi Define guifg=#b43036 ctermfg=9

hi Title gui=bold guibg=#dadce8 guifg=#49628d cterm=bold ctermbg=15 ctermfg=6

hi Special gui=bold guifg=#91520a term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#91520a ctermfg=11
hi SpecialChar gui=bold guifg=#91520a cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#a43878 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#a43878 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#a43878 cterm=bold ctermfg=5

hi Debug guifg=#ba166b ctermfg=13

" Other
" -----------------
hi LineNr guibg=#e0dcd6 guifg=#80565d term=none ctermbg=7 ctermfg=8
hi Cursor guibg=#63606b guifg=#dadce8 ctermbg=0 ctermfg=15
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#e0dcd6 term=none cterm=none ctermbg=7
hi CursorLineNr gui=bold guibg=#80565d guifg=#dadce8 cterm=bold ctermbg=8 ctermfg=15
hi ColorColumn guibg=#e0dcd6 guifg=#63606b term=none ctermbg=7 ctermfg=0

hi Folded guibg=#e0dcd6 guifg=#80565d ctermbg=7 ctermfg=8
hi FoldColumn guibg=#e0dcd6 guifg=#80565d ctermbg=7 ctermfg=8

hi NonText gui=bold guibg=NONE guifg=#80565d cterm=bold ctermbg=none ctermfg=8

hi Directory gui=none guifg=#2a7000 term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#91520a cterm=bold ctermfg=11
hi MoreMsg guifg=#007214 ctermfg=10
hi ModeMsg gui=bold guifg=#2a7000 cterm=bold ctermfg=2

hi VimOption guifg=#a43878 ctermfg=5
hi VimGroup guifg=#a43878 ctermfg=5

hi Underlined gui=underline,bold guifg=#63606b cterm=underline,bold ctermfg=0
hi Ignore guibg=#e0dcd6 guifg=#80565d ctermbg=7 ctermfg=8
hi Conceal guibg=#80565d guifg=#e0dcd6 ctermbg=8 ctermfg=7

hi SpellBad guibg=#c01c10 guifg=#dadce8 ctermbg=1 ctermfg=15
hi SpellCap guibg=#825a0a guifg=#dadce8 ctermbg=3 ctermfg=15
hi SpellRare guibg=#ba166b guifg=#dadce8 ctermbg=13 ctermfg=15
hi SpellLocal guibg=#076c76 guifg=#dadce8 ctermbg=14 ctermfg=15

hi Pmenu gui=italic guibg=#e0dcd6 guifg=#63606b cterm=italic ctermbg=7 ctermfg=0
hi PmenuSel gui=none,bold guibg=#80565d guifg=#dadce8 cterm=none,bold ctermbg=8 ctermfg=15
hi PmenuSbar guibg=#e0dcd6 ctermbg=7
hi PmenuThumb guibg=#80565d ctermbg=8

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#2a7000 guifg=#dadce8 cterm=bold ctermbg=10 ctermfg=15
hi DiffDelete gui=none guibg=#c01c10 guifg=#dadce8 cterm=none ctermbg=9 ctermfg=15
hi DiffChange gui=bold guibg=#e0dcd6 guifg=#80565d cterm=bold ctermbg=7 ctermfg=8
hi DiffText gui=bold guibg=#e0dcd6 guifg=#b43036 cterm=bold ctermbg=7 ctermfg=1

hi diffAdded guifg=#2a7000 ctermfg=2
hi diffRemoved guifg=#c01c10 ctermfg=1
hi diffNewFile gui=none guifg=#025ccd ctermfg=4
hi diffFile gui=none guifg=#825a0a cterm=none ctermfg=3
