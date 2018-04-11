" Name: Tempus Fugit
" Author: Protesilaos Stavrou (https://protesilaos.com)
" Description: Light, pleasant theme optimised for long writing/coding sessions (WCAG AA compliant)

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tempus_fugit"

" General
" -----------------

" NOTE the ctermbg=none is for terminals with transparency
hi Normal guibg=#fff5f3 guifg=#4d696f ctermbg=none ctermfg=0
hi Visual guibg=#4d696f guifg=#fff5f3 ctermbg=0 ctermfg=15
hi Search gui=underline,bold,italic guibg=#587d0a guifg=#fff5f3 cterm=underline,bold,italic ctermbg=2 ctermfg=15
hi IncSearch gui=underline,bold,italic guibg=#8b6781 guifg=#fff5f3 term=none cterm=underline,bold,italic ctermbg=8 ctermfg=15

hi StatusLine gui=none,bold guibg=#4d696f guifg=#fff5f3 cterm=none,bold ctermbg=0 ctermfg=15
hi StatusLineNC gui=none guibg=#faf6f9 guifg=#8b6781 cterm=none ctermbg=7 ctermfg=8
hi StatusLineTerm gui=none,bold guibg=#587d0a guifg=#fff5f3 cterm=none,bold ctermbg=2 ctermfg=15
hi StatusLineTermNC gui=none guibg=#faf6f9 guifg=#587d0a cterm=none ctermbg=7 ctermfg=2

hi VertSplit gui=none cterm=none
hi TabLine gui=none guibg=#faf6f9 guifg=#8b6781 cterm=none ctermbg=7 ctermfg=8
hi TabLineSel gui=none guibg=#4d696f guifg=#fff5f3 cterm=none ctermbg=0 ctermfg=15
hi TabLineFill gui=none cterm=none

hi Comment gui=italic guifg=#8b6781 cterm=italic ctermfg=8
hi Todo gui=bold guibg=#faf6f9 guifg=#8d590a cterm=bold ctermbg=7 ctermfg=11

hi Warning gui=none guibg=#8a6f00 guifg=#fff5f3 cterm=none ctermbg=3 ctermfg=15
hi WarningMsg gui=none guibg=#8a6f00 guifg=#fff5f3 cterm=none ctermbg=3 ctermfg=15
hi Error gui=none guibg=#df2014 guifg=#fff5f3 cterm=none ctermbg=1 ctermfg=15
hi ErrorMsg gui=none guibg=#df2014 guifg=#fff5f3 cterm=none ctermbg=1 ctermfg=15

hi MatchParen gui=underline,bold guibg=#9536c0 guifg=#fff5f3 cterm=underline,bold ctermbg=13 ctermfg=15

hi ToolbarLine guibg=#8b6781 guifg=#fff5f3 term=none ctermbg=8 ctermfg=15
hi ToolbarButton gui=bold guibg=#8b6781 guifg=#fff5f3 term=none cterm=bold ctermbg=8 ctermfg=15

hi WildMenu guibg=#fff5f3 guifg=#4d696f term=standout ctermbg=15 ctermfg=0

hi Terminal guibg=#fff5f3 guifg=#4d696f term=none ctermbg=15 ctermfg=0

" Constructs
" -----------------
hi Constant guifg=#196bec ctermfg=4
hi Number guifg=#196bec ctermfg=4
hi Float guifg=#196bec ctermfg=4
hi String guifg=#004fff ctermfg=12

hi Function guifg=#c83884 ctermfg=5
hi Identifier guifg=#9536c0 term=none ctermfg=13
hi Label guifg=#c83884 ctermfg=5
hi Tag guifg=#c83884 ctermfg=5
hi Keyword gui=bold guifg=#9536c0 gui=bold ctermfg=13

hi Character gui=bold guifg=#046c92 cterm=bold ctermfg=14

hi Type gui=none,bold guifg=#2a79a2 term=none cterm=none,bold ctermfg=6
hi Boolean guifg=#2a79a2 ctermfg=6
hi StorageClass guifg=#2a79a2 ctermfg=6
hi Structure guifg=#2a79a2 ctermfg=6
hi Typedef gui=bold guifg=#046c92 cterm=bold ctermfg=14

hi Conditional gui=bold guifg=#587d0a cterm=bold ctermfg=2
hi Statement gui=none guifg=#11742f cterm=none ctermfg=10
hi Repeat gui=bold guifg=#11742f cterm=bold ctermfg=10
hi Operator gui=bold guifg=#4d696f cterm=bold ctermfg=0
hi Exception gui=bold guifg=#df2014 cterm=bold ctermfg=1

