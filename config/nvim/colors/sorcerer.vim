" 'sorcerer.vim' -- Vim color scheme.
" Maintainer: Andrew Lawson
" Forked from 'vim-scripts/Sorcerer' by Jeet Sukumaran
" Based on 'Mustang' by Henrique C. Alves (hcarvalhoalves@gmail.com),

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sorcerer"

" GUI Colors {{{1
" ============================================================================

hi Normal       guifg=#c2c2b0 guibg=#222222 gui=NONE
hi ColorColumn  guifg=NONE    guibg=#1c1c1c
hi Cursor       guifg=NONE    guibg=#626262 gui=NONE
hi CursorColumn guibg=#2d2d2d
hi CursorLine   guibg=#2d2d2d
hi DiffAdd      guifg=#000000 guibg=#3cb371 gui=NONE
hi DiffDelete   guifg=#000000 guibg=#aa4450 gui=NONE
hi DiffChange   guifg=#000000 guibg=#4f94cd gui=NONE
hi DiffText     guifg=#000000 guibg=#8ee5ee gui=NONE
hi Directory    guifg=#1e90ff guibg=NONE    gui=NONE
hi ErrorMsg     guifg=#ff6a6a guibg=NONE    gui=bold
hi FoldColumn   guifg=#68838b guibg=#4B4B4B gui=bold
hi Folded       guifg=#406060 guibg=#232c2c gui=NONE
hi IncSearch    guifg=#ffffff guibg=#ff4500 gui=bold
hi LineNr       guifg=#686858 guibg=NONE    gui=NONE
hi MatchParen   guifg=#fff000 guibg=NONE    gui=bold
hi ModeMsg      guifg=#000000 guibg=#00ff00 gui=bold
hi MoreMsg      guifg=#2e8b57 guibg=NONE    gui=bold
hi NonText      guifg=#404050 guibg=NONE    gui=NONE

hi Pmenu        guifg=#ffffff guibg=#444444
hi PmenuSel     guifg=#000000 guibg=#b1d631
"  hi           PmenuSbar     guifg=#ffffff guibg=#c1cdc1 gui=NONE
"  hi           PmenuThumb    guifg=#ffffff guibg=#838b83 gui=NONE

hi Question     guifg=#00ee00 guibg=NONE    gui=bold
hi Search       guifg=#000000 guibg=#d6e770 gui=bold
hi SignColumn   guifg=#ffffff guibg=NONE    gui=NONE
hi SpecialKey   guifg=#505060 guibg=NONE    gui=NONE
hi SpellBad     guisp=#ee2c2c gui=undercurl
hi SpellCap     guisp=#0000ff gui=undercurl
hi SpellLocal   guisp=#008b8b gui=undercurl
hi SpellRare    guisp=#ff00ff gui=undercurl
hi StatusLine   guifg=#000000 guibg=#808070 gui=bold
hi StatusLineNC guifg=#000000 guibg=#404c4c gui=italic
hi VertSplit    guifg=#404c4c guibg=#404c4c gui=NONE
hi TabLine      guifg=fg      guibg=#d3d3d3 gui=underline
hi TabLineFill  guifg=fg      guibg=NONE    gui=reverse
hi TabLineSel   guifg=fg      guibg=NONE    gui=bold
hi Title        guifg=#528b8b guibg=NONE    gui=bold
hi Visual       guifg=#000000 guibg=#6688aa gui=NONE
hi WarningMsg   guifg=#ee9a00 guibg=NONE    gui=NONE
hi WildMenu     guifg=#000000 guibg=#87ceeb gui=NONE
hi ExtraWhitespace guifg=fg   guibg=#528b8b gui=NONE

"  Syntax highlighting
hi Comment      guifg=#686858 gui=italic
hi Boolean      guifg=#ff9800 gui=NONE
hi String       guifg=#779b70 gui=NONE
hi Identifier   guifg=#9ebac2 gui=NONE
hi Function     guifg=#faf4c6 gui=NONE
hi Type         guifg=#7e8aa2 gui=NONE
hi Statement    guifg=#90b0d1 gui=NONE
hi Keyword      guifg=#90b0d1 gui=NONE
hi Constant     guifg=#ff9800 gui=NONE
hi Number       guifg=#cc8800 gui=NONE
hi Special      guifg=#719611 gui=NONE
hi PreProc      guifg=#528b8b gui=NONE
hi Todo         guifg=#8f6f8f guibg=#202020 gui=italic,underline,bold

" Diff
hi diffOldFile      guifg=#88afcb   guibg=NONE      gui=italic
hi diffNewFile      guifg=#88afcb   guibg=NONE      gui=italic
hi diffFile         guifg=#88afcb   guibg=NONE      gui=italic
hi diffLine         guifg=#88afcb   guibg=NONE      gui=italic
hi link             diffSubname     diffLine
hi diffAdded        guifg=#3cb371   guibg=NONE      gui=NONE
hi diffRemoved      guifg=#aa4450   guibg=NONE      gui=NONE
hi diffChanged      guifg=#4f94cd   guibg=NONE      gui=NONE
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi link             diffComment     Constant

" Python
hi pythonException  guifg=#90b0d1 guibg=NONE gui=NONE
hi pythonExClass    guifg=#996666 guibg=NONE gui=NONE
hi pythonDecorator  guifg=#888555 guibg=NONE gui=NONE
hi link pythonDecoratorFunction pythonDecorator

" 1}}}

