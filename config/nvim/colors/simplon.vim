" description: color scheme based on github's
" author: png1981@gmail.com
" license:  gpl 3+
" based: Anthony Carapetis's github.vim

hi clear

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="simplon"

" {{{ Fondo y color de las letras
hi Normal           guifg=#000000   guibg=#EBEBEB
" }}}

" {{{ Cursor
hi Cursor           guibg=#444454   guifg=#F8F8FF
hi CursorLine       guibg=#D4D4D8
hi CursorColumn     guibg=#E8E8EE
" }}}

" {{{ Diff
hi DiffAdd          guifg=#003300   guibg=#DDFFDD   gui=none
hi DiffChange       guibg=#ececec   gui=none
hi DiffText         guifg=#000033   guibg=#DDDDFF   gui=none
hi DiffDelete       guifg=#DDCCCC   guibg=#FFDDDD   gui=none
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded           guibg=#ECECEC   guifg=#808080   gui=bold
hi vimFold          guibg=#ECECEC   guifg=#808080   gui=bold
hi FoldColumn       guibg=#ECECEC   guifg=#808080   gui=bold
hi LineNr           guifg=#A1A1A1   guibg=#E6E6E6
hi NonText          guifg=#808080   guibg=#ECECEC
hi Folded           guifg=#808080   guibg=#ECECEC   gui=bold
hi FoldeColumn      guifg=#808080   guibg=#ECECEC   gui=bold
hi VertSplit        guibg=#EBEBEB   guifg=#000000   gui=none
hi StatusLine       guibg=#ADC2D6   guifg=#000000   gui=inverse
hi StatusLine       guibg=#ADC2D6   guifg=#000000   gui=bold
hi StatusLineNC     guibg=#d4d4d4   guifg=#404040   gui=italic
hi ColorColumn      guibg=#F2F2F3   gui=none
" }}}

" {{{ Misc
hi ModeMsg          guifg=#990000
hi MoreMsg          guifg=#990000

hi Title            guifg=#ef5939
hi WarningMsg       guifg=#ef5939
hi SpecialKey       guifg=#808080   guibg=#ECECEC

hi MatchParen       guibg=#9E35C4   guifg=#000000
hi Underlined       guifg=#000000   gui=underline
hi Directory        guifg=#990000
" }}}

" {{{ Search, Visual, etc
hi Visual           guifg=#000000   guibg=#99C2FF   gui=none
hi VisualNOS        guifg=#FFFFFF   guibg=#204a87   gui=none
hi IncSearch        guibg=#FFBC58   guifg=#000000   gui=none
hi Search           guibg=#FFBC58   guifg=#000000   gui=none
" }}}

" {{{ Syntax groups
hi Ignore           guifg=#808080
hi Identifier       guifg=#0000FF
hi PreProc          guifg=#0033CC
hi Comment          guifg=#008A00   gui=italic
hi Constant         guifg=#177F80   gui=none
hi String           guifg=#9C2E9C
hi Function         guifg=#990000   gui=bold
hi Statement        guifg=#000000   gui=bold
hi Type             guifg=#0047B2   gui=bold
hi Number           guifg=#CC0052
hi Todo             guifg=#FFFFFF   guibg=#D75F14   gui=bold

hi Special          guifg=#006699   gui=bold
hi rubySymbol       guifg=#960B73
hi Error            guibg=#f8f8ff   guifg=#ff1100   gui=undercurl
hi Label            guifg=#000000   gui=bold
hi StorageClass     guifg=#000000   gui=bold
hi Structure        guifg=#000000   gui=bold
hi TypeDef          guifg=#000000   gui=bold
" }}}

" {{{ Completion menus
hi WildMenu         guifg=#7fbdff   guibg=#425c78   gui=none

hi Pmenu            guibg=#808080   guifg=#ffffff   gui=bold
hi PmenuSel         guibg=#cdcdfd   guifg=#000000   gui=italic
hi PmenuSbar        guibg=#000000   guifg=#444444
hi PmenuThumb       guibg=#aaaaaa   guifg=#aaaaaa
" }}}

" {{{ Spelling
hi spellBad         guisp=#fcaf3e
hi spellCap         guisp=#73d216
hi spellRare        guisp=#fcaf3e
hi spellLocal       guisp=#729fcf
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag     htmlEndTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
" }}}

" {{{ Tabs (non-gui0)
hi TabLine          guifg=#404040   guibg=#dddddd   gui=none
hi TabLineFill      guifg=#404040   guibg=#dddddd   gui=none
hi TabLineSel       guifg=#404040   gui=bold
" }}}
