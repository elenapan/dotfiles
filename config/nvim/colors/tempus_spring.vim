" Name: Tempus Spring
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with a palette inspired by early spring colours (WCAG AA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_spring"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#34403c guifg=#a5a8a7 ctermbg=none ctermfg=15
hi Visual guibg=#a5a8a7 guifg=#34403c ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#6ab78a guifg=#34403c cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#96aca7 guifg=#34403c term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#a5a8a7 guifg=#34403c cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#2a423d guifg=#96aca7 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#6ab78a guifg=#34403c cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#2a423d guifg=#6ab78a cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#2a423d guifg=#96aca7 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#a5a8a7 guifg=#34403c cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#96aca7 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#2a423d guifg=#99b22a cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#b6aa1a guifg=#34403c cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#b6aa1a guifg=#34403c cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#ff855a guifg=#34403c cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#ff855a guifg=#34403c cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#d091db guifg=#34403c cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#96aca7 guifg=#34403c term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#96aca7 guifg=#34403c term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#34403c guifg=#a5a8a7 term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#34403c guifg=#a5a8a7 term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#5daeee ctermfg=4
hi Number guifg=#5daeee ctermfg=4
hi Float guifg=#5daeee ctermfg=4
hi String guifg=#3caffe ctermfg=12

hi Function guifg=#d495b4 ctermfg=5
hi Identifier guifg=#d091db term=none ctermfg=13
hi Label guifg=#d495b4 ctermfg=5
hi Tag guifg=#d495b4 ctermfg=5
hi Keyword gui=bold guifg=#d091db gui=bold ctermfg=13

hi Character gui=bold guifg=#4ab4d3 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#6eb2bc term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#6eb2bc ctermfg=6
hi StorageClass guifg=#6eb2bc ctermfg=6
hi Structure guifg=#6eb2bc ctermfg=6
hi Typedef gui=bold guifg=#4ab4d3 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#6ab78a cterm=bold ctermfg=2
hi Statement gui=none guifg=#4abb88 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#4abb88 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#a5a8a7 cterm=bold ctermfg=15
hi Exception gui=bold guifg=#ff855a cterm=bold ctermfg=1

hi Preproc gui=none guifg=#df993a term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#df993a cterm=bold ctermfg=9
hi Macro gui=bold guifg=#df993a cterm=bold ctermfg=9
hi Include guifg=#df993a ctermfg=9
hi Define guifg=#df993a ctermfg=9

hi Title gui=bold guibg=#34403c guifg=#6eb2bc cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#99b22a term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#99b22a ctermfg=11
hi SpecialChar gui=bold guifg=#99b22a cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#d495b4 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#d495b4 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#d495b4 cterm=bold ctermfg=5

hi Debug guifg=#d091db ctermfg=13

" Other
" -----------------
hi LineNr guibg=#2a423d guifg=#96aca7 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#a5a8a7 guifg=#34403c ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#2a423d term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#96aca7 guifg=#34403c cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#2a423d guifg=#a5a8a7 term=none ctermbg=8 ctermfg=15

hi Folded guibg=#2a423d guifg=#96aca7 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#2a423d guifg=#96aca7 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#96aca7 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#6ab78a term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#99b22a cterm=bold ctermfg=11
hi MoreMsg guifg=#4abb88 ctermfg=10
hi ModeMsg gui=bold guifg=#6ab78a cterm=bold ctermfg=2

hi VimOption guifg=#d495b4 ctermfg=5
hi VimGroup guifg=#d495b4 ctermfg=5

hi Underlined gui=underline,bold guifg=#a5a8a7 cterm=underline,bold ctermfg=15
hi Ignore guibg=#2a423d guifg=#96aca7 ctermbg=8 ctermfg=7
hi Conceal guibg=#96aca7 guifg=#2a423d ctermbg=7 ctermfg=8

hi SpellBad guibg=#ff855a guifg=#34403c ctermbg=1 ctermfg=0
hi SpellCap guibg=#b6aa1a guifg=#34403c ctermbg=3 ctermfg=0
hi SpellRare guibg=#d091db guifg=#34403c ctermbg=13 ctermfg=0
hi SpellLocal guibg=#4ab4d3 guifg=#34403c ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#2a423d guifg=#a5a8a7 cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#96aca7 guifg=#34403c cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#2a423d ctermbg=8
hi PmenuThumb guibg=#96aca7 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#6ab78a guifg=#34403c cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#ff855a guifg=#34403c cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#2a423d guifg=#96aca7 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#2a423d guifg=#df993a cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#6ab78a ctermfg=2
hi diffRemoved guifg=#ff855a ctermfg=1
hi diffNewFile gui=none guifg=#5daeee ctermfg=4
hi diffFile gui=none guifg=#b6aa1a cterm=none ctermfg=3