" 256 Colors {{{1
" ============================================================================
hi Normal                 cterm=NONE             ctermbg=NONE  ctermfg=145
hi ColorColumn            cterm=NONE             ctermbg=16    ctermfg=NONE
hi Cursor                 cterm=NONE             ctermbg=241   ctermfg=fg
hi CursorColumn           cterm=NONE             ctermbg=16    ctermfg=fg
hi CursorLine             cterm=NONE             ctermbg=236   ctermfg=fg
hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=124   ctermfg=16
hi DiffChange             cterm=NONE             ctermbg=68    ctermfg=16
hi DiffText               cterm=NONE             ctermbg=117   ctermfg=16
hi Directory              cterm=NONE             ctermbg=234   ctermfg=33
hi ErrorMsg               cterm=bold             ctermbg=NONE  ctermfg=203
hi FoldColumn             cterm=bold             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=16    ctermfg=60
hi IncSearch              cterm=bold             ctermbg=202   ctermfg=231
hi LineNr                 cterm=NONE             ctermbg=NONE  ctermfg=59
hi MatchParen             cterm=bold             ctermbg=NONE  ctermfg=226
hi ModeMsg                cterm=bold             ctermbg=46    ctermfg=16
hi MoreMsg                cterm=bold             ctermbg=234   ctermfg=29
hi NonText                cterm=NONE             ctermbg=NONE  ctermfg=59
hi Pmenu                  cterm=NONE             ctermbg=238   ctermfg=231
hi PmenuSbar              cterm=NONE             ctermbg=250   ctermfg=fg
hi PmenuSel               cterm=NONE             ctermbg=149   ctermfg=16
hi Question               cterm=bold             ctermbg=NONE  ctermfg=46
hi Search                 cterm=bold             ctermbg=185   ctermfg=16
hi SignColumn             cterm=NONE             ctermbg=NONE  ctermfg=231
hi SpecialKey             cterm=NONE             ctermbg=NONE  ctermfg=59
hi SpellBad               cterm=undercurl        ctermbg=NONE  ctermfg=196
hi SpellCap               cterm=undercurl        ctermbg=NONE  ctermfg=21
hi SpellLocal             cterm=undercurl        ctermbg=NONE  ctermfg=30
hi SpellRare              cterm=undercurl        ctermbg=NONE  ctermfg=201
hi StatusLine             cterm=bold             ctermbg=101   ctermfg=16
hi StatusLineNC           cterm=NONE             ctermbg=102   ctermfg=16
hi VertSplit              cterm=NONE             ctermbg=102   ctermfg=102
hi TabLine                cterm=bold             ctermbg=102   ctermfg=16
hi TabLineFill            cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineSel             cterm=bold             ctermbg=16    ctermfg=59
hi Title                  cterm=bold             ctermbg=NONE  ctermfg=66
hi Visual                 cterm=NONE             ctermbg=67    ctermfg=16
hi WarningMsg             cterm=NONE             ctermbg=234   ctermfg=208
hi WildMenu               cterm=NONE             ctermbg=116   ctermfg=16
hi ExtraWhitespace        cterm=NONE             ctermbg=66    ctermfg=fg

hi Comment                cterm=NONE             ctermbg=NONE    ctermfg=59
hi Boolean                cterm=NONE             ctermbg=NONE    ctermfg=208
hi String                 cterm=NONE             ctermbg=NONE    ctermfg=101
hi Identifier             cterm=NONE             ctermbg=NONE    ctermfg=145
hi Function               cterm=NONE             ctermbg=NONE    ctermfg=230
hi Type                   cterm=NONE             ctermbg=NONE    ctermfg=103
hi Statement              cterm=NONE             ctermbg=NONE    ctermfg=110
hi Keyword                cterm=NONE             ctermbg=NONE    ctermfg=110
hi Constant               cterm=NONE             ctermbg=NONE    ctermfg=208
hi Number                 cterm=NONE             ctermbg=NONE    ctermfg=172
hi Special                cterm=NONE             ctermbg=NONE    ctermfg=64
hi PreProc                cterm=NONE             ctermbg=NONE    ctermfg=66
hi Todo                   cterm=bold,underline   ctermbg=234     ctermfg=96

hi diffOldFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffAdded              cterm=NONE             ctermfg=NONE    ctermfg=71
hi diffRemoved            cterm=NONE             ctermfg=NONE    ctermfg=124
hi diffChanged            cterm=NONE             ctermfg=NONE    ctermfg=68
hi link             diffSubname     diffLine
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi link             diffComment     Constant

hi pythonClass            cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonDecorator        cterm=NONE             ctermbg=NONE    ctermfg=101
hi pythonExClass          cterm=NONE             ctermbg=NONE    ctermfg=95
hi pythonException        cterm=NONE             ctermbg=NONE    ctermfg=110
hi pythonFunc             cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonFuncParams       cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonKeyword          cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonParam            cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonRawEscape        cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonSuperclasses     cterm=NONE             ctermbg=NONE    ctermfg=fg
hi pythonSync             cterm=NONE             ctermbg=NONE    ctermfg=fg

hi Conceal                cterm=NONE             ctermbg=248   ctermfg=252
hi Error                  cterm=NONE             ctermbg=196   ctermfg=231
hi Ignore                 cterm=NONE             ctermbg=NONE  ctermfg=234
hi InsertModeCursorLine   cterm=NONE             ctermbg=16    ctermfg=fg
hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg
hi PmenuThumb             cterm=reverse          ctermbg=NONE  ctermfg=fg
hi StatusLineAlert        cterm=NONE             ctermbg=160   ctermfg=231
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144
hi Test                   cterm=NONE             ctermbg=NONE  ctermfg=fg
hi Underlined             cterm=underline        ctermbg=NONE  ctermfg=111
hi VisualNOS              cterm=bold,underline   ctermbg=NONE  ctermfg=fg
hi cCursor                cterm=reverse          ctermbg=NONE  ctermfg=fg
hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
hi nCursor                cterm=NONE             ctermbg=46    ctermfg=16
hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16
" 1}}}
