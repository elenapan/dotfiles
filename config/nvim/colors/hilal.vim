" hilal - a dark colorscheme for gvim
" Copyright (c) 2016 Osman Koçak <kocakosm@gmail.com>
" Licensed under the MIT/X11 license <https://opensource.org/licenses/MIT>

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="hilal"

" Editor settings
hi Normal          guifg=#dadada    guibg=#171717    gui=NONE
hi Cursor          guifg=#171717    guibg=#dadada    gui=NONE
hi CursorLine      guifg=NONE       guibg=#1e1e1e    gui=NONE
hi LineNr          guifg=#6f6f6f    guibg=#1e1e1e    gui=NONE
hi CursorLineNR    guifg=#aeaeae    guibg=#1e1e1e    gui=BOLD

" Number column
hi CursorColumn    guifg=NONE       guibg=#1e1e1e    gui=NONE
hi FoldColumn      guifg=#6f6f6f    guibg=#1e1e1e    gui=NONE
hi SignColumn      guifg=#6f6f6f    guibg=#1e1e1e    gui=NONE
hi Folded          guifg=#aeaeae    guibg=#1e1e1e    gui=NONE

" Window/Tab delimiters
hi VertSplit       guifg=#1e1e1e    guibg=#1e1e1e    gui=NONE
hi ColorColumn     guifg=NONE       guibg=#1e1e1e    gui=NONE
hi TabLine         guifg=NONE       guibg=NONE       gui=NONE
hi TabLineFill     guifg=NONE       guibg=NONE       gui=NONE
hi TabLineSel      guifg=NONE       guibg=NONE       gui=NONE

" Navigation/Search
hi Directory       guifg=#5fafaf    guibg=NONE       gui=NONE
hi Search          guifg=#171717    guibg=#87af87    gui=NONE
hi IncSearch       guifg=#171717    guibg=#87af87    gui=NONE

" Prompt/Status
hi StatusLine      guifg=NONE       guibg=#002c2c    gui=NONE
hi StatusLineNC    guifg=NONE       guibg=#1e1e1e    gui=NONE
hi WildMenu        guifg=#002c2c    guibg=#dadada    gui=NONE
hi Question        guifg=#87afaf    guibg=NONE       gui=NONE
hi Title           guifg=#fafafa    guibg=NONE       gui=BOLD
hi ModeMsg         guifg=#002c2c    guibg=#dadada    gui=BOLD
hi MoreMsg         guifg=NONE       guibg=NONE       gui=NONE
hi MoreMsg         guifg=#5fafaf    guibg=NONE       gui=NONE

" Visual aid
hi MatchParen      guifg=#fefede    guibg=NONE       gui=BOLD
hi Visual          guifg=#dadada    guibg=#002c2c    gui=NONE
hi VisualNOS       guifg=NONE       guibg=#002c2c    gui=NONE
hi NonText         guifg=NONE       guibg=NONE       gui=NONE
hi Todo            guifg=NONE       guibg=NONE       gui=BOLD,UNDERLINE
hi underlined      guifg=NONE       guibg=NONE       gui=UNDERLINE
hi Error           guifg=#ee7f7f    guibg=NONE       gui=NONE
hi ErrorMsg        guifg=#ee7f7f    guibg=NONE       gui=NONE
hi WarningMsg      guifg=#ffbb66    guibg=NONE       gui=NONE
hi Ignore          guifg=NONE       guibg=NONE       gui=NONE
hi SpecialKey      guifg=#ffdddd    guibg=NONE       gui=NONE

" Variable types
hi Constant        guifg=#4fa4af    guibg=NONE       gui=NONE
hi String          guifg=#fefede    guibg=NONE       gui=NONE
hi Identifier      guifg=#28a0e0    guibg=NONE       gui=NONE
hi Function        guifg=#7acab0    guibg=NONE       gui=NONE
hi link StringDelimiter String
hi link Character       String
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number

" Language constructs
hi Statement       guifg=#2c89a9    guibg=NONE       gui=NONE
hi Conditional     guifg=#2c89a9    guibg=NONE       gui=NONE
hi Operator        guifg=#ffffff    guibg=NONE       gui=NONE
hi Keyword         guifg=#2c89a9    guibg=NONE       gui=NONE
hi Comment         guifg=#4a4a4a    guibg=NONE       gui=ITALIC
hi Special         guifg=#ffaa88    guibg=NONE       gui=NONE
hi Delimiter       guifg=#2c89a9    guibg=NONE       gui=NONE
hi link Repeat         Conditional
hi link Label          Conditional
hi link Exception      Statement
hi link SpecialComment Special
hi link Debug          Special
hi link SpecialChar    Special
hi link Tag            Special

" C like syntax constructs
hi PreProc         guifg=#609faf    guibg=NONE       gui=NONE
hi Type            guifg=#2c89a9    guibg=NONE       gui=NONE
hi link StorageClass Type
hi link Structure    Type
hi link Typedef      Type
hi link Include      PreProc
hi link Define       PreProc
hi link Macro        PreProc
hi link PreCondit    PreProc

" Diff
hi DiffAdd         guifg=#ffffff    guibg=#308a3f    gui=NONE
hi DiffChange      guifg=#ffffff    guibg=#1f4f8a    gui=NONE
hi DiffDelete      guifg=#ffffff    guibg=#9f4040    gui=NONE
hi DiffText        guifg=#ffffff    guibg=#3f6fba    gui=NONE

" Completion menu
hi Pmenu           guifg=#d0d0d0    guibg=#002c2c    gui=NONE
hi PmenuSel        guifg=#efefef    guibg=#002c2c    gui=BOLD
hi PmenuSbar       guifg=NONE       guibg=NONE       gui=NONE
hi PmenuThumb      guifg=NONE       guibg=NONE       gui=NONE

" Spelling
hi SpellBad        guifg=#ee7f7f    guibg=NONE       gui=NONE
hi SpellCap        guifg=NONE       guibg=NONE       gui=NONE
hi SpellLocal      guifg=NONE       guibg=NONE       gui=NONE
hi SpellRare       guifg=NONE       guibg=NONE       gui=NONE

" Syntax highlighting for Java
hi JavaDocTags    guifg=#5e5e5e    guibg=NONE       gui=ITALIC
hi JavaDocComment guifg=#4a4a4a    guibg=NONE       gui=ITALIC
hi JavaAnnotation guifg=#6f8080    guibg=NONE       gui=ITALIC
hi link JavaScopeDecl      Identifier
hi link JavaCommentTitle   JavaDocTags
hi link JavaDocParam       JavaDocTags
hi link JavaDocSeeTagParam JavaDocTags
hi link JavaDocSeeTag      JavaDocTags

" Syntax highlighting for XML
hi XmlTag         guifg=#4ca9b9    guibg=NONE       gui=NONE
hi link XmlTagName XmlTag
hi link XmlEndTag  XmlTag

" Syntax highlighting for HTML
hi link HtmlTag     XmlTagName
hi link HtmlTagName XmlTagName
hi link HtmlEndTag  XmlTagName

" Syntax highlighting for Javascript
hi link JavaScriptNumber Number
