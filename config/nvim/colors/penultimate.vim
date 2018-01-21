" Vim color file                              "
"                                             "
" Maintainer:   Ivan Cukic                    "
" Last Change:  $Date: 13. 4. 2014.$          "
" URL:                                        "
" Version:  $Id: penultimate.vim, v 1.0$      "
"                                             "
" Based on: Desert by Hans Fugal              "

" Cterm colors "

hi SpecialKey term=bold ctermfg=51
hi NonText term=bold cterm=bold ctermfg=21
hi Directory term=bold ctermfg=51
hi ErrorMsg term=standout ctermfg=231 ctermbg=196
hi IncSearch term=reverse cterm=reverse
hi Search term=reverse ctermfg=16 ctermbg=226
hi MoreMsg term=bold cterm=bold ctermfg=29
hi ModeMsg term=bold cterm=bold
hi LineNr term=underline ctermfg=226
hi CursorLineNr term=bold cterm=bold ctermfg=226
hi Question term=standout cterm=bold ctermfg=46
hi StatusLine term=bold,reverse cterm=bold,reverse
hi StatusLineNC term=reverse cterm=reverse
hi VertSplit term=reverse cterm=reverse
hi Title term=bold cterm=bold ctermfg=201
hi Visual term=reverse ctermbg=248
hi VisualNOS term=bold,underline cterm=bold,underline
hi WarningMsg term=standout ctermfg=196
hi WildMenu term=standout ctermfg=16 ctermbg=226
hi Folded term=standout ctermfg=51 ctermbg=248
hi FoldColumn term=standout ctermfg=51 ctermbg=250
hi DiffAdd term=bold ctermbg=18
hi DiffChange term=bold ctermbg=90
hi DiffDelete term=bold cterm=bold ctermfg=21 ctermbg=30
hi DiffText term=reverse cterm=bold ctermbg=196
hi SignColumn term=standout ctermfg=51 ctermbg=250
hi Conceal ctermfg=252 ctermbg=248
hi SpellBad term=reverse cterm=undercurl ctermfg=196
hi SpellCap term=reverse cterm=undercurl ctermfg=21
hi SpellRare term=reverse cterm=undercurl ctermfg=201
hi SpellLocal term=underline cterm=undercurl ctermfg=51
hi Pmenu ctermbg=201
hi PmenuSel ctermbg=248
hi PmenuSbar ctermbg=250
hi PmenuThumb ctermbg=231
hi TabLine term=underline cterm=underline ctermbg=248
hi TabLineSel term=bold cterm=bold
hi TabLineFill term=reverse cterm=reverse
hi CursorColumn term=reverse ctermbg=241
hi CursorLine term=underline ctermbg=241
hi ColorColumn term=reverse ctermbg=88
hi Cursor ctermfg=231 ctermbg=16
hi lCursor ctermfg=231 ctermbg=16
hi MatchParen term=reverse ctermbg=30
hi Normal ctermfg=16 ctermbg=0
hi Error term=reverse ctermfg=231 ctermbg=196
hi Comment term=bold ctermfg=111
hi Constant term=underline ctermfg=217
hi Special term=bold ctermfg=214
hi Identifier term=underline ctermfg=87
hi Statement term=bold cterm=bold ctermfg=227
hi PreProc term=underline ctermfg=213
hi Type term=underline cterm=bold ctermfg=83
hi Underlined term=underline cterm=underline ctermfg=111
hi Ignore ctermfg=231
hi Todo term=standout ctermfg=21 ctermbg=226
hi quickfix_error cterm=bold ctermfg=16 ctermbg=196
hi syntax_pimpl_access term=bold ctermfg=242
hi syntax_qtWarning ctermfg=11
hi syntax_qtFatal ctermfg=9
hi syntax_qtCritical ctermfg=9

" GUI "
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="penultimate"


" Normal text "

hi Normal guibg=#151515 guifg=#bbbbbb
hi NonText guibg=#101010 guifg=#bbbbbb
hi Visual guibg=#777777 guifg=#151515

