" -----------------------------------------------------------------------------
" File: smpl.vim
" Description: A simple vim color scheme
" Author: Konstantin Kanellopoulos
" Source: https://github.com/ikaros/smpl
" -----------------------------------------------------------------------------

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='smpl'

hi Boolean             ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Character           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi ColorColumn         ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Comment             ctermfg=239   ctermbg=NONE  cterm=none
hi Conditional         ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Constant            ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi CursorColumn        ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Cursor              ctermfg=254   ctermbg=111   cterm=NONE
hi CursorLine          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Define              ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Directory           ctermfg=NONE  ctermbg=NONE  cterm=bold
hi ErrorMsg            ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Float               ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Folded              ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Function            ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Identifier          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi IncSearch           ctermfg=255   ctermbg=33    cterm=NONE
hi Keyword             ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Label               ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi LineNr              ctermfg=grey  ctermbg=NONE  cterm=NONE
hi MatchParen          ctermfg=NONE  ctermbg=NONE  cterm=reverse,bold
hi NonText             ctermfg=254   ctermbg=NONE  cterm=NONE
hi Normal              ctermfg=235   ctermbg=254   cterm=none
hi Number              ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Operator            ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Pmenu               ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Pmenu               ctermfg=NONE  ctermbg=NONE  cterm=reverse
hi PmenuSel            ctermfg=NONE  ctermbg=NONE  cterm=bold
hi PmenuSel            ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi PreProc             ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Repeat              ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Search              ctermfg=255   ctermbg=240   cterm=NONE
hi SignColumn          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Special             ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi SpecialKey          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Statement           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi StatusLine          ctermfg=188   ctermbg=235   cterm=NONE
hi StatusLineNC        ctermfg=188   ctermbg=239   cterm=NONE
hi StorageClass        ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi String              ctermfg=239   ctermbg=NONE  cterm=none
hi Tag                 ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Title               ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Todo                ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Type                ctermfg=NONE  ctermbg=NONE  cterm=bold
hi Underlined          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi VertSplit           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Visual              ctermfg=NONE  ctermbg=NONE  cterm=reverse
hi WarningMsg          ctermfg=124   ctermbg=NONE  cterm=NONE

" Go {{{
hi goBuiltins         ctermfg=25    ctermbg=NONE  cterm=NONE
hi goComment          ctermfg=239   ctermbg=NONE  cterm=NONE
hi goComplexes        ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goConditional      ctermfg=NONE  ctermbg=NONE  cterm=bold
hi goDeclaration      ctermfg=25    ctermbg=NONE  cterm=bold
hi goDirective        ctermfg=25    ctermbg=NONE  cterm=bold
hi goExtraType        ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goFloats           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goFormatSpecifier  ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goFunction         ctermfg=NONE  ctermbg=NONE  cterm=bold
hi goLabel            ctermfg=239   ctermbg=NONE  cterm=bold
hi goMethod           ctermfg=NONE   ctermbg=NONE cterm=bold
hi goRepeat           ctermfg=NONE  ctermbg=NONE  cterm=bold
hi goSignedInts       ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goStatement        ctermfg=NONE  ctermbg=NONE  cterm=bold
hi goString           ctermfg=239   ctermbg=NONE  cterm=NONE
hi goStruct           ctermfg=239   ctermbg=NONE  cterm=bold
hi goStructDef        ctermfg=NONE  ctermbg=NONE  cterm=bold
hi goType             ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi goUnsignedInts     ctermfg=NONE  ctermbg=NONE  cterm=NONE

hi godocConstBlock  ctermfg=25    ctermbg=NONE  cterm=NONE
hi godocConst       ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi godocFunction    ctermfg=NONE  ctermbg=NONE  cterm=bold
hi godocMethod      ctermfg=NONE  ctermbg=NONE  cterm=bold
hi godocMethodRec   ctermfg=25    ctermbg=NONE  cterm=bold
hi godocTitle       ctermfg=25    ctermbg=NONE  cterm=bold
hi godocType        ctermfg=25    ctermbg=NONE  cterm=bold
hi godocVarBlock    ctermfg=25    ctermbg=NONE  cterm=NONE
hi godocVar         ctermfg=25    ctermbg=NONE  cterm=NONE
"}}}

