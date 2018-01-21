" Vim color file
" Name: eva01
" Author: hachy
" License: MIT

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "eva01"

" General colors"{{{
hi Normal ctermfg=252 ctermbg=NONE cterm=NONE guifg=#D0D0D0 guibg=#1C1C1C gui=NONE
hi NonText ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi Directory ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
hi LineNr ctermfg=240 ctermbg=233 cterm=NONE guifg=#585858 guibg=#121212 gui=NONE
hi Title ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
hi Visual ctermfg=119 ctermbg=97 cterm=bold guifg=#87FF5F guibg=#875FAF gui=bold
hi SpecialKey ctermfg=97 ctermbg=NONE cterm=NONE guifg=#875FAF guibg=NONE gui=NONE
hi MatchParen ctermfg=15 ctermbg=240 cterm=bold guifg=#FFFFFF guibg=#585858 gui=bold
hi Cursor ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#87FF5F gui=NONE
hi CursorIM ctermfg=NONE ctermbg=168 cterm=NONE guifg=NONE guibg=#D75F87 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
hi CursorLineNr ctermfg=102 ctermbg=233 cterm=bold guifg=#878787 guibg=#121212 gui=bold
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
hi Search ctermfg=16 ctermbg=147 cterm=bold guifg=#000000 guibg=#AFAFFF gui=bold
hi IncSearch ctermfg=16 ctermbg=119 cterm=bold guifg=#000000 guibg=#87FF5F gui=bold
hi ErrorMsg ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
hi WarningMsg ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
hi ModeMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#87FF5F guibg=NONE gui=bold
hi MoreMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#87FF5F guibg=NONE gui=bold
hi Question ctermfg=119 ctermbg=NONE cterm=underline guifg=#87FF5F guibg=NONE gui=underline
hi TabLine ctermfg=102 ctermbg=235 cterm=NONE guifg=#878787 guibg=#262626 gui=NONE
hi TabLineFill ctermfg=102 ctermbg=235 cterm=NONE guifg=#878787 guibg=#262626 gui=NONE
hi TabLineSel ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
hi StatusLine ctermfg=135 ctermbg=233 cterm=NONE guifg=#AF5FFF guibg=#121212 gui=NONE
hi StatusLineNC ctermfg=240 ctermbg=233 cterm=NONE guifg=#585858 guibg=#121212 gui=NONE
hi VertSplit ctermfg=97 ctermbg=NONE cterm=NONE guifg=#875FAF guibg=NONE gui=NONE
hi WildMenu ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi Folded ctermfg=97 ctermbg=235 cterm=bold guifg=#875FAF guibg=#262626 gui=bold
hi FoldColumn ctermfg=97 ctermbg=NONE cterm=bold guifg=#875FAF guibg=NONE gui=bold
hi ColorColumn ctermfg=NONE ctermbg=97 cterm=NONE guifg=NONE guibg=#875FAF gui=NONE
hi SignColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
hi Conceal ctermfg=119 ctermbg=NONE cterm=NONE guifg=#87FF5F guibg=NONE gui=NONE
hi SpellBad ctermfg=168 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D75F87
hi SpellCap ctermfg=168 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D75F87
hi SpellRare ctermfg=168 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D75F87
hi SpellLocal ctermfg=168 ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=undercurl guisp=#D75F87
hi DiffAdd ctermfg=234 ctermbg=156 cterm=NONE guifg=#1C1C1C guibg=#AFFF87 gui=NONE
hi DiffChange ctermfg=234 ctermbg=175 cterm=NONE guifg=#1C1C1C guibg=#D787AF gui=NONE
hi DiffDelete ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
hi DiffText ctermfg=234 ctermbg=168 cterm=bold guifg=#1C1C1C guibg=#D75F87 gui=bold
hi Pmenu ctermfg=119 ctermbg=16 cterm=NONE guifg=#87FF5F guibg=#000000 gui=NONE
hi PmenuSel ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#87FF5F gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=119 cterm=NONE guifg=NONE guibg=#87FF5F gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#878787 guibg=NONE gui=italic
hi Constant ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
hi String ctermfg=151 ctermbg=NONE cterm=NONE guifg=#AFD7AF guibg=NONE gui=NONE
hi Number ctermfg=179 ctermbg=NONE cterm=NONE guifg=#D7AF5F guibg=NONE gui=NONE
hi PreProc ctermfg=135 ctermbg=NONE cterm=NONE guifg=#AF5FFF guibg=NONE gui=NONE
hi Identifier ctermfg=147 ctermbg=NONE cterm=NONE guifg=#AFAFFF guibg=NONE gui=NONE
hi Statement ctermfg=171 ctermbg=NONE cterm=NONE guifg=#D75FFF guibg=NONE gui=NONE
hi Type ctermfg=156 ctermbg=NONE cterm=NONE guifg=#AFFF87 guibg=NONE gui=NONE
hi Special ctermfg=179 ctermbg=NONE cterm=NONE guifg=#D7AF5F guibg=NONE gui=NONE
hi Underlined ctermfg=119 ctermbg=NONE cterm=underline guifg=#87FF5F guibg=NONE gui=underline
hi Error ctermfg=168 ctermbg=NONE cterm=underline guifg=#D75F87 guibg=NONE gui=underline
hi Todo ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
"hi Ignore
hi link Character Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Operator Statement
hi link Keyword Statement
hi link Label Statement
hi link Exception Statement
hi link Include Preproc
hi link Define Preproc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
"}}}
" HTML"{{{
hi link htmlTag Statement
hi link htmlTagName Constant
hi link htmlEndTag Statement
hi link htmlSpecialTagName Number
hi link htmlArg Statement
hi link javaScript Normal
hi htmlItalic ctermfg=252 ctermbg=NONE cterm=NONE
"}}}
" XML"{{{
hi link xmlEndTag Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier Type
hi link javaScriptDOMMethods Normal
hi link javaScriptDOMProperties Normal
hi link javaScriptNumber Number
hi link javaScriptParens Preproc
hi link javaScriptFuncArg Normal
hi javaScriptFuncDef ctermfg=168 ctermbg=NONE cterm=NONE guifg=#D75F87 guibg=NONE gui=NONE
"}}}
" Ruby"{{{
hi rubyRegexp ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
hi rubyRegexpDelimiter ctermfg=168 ctermbg=NONE cterm=bold guifg=#D75F87 guibg=NONE gui=bold
hi rubyIdentifier ctermfg=252 ctermbg=NONE cterm=bold guifg=#D0D0D0 guibg=NONE gui=bold
hi link rubyAccess Special
hi link rubyConstant Constant
hi link rubyFunction Constant
hi link rubyKeyword Number
hi link rubySymbol Identifier
hi link rubyClassVariable Identifier
hi link rubyInstanceVariable Identifier
hi link rubyBlockParameter Normal
hi link rubyBoolean Normal
hi link rubyPseudoVariable Constant
hi link rubyPredefinedVariable Type
"}}}
" eruby"{{{
hi link erubyDelimiter Special
"}}}
" Python"{{{
hi link pythonFunction Constant
"}}}
" CoffeeScript"{{{
hi link coffeeBlock Preproc
hi link coffeeSpecialIdent Normal
hi link coffeeObject Constant
" hi link coffeeSpecialIdent Number
"}}}
" php"{{{
hi link phpParent Normal
"}}}
" Markdown"{{{
hi markdownH3 ctermfg=135 ctermbg=NONE cterm=bold guifg=#AF5FFF guibg=NONE gui=bold
hi markdownH4 ctermfg=135 ctermbg=NONE cterm=bold guifg=#AF5FFF guibg=NONE gui=bold
hi markdownH5 ctermfg=135 ctermbg=NONE cterm=bold guifg=#AF5FFF guibg=NONE gui=bold
hi markdownH6 ctermfg=135 ctermbg=NONE cterm=bold guifg=#AF5FFF guibg=NONE gui=bold
"}}}
