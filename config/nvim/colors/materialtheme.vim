" =============================================================================
" Name: materialtheme
" Maintainer: Günther Wutz
" =============================================================================

" =============================================================================
" Preamble
" =============================================================================

set background=dark

hi clear

if exists("syntax-on")
syntax reset
endif

let colors_name = "materialtheme"

" =============================================================================
" General colours
" =============================================================================
"let s:mat.accent = ['80cbc4']
"let s:mat.grey900 = ['263238']
"let s:mat.grey800 = ['37474F']
"let s:mat.grey600 = ['546e7a']
"let s:mat.grey500 = ['607d8b']
"orange 300 ffb74d
"amber  300 ffd54f
"red    300 e57373
"pink   300 f06292
"green  300 81c784
"blue   300 64b5f6

hi Normal guibg=#263238 guifg=#eeeeec 
hi VertSplit guibg=#263238 guifg=#263238
hi SignColumn guibg=#263238
hi LineNr guibg=#263238 guifg=#37474f
hi NonText guibg=#263238 guifg=#37474f
hi Cursor gui=none guibg=#607d8b guifg=#263238
hi CursorLine guibg=#2b3940
hi CursorColumn guibg=#2b3940
hi ColorColumn guibg=#37474f
hi SpecialKey guibg=#263238 guifg=#37474f
hi conceal guibg=#263238
hi FoldColumn guibg=#263238 guifg=#607d8b gui=bold
hi PMenu guifg=#80cbc4 guibg=#37474f
hi PMenuSel guibg=#546e7a guifg=#80cbc4
hi SpellBad gui=undercurl guisp=#e57373 guifg=#e57373

hi Folded guibg=#37474f guifg=#80cbc4 
" No fold column support yet 
" hi FoldColumn guifg=Orange guibg=DarkBlue
" =============================================================================
" Syntax highlighting
" =============================================================================

"hi Comment gui=italic guifg=#6d7e8a ctermfg=Grey
hi Comment gui=italic guifg=#546e7a ctermfg=Grey
hi Todo gui=bold guifg=#80cbc4 guibg=#37474f
"hi Constant guifg=#8ae234
hi Constant guifg=#ffd54f
"hi Type guifg=#8AE234
hi Type guifg=#ffb74d
hi Function gui=bold guifg=#9BCF8D
"hi Function gui=bold guifg=#607D8B
"hi Statement guifg=#729FCF
hi Statement guifg=#ff8a65
hi Identifier guifg=#AD7FA8
hi PreProc guifg=#e9ba6e 
hi Special term=underline guifg=#64b5f6
hi Number guifg=#ffd54f gui=bold

hi Search guifg=#81c784 guibg=#263238 gui=bold
hi StatusLine guibg=#546e7a guifg=#263238
hi StatusLineNC guibg=#263238 guifg=#263238
hi TabLineFill guibg=#263238
hi Delimiter guifg=#607d8b
hi MatchParen guibg=#37473f guifg=#ffb74d gui=bold
hi markdownHeadingDelimiter guifg=#ffb74d
hi Title gui=bold guifg=#ffb74d
hi htmlH1 gui=bold guifg=#ffb74d
hi htmlH2 gui=bold guifg=#ffb74d
hi htmlH3 guifg=#ffb74d

" Syntastic
hi SyntasticError guifg=#e57373
hi SyntasticWarning guifg=#ffd54f gui=NONE
hi SyntasticErrorSign guifg=#e57373 gui=bold
hi SyntasticWarningSign guifg=#ffd54f gui=bold
