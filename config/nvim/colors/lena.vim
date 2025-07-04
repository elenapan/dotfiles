" lena.vim - Vim color scheme based on noctu
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
hi Normal              guifg=#f4f3ee     guibg=#101319
hi Cursor              guifg=#f4f3ee     guibg=#E34F4F
hi CursorLine          guibg=#171b24     gui=none
hi MatchParen          guifg=#f4f3ee     guibg=#101319  gui=underline
hi Pmenu               guifg=#DDDBCF    guibg=#171b24
hi PmenuThumb          guibg=#f4f3ee
hi PmenuSBar           guibg=#3A435A
" For some reason, after an update bg and fg on this one are inverted
hi PmenuSel            guibg=#171b24     guifg=#956dca
hi ColorColumn         guibg=#171b24
hi SpellBad            guifg=#E34F4F     guibg=none  gui=underline
hi SpellCap            guifg=#56B7C8    guibg=none  gui=underline
hi SpellRare           guifg=#5679E3    guibg=none  gui=underline
hi SpellLocal          guifg=#885AC4    guibg=none  gui=underline
hi NonText             guifg=#3A435A
hi LineNr              guifg=#3A435A     guibg=#101319 gui=bold
hi CursorLineNr        guifg=#5679E3    guibg=#171b24 gui=bold
hi Visual              guifg=#171b24     guibg=#956dca
hi IncSearch           guifg=#171b24     guibg=#885AC4    gui=none
hi Search              guifg=#171b24     guibg=#DE642B
hi WinSeparator        guifg=#171b24     guibg=#101319  gui=bold
hi EndOfBuffer         guifg=#3A435A     guibg=none  gui=bold
hi Folded              guifg=#DE642B     guibg=#101319  gui=bold
hi Conceal             guifg=#DE642B     guibg=#101319
hi Directory           guifg=#3E66E0    guibg=#101319  gui=none
hi Title               guifg=#5679E3    guibg=#101319  gui=bold
hi ErrorMsg            guifg=#DE2B2B     guibg=#101319  gui=bold
hi DiffAdd             guifg=#171b24     guibg=#69bfce
hi DiffChange          guifg=#171b24     guibg=#5599E2
hi DiffDelete          guifg=#171b24     guibg=#E34F4F
hi DiffText            guifg=#171b24     guibg=#5679E3    gui=bold
hi User1               guifg=#E34F4F     guibg=#171b24
hi User2               guifg=#3F8CDE     guibg=#171b24
hi User3               guifg=#5599E2     guibg=#171b24
hi User4               guifg=#69bfce     guibg=#171b24
hi User5               guifg=#956dca     guibg=#171b24
hi User6               guifg=#DE642B     guibg=#171b24
hi User7               guifg=#f4f3ee     guibg=#171b24
hi User8               guifg=#3A435A     guibg=#171b24
hi User9               guifg=#DE2B2B     guibg=#171b24
hi User10              guifg=#3E66E0    guibg=#171b24
hi User11              guifg=#5679E3    guibg=#171b24
hi User12              guifg=#56B7C8    guibg=#171b24
hi User13              guifg=#885AC4    guibg=#171b24
hi User14              guifg=#DE642B    guibg=#171b24
hi User15              guifg=#DDDBCF    guibg=#171b24
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link SpecialKey    NonText

"}}}
" Generic syntax {{{
hi Delimiter       guifg=#f4f3ee
hi Comment         guifg=#3A435A   gui=bold
hi Underlined      guifg=#3F8CDE   gui=underline
hi Type            guifg=#3F8CDE
hi String          guifg=#5679E3  gui=bold
hi Keyword         guifg=#3F8CDE
hi Todo            guifg=#5679E3  guibg=#101319     gui=bold,underline
hi Urgent          guifg=#E34F4F   guibg=#101319     gui=bold,underline
hi Done            guifg=#69bfce   guibg=#101319     gui=bold,underline
hi Function        guifg=#DE642B  gui=bold
" hi Function        guifg=#DE642B  gui=italic
hi Identifier      guifg=#f4f3ee   gui=none
hi Statement       guifg=#3F8CDE   gui=bold
hi Constant        guifg=#885AC4
hi Number          guifg=#3E66E0 gui=bold
hi Boolean         guifg=#69bfce
hi Special         guifg=#885AC4
hi Ignore          guifg=#171b24
hi PreProc         guifg=#DE642B   gui=bold
hi Operator        guifg=#956dca   gui=bold
hi Define          guifg=#3F8CDE   gui=none
hi! link Error     ErrorMsg

