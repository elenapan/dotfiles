" Name: Tempus Autumn
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with a palette inspired by earthly colours (WCAG AA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_autumn"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#322622 guifg=#8e8f8d ctermbg=none ctermfg=15
hi Visual guibg=#8e8f8d guifg=#322622 ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#83973f guifg=#322622 cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#919078 guifg=#322622 term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#8e8f8d guifg=#322622 cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#35260f guifg=#919078 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#83973f guifg=#322622 cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#35260f guifg=#83973f cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#35260f guifg=#919078 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#8e8f8d guifg=#322622 cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#919078 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#35260f guifg=#b1891a cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#9e9022 guifg=#322622 cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#9e9022 guifg=#322622 cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#fc5526 guifg=#322622 cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#fc5526 guifg=#322622 cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#9d80d3 guifg=#322622 cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#919078 guifg=#322622 term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#919078 guifg=#322622 term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#322622 guifg=#8e8f8d term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#322622 guifg=#8e8f8d term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#7f8dbf ctermfg=4
hi Number guifg=#7f8dbf ctermfg=4
hi Float guifg=#7f8dbf ctermfg=4
hi String guifg=#6b8ed6 ctermfg=12

hi Function guifg=#ce7673 ctermfg=5
hi Identifier guifg=#9d80d3 term=none ctermfg=13
hi Label guifg=#ce7673 ctermfg=5
hi Tag guifg=#ce7673 ctermfg=5
hi Keyword gui=bold guifg=#9d80d3 gui=bold ctermfg=13

hi Character gui=bold guifg=#229ea0 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#6e978b term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#6e978b ctermfg=6
hi StorageClass guifg=#6e978b ctermfg=6
hi Structure guifg=#6e978b ctermfg=6
hi Typedef gui=bold guifg=#229ea0 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#83973f cterm=bold ctermfg=2
hi Statement gui=none guifg=#609d59 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#609d59 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#8e8f8d cterm=bold ctermfg=15
hi Exception gui=bold guifg=#fc5526 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#dc721a term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#dc721a cterm=bold ctermfg=9
hi Macro gui=bold guifg=#dc721a cterm=bold ctermfg=9
hi Include guifg=#dc721a ctermfg=9
hi Define guifg=#dc721a ctermfg=9

hi Title gui=bold guibg=#322622 guifg=#6e978b cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#b1891a term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#b1891a ctermfg=11
hi SpecialChar gui=bold guifg=#b1891a cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#ce7673 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#ce7673 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#ce7673 cterm=bold ctermfg=5

hi Debug guifg=#9d80d3 ctermfg=13

" Other
" -----------------
hi LineNr guibg=#35260f guifg=#919078 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#8e8f8d guifg=#322622 ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#35260f term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#919078 guifg=#322622 cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#35260f guifg=#8e8f8d term=none ctermbg=8 ctermfg=15

hi Folded guibg=#35260f guifg=#919078 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#35260f guifg=#919078 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#919078 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#83973f term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#b1891a cterm=bold ctermfg=11
hi MoreMsg guifg=#609d59 ctermfg=10
hi ModeMsg gui=bold guifg=#83973f cterm=bold ctermfg=2

hi VimOption guifg=#ce7673 ctermfg=5
hi VimGroup guifg=#ce7673 ctermfg=5

hi Underlined gui=underline,bold guifg=#8e8f8d cterm=underline,bold ctermfg=15
hi Ignore guibg=#35260f guifg=#919078 ctermbg=8 ctermfg=7
hi Conceal guibg=#919078 guifg=#35260f ctermbg=7 ctermfg=8

hi SpellBad guibg=#fc5526 guifg=#322622 ctermbg=1 ctermfg=0
hi SpellCap guibg=#9e9022 guifg=#322622 ctermbg=3 ctermfg=0
hi SpellRare guibg=#9d80d3 guifg=#322622 ctermbg=13 ctermfg=0
hi SpellLocal guibg=#229ea0 guifg=#322622 ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#35260f guifg=#8e8f8d cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#919078 guifg=#322622 cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#35260f ctermbg=8
hi PmenuThumb guibg=#919078 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#83973f guifg=#322622 cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#fc5526 guifg=#322622 cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#35260f guifg=#919078 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#35260f guifg=#dc721a cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#83973f ctermfg=2
hi diffRemoved guifg=#fc5526 ctermfg=1
hi diffNewFile gui=none guifg=#7f8dbf ctermfg=4
hi diffFile gui=none guifg=#9e9022 cterm=none ctermfg=3
