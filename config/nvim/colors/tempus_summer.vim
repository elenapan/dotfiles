" Name: Tempus Summer
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Dark theme with colours inspired by summer evenings by the sea (WCAG AA compliant)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_summer"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#293345 guifg=#9b999e ctermbg=none ctermfg=15
hi Visual guibg=#9b999e guifg=#293345 ctermbg=15 ctermfg=0
hi Search gui=underline,bold,italic guibg=#6ba86d guifg=#293345 cterm=underline,bold,italic ctermbg=2 ctermfg=0
hi IncSearch gui=underline,bold,italic guibg=#a39799 guifg=#293345 term=none cterm=underline,bold,italic ctermbg=7 ctermfg=0

hi StatusLine gui=none,bold guibg=#9b999e guifg=#293345 cterm=none,bold ctermbg=15 ctermfg=0
hi StatusLineNC gui=none guibg=#352f49 guifg=#a39799 cterm=none ctermbg=8 ctermfg=7
hi StatusLineTerm gui=none,bold guibg=#6ba86d guifg=#293345 cterm=none,bold ctermbg=2 ctermfg=0
hi StatusLineTermNC gui=none guibg=#352f49 guifg=#6ba86d cterm=none ctermbg=8 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#352f49 guifg=#a39799 cterm=none ctermbg=8 ctermfg=7
hi TabLineSel gui=none guibg=#9b999e guifg=#293345 cterm=none ctermbg=15 ctermfg=0
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#a39799 cterm=italic ctermfg=7
hi Todo gui=bold guibg=#352f49 guifg=#ba953a cterm=bold ctermbg=8 ctermfg=11

hi Warning gui=none guibg=#af9a0a guifg=#293345 cterm=none ctermbg=3 ctermfg=0
hi WarningMsg gui=none guibg=#af9a0a guifg=#293345 cterm=none ctermbg=3 ctermfg=0
hi Error gui=none guibg=#fe6d32 guifg=#293345 cterm=none ctermbg=1 ctermfg=0
hi ErrorMsg gui=none guibg=#fe6d32 guifg=#293345 cterm=none ctermbg=1 ctermfg=0

hi MatchParen gui=underline,bold guibg=#c97ed7 guifg=#293345 cterm=underline,bold ctermbg=13 ctermfg=0

hi ToolbarLine guibg=#a39799 guifg=#293345 term=none ctermbg=7 ctermfg=0
hi ToolbarButton gui=bold guibg=#a39799 guifg=#293345 term=none cterm=bold ctermbg=7 ctermfg=0

hi WildMenu guibg=#293345 guifg=#9b999e term=standout ctermbg=0 ctermfg=15

hi Terminal guibg=#293345 guifg=#9b999e term=none ctermbg=0 ctermfg=15

" Constructs
" -----------------
hi Constant guifg=#679ed7 ctermfg=4
hi Number guifg=#679ed7 ctermfg=4
hi Float guifg=#679ed7 ctermfg=4
hi String guifg=#3ba1e8 ctermfg=12

hi Function guifg=#bc8ab6 ctermfg=5
hi Identifier guifg=#c97ed7 term=none ctermfg=13
hi Label guifg=#bc8ab6 ctermfg=5
hi Tag guifg=#bc8ab6 ctermfg=5
hi Keyword gui=bold guifg=#c97ed7 gui=bold ctermfg=13

hi Character gui=bold guifg=#52a6b1 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#6ea590 term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#6ea590 ctermfg=6
hi StorageClass guifg=#6ea590 ctermfg=6
hi Structure guifg=#6ea590 ctermfg=6
hi Typedef gui=bold guifg=#52a6b1 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#6ba86d cterm=bold ctermfg=2
hi Statement gui=none guifg=#7aa747 cterm=none ctermfg=10
hi Repeat gui=bold guifg=#7aa747 cterm=bold ctermfg=10
hi Operator gui=bold guifg=#9b999e cterm=bold ctermfg=15
hi Exception gui=bold guifg=#fe6d32 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#df8251 term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#df8251 cterm=bold ctermfg=9
hi Macro gui=bold guifg=#df8251 cterm=bold ctermfg=9
hi Include guifg=#df8251 ctermfg=9
hi Define guifg=#df8251 ctermfg=9

