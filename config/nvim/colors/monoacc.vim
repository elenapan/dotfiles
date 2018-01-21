" This is my minimal vim colorscheme for Python and Go. Make sure Go type and function highlight is enabled in Go:
" let g:go_highlight_functions = 1
" let g:go_highlight_types = 1

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "monoacc"


set t_ZH=[3m
set t_ZR=[23m

hi Normal ctermfg=252 ctermbg=235 cterm=NONE

" Python specific

hi link pythonDoctest   Normal
hi pythonComment ctermfg=240 ctermbg=NONE cterm=italic

hi pythonStatement ctermfg=252 ctermbg=NONE cterm=bold
hi link pythonInclude     pythonStatement
hi link pythonBuiltin     pythonStatement
hi link pythonConditional pythonStatement
hi link pythonOperator    pythonStatement
hi link pythonException   pythonStatement
hi link pythonExceptions  pythonStatement
hi link pythonRepeat      pythonStatement
hi link pythonDecorator   pythonStatement

hi pythonTodo ctermfg=105 ctermbg=None cterm=bold

hi pythonFunction ctermfg=105 ctermbg=NONE cterm=NONE
hi link pythonTodo      pythonFunction
hi link pythonEscape    pythonFunction
hi link pythonNumber    pythonFunction

hi pythonSpaceError ctermfg=105 ctermbg=NONE cterm=NONE

hi pythonString ctermfg=248 ctermbg=NONE cterm=italic
hi link pythonRawString pythonString

" Go specific
hi link goComment pythonComment
hi link goCommentGroup goComment
hi link goPackageComment goComment
hi goTodo ctermfg=240 ctermbg=105 cterm=bold

hi link goDirective pythonStatement
hi link goDeclaration goDirective
hi link goDeclType goDirective
hi link goStatement goDirective
hi link goConditional goDirective
hi link goLabel goDirective
hi link goRepeat goDirective
hi link goType goDirective
hi link goTypeDecl goType
hi link goSignedInts goDirective
hi link goUnsignedInts goDirective
hi link goFloats goDirective
hi link goComplexes goDirective
hi link goBuiltins goDirective
hi link goBoolean goDirective

hi link goExtraType Normal
hi link goMethod Normal
hi link goStruct Normal
hi link goInterface Normal

hi link goTypeName pythonFunction
hi link goTypeConstructor Normal

hi link goReceiver Normal
hi link goReceiverType pythonFunction
hi link goFunction pythonFunction
hi link goFunctionCall Normal
hi link goStructDef pythonFunction
hi link goInterfaceDef pythonFunction
hi link goOperator goFunction

hi link goImaginary goFunction
hi link goFloat goFunction
hi link goDecimalInt goFunction
hi link goHexadecimalInt pythonFunction
hi link goOctalInt pythonFunction
hi link goOctalError goTodo

hi link goString pythonString
hi link goRawString goString
hi goFormatSpecifier ctermfg=248 ctermbg=None cterm=bold
hi link goSpecialString goFormatSpecifier
hi link goEscapeError goTodo
hi link goSpaceError goTodo

hi link goBuildCommentStart goFunction
hi link goBuildKeyword goFunction
hi goBuildDirectives ctermfg=240 ctermbg=None cterm=bold



" Syntastic

hi SyntasticError ctermfg=NONE ctermbg=NONE cterm=underline
hi SyntasticWarning ctermfg=NONE ctermbg=NONE cterm=underline
hi SyntasticErrorSign ctermfg=226 ctermbg=NONE cterm=NONE
hi SyntasticWarningSign ctermfg=240 ctermbg=NONE cterm=NONE

" Vim

hi ColorColumn ctermfg=None ctermbg=236 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE
hi Folded ctermfg=248 ctermbg=237 cterm=italic
hi SpecialKey ctermfg=237 ctermbg=NONE cterm=NONE
hi NonText ctermfg=237 ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=234 ctermbg=234 cterm=NONE
hi SignColumn ctermfg=234 ctermbg=235 cterm=NONE
hi MatchParen ctermfg=NONE ctermbg=105 cterm=NONE
hi Search ctermfg=226 ctermbg=NONE cterm=NONE
hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
hi Visual ctermfg=NONE ctermbg=233 cterm=NONE
hi LineNr ctermfg=240 ctermbg=NONE cterm=italic
hi CursorLineNR ctermfg=240 ctermbg=236 cterm=italic
hi Pmenu ctermfg=NONE ctermbg=234 cterm=NONE
hi PmenuSel ctermfg=234 ctermbg=105 cterm=NONE
