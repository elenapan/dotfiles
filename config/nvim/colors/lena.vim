" lena.vim - Vim color scheme for 16-color terminals, heavily based on noctu
" elenapan @ github
" ------------------------------------------------------------------

" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "lena"

"}}}
" Vim UI {{{
hi Normal              ctermfg=7
hi Cursor              ctermfg=7     ctermbg=1
hi CursorLine          ctermbg=0     cterm=NONE
hi MatchParen          ctermfg=7     ctermbg=NONE  cterm=underline
hi Pmenu               ctermfg=15    ctermbg=0
hi PmenuThumb          ctermbg=7
hi PmenuSBar           ctermbg=8
hi PmenuSel            ctermfg=0     ctermbg=4
hi ColorColumn         ctermbg=0
hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=12    ctermbg=NONE  cterm=underline
hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline
hi NonText             ctermfg=8
hi LineNr              ctermfg=8     ctermbg=NONE  cterm=bold
hi CursorLineNr        ctermfg=14    ctermbg=NONE     cterm=bold
hi Visual              ctermfg=0     ctermbg=5
hi IncSearch           ctermfg=0     ctermbg=13    cterm=NONE
hi Search              ctermfg=0     ctermbg=14
hi StatusLine          ctermfg=5     ctermbg=0     cterm=NONE
hi StatusLineNC        ctermfg=8     ctermbg=0     cterm=bold
hi VertSplit           ctermfg=13    ctermbg=NONE     cterm=bold
hi TabLine             ctermfg=8     ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=7     ctermbg=0
hi Folded              ctermfg=4     ctermbg=0     cterm=bold,italic
hi Conceal             ctermfg=6     ctermbg=NONE
hi Directory           ctermfg=10    ctermbg=NONE  cterm=NONE
hi Title               ctermfg=11    ctermbg=NONE  cterm=bold
hi ErrorMsg            ctermfg=9     ctermbg=NONE     cterm=bold
hi DiffAdd             ctermfg=0     ctermbg=2
hi DiffChange          ctermfg=0     ctermbg=3
hi DiffDelete          ctermfg=0     ctermbg=1
hi DiffText            ctermfg=0     ctermbg=11    cterm=bold
hi User1               ctermfg=1     ctermbg=0
hi User2               ctermfg=2     ctermbg=0
hi User3               ctermfg=4     ctermbg=0
hi User4               ctermfg=3     ctermbg=0
hi User5               ctermfg=5     ctermbg=0
hi User6               ctermfg=6     ctermbg=0
hi User7               ctermfg=7     ctermbg=0
hi User8               ctermfg=8     ctermbg=0
hi User9               ctermfg=15    ctermbg=5
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

"}}}
" Generic syntax {{{
hi Delimiter       ctermfg=7
hi Comment         ctermfg=8   cterm=bold
hi Underlined      ctermfg=2   cterm=underline
hi Type            ctermfg=2
hi String          ctermfg=1  cterm=bold
hi Keyword         ctermfg=4
hi Todo            ctermfg=11  ctermbg=NONE     cterm=bold,underline
hi Urgent          ctermfg=1   ctermbg=NONE     cterm=bold,underline
hi Done            ctermfg=4   ctermbg=NONE     cterm=bold,underline
hi Function        ctermfg=2
hi Identifier      ctermfg=7   cterm=NONE
hi Statement       ctermfg=4   cterm=bold
hi Constant        ctermfg=13
hi Number          ctermfg=10
hi Boolean         ctermfg=2
hi Special         ctermfg=13
hi Ignore          ctermfg=0
hi PreProc         ctermfg=8   cterm=bold
hi Operator        ctermfg=5   cterm=bold
" hi! link Operator  Delimiter
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              ctermfg=4
hi htmlTag                  ctermfg=4
hi htmlArg                  ctermfg=12
hi htmlH1                   cterm=bold
hi htmlBold                 cterm=bold
hi htmlItalic               cterm=underline
hi htmlUnderline            cterm=underline
hi htmlBoldItalic           cterm=bold,underline
hi htmlBoldUnderline        cterm=bold,underline
hi htmlUnderlineItalic      cterm=underline
hi htmlBoldUnderlineItalic  cterm=bold,underline
hi! link htmlLink           Underlined
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       ctermfg=2
hi xmlTag           ctermfg=10
hi! link xmlString  xmlTagName
hi! link xmlAttrib  xmlTag
hi! link xmlEndTag  xmlTag
hi! link xmlEqual   xmlTag

"}}}
" JavaScript {{{
hi! link javaScript        Normal
hi! link javaScriptBraces  Delimiter