hi Cursor guibg=khaki guifg=black
hi CursorLine guibg=#282320
hi ColorColumn guibg=#331111
hi SignColumn guibg=#151515

hi IncSearch guibg=darkred guifg=wheat
hi Search guibg=#cc7711 guifg=wheat

hi SpecialKey gui=bold guifg=yellow guibg=darkred
hi Conceal guifg=yellow guibg=black gui=bold

hi DiffAdd guibg=#152515
hi DiffChange guibg=#153552
hi DiffDelete guibg=#552525 guifg=#552525
hi DiffText gui=bold guifg=yellow guibg=darkred

" UI parts "

hi LineNr guibg=#101010 guifg=#333333

hi VertSplit guibg=#c2bfa5 guifg=black
hi StatusLine guibg=#c2bfa5 guifg=black gui=bold
hi StatusLineNC guibg=black guifg=#c2bfa5 gui=bold

hi Question guifg=seagreen
hi ModeMsg guifg=seagreen
hi MoreMsg guifg=seagreen
hi ErrorMsg gui=bold guifg=yellow guibg=darkred
hi WarningMsg gui=bold guifg=black guibg=darkorange

hi Pmenu guibg=#282320
hi PmenuSel guibg=#6f6760

hi Folded guibg=grey30 guifg=gold
hi FoldColumn guibg=grey30 guifg=tan

hi Title guifg=indianred
hi WildMenu guibg=#6f6760 guifg=black gui=bold

" Syntax highlighting groups "
hi Comment guifg=#668888

hi Todo gui=bold guifg=yellow guibg=darkred
hi String guibg=#0b0b0b guifg=#71cfff
hi Character guibg=#0b0b0b guifg=skyblue
hi Constant guibg=#0b0b0b guifg=lightgreen
hi Passive guifg=#777777
hi Boolean guibg=#0b0b0b gui=bold
hi BooleanTrue guifg=seagreen2
hi BooleanFalse guifg=tomato

hi Identifier guifg=palegreen
hi Statement guifg=khaki
hi PreProc guifg=#7D3C3C
hi Type guifg=#68bb88 gui=bold
hi Special guifg=#3daee9
hi Ignore guifg=#668888
hi Keyword guifg=#eeee77 gui=bold gui=bold

" Language specific "

" C/C++ "

hi cCustomFunc guifg=#eeeeee
hi cIncluded guifg=#ad6c6c
hi cStorageClass guifg=#68bb88 gui=bold
hi cType guifg=#68bb88 gui=bold
hi cUserLabel guifg=#eeee77 gui=bold

hi cppAccess guifg=#eeee77 gui=bold
hi cppAnnotation guifg=#777777
hi cppConstKeyword guifg=#68bb88
hi cppOperator guifg=#3daee9 gui=bold gui=none
hi cppSTLNamespace guifg=#777777
hi cppSTLfunction guifg=#eeeeee
hi cppStructure guifg=#eeee77 gui=bold gui=bold
hi cppSyntaxNamespaceAccess guifg=#777777
hi cppTemplateKeyword guifg=#f67400 gui=bold
hi cppType guifg=#68bb88 gui=bold
hi cppTypenameKeyword guifg=#777777

hi kdeMacros guifg=#3daee9
hi qtStatements guifg=#3daee9
hi qtUnimportant guifg=#777777






hi doxygenBrief guifg=cadetblue3
hi doxygenBody guifg=#777777
hi doxygenOther guifg=deepskyblue1
hi doxygenSpecial guifg=deepskyblue1
hi doxygenParam guifg=deepskyblue1
hi doxygenComment guifg=#333333
hi doxygenPrevL guifg=#333333
hi doxygenSpecialMultilineDesc guifg=cadetblue3

" Scala "

hi scalaCapitalWord guifg=#68bb88
hi scalaCaseFollowing guifg=#3daee9
hi scalaInstanceDeclaration guifg=#68bb88 gui=bold
hi scalaNameDefinition guifg=#bbbbbb
hi scalaSpecial guifg=skyblue
hi scalaInterpolation guibg=#0b0b0b guifg=skyblue

" TagBar "

hi link TagbarSignature Passive