hi Title gui=bold guibg=#293345 guifg=#6ea590 cterm=bold ctermbg=0 ctermfg=6

hi Special gui=bold guifg=#ba953a term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#ba953a ctermfg=11
hi SpecialChar gui=bold guifg=#ba953a cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#bc8ab6 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#bc8ab6 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#bc8ab6 cterm=bold ctermfg=5

hi Debug guifg=#c97ed7 ctermfg=13

" Other
" -----------------
hi LineNr guibg=#352f49 guifg=#a39799 term=none ctermbg=8 ctermfg=7
hi Cursor guibg=#9b999e guifg=#293345 ctermbg=15 ctermfg=0
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#352f49 term=none cterm=none ctermbg=8
hi CursorLineNr gui=bold guibg=#a39799 guifg=#293345 cterm=bold ctermbg=7 ctermfg=0
hi ColorColumn guibg=#352f49 guifg=#9b999e term=none ctermbg=8 ctermfg=15

hi Folded guibg=#352f49 guifg=#a39799 ctermbg=8 ctermfg=7
hi FoldColumn guibg=#352f49 guifg=#a39799 ctermbg=8 ctermfg=7

hi NonText gui=bold guibg=NONE guifg=#a39799 cterm=bold ctermbg=none ctermfg=7

hi Directory gui=none guifg=#6ba86d term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#ba953a cterm=bold ctermfg=11
hi MoreMsg guifg=#7aa747 ctermfg=10
hi ModeMsg gui=bold guifg=#6ba86d cterm=bold ctermfg=2

hi VimOption guifg=#bc8ab6 ctermfg=5
hi VimGroup guifg=#bc8ab6 ctermfg=5

hi Underlined gui=underline,bold guifg=#9b999e cterm=underline,bold ctermfg=15
hi Ignore guibg=#352f49 guifg=#a39799 ctermbg=8 ctermfg=7
hi Conceal guibg=#a39799 guifg=#352f49 ctermbg=7 ctermfg=8

hi SpellBad guibg=#fe6d32 guifg=#293345 ctermbg=1 ctermfg=0
hi SpellCap guibg=#af9a0a guifg=#293345 ctermbg=3 ctermfg=0
hi SpellRare guibg=#c97ed7 guifg=#293345 ctermbg=13 ctermfg=0
hi SpellLocal guibg=#52a6b1 guifg=#293345 ctermbg=14 ctermfg=0

hi Pmenu gui=italic guibg=#352f49 guifg=#9b999e cterm=italic ctermbg=8 ctermfg=15
hi PmenuSel gui=none,bold guibg=#a39799 guifg=#293345 cterm=none,bold ctermbg=7 ctermfg=0
hi PmenuSbar guibg=#352f49 ctermbg=8
hi PmenuThumb guibg=#a39799 ctermbg=7

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#6ba86d guifg=#293345 cterm=bold ctermbg=10 ctermfg=0
hi DiffDelete gui=none guibg=#fe6d32 guifg=#293345 cterm=none ctermbg=9 ctermfg=0
hi DiffChange gui=bold guibg=#352f49 guifg=#a39799 cterm=bold ctermbg=8 ctermfg=7
hi DiffText gui=bold guibg=#352f49 guifg=#df8251 cterm=bold ctermbg=8 ctermfg=1

hi diffAdded guifg=#6ba86d ctermfg=2
hi diffRemoved guifg=#fe6d32 ctermfg=1
hi diffNewFile gui=none guifg=#679ed7 ctermfg=4
hi diffFile gui=none guifg=#af9a0a cterm=none ctermfg=3
