" Vim color scheme
"
" Name:         mac_classic.vim
" Maintainer:   Drew Neil <andrew.jr.neil@gmail.com>
" License:      public domain
" Version:      0.1

" Boilerplate: {{{1
set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mac_classic"


" Colors: {{{1
" TODO figure out how to not highlight TODO
"
" #000000
" #3C4C72 - BLUE/GREY - cursor, rails helpers
" #0000A2 - D.BLUE - numbers & function names
" #1E39F6 - BLUE
" #0066FF - L.BLUE - Comments, TODOs and folds
" #6E79F1 - L.PURPLE - Booleans, Ruby Constants & CSS definitions
" #318495 - BLUE/GREEN - Ruby instance/global/pseudo variables
" #007B22 - D.GREEN - Strings, Labels and code blocks in Markdown
" #00BC41 - L.GREEN - CSS common attributes & ruby interpolation
" #990000 - BURGUNDY - Errors and Warnings
" #D51015 - RED for constants, symbols, numbers
" #E18AC7 - PINK RegularExpressions in Ruby
" #FFCE77 - ORANGE - Incremental Search
" #FFE6BB - L.ORANGE - Search
" #C6DEFF - VL.BLUE Visual, Current StatusLine & AutoComplete selection
" #808080 - Line numbers
" #CFCFCF - VerticalSplit separator
" #DFDFDF - Invisible Characters
" #EFEFEF - LineNumber & Non-Current StatusLine
" #F0F6FF - CursorLine & CursorColumn
" #FFFFFF - WHITE
" }}}

" GUI: {{{1
hi Cursor  guifg=#FFFFFF ctermfg=15 guibg=#3C4C72 ctermbg=240
hi Visual  guibg=#C6DEFF ctermbg=189
hi CursorLine  guibg=#F0F6FF ctermbg=15
hi CursorColumn  guibg=#F0F6FF ctermbg=15
hi LineNr  guifg=#808080 ctermfg=244 guibg=#EFEFEF ctermbg=7
hi VertSplit  guifg=#FFFFFF ctermfg=15 guibg=#CFCFCF ctermbg=252 gui=NONE
hi MatchParen  guifg=#1E39F6 ctermfg=27 guibg=NONE gui=bold
hi Pmenu guibg=#EFEFEF ctermbg=7
hi PmenuSel  guibg=#C6DEFF ctermbg=189
hi Directory  guifg=#D51015 ctermfg=160 gui=bold
hi Folded  guifg=#0066FF ctermfg=27 guibg=#FFFFFF ctermbg=15
" StatusLine: {{{2
hi StatusLine  guifg=#000000 ctermfg=0 guibg=#C6DEFF ctermbg=189 gui=italic
hi StatusLineNC  guifg=#000000 ctermfg=0 guibg=#EFEFEF ctermbg=7 gui=NONE

" Search: {{{2
" [IncSearch is stronger than Search]
hi IncSearch  guifg=NONE guibg=#FFCE77 ctermbg=222 gui=NONE
hi Search  guibg=#FFE6BB ctermbg=223

" Syntax: {{{1
hi Normal  guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=15
hi Boolean  guifg=#6E79F1 ctermfg=69 gui=bold
hi Character  guifg=#D51015 ctermfg=160 gui=bold
hi Comment  guifg=#0066FF ctermfg=27 gui=italic
hi Conditional  guifg=#1E39F6 ctermfg=27 gui=bold
hi Constant  guifg=#D51015 ctermfg=160 gui=bold
hi Define  guifg=#1E39F6 ctermfg=27 gui=bold
hi ErrorMsg  guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88
hi WarningMsg  guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88
hi Float  guifg=#0000A2 ctermfg=19
hi Function  guifg=#0000A2 ctermfg=19 gui=bold
hi Identifier  guifg=#1E39F6 ctermfg=27 gui=bold
hi Keyword  guifg=#1E39F6 ctermfg=27 gui=bold
hi Label  guifg=#007B22 ctermfg=28
hi Number  guifg=#0000A2 ctermfg=19
hi Operator  guifg=#1E39F6 ctermfg=27 gui=bold
hi PreProc  guifg=#1E39F6 ctermfg=27 gui=bold
hi Special  guifg=#000000 ctermfg=0
hi Statement  guifg=#1E39F6 ctermfg=27 gui=bold
hi StorageClass  guifg=#1E39F6 ctermfg=27 gui=bold
hi String  guifg=#007B22 ctermfg=28
hi Title  guifg=#000000 ctermfg=0 gui=bold
hi Todo  guifg=#0066FF ctermfg=27 gui=inverse,bold,italic
hi Underlined  gui=underline

