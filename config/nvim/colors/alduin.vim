"  "        ___                                 "
"  "       -   -_, ,,  |\                       "
"  "      (  ~/||  ||   \\         '            "
"  "      (  / ||  ||  / \\ \\ \\ \\ \\/\\      "
"  "       \/==||  || || || || || || || ||      "
"  "       /_ _||  || || || || || || || ||      "
"  "      (  - \\, \\  \\/  \\/\\ \\ \\ \\      "




" A Terminal and Gui colorscheme 
" Author:       Alessandro Yorba 
" Maintainer:   Alessandro Yorba
" Script URL:   https://github.com/AlessandroYorba/Alduin
" License:      MIT


set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif


" Alduin Shouts:
"----------------------------------------------------------------

" Default:
let g:colors_name="alduin"


" Aura Whisper:
" Change the MatchParen HL to Underlined
if !exists( "g:alduin_Shout_Aura_Whisper") " {{{
    let g:alduin_Shout_Aura_Whisper = 0
endif " }}}


" Fire Breath:
" Change the Special HL foreground color to Sahloknir
if !exists( "g:alduin_Shout_Fire_Breath" ) " {{{
    let g:alduin_Shout_Fire_Breath = 0
endif " }}}


" Become Ethereal:
" Changes the Default Alduin to a Darker Version
if !exists( "g:alduin_Shout_Become_Ethereal" ) " {{{
    let g:alduin_Shout_Become_Ethereal = 0
endif " }}}


" Contract Vampirism:
" Automatically changes the Alduin to Ethereal after 5pm
if !exists( "g:alduin_Contract_Vampirism") " {{{
    let g:alduin_Contract_Vampirism = 0
endif " }}}


" Colors:
"----------------------------------------------------------------
let s:alduin = {}

let s:alduin.Abyss       = [ '000000', 16  ]
let s:alduin.Krosulhah   = [ '5f0000', 52  ]
let s:alduin.Morthal     = [ '5f5f87', 60  ]
let s:alduin.Dawnstar    = [ '5f8787', 66  ]
let s:alduin.Durnehviir  = [ '875f5f', 95  ]
let s:alduin.Winterhold  = [ '87875f', 101 ]
let s:alduin.Relonikiv   = [ '878787', 102 ]
let s:alduin.Falkreath   = [ '8787af', 103 ]
let s:alduin.Mirmulnir   = [ '87afaf', 109 ]
let s:alduin.Markarth    = [ '87ffaf', 121 ]
let s:alduin.Sahloknir   = [ 'af0000', 124 ]
let s:alduin.Odahviing   = [ 'af5f00', 130 ]
let s:alduin.Windhelm    = [ 'af5f5f', 131 ]
let s:alduin.Viinturuth  = [ 'af875f', 137 ]
let s:alduin.Kruziikrel  = [ 'af8787', 138 ]
let s:alduin.Riverwood   = [ 'afd7d7', 152 ]
let s:alduin.Sahrotaar   = [ 'dfaf87', 180 ]
let s:alduin.Whiterun    = [ 'dfdfaf', 187 ]
let s:alduin.Paarthurnax = [ 'ffdf87', 222 ]
let s:alduin.Oblivion    = [ '080808', 232 ]
let s:alduin.Solitude    = [ '121212', 233 ]
let s:alduin.Skyrim      = [ '1c1c1c', 234 ]
let s:alduin.Ivarstead   = [ '262626', 235 ]
let s:alduin.Riften      = [ '303030', 236 ]
let s:alduin.Rorikstead  = [ '3a3a3a', 237 ]
let s:alduin.Nightingale = [ '585858', 240 ]
let s:alduin.Ivory       = [ 'eeeeee', 255 ]


function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let highlightString = 'hi ' . a:group . ' '

    " Settings for highlight group ctermfg & guifg 
    if strlen(a:fg)
        if a:fg == 'fg'
            let highlightString .= 'guifg=fg ctermfg=fg '
        else
            let color = get(s:alduin, a:fg)
            let highlightString .= 'guifg=#' . color[0] . ' ctermfg=' . color[1] . ' '
        endif
    endif

    " Settings for highlight group termbg & guibg 
    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let highlightString .= 'guibg=bg ctermbg=bg '
        else
            let color = get(s:alduin, a:1)
            let highlightString .= 'guibg=#' . color[0] . ' ctermbg=' . color[1] . ' '
        endif
    endif

    " Settings for highlight group cterm & gui 
    if a:0 >= 2 && strlen(a:2)
        let highlightString .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    " Settings for highlight guisp
    if a:0 >= 3 && strlen(a:3)
        let color = get(s:alduin, a:3)
        let highlightString .= 'guisp=#' . color[0] . ' '
    endif

    " echom highlightString

    execute highlightString
endfunction


" Editor Settings:
"--------------------------------------------------------------------------------
call s:HL( 'Normal', 'Whiterun', 'Skyrim', '' )
call s:HL( 'CursorLineNR', 'Nightingale', '', 'none' )
call s:HL( 'CursorLine', '', 'Ivarstead', 'none' )
call s:HL( 'LineNr', 'Rorikstead', 'Solitude','none' )
"TODO
"call s:HL( 'Cursor', '', '',          '' )


" Number Column:
"--------------------------------------------------------------------------------
call s:HL( 'FoldColumn', 'Mirmulnir', 'Skyrim', '' )
call s:HL( 'Folded', 'Rorikstead', 'Solitude', 'none' )
call s:HL( 'SignColumn', 'Winterhold', 'Solitude','none' )
"TODO
"call s:HL( 'CursorColumn', '', '', '' )


" WindowTab Delimiters:
"--------------------------------------------------------------------------------
call s:HL( 'VertSplit', 'Winterhold', 'Ivarstead', 'none' )
call s:HL( 'TabLine', 'Winterhold', 'Solitude', 'none' )
call s:HL( 'TabLineFill', 'Winterhold', 'Solitude', 'none' )
call s:HL( 'TabLineSel', 'Solitude', 'Winterhold', 'none' )
"TODO
"call s:HL( 'ColorColumn', '', '', '' )


" File Navigation: 
"--------------------------------------------------------------------------------
call s:HL( 'Directory', 'Windhelm', '', 'none' )
call s:HL( 'Search', 'Whiterun', 'Krosulhah', 'none' )
call s:HL( 'IncSearch', 'Windhelm', '', 'reverse' )


" Prompt Status:
"--------------------------------------------------------------------------------
call s:HL( 'StatusLine', 'Solitude', 'Winterhold', 'none' )
call s:HL( 'StatusLineNC', 'Winterhold', 'Riften', 'none' )
call s:HL( 'WildMenu', 'Whiterun', 'Krosulhah', 'none' )
call s:HL( 'Title', 'Sahrotaar', '', 'none' )
call s:HL( 'MoreMsg', 'Sahrotaar', '', 'none' )
call s:HL( 'ModeMsg', 'Mirmulnir', '', 'none' )
call s:HL( 'Question', 'Durnehviir', '', '' )


" Visual Aid: 
"--------------------------------------------------------------------------------
call s:HL( 'MatchParen', 'Skyrim', 'Viinturuth', 'none' )
call s:HL( 'Visual', 'Whiterun', 'Krosulhah', 'none' )
call s:HL( 'VisualNOS', '', '', 'underline' )
call s:HL( 'NonText', 'Winterhold', '', 'none' )
call s:HL( 'Todo', 'Odahviing', 'Solitude', 'italic' )
call s:HL( 'Underlined', 'Riverwood', '', 'none' )
call s:HL( 'Error', 'Windhelm', 'Solitude', 'reverse' )
call s:HL( 'ErrorMsg', 'Windhelm', 'Solitude', 'reverse' )
call s:HL( 'WarningMsg', 'Windhelm', '', 'none' )
call s:HL( 'SpecialKey', 'Mirmulnir', '', '' )
"TODO
"call s:HL( 'Ignore', '', '', '' )


" Variable Types:
"--------------------------------------------------------------------------------
call s:HL( 'Constant', 'Kruziikrel', '', 'none' )
call s:HL( 'String', 'Paarthurnax', 'Ivarstead', 'none' )
call s:HL( 'Character', 'Odahviing', '', 'none' )
call s:HL( 'Number', 'Odahviing', '', 'none' )
call s:HL( 'Boolean', 'Odahviing', '', 'none' )
call s:HL( 'Float', 'Odahviing', '', 'none' )
call s:HL( 'Identifier', 'Mirmulnir', '', 'none' )
call s:HL( 'Function', 'Durnehviir', '', 'none' )
"TODO
"call s:HL( 'StringDelimiter', '', '', '' )


" Language Constructs:
"--------------------------------------------------------------------------------
call s:HL( 'Statement', 'Relonikiv', '', 'none' )
call s:HL( 'Conditional', 'Relonikiv', '', 'none' )
call s:HL( 'Repeat', 'Relonikiv', '', 'none' )
call s:HL( 'Label', 'Relonikiv', '', 'none' )
call s:HL( 'Operator', 'Relonikiv', '', 'none' )
call s:HL( 'Keyword', 'Relonikiv', '', 'none' )
call s:HL( 'Exception', 'Relonikiv', '', 'none' )
call s:HL( 'Comment', 'Winterhold', '', 'none' )
call s:HL( 'SpecialComment', 'Winterhold', 'Solitude', 'reverse' )
call s:HL( 'Special', 'Windhelm', '', 'none' )
"TODO
"call s:HL( 'SpecialChar', '', '', '' )
"call s:HL( 'Tag', '', '', '' )
"call s:HL( 'Delimiter', '', '', '' )
"call s:HL( 'SpecialComment', '', '', '' )
"call s:HL( 'Debug', '', '', '' )


" C Like:
"--------------------------------------------------------------------
call s:HL( 'PreProc', 'Sahrotaar', '', 'none' )
call s:HL( 'Include', 'Sahrotaar', '', 'none' )
call s:HL( 'Define', 'Sahrotaar', '', 'none' )
call s:HL( 'Macro', 'Sahrotaar', '', 'none' )
call s:HL( 'PreCondit', 'Sahrotaar', '', 'none' )
call s:HL( 'Type', 'Viinturuth', '', 'none' )
call s:HL( 'StorageClass', 'Viinturuth', '', 'none' )
call s:HL( 'Structure', 'Viinturuth', '', 'none' )
call s:HL( 'Typedef', 'Viinturuth', '', 'none' )


" HTML:
"--------------------------------------------------------------------
call s:HL( 'htmlArg', 'Durnehviir', '', 'none' )
call s:HL( 'htmlItalic', 'Sahrotaar', '', 'none' )


" Diff:
"--------------------------------------------------------------------
call s:HL( 'DiffAdd', 'Ivarstead', 'Dawnstar', 'none' )
call s:HL( 'DiffChange', 'Ivarstead', 'Morthal', 'none' )
call s:HL( 'DiffDelete', 'Ivarstead', 'Windhelm', 'none' )
call s:HL( 'DiffText', 'Ivarstead', 'Falkreath', 'none' )


" Completion Menu:
"--------------------------------------------------------------------
call s:HL( 'Pmenu', 'Winterhold', 'Solitude', 'none' )
call s:HL( 'PmenuSel', 'Whiterun', 'Krosulhah', 'none' )
call s:HL( 'PmenuSbar', '', 'Solitude', 'none' )
call s:HL( 'PmenuThumb', '', 'Whiterun', '' )


" Spelling:
"--------------------------------------------------------------------
call s:HL( 'SpellBad', 'Windhelm', '', 'undercurl' )
"TODO
"call s:HL( 'SpellCap', '', '', '' )
"call s:HL( 'SpellLocal', '', '', '' )
"call s:HL( 'SpellRare', '', '', '' )


" Aura Whisper:
"--------------------------------------------------------------------
if g:alduin_Shout_Aura_Whisper
    call s:HL( 'MatchParen', 'Ivory', 'Skyrim', 'underline' )
end


" Fire Breath:
if g:alduin_Shout_Fire_Breath
    call s:HL( 'Special', 'Sahloknir', '', 'none' )
    call s:HL( 'Title', 'Windhelm', '', 'none' )
end


" Become Ethereal: 
"--------------------------------------------------------------------
if g:alduin_Shout_Become_Ethereal
    call s:HL( 'Normal', 'Whiterun', 'Oblivion', 'none' )
    call s:HL( 'LineNr', 'Riften', 'Abyss','none' )
    call s:HL( 'String', 'Paarthurnax', 'Solitude', 'none' )
    call s:HL( 'CursorLine', '', 'Solitude', 'none' )
    call s:HL( 'TabLineFill', 'Winterhold', 'Abyss', 'none' )
    call s:HL( 'TabLine', 'Winterhold', 'Abyss', 'none' )
    call s:HL( 'VertSplit', 'Winterhold', 'Solitude', 'none' )
    call s:HL( 'FoldColumn', 'Mirmulnir', 'Oblivion', '' )
    call s:HL( 'SignColumn', 'Winterhold', 'Abyss','none' )
end


" Contract Vampirism: 
"--------------------------------------------------------------------
if g:alduin_Contract_Vampirism
    let alduin_Hour = strftime("%H") 
    if 7 <= alduin_Hour && alduin_Hour < 17
        let g:alduin_Shout_Become_Ethereal = 0
    else
        let g:alduin_Shout_Become_Ethereal = 1
    endif
end
