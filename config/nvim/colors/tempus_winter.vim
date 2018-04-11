" Name: Tempus Winter
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with a palette inspired by winter nights at the city (WCAG AA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_winter"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#202427 guifg=#798ba5 ctermbg=none ctermfg=15
hi Visual guibg=#798ba5 guifg=#202427 ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#589584 guifg=#202427 cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#888a8a guifg=#202427 term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#798ba5 guifg=#202427 cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#1b2431 guifg=#888a8a cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#589584 guifg=#202427 cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#1b2431 guifg=#589584 cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#1b2431 guifg=#888a8a cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#798ba5 guifg=#202427 cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#888a8a cterm=italic ctermfg=7
hi Todo gui=bold guibg=#1b2431 guifg=#a2864b cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#988b21 guifg=#202427 cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#988b21 guifg=#202427 cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#ca7162 guifg=#202427 cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#ca7162 guifg=#202427 cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#987dc2 guifg=#202427 cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#888a8a guifg=#202427 term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#888a8a guifg=#202427 term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#202427 guifg=#798ba5 term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#202427 guifg=#798ba5 term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#2b92c8 ctermfg=4
hi Number guifg=#2b92c8 ctermfg=4
hi Float guifg=#2b92c8 ctermfg=4
hi String guifg=#6987d7 ctermfg=12

hi Function guifg=#b572b6 ctermfg=5
hi Identifier guifg=#987dc2 term=none ctermfg=13
hi Label guifg=#b572b6 ctermfg=5
hi Tag guifg=#b572b6 ctermfg=5
hi Keyword gui=bold guifg=#987dc2 gui=bold ctermfg=13

hi Character gui=bold guifg=#1f96b0 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#4f91b5 term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#4f91b5 ctermfg=6
hi StorageClass guifg=#4f91b5 ctermfg=6
hi Structure guifg=#4f91b5 ctermfg=6
hi Typedef gui=bold guifg=#1f96b0 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#589584 cterm=bold ctermfg=2
hi Statement gui=none guifg=#2c9a81 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#2c9a81 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#798ba5 cterm=bold ctermfg=15
hi Exception gui=bold guifg=#ca7162 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#c47818 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#c47818 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#c47818 cterm=bold ctermfg=9
hi Include guifg=#c47818 ctermfg=9
hi Define guifg=#c47818 ctermfg=9

hi Title gui=bold guibg=#202427 guifg=#4f91b5 cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#a2864b term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#a2864b ctermfg=11
hi SpecialChar gui=bold guifg=#a2864b cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#b572b6 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#b572b6 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#b572b6 cterm=bold ctermfg=5

hi Debug guifg=#987dc2 ctermfg=13

" Other
" -----------------
hi LineNr guibg=#1b2431 guifg=#888a8a term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#798ba5 guifg=#202427 ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#1b2431 term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#888a8a guifg=#202427 cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#1b2431 guifg=#798ba5 term=none ctermbg=8 ctermfg=15

hi Folded guibg=#1b2431 guifg=#888a8a ctermbg=8 ctermfg=7
hi FoldColumn guibg=#1b2431 guifg=#888a8a ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#888a8a cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#589584 term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#a2864b cterm=bold ctermfg=11
hi MoreMsg guifg=#2c9a81 ctermfg=10
hi ModeMsg gui=bold guifg=#589584 cterm=bold ctermfg=2

hi VimOption guifg=#b572b6 ctermfg=5
hi VimGroup guifg=#b572b6 ctermfg=5

hi Underlined gui=underline,bold guifg=#798ba5 cterm=underline,bold ctermfg=15
hi Ignore guibg=#1b2431 guifg=#888a8a ctermbg=8 ctermfg=7
hi Conceal guibg=#888a8a guifg=#1b2431 ctermbg=7 ctermfg=8

hi SpellBad guibg=#ca7162 guifg=#202427 ctermbg=1 ctermfg=0
hi SpellCap guibg=#988b21 guifg=#202427 ctermbg=3 ctermfg=0
hi SpellRare guibg=#987dc2 guifg=#202427 ctermbg=13 ctermfg=0
hi SpellLocal guibg=#1f96b0 guifg=#202427 ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#1b2431 guifg=#798ba5 cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#888a8a guifg=#202427 cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#1b2431 ctermbg=8
hi PmenuThumb guibg=#888a8a ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#589584 guifg=#202427 cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#ca7162 guifg=#202427 cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#1b2431 guifg=#888a8a cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#1b2431 guifg=#c47818 cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#589584 ctermfg=2
hi diffRemoved guifg=#ca7162 ctermfg=1
hi diffNewFile gui=none guifg=#2b92c8 ctermfg=4
hi diffFile gui=none guifg=#988b21 cterm=none ctermfg=3