" Invisible character colors
hi NonText  guifg=#DFDFDF ctermfg=253 guibg=#FFFFFF ctermbg=15
hi SpecialKey  guifg=#DFDFDF ctermfg=253 guibg=#FFFFFF ctermbg=15

" Diff styles {{{1
hi diffAdded guifg=#007B22 guibg=#FFFFFF ctermfg=28 ctermbg=15
hi diffRemoved guifg=#D51015 guibg=#FFFFFF ctermfg=160 ctermbg=15
hi diffFile guifg=#6E79F1 guibg=#FFFFFF ctermfg=69 ctermbg=15
hi diffNewFile guifg=#6E79F1 guibg=#FFFFFF ctermfg=69 ctermbg=15
hi diffLine guifg=#000000 guibg=#FFFFFF ctermfg=0 ctermbg=15

hi diffAdd guifg=#007B22 guibg=#FFFFFF ctermfg=28 ctermbg=15
hi diffChange guifg=#007B22 guibg=#FFFFFF ctermfg=28 ctermbg=15
hi diffText guifg=#007B22 guibg=#FFFFFF ctermfg=28 ctermbg=15
hi link diffDelete diffRemoved
" Git styles {{{1
hi gitcommitFirstLine guifg=#000000 guibg=#FFFFFF ctermfg=0 ctermbg=15
hi gitcommitSelectedType guifg=#007B22 guibg=#FFFFFF ctermfg=28 ctermbg=15
hi link gitcommitSelectedFile gitcommitSelectedType
hi gitcommitDiscardedType guifg=#D51015 guibg=#FFFFFF ctermfg=160 ctermbg=15
hi link gitcommitDiscardedFile gitcommitDiscardedType
hi gitcommitUntrackedFile guifg=#6E79F1 guibg=#FFFFFF ctermfg=69 ctermbg=15
" Ruby styles {{{1
hi rubyClass  guifg=#1E39F6 ctermfg=27 gui=bold
hi rubyFunction  guifg=#0000A2 ctermfg=19 gui=bold
hi rubyInterpolationDelimiter  guifg=#00BC41 ctermfg=35
hi rubyInterpolation  guifg=#00BC41 ctermfg=35
hi rubySymbol  guifg=#D51015 ctermfg=160 gui=bold
hi rubyConstant  guifg=#6E79F1 ctermfg=69 gui=bold
hi rubyStringDelimiter  guifg=#007B22 ctermfg=28
hi rubyInstanceVariable  guifg=#318495 ctermfg=66
hi rubyInclude  guifg=#1E39F6 ctermfg=27 gui=bold
hi rubyGlobalVariable  guifg=#318495 ctermfg=66
hi rubyRegexp  guifg=#E18AC7 ctermfg=176
hi rubyRegexpAnchor  guifg=#E18AC7 ctermfg=176
hi rubyRegexpQuantifier  guifg=#E18AC7 ctermfg=176
hi rubyRegexpParens  guifg=#E18AC7 ctermfg=176
hi rubyRegexpEscape  guifg=#00BC41 ctermfg=35
hi rubyRegexpCharClass  guifg=#00BC41 ctermfg=35
hi rubyRegexpDelimiter  guifg=#E18AC7 ctermfg=176
hi rubyEscape  guifg=#00BC41 ctermfg=35
hi rubyControl  guifg=#1E39F6 ctermfg=27 gui=bold
hi rubyOperator  guifg=#1E39F6 ctermfg=27 gui=bold
hi rubyException  guifg=#1E39F6 ctermfg=27 gui=bold
hi rubyPseudoVariable  guifg=#318495 ctermfg=66
hi rubyRailsUserClass  guifg=#6E79F1 ctermfg=69 gui=bold
hi rubyRailsARAssociationMethod  guifg=#3C4C72 ctermfg=240 gui=bold
hi rubyRailsARMethod  guifg=#3C4C72 ctermfg=240 gui=bold
hi rubyRailsRenderMethod  guifg=#3C4C72 ctermfg=240 gui=bold
hi rubyRailsMethod  guifg=#3C4C72 ctermfg=240 gui=bold
hi link erubyComment Comment
hi erubyRailsMethod  guifg=#3C4C72 ctermfg=240 gui=bold