" Ruby {{{
hi rubyClass                   ctermfg=124   ctermbg=NONE  cterm=bold
hi rubyConditional             ctermfg=NONE  ctermbg=NONE  cterm=bold
hi rubyConstant                ctermfg=NONE  ctermbg=NONE  cterm=bold
hi rubyControl                 ctermfg=NONE  ctermbg=NONE  cterm=bold
hi rubyDefine                  ctermfg=124   ctermbg=NONE  cterm=bold
hi rubyExceptional             ctermfg=124   ctermbg=NONE  cterm=bold
hi rubyModule                  ctermfg=124   ctermbg=NONE  cterm=bold
hi rubyString                  ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyAccess                  ctermfg=124   ctermbg=NONE  cterm=NONE
hi rubyPredefinedVariable      ctermfg=232   ctermbg=NONE  cterm=bold
hi rubyInterpolation           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyInterpolationDelimiter  ctermfg=240   ctermbg=NONE  cterm=bold
hi rubySymbol                  ctermfg=240   ctermbg=NONE  cterm=bold
hi rubyBlockParameter          ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyBlockParameterList      ctermfg=NONE  ctermbg=NONE  cterm=bold
hi rubyRepeat                  ctermfg=NONE  ctermbg=NONE  cterm=bold
"}}}

" Markdown {{{
hi  markdownH1          ctermfg=235   ctermbg=NONE  cterm=bold
hi  markdownH2          ctermfg=237   ctermbg=NONE  cterm=bold
hi  markdownH3          ctermfg=238   ctermbg=NONE  cterm=bold
hi  markdownH3          ctermfg=239   ctermbg=NONE  cterm=bold
hi  markdownH5          ctermfg=240   ctermbg=NONE  cterm=bold
hi  markdownH6          ctermfg=241   ctermbg=NONE  cterm=bold
hi  markdownListMarker  ctermfg=NONE  ctermbg=NONE  cterm=NONE
"}}}

" Javascript {{{

" Basic {{{
hi javascriptFunction     ctermfg=136   ctermbg=NONE  cterm=bold
hi javaScriptIdentifier   ctermfg=136   ctermbg=NONE  cterm=NONE
hi javaScriptRepeat       ctermfg=NONE  ctermbg=NONE  cterm=bold
hi javascriptConditional  ctermfg=NONE  ctermbg=NONE  cterm=bold
hi javascriptStatement    ctermfg=NONE  ctermbg=NONE  cterm=bold
"}}}

" github.com/pangloss/vim-javascript {{{
hi  jsAsyncKeyword    ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsBraces          ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsClass           ctermfg=136   ctermbg=NONE  cterm=bold
hi  jsConditional     ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsDocType         ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi  jsDocTypeNoParam  ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi  jsException       ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsFuncBraces      ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsFuncCall        ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsFunction        ctermfg=136   ctermbg=NONE  cterm=bold
hi  jsKeyword         ctermfg=239   ctermbg=NONE  cterm=bold
hi  jsLabel           ctermfg=239   ctermbg=NONE  cterm=bold
hi  jsParens          ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsRepeat          ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsReturn          ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsStatement       ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  jsStorageClass    ctermfg=136   ctermbg=NONE  cterm=NONE
"}}}
"}}}

" c {{{
hi  cConditional   ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cConstant      ctermfg=239   ctermbg=NONE  cterm=bold
hi  cFunction      ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cInclude       ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cLabel         ctermfg=239   ctermbg=NONE  cterm=bold
hi  cPreCondit     ctermfg=25    ctermbg=NONE  cterm=bold
hi  cRepeat        ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cStatement     ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cStorageClass  ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi  cType          ctermfg=25    ctermbg=NONE  cterm=NONE
hi  cDefine        ctermfg=NONE  ctermbg=NONE  cterm=bold
hi  cStructure     ctermfg=NONE  ctermbg=NONE  cterm=bold
"}}}

" HTML {{{
hi  htmlSpecialTagName  ctermfg=166  ctermbg=NONE  cterm=bold
hi  htmlTagName         ctermfg=166  ctermbg=NONE  cterm=bold
hi  htmlTagN            ctermfg=166  ctermbg=NONE  cterm=bold
"}}}

" Scala {{{
hi scalaKeyword                 ctermfg=88    ctermbg=NONE  cterm=bold
hi scalaInstanceDeclaration     ctermfg=NONE  ctermbg=NONE  cterm=bold
hi scalaTypeDeclaration         ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi scalaSquareBracketsBrackets  ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi scalaDocLinks                ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi scalaKeywordModifier         ctermfg=88    ctermbg=NONE  cterm=NONE
hi scalaNameDefinition          ctermfg=NONE  ctermbg=NONE  cterm=bold
hi scalaInstanceDeclaration     ctermfg=NONE  ctermbg=NONE  cterm=NONE
"}}}

" vim:foldmethod=marker:foldlevel=2