"}}}
" PHP {{{
hi phpSpecialFunction    ctermfg=5
hi phpIdentifier         ctermfg=11
hi phpParent             ctermfg=8
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Markdown {{{
hi markdownHeadingRule          ctermfg=3
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi markdownLinkDelimiter    ctermfg=15 ctermbg=NONE cterm=NONE
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi markdownLinkText         ctermfg=2 ctermbg=NONE cterm=bold,underline
hi! link markdownUrl                markdownLinkText
hi! link markdownUrlTitleDelimiter  markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownIdDeclaration      markdownLinkText
hi markdownCode                     ctermfg=4 ctermbg=NONE cterm=NONE
hi! link markdownCodeBlock          String
hi! link markdownCodeBlock markdownCode
hi! link markdownCodeDelimiter markdownCode
hi markdownBold                     ctermfg=5 ctermbg=NONE cterm=bold
hi markdownItalic                   ctermfg=5 ctermbg=NONE cterm=italic
hi markdownBlockquote               ctermfg=15 ctermbg=NONE cterm=italic,bold
hi markdownRule                     ctermfg=15 ctermbg=NONE cterm=italic,bold

hi markdownH1 ctermfg=3 ctermbg=NONE cterm=bold
hi markdownH2 ctermfg=3 ctermbg=NONE cterm=bold
hi markdownH3 ctermfg=2 ctermbg=NONE cterm=bold
hi markdownH4 ctermfg=2 ctermbg=NONE cterm=bold
hi markdownH5 ctermfg=2 ctermbg=NONE cterm=NONE
hi markdownH6 ctermfg=2 ctermbg=NONE cterm=NONE

hi markdownListMarker ctermfg=6 ctermbg=NONE cterm=bold
hi markdownOrderedListMarker ctermfg=3 ctermbg=NONE cterm=bold

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               ctermfg=3
hi gitCommitSelectedType         ctermfg=12
hi gitCommitSelectedFile         ctermfg=4
hi gitCommitUnmergedType         ctermfg=9
hi gitCommitUnmergedFile         ctermfg=1
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vim {{{
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant

"}}}
" LESS {{{
hi lessVariable             ctermfg=11
hi! link lessVariableValue  Normal

"}}}
" NERDTree {{{
hi! link NERDTreeHelp      Comment
hi! link NERDTreeExecFile  String

"}}}
" Vimwiki {{{
hi! link VimwikiBold markdownBold
hi! link VimwikiItalic markdownItalic
hi! link VimwikiBoldChar markdownBold
hi! link VimwikiItalicChar markdownItalic
hi! link VimwikiBoldCharT   VimwikiBoldChar
hi! link VimwikiItalicCharT   VimwikiItalicChar
hi VimwikiBoldItalicChar ctermfg=6 ctermbg=NONE cterm=italic,bold
hi! link VimwikiItalicBoldChar VimwikiBoldItalicChar
hi! link VimwikiBoldItalicCharT VimwikiBoldItalicChar
hi! link VimwikiItalicBoldCharT VimwikiBoldItalicChar
" VimwikiEqInChar xxx links to VimwikiMarkers
" VimwikiDelTextChar xxx links to VimwikiMarkers
" VimwikiEqInCharT xxx links to VimwikiMarkers
" VimwikiCodeCharT xxx links to VimwikiMarkers
" VimwikiDelTextCharT xxx links to VimwikiMarkers
hi! link VimwikiHeaderChar  markdownHeadingDelimiter
hi! link VimwikiList        markdownListMarker
hi! link VimwikiCode        markdownCode
hi! link VimwikiCodeChar    markdownCodeDelimiter
hi! link VimwikiHeader1     markdownH1
hi! link VimwikiHeader2     markdownH2
hi! link VimwikiHeader3     markdownH3
hi! link VimwikiHeader4     markdownH4
hi! link VimwikiHeader5     markdownH5
hi! link VimwikiHeader6     markdownH6

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}
" CtrlP {{{
hi CtrlPMatch   ctermfg=1   cterm=bold
hi CtrlPLinePre ctermfg=6 cterm=bold

"}}}
" Mustache {{{
hi mustacheSection           ctermfg=14  cterm=bold
hi mustacheMarker            ctermfg=6
hi mustacheVariable          ctermfg=14
hi mustacheVariableUnescape  ctermfg=9
hi mustachePartial           ctermfg=13

"}}}
" Shell {{{
hi shDerefSimple     ctermfg=11
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       ctermfg=3  ctermbg=NONE
hi SyntasticErrorSign         ctermfg=1  ctermbg=NONE
hi SyntasticStyleWarningSign  ctermfg=4  ctermbg=NONE
hi SyntasticStyleErrorSign    ctermfg=2  ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       ctermfg=9
hi netrwClassify  ctermfg=8  cterm=bold

"}}}
" Ledger {{{
hi ledgerAccount  ctermfg=11
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  ctermfg=4
hi diffRemoved  ctermfg=1
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  ctermfg=3

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}

" vim: fdm=marker:sw=2:sts=2:et