" XML: {{{1
hi link xmlEndTag xmlTag
" HTML: {{{1
hi htmlTag  guifg=#1E39F6 ctermfg=27
hi link htmlEndTag htmlTag
hi link htmlTagName htmlTag
hi link htmlArg htmlTag
hi htmlSpecialChar  guifg=#D51015 ctermfg=160 gui=bold
hi htmlH1 gui=bold
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1

" JavaScript: {{{1
hi javaScriptFunction  guifg=#1E39F6 ctermfg=27 gui=bold
hi javaScriptFuncName  guifg=#318495 ctermfg=66 gui=italic
hi javaScriptLabel  guifg=#0000A2 ctermfg=19 gui=bold
hi javaScriptRailsFunction  guifg=#3C4C72 ctermfg=240 gui=bold
hi javaScriptType  guifg=#318495 ctermfg=66 gui=none
hi javaScriptArgument  guifg=#318495 ctermfg=66 gui=italic
hi javaScriptRegexpString  guifg=#E18AC7 ctermfg=176 gui=NONE
hi javaScriptSpecial  guifg=#00BC41 ctermfg=35 gui=NONE
" NOTE: Syntax Highlighting for javascript doesn't match the
" TextMate version very accurately, because the javascript
" syntax file does not create matches for some items. In
" particular:
" * javaScriptArgument - e.g. function(argument)
" * javaScriptFuncName for object literal style functions - e.g.: 
"     myFunction: function() { ... }

" YAML: {{{1
hi yamlAnchor  guifg=#318495 ctermfg=66
hi yamlAlias  guifg=#318495 ctermfg=66
hi yamlDocumentHeader  guibg=#F2F2F2 ctermbg=7

" CSS: {{{1
hi cssTagName  gui=bold
hi cssIdentifier  gui=italic
hi link cssClassName cssIdentifier
hi cssDefinition  guifg=#6E79F1 ctermfg=69
hi link cssRenderProp cssDefinition
hi link cssTextProp cssDefinition
hi link cssFontProp cssDefinition
hi link cssColorProp cssDefinition
hi link cssBoxProp cssDefinition
hi link cssGeneratedContentProp cssDefinition
hi link cssUIProp cssDefinition
hi cssCommonAttr  guifg=#00BC41 ctermfg=35
hi link cssAttr cssCommonAttr
hi link cssRenderAttr cssCommonAttr
hi link cssTextAttr cssCommonAttr
hi link cssFontAttr cssCommonAttr
hi link cssGeneratedContentAttr cssCommonAttr
hi cssURL  guifg=#007B22 ctermfg=28
hi cssFunctionName  guifg=#3C4C72 ctermfg=240 gui=bold
hi cssColor  guifg=#D51015 ctermfg=160 gui=bold
hi cssValueLength  guifg=#0000A2 ctermfg=19
hi cssImportant  guifg=#1E39F6 ctermfg=27 gui=bold

" Vimscript: {{{1
hi vimGroup  guifg=#007B22 ctermfg=28 gui=bold
hi link vimHiGroup vimGroup
hi vimCommentTitle  guifg=#3C4C72 ctermfg=240 gui=bold
hi helpSpecial guifg=#6E79F1 ctermfg=69

" Markdown: {{{1
hi markdownBold gui=bold
hi markdownItalic gui=italic
hi markdownCode  guifg=#007B22 ctermfg=28
hi link markdownCodeBlock markdownCode

" Outliner: {{{1
hi BT1 guifg=#808080 ctermfg=244 gui=italic
hi OL1 guifg=#000000 ctermfg=0 gui=bold
hi OL2 guifg=#0000A2 ctermfg=19 gui=bold
hi OL3 guifg=#007B22 ctermfg=28 gui=bold
hi OL4 guifg=#6E79F1 ctermfg=69 gui=NONE
" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
