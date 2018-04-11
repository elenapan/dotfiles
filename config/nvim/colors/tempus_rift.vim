" Name: Tempus Rift
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with a subdued palette on the green side of the spectrum

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_rift"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#2b353c guifg=#abacac ctermbg=none ctermfg=15
hi Visual guibg=#abacac guifg=#2b353c ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#0eb40e guifg=#2b353c cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#ab9699 guifg=#2b353c term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#abacac guifg=#2b353c cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#3d3038 guifg=#ab9699 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#0eb40e guifg=#2b353c cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#3d3038 guifg=#0eb40e cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#3d3038 guifg=#ab9699 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#abacac guifg=#2b353c cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#ab9699 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#3d3038 guifg=#9ab800 cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#79aa00 guifg=#2b353c cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#79aa00 guifg=#2b353c cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#be9604 guifg=#2b353c cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#be9604 guifg=#2b353c cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#cca57a guifg=#2b353c cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#ab9699 guifg=#2b353c term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#ab9699 guifg=#2b353c term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#2b353c guifg=#abacac term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#2b353c guifg=#abacac term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#00acb3 ctermfg=4
hi Number guifg=#00acb3 ctermfg=4
hi Float guifg=#00acb3 ctermfg=4
hi String guifg=#20bdce ctermfg=12

hi Function guifg=#ba964c ctermfg=5
hi Identifier guifg=#cca57a term=none ctermfg=13
hi Label guifg=#ba964c ctermfg=5
hi Tag guifg=#ba964c ctermfg=5
hi Keyword gui=bold guifg=#cca57a gui=bold ctermfg=13

hi Character gui=bold guifg=#6fb9ae cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#5fa98f term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#5fa98f ctermfg=6
hi StorageClass guifg=#5fa98f ctermfg=6
hi Structure guifg=#5fa98f ctermfg=6
hi Typedef gui=bold guifg=#6fb9ae cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#0eb40e cterm=bold ctermfg=2
hi Statement gui=none guifg=#3ac53a cterm=none ctermfg=10
hi Repeat gui=bold guifg=#3ac53a cterm=bold ctermfg=10
hi Operator gui=bold guifg=#abacac cterm=bold ctermfg=15
hi Exception gui=bold guifg=#be9604 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#bdae13 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#bdae13 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#bdae13 cterm=bold ctermfg=9
hi Include guifg=#bdae13 ctermfg=9
hi Define guifg=#bdae13 ctermfg=9

hi Title gui=bold guibg=#2b353c guifg=#5fa98f cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#9ab800 term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#9ab800 ctermfg=11
hi SpecialChar gui=bold guifg=#9ab800 cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#ba964c cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#ba964c cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#ba964c cterm=bold ctermfg=5

hi Debug guifg=#cca57a ctermfg=13

" Other
" -----------------
hi LineNr guibg=#3d3038 guifg=#ab9699 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#abacac guifg=#2b353c ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#3d3038 term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#ab9699 guifg=#2b353c cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#3d3038 guifg=#abacac term=none ctermbg=8 ctermfg=15

hi Folded guibg=#3d3038 guifg=#ab9699 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#3d3038 guifg=#ab9699 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#ab9699 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#0eb40e term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#9ab800 cterm=bold ctermfg=11
hi MoreMsg guifg=#3ac53a ctermfg=10
hi ModeMsg gui=bold guifg=#0eb40e cterm=bold ctermfg=2

hi VimOption guifg=#ba964c ctermfg=5
hi VimGroup guifg=#ba964c ctermfg=5

hi Underlined gui=underline,bold guifg=#abacac cterm=underline,bold ctermfg=15
hi Ignore guibg=#3d3038 guifg=#ab9699 ctermbg=8 ctermfg=7
hi Conceal guibg=#ab9699 guifg=#3d3038 ctermbg=7 ctermfg=8

hi SpellBad guibg=#be9604 guifg=#2b353c ctermbg=1 ctermfg=0
hi SpellCap guibg=#79aa00 guifg=#2b353c ctermbg=3 ctermfg=0
hi SpellRare guibg=#cca57a guifg=#2b353c ctermbg=13 ctermfg=0
hi SpellLocal guibg=#6fb9ae guifg=#2b353c ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#3d3038 guifg=#abacac cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#ab9699 guifg=#2b353c cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#3d3038 ctermbg=8
hi PmenuThumb guibg=#ab9699 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#0eb40e guifg=#2b353c cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#be9604 guifg=#2b353c cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#3d3038 guifg=#ab9699 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#3d3038 guifg=#bdae13 cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#0eb40e ctermfg=2
hi diffRemoved guifg=#be9604 ctermfg=1
hi diffNewFile gui=none guifg=#00acb3 ctermfg=4
hi diffFile gui=none guifg=#79aa00 cterm=none ctermfg=3