" Extra TODO
hi Conditional     guifg=#5599E2   gui=bold
hi Exception     guifg=#5599E2   gui=none

"}}}
" HTML {{{
hi htmlTagName              guifg=#3F8CDE
hi htmlTag                  guifg=#3F8CDE
hi htmlArg                  guifg=#3E66E0
hi htmlH1                   gui=bold
hi htmlBold                 gui=bold
hi htmlItalic               gui=underline
hi htmlUnderline            gui=underline
hi htmlBoldItalic           gui=bold,underline
hi htmlBoldUnderline        gui=bold,underline
hi htmlUnderlineItalic      gui=underline
hi htmlBoldUnderlineItalic  gui=bold,underline
hi! link htmlLink           Underlined
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       guifg=#69bfce
hi xmlTag           guifg=#56B7C8
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
hi phpSpecialFunction    guifg=#956dca
hi phpIdentifier         guifg=#5679E3
hi phpParent             guifg=#3A435A
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Lua {{{
hi luaIfThen guifg=#3F8CDE gui=bold
hi luaCond guifg=#3F8CDE gui=bold
"}}}
" Markdown {{{
hi markdownHeadingRule          guifg=#5599E2
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi markdownLinkDelimiter    guifg=#DDDBCF guibg=#101319 gui=none
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi markdownLinkText         guifg=#3F8CDE guibg=#101319 gui=bold,underline
hi! link markdownUrl                markdownLinkText
hi! link markdownUrlTitleDelimiter  markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownIdDeclaration      markdownLinkText
hi markdownCode                     guifg=#69bfce guibg=#101319 gui=none
hi! link markdownCodeBlock          String
hi! link markdownCodeBlock markdownCode
hi! link markdownCodeDelimiter markdownCode
hi markdownBold                     guifg=#956dca guibg=#101319 gui=bold
hi markdownItalic                   guifg=#956dca guibg=#101319 gui=italic
hi markdownBlockquote               guifg=#DDDBCF guibg=#101319 gui=italic,bold
hi markdownRule                     guifg=#DDDBCF guibg=#101319 gui=italic,bold

hi markdownH1 guifg=#5599E2 guibg=#101319 gui=bold
hi markdownH2 guifg=#5599E2 guibg=#101319 gui=bold
hi markdownH3 guifg=#3F8CDE guibg=#101319 gui=bold
hi markdownH4 guifg=#3F8CDE guibg=#101319 gui=bold
hi markdownH5 guifg=#3F8CDE guibg=#101319 gui=none
hi markdownH6 guifg=#3F8CDE guibg=#101319 gui=none

hi markdownListMarker guifg=#DE642B guibg=#101319 gui=bold
hi markdownOrderedListMarker guifg=#5599E2 guibg=#101319 gui=bold

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               guifg=#5599E2
hi gitCommitSelectedType         guifg=#3E66E0
hi gitCommitSelectedFile         guifg=#3F8CDE
hi gitCommitUnmergedType         guifg=#DE2B2B
hi gitCommitUnmergedFile         guifg=#E34F4F
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
hi lessVariable             guifg=#5679E3
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
hi VimwikiBoldItalicChar guifg=#DE642B guibg=#101319 gui=italic,bold
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
hi CtrlPMatch   guifg=#E34F4F   gui=bold
hi CtrlPLinePre guifg=#DE642B gui=bold

"}}}
" Mustache {{{
hi mustacheSection           guifg=#DE642B  gui=bold
hi mustacheMarker            guifg=#DE642B
hi mustacheVariable          guifg=#DE642B
hi mustacheVariableUnescape  guifg=#DE2B2B
hi mustachePartial           guifg=#885AC4

"}}}
" Shell {{{
hi shDerefSimple guifg=#5679E3
hi shDo guifg=#5599E2
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       guifg=#5599E2  guibg=#101319
hi SyntasticErrorSign         guifg=#E34F4F  guibg=#101319
hi SyntasticStyleWarningSign  guifg=#69bfce  guibg=#101319
hi SyntasticStyleErrorSign    guifg=#3F8CDE  guibg=#101319

"}}}
" Netrw {{{
hi netrwExe       guifg=#DE2B2B
hi netrwClassify  guifg=#3A435A  gui=bold

"}}}
" Ledger {{{
hi ledgerAccount  guifg=#5679E3
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  guifg=#3F8CDE
hi diffRemoved  guifg=#E34F4F
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  guifg=#5599E2

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}
" Solidity {{{
hi! link solStorageType      Keyword
hi! link solFuncStorageType  Keyword
hi! link solStorageConst     Keyword
hi! link solParens           Normal
hi! link solComma            Normal
hi! link solMapping          Define
hi! link solEnum             Define
hi! link solStruct           Define
hi! link solNumber           Number
hi! link solString           String
hi! link solString           String
hi! link solOperator         Operator
hi! link solDestructure      Keyword
hi! link solFunction         Define
hi! link solConstructor      Define
hi! link solFuncName         Function
hi! link solFuncModifier     Keyword
hi! link solFuncModCustom    Keyword
hi! link solFuncCall         Function
hi! link solFuncReturn       Special
hi! link solModifier         Define
hi! link solModifierName     Function
hi! link solModifierInsert   Function
hi! link solContract         Define
hi! link solContractName     Function
hi! link solInheritor        Keyword
hi! link solLibUsing         Special
hi! link solLibName          Type
hi! link solEvent            Define
hi! link solEventName        Function
hi! link solEventParamMod    Keyword
hi! link solEmitEvent        Special
hi! link solConstant         Constant
hi! link solReserved         Error
hi! link solPragma           PreProc
hi! link solAssemblyBlock    PreProc
hi! link solAssemblyName     Special
hi! link solAssemblyOperator Operator
hi! link solAssemblyLet      Keyword
hi! link solAssemblyMethod   Special
hi! link solAssemblyConst    Constant
hi! link solAssemblyCond     Conditional
hi! link solMethod           Special
hi! link solRepeat           Repeat
hi! link solLabel            Label
hi! link solException        Exception
hi! link solValueType        Type
hi! link solTypeCast         Type
hi! link solIf               Keyword
hi! link solElse             Keyword
hi! link solLoop             Keyword
hi! link solTodo             Todo
hi! link solComment          Comment
hi! link solNatspecTag       SpecialComment
hi! link solNatspecBlock     Comment
hi! link solNatspecParam     Define


" }}}
" FZF {{{
hi FzfMain guifg=#f4f3ee guibg=#171b24
hi FzfMargin guifg=#f4f3ee guibg=#171b24
hi FzfHighlight guifg=#E34F4F guibg=#E34F4F
hi FzfBorder guifg=#DE642B guibg=#101319
hi FzfBgPlus guibg=#171b24 gui=none
hi FzfBorderFloating guibg=#171b24 guifg=#E34F4F
"}}}
" Statusline {{{
hi StatusLine          guifg=#171b24     guibg=none     gui=bold
hi StatusLineNC        guifg=#171b24     guibg=none     gui=bold

hi StatusLineAccent guibg=#171b24 guifg=#f4f3ee
hi StatusLineNormalAccent guibg=#171b24 guifg=#5679E3
hi StatusLineInsertAccent guibg=#171b24 guifg=#E34F4F
hi StatusLineVisualAccent guibg=#171b24 guifg=#956dca
hi StatusLineReplaceAccent guibg=#171b24 guifg=#e37e4f
hi StatusLineCmdLineAccent guibg=#171b24 guifg=#69bfce

" }}}
" Tabline {{{
hi TabLine             guifg=#3A435A     guibg=none     gui=none
hi TabLineSel          guifg=#f4f3ee     guibg=none
hi TabLineFill         guifg=#E34F4F     guibg=none     gui=none

hi CustomTablineBubbleEdge guibg=none guifg=#171b24
hi CustomTablineBubbleIndex guibg=#171b24 guifg=#69bfce gui=bold
hi CustomTablineBubbleIndexSel guibg=#171b24 guifg=#956dca gui=bold
hi CustomTablineBubbleLabel guibg=#171b24 guifg=#3A435A gui=bold
hi CustomTablineBubbleLabelSel guibg=#171b24 guifg=#f4f3ee gui=bold
hi CustomTablineBubbleLabelSelModified guibg=#171b24 guifg=#f4f3ee gui=bold,undercurl guisp=#5599E2
hi CustomTablineBubbleDirectory guibg=#171b24 guifg=#5679E3 gui=bold
hi CustomTablineBubbleFiletype guibg=#171b24 guifg=#e37e4f gui=bold
hi CustomTablineBubbleGit guibg=#171b24 guifg=#E34F4F gui=bold
hi CustomTablineBubbleSeparator guibg=#171b24 guifg=#3A435A gui=bold
hi CustomTablineBubbleLine guibg=#171b24 guifg=#E34F4F gui=bold
hi CustomTablineBubbleColumn guibg=#171b24 guifg=#69bfce gui=bold
hi CustomTablineBubblePercentage guibg=#171b24 guifg=#5679E3 gui=bold
hi CustomTablineBubbleTotalLines guibg=#171b24 guifg=#956dca gui=bold

" }}}
" Vim Sneak {{{
hi Sneak guifg=#171b24 gui=bold guibg=#5679E3
hi SneakScope guifg=#171b24 gui=bold guibg=#DE642B
hi SneakLabel guifg=#171b24 gui=bold guibg=#5679E3

"}}}
" GitGutter {{{
hi GitGutterAdd guifg=#56B7C8 guibg=#101319 gui=bold
hi GitGutterChange guifg=#3E66E0 guibg=#101319 gui=bold
hi GitGutterDelete guifg=#DE2B2B guibg=#101319 gui=bold
hi GitGutterChangeDelete guifg=#5679E3 guibg=#101319 gui=bold

hi GitGutterAddLine guifg=#56B7C8 guibg=#101319 gui=bold
hi GitGutterChangeLine guifg=#3E66E0 guibg=#101319 gui=bold
hi GitGutterDeleteLine guifg=#DE2B2B guibg=#101319 gui=bold
hi GitGutterChangeDeleteLine guifg=#5679E3 guibg=#101319 gui=bold

highlight link diffAdded DiffAdd
highlight link diffChanged DiffChange
highlight link diffRemoved DiffDelete
"}}}

" highlightedyank
" highlight HighlightedyankRegion gui=reverse gui=reverse
highlight HighlightedyankRegion guibg=#3F8CDE guifg=#171b24 gui=none

" Mini
hi MiniIndentscopeSymbol guifg=#956dca guibg=none gui=none

" Org
hi @org.headline.level1 guibg=none guifg=#3F8CDE gui=bold
hi @org.headline.level2 guibg=none guifg=#DE642B gui=bold
hi @org.headline.level3 guibg=none guifg=#DE2B2B gui=bold
hi @org.headline.level4 guibg=none guifg=#3E66E0 gui=bold
hi @org.headline.level5 guibg=none guifg=#56B7C8 gui=bold
hi @org.headline.level6 guibg=none guifg=#885AC4 gui=bold
hi @org.headline.level7 guibg=none guifg=#3F8CDE gui=bold
hi @org.headline.level8 guibg=none guifg=#DE642B gui=bold

" Nvim-cmp
hi FloatBorder guibg=none guifg=#5599E2 gui=bold

