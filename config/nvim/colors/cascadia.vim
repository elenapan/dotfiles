" Vim color file
" File_Name:    cascadia.vim
" Abstract:     A light theme created in honor of the Cascadia Bioregion. As
"               with the Cascadian flag, the colors of this theme are meant to
"               represent the beauty of the Pacific Northwest. 
" Maintainer:	Aaron Heuser <ahe2user at gmail dot com>
" Last Change:	11 December 2014
" Version:	2.0.0

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "cascadia"

hi SpecialKey   guifg=#000000   guibg=#b9ffc2
hi NonText      guifg=#969696   guibg=#f0f0f0   gui=none
hi Directory    guifg=#78681a
hi ErrorMsg     guifg=#ffffff   guibg=#a01010
hi IncSearch    guifg=#ffffff   guibg=#ff8000   gui=none
hi Search       guifg=#000000   guibg=#ffd073
hi MoreMsg      guifg=#ffffff   guibg=#3c960f   gui=none
hi ModeMsg      guifg=#323232                   gui=none
hi LineNr       guifg=#969696   guibg=#f0f0f0
hi Question     guifg=#000000   guibg=#ffde37   gui=none
hi StatusLine   guifg=#ffffff   guibg=#323232   gui=none
hi StatusLineNC guifg=#f0f0f0   guibg=#646464   gui=none
hi VertSplit    guifg=#f0f0f0   guibg=#646464   gui=none
hi Title        guifg=#323232                   gui=none
hi Visual       guifg=#ffffff   guibg=#0db906
hi VisualNOS    guifg=#000000   guibg=#0db906   gui=none
hi WarningMsg   guifg=#c8c8c8   guibg=#a01010
hi WildMenu     guifg=#ffffff   guibg=#1994d1
hi Folded       guifg=#969696   guibg=#f0f0f0
hi FoldColumn   guifg=#969696   guibg=#f0f0f0
hi DiffAdd                      guibg=#deffcd
hi DiffChange                   guibg=#dad7ff
hi DiffDelete   guifg=#c8c8c8   guibg=#ffffff   gui=none
hi DiffText     guifg=#ffffff   guibg=#767396   gui=none
hi SignColumn   guifg=#969696   guibg=#f0f0f0
hi SpellBad     guifg=#000000   guibg=#b9ffc2   guisp=#085d06   gui=undercurl
hi Pmenu        guifg=#ffffff   guibg=#323232
hi PmenuSel     guifg=#ffffff   guibg=#1994d1
hi PmenuSbar    guifg=#323232   guibg=#323232
hi PmenuThumb   guifg=#646464   guibg=#646464   gui=none
hi TabLine      guifg=#f0f0f0   guibg=#646464   gui=none
hi TabLineSel   guifg=#ffffff   guibg=#323232   gui=none
hi TabLineFill  guifg=#646464   guibg=#646464   gui=none
hi ColorColumn  guifg=#000000   guibg=#dde8e8   gui=none
hi CursorColumn                 guibg=#eeeeee
hi CursorLine                   guibg=#eeeeee   gui=none
hi CursorLineNr guifg=#505050   guibg=#ffffff   gui=none
hi LineNr       guifg=#505050   guibg=#dde8e8   gui=none
hi Cursor       guifg=#ffffff   guibg=#000000
hi lCursor      guifg=#ffffff   guibg=#004364
hi MatchParen                   guibg=#47e538   gui=none
hi Normal       guifg=#000000   guibg=#ffffff
hi Number       guifg=#5080b0   guibg=bg        gui=bold
hi String       guifg=#085d06   guibg=bg
hi Comment      guifg=#79a97b   guibg=bg
hi Constant     guifg=#508040
hi Special      guifg=#5080b0                   gui=bold
hi SpecialChar  guifg=#a9a61f   guibg=bg        gui=bold
hi Identifier   guifg=#a9a61f
hi Statement    guifg=#121bc0   guibg=bg        gui=bold
hi PreProc      guifg=#121bc0   guibg=bg        gui=bold
hi PreCondit    guifg=#cc00cc   guibg=bg        gui=bold
hi Type         guifg=#121bc0   guibg=bg        gui=bold
hi Underlined   guifg=#121bc0   guibg=bg        gui=underline
hi Ignore       guifg=#c8c8c8
hi Error        guifg=bg        guibg=#00ee00   gui=none
hi Todo         guifg=#085d06   guibg=#ffffff   gui=none

hi link Conditional     PreProc
hi link Debug           Special
hi link Delimiter       Special
hi link Float           Number
hi link Identifier      SpecialChar
hi link Include         PreProc
hi link Macro           PreProc
hi link SpecialComment  Special
hi link SpellCap        SpellBad 
hi link SpellRare       SpellBad
hi link SpellLocal      SpellBad
hi link StorageClass    Type
hi link Structure       Type
hi link Tag             Special
hi link Typedef         Type