hi Preproc gui=none guifg=#9a511a term=none cterm=none ctermfg=9
hi PreCondit gui=bold guifg=#9a511a cterm=bold ctermfg=9
hi Macro gui=bold guifg=#9a511a cterm=bold ctermfg=9
hi Include guifg=#9a511a ctermfg=9
hi Define guifg=#9a511a ctermfg=9

hi Title gui=bold guibg=#fff5f3 guifg=#2a79a2 cterm=bold ctermbg=15 ctermfg=6

hi Special gui=bold guifg=#8d590a term=none cterm=bold ctermfg=11
hi SpecialKey guifg=#8d590a ctermfg=11
hi SpecialChar gui=bold guifg=#8d590a cterm=bold ctermfg=11

hi Delimeter gui=bold guifg=#c83884 cterm=bold ctermfg=5
hi Delimiter gui=bold guifg=#c83884 cterm=bold ctermfg=5
hi SpecialComment gui=bold guifg=#c83884 cterm=bold ctermfg=5

hi Debug guifg=#9536c0 ctermfg=13

" Other
" -----------------
hi LineNr guibg=#faf6f9 guifg=#8b6781 term=none ctermbg=7 ctermfg=8
hi Cursor guibg=#4d696f guifg=#fff5f3 ctermbg=0 ctermfg=15
hi CursorLine gui=none guibg=NONE term=none cterm=none ctermbg=none
hi CursorColumn gui=none guibg=#faf6f9 term=none cterm=none ctermbg=7
hi CursorLineNr gui=bold guibg=#8b6781 guifg=#fff5f3 cterm=bold ctermbg=8 ctermfg=15
hi ColorColumn guibg=#faf6f9 guifg=#4d696f term=none ctermbg=7 ctermfg=0

hi Folded guibg=#faf6f9 guifg=#8b6781 ctermbg=7 ctermfg=8
hi FoldColumn guibg=#faf6f9 guifg=#8b6781 ctermbg=7 ctermfg=8

hi NonText gui=bold guibg=NONE guifg=#8b6781 cterm=bold ctermbg=none ctermfg=8

hi Directory gui=none guifg=#587d0a term=none cterm=none ctermfg=2
hi Question gui=bold guifg=#8d590a cterm=bold ctermfg=11
hi MoreMsg guifg=#11742f ctermfg=10
hi ModeMsg gui=bold guifg=#587d0a cterm=bold ctermfg=2

hi VimOption guifg=#c83884 ctermfg=5
hi VimGroup guifg=#c83884 ctermfg=5

hi Underlined gui=underline,bold guifg=#4d696f cterm=underline,bold ctermfg=0
hi Ignore guibg=#faf6f9 guifg=#8b6781 ctermbg=7 ctermfg=8
hi Conceal guibg=#8b6781 guifg=#faf6f9 ctermbg=8 ctermfg=7

hi SpellBad guibg=#df2014 guifg=#fff5f3 ctermbg=1 ctermfg=15
hi SpellCap guibg=#8a6f00 guifg=#fff5f3 ctermbg=3 ctermfg=15
hi SpellRare guibg=#9536c0 guifg=#fff5f3 ctermbg=13 ctermfg=15
hi SpellLocal guibg=#046c92 guifg=#fff5f3 ctermbg=14 ctermfg=15

hi Pmenu gui=italic guibg=#faf6f9 guifg=#4d696f cterm=italic ctermbg=7 ctermfg=0
hi PmenuSel gui=none,bold guibg=#8b6781 guifg=#fff5f3 cterm=none,bold ctermbg=8 ctermfg=15
hi PmenuSbar guibg=#faf6f9 ctermbg=7
hi PmenuThumb guibg=#8b6781 ctermbg=8

" Diffs
" -----------------
hi DiffAdd gui=bold guibg=#587d0a guifg=#fff5f3 cterm=bold ctermbg=10 ctermfg=15
hi DiffDelete gui=none guibg=#df2014 guifg=#fff5f3 cterm=none ctermbg=9 ctermfg=15
hi DiffChange gui=bold guibg=#faf6f9 guifg=#8b6781 cterm=bold ctermbg=7 ctermfg=8
hi DiffText gui=bold guibg=#faf6f9 guifg=#9a511a cterm=bold ctermbg=7 ctermfg=1

hi diffAdded guifg=#587d0a ctermfg=2
hi diffRemoved guifg=#df2014 ctermfg=1
hi diffNewFile gui=none guifg=#196bec ctermfg=4
hi diffFile gui=none guifg=#8a6f00 cterm=none ctermfg=3
