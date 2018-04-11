" Name: Tempus Future
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with colours inspired by concept art of outer space (WCAG AAA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_future"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#18161d guifg=#a4a0ac ctermbg=none ctermfg=15
hi Visual guibg=#a4a0ac guifg=#18161d ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#68b183 guifg=#18161d cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#bd9b87 guifg=#18161d term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#a4a0ac guifg=#18161d cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#001b1a guifg=#bd9b87 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#68b183 guifg=#18161d cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#001b1a guifg=#68b183 cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#001b1a guifg=#bd9b87 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#a4a0ac guifg=#18161d cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#bd9b87 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#001b1a guifg=#d39710 cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#bda014 guifg=#18161d cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#bda014 guifg=#18161d cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#ff7780 guifg=#18161d cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#ff7780 guifg=#18161d cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#ec7aca guifg=#18161d cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#bd9b87 guifg=#18161d term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#bd9b87 guifg=#18161d term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#18161d guifg=#a4a0ac term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#18161d guifg=#a4a0ac term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#54a5ff ctermfg=4
hi Number guifg=#54a5ff ctermfg=4
hi Float guifg=#54a5ff ctermfg=4
hi String guifg=#a294fe ctermfg=12

hi Function guifg=#da89b2 ctermfg=5
hi Identifier guifg=#ec7aca term=none ctermfg=13
hi Label guifg=#da89b2 ctermfg=5
hi Tag guifg=#da89b2 ctermfg=5
hi Keyword gui=bold guifg=#ec7aca gui=bold ctermfg=13

hi Character gui=bold guifg=#4ab0b9 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#79a8c3 term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#79a8c3 ctermfg=6
hi StorageClass guifg=#79a8c3 ctermfg=6
hi Structure guifg=#79a8c3 ctermfg=6
hi Typedef gui=bold guifg=#4ab0b9 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#68b183 cterm=bold ctermfg=2
hi Statement gui=none guifg=#08b885 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#08b885 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#a4a0ac cterm=bold ctermfg=15
hi Exception gui=bold guifg=#ff7780 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#ef873d term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#ef873d cterm=bold ctermfg=9
hi Macro gui=bold guifg=#ef873d cterm=bold ctermfg=9
hi Include guifg=#ef873d ctermfg=9
hi Define guifg=#ef873d ctermfg=9

hi Title gui=bold guibg=#18161d guifg=#79a8c3 cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#d39710 term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#d39710 ctermfg=11
hi SpecialChar gui=bold guifg=#d39710 cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#da89b2 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#da89b2 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#da89b2 cterm=bold ctermfg=5

hi Debug guifg=#ec7aca ctermfg=13

" Other
" -----------------
hi LineNr guibg=#001b1a guifg=#bd9b87 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#a4a0ac guifg=#18161d ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#001b1a term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#bd9b87 guifg=#18161d cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#001b1a guifg=#a4a0ac term=none ctermbg=8 ctermfg=15

hi Folded guibg=#001b1a guifg=#bd9b87 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#001b1a guifg=#bd9b87 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#bd9b87 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#68b183 term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#d39710 cterm=bold ctermfg=11
hi MoreMsg guifg=#08b885 ctermfg=10
hi ModeMsg gui=bold guifg=#68b183 cterm=bold ctermfg=2

hi VimOption guifg=#da89b2 ctermfg=5
hi VimGroup guifg=#da89b2 ctermfg=5

hi Underlined gui=underline,bold guifg=#a4a0ac cterm=underline,bold ctermfg=15
hi Ignore guibg=#001b1a guifg=#bd9b87 ctermbg=8 ctermfg=7
hi Conceal guibg=#bd9b87 guifg=#001b1a ctermbg=7 ctermfg=8

hi SpellBad guibg=#ff7780 guifg=#18161d ctermbg=1 ctermfg=0
hi SpellCap guibg=#bda014 guifg=#18161d ctermbg=3 ctermfg=0
hi SpellRare guibg=#ec7aca guifg=#18161d ctermbg=13 ctermfg=0
hi SpellLocal guibg=#4ab0b9 guifg=#18161d ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#001b1a guifg=#a4a0ac cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#bd9b87 guifg=#18161d cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#001b1a ctermbg=8
hi PmenuThumb guibg=#bd9b87 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#68b183 guifg=#18161d cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#ff7780 guifg=#18161d cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#001b1a guifg=#bd9b87 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#001b1a guifg=#ef873d cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#68b183 ctermfg=2
hi diffRemoved guifg=#ff7780 ctermfg=1
hi diffNewFile gui=none guifg=#54a5ff ctermfg=4
hi diffFile gui=none guifg=#bda014 cterm=none ctermfg=3
