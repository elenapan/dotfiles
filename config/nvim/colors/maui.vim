" maui.vim: a new colorscheme by kryten

" Standard Initialization: {{{
set bg=dark
hi clear
if exists( "syntax_on")
  syntax reset
endif
let g:colors_name="maui"
" }}}

" Highlighting Commands: {{{
hi SpecialKey term=bold guifg=#5f5f5f ctermfg=59
hi NonText term=bold guifg=#5f5f5f ctermfg=59
hi Directory term=bold gui=bold cterm=bold guifg=#5f87af ctermfg=67
hi ErrorMsg term=standout gui=bold cterm=bold guifg=#ff00af ctermfg=199 guibg=#000000 ctermbg=16
hi IncSearch term=reverse gui=reverse cterm=reverse guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208
hi Search term=reverse guibg=#df5f00 ctermbg=166
hi MoreMsg term=bold guifg=#ffffaf ctermfg=229
hi ModeMsg term=bold gui=bold cterm=bold guifg=#ffffaf ctermfg=229
hi LineNr term=underline guifg=#303030 ctermfg=236 guibg=#101010 ctermbg=233
hi CursorLineNr term=bold guifg=#ff8700 ctermfg=208
hi Question term=standout guifg=#5fdfff ctermfg=81
hi StatusLine term=bold gui=bold cterm=bold guifg=#5f87af ctermfg=67 guibg=#303030 ctermbg=236
hi StatusLineNC term=none gui=none cterm=none guifg=#5f87af ctermfg=67 guibg=#303030 ctermbg=236
hi VertSplit term=none guifg=#303030 ctermfg=236 guibg=#303030 ctermbg=236
hi Title term=bold guifg=#df5f00 ctermfg=166
hi Visual term=reverse gui=none cterm=none guibg=#003366 ctermbg=236
hi VisualNOS guibg=#444444 ctermbg=238
hi WarningMsg term=standout gui=bold cterm=bold guifg=#ffffff ctermfg=231 guibg=#444444 ctermbg=238
hi WildMenu term=standout guifg=#5fdfff ctermfg=81 guibg=#000000 ctermbg=16
hi Folded term=standout guifg=#5f87af ctermfg=67 guibg=#262626 ctermbg=235
hi FoldColumn term=standout guifg=#5f87af ctermfg=67 guibg=#000000 ctermbg=16
hi DiffAdd term=bold guibg=#1d3600 ctermbg=22
hi DiffChange term=bold guibg=#1d3600 ctermbg=0
hi DiffDelete term=bold guifg=#5f0000 ctermfg=52 guibg=#5f0000 ctermbg=52
hi DiffText term=bold gui=bold cterm=bold guibg=#2a4f00 ctermbg=238
hi SignColumn term=standout guifg=#87ff00 ctermfg=118 guibg=#262626 ctermbg=235
hi Conceal guifg=#c0c0c0 ctermfg=7 guibg=#666666 ctermbg=242
hi SpellBad term=reverse guibg=#5f0000 ctermbg=52
hi SpellCap term=reverse guibg=#00005f ctermbg=17
hi SpellRare term=reverse gui=reverse cterm=reverse
hi SpellLocal term=underline guibg=#00005f ctermbg=17
hi Pmenu guifg=#5fdfff ctermfg=81 guibg=#000000 ctermbg=16
hi PmenuSel guifg=#eeeeee ctermfg=255 guibg=#666666 ctermbg=242
hi PmenuSbar guibg=#080808 ctermbg=232
hi PmenuThumb guifg=#5fdfff ctermfg=81 guibg=#ffffff ctermbg=15
hi TabLine term=underline gui=underline cterm=underline guifg=#ffffff ctermfg=15 guibg=#666666 ctermbg=242
hi TabLineSel term=bold gui=bold cterm=bold
hi TabLineFill term=reverse gui=reverse cterm=reverse
hi CursorColumn term=reverse guibg=#303030 ctermbg=236
hi CursorLine term=none gui=none cterm=none guibg=#000000 ctermbg=233
hi ColorColumn term=none guibg=#303030 ctermbg=236
hi MatchParen term=reverse gui=bold cterm=bold guifg=#121212 ctermfg=233 guibg=#ff8700 ctermbg=208
hi Normal guifg=#d0d0d0 ctermfg=252 guibg=#151515 ctermbg=233
hi Cursor guifg=#151515 ctermfg=16 guibg=#dadada ctermbg=253
hi Comment guifg=#585858 ctermfg=240
hi Constant term=underline gui=bold cterm=bold guifg=#df005f ctermfg=161
hi Identifier term=underline guifg=#5f87af ctermfg=67
hi Statement term=bold gui=bold cterm=bold guifg=#df5f00 ctermfg=166
hi PreProc term=underline guifg=#87af5f ctermfg=107
hi Type term=underline guifg=#5f87df ctermfg=68
hi Special term=bold guifg=#5f87af ctermfg=67
hi Ignore guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=232
hi Todo term=standout gui=bold cterm=bold guifg=#ffffff ctermfg=231 guibg=#080808 ctermbg=232
hi Underlined term=underline gui=underline cterm=underline guifg=#808080 ctermfg=244
hi Error term=reverse guifg=#ffafff ctermfg=219 guibg=#87005f ctermbg=89
hi String guifg=#87af87 ctermfg=108
hi Character guifg=#afaf87 ctermfg=144
hi Number guifg=#5fafff ctermfg=75
hi Boolean guifg=#ff8700 ctermfg=208
hi Float guifg=#ff8700 ctermfg=208
hi Function guifg=#5f87af ctermfg=67
hi Conditional gui=bold cterm=bold guifg=#ff8700 ctermfg=208
hi Repeat gui=bold cterm=bold guifg=#df005f ctermfg=161
hi Label guifg=#ffffaf ctermfg=229
hi Operator guifg=#df005f ctermfg=161
hi Keyword gui=bold cterm=bold guifg=#df005f ctermfg=161
hi Exception gui=bold cterm=bold guifg=#87af5f ctermfg=107
hi Define guifg=#5f87af ctermfg=67
hi Macro guifg=#dfffaf ctermfg=193
hi PreCondit gui=bold cterm=bold guifg=#87af5f ctermfg=107
hi StorageClass guifg=#ff8700 ctermfg=208
hi Structure guifg=#5fdfff ctermfg=81
hi Typedef guifg=#5fdfff ctermfg=81
hi Tag gui=bold cterm=bold guifg=#df005f ctermfg=161
hi SpecialChar gui=bold cterm=bold guifg=#df005f ctermfg=161
hi Delimiter guifg=#5f87af ctermfg=67
hi SpecialComment gui=bold cterm=bold guifg=#8a8a8a ctermfg=245
hi Debug gui=bold cterm=bold guifg=#ffdfff ctermfg=225

hi diffRemoved term=bold guibg=#5f0000 ctermbg=52
hi link diffAdded DiffAdd

hi link gitKeyword Function
hi link gitIdentity Title
hi link gitDate PreProc

hi IndentGuidesOdd guibg=#151515 ctermbg=233
hi IndentGuidesEven guibg=#080808 ctermbg=232

hi SyntasticError term=reverse gui=bold,underline cterm=bold,underline guifg=#ffafff ctermfg=219 guibg=#303030 ctermbg=236
hi SyntasticWarning term=standout gui=bold,underline cterm=bold,underline guifg=#ff00af ctermfg=199 guibg=#262626 ctermbg=235
hi SyntasticWarningLine guibg=#262626 ctermbg=235
hi SyntasticErrorLine guibg=#303030 ctermbg=236
hi SyntasticWarningSign ctermfg=yellow guibg=#121212 ctermbg=233
hi SyntasticErrorSign ctermfg=red guibg=#121212 ctermbg=233
" }}}

set bg=dark "bg switches to light for some reason

" vim:set fdm=marker
