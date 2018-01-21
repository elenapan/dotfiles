
"    ███████╗██╗███████╗██████╗ ██████╗  █████╗
"    ██╔════╝██║██╔════╝██╔══██╗██╔══██╗██╔══██╗
"    ███████╗██║█████╗  ██████╔╝██████╔╝███████║
"    ╚════██║██║██╔══╝  ██╔══██╗██╔══██╗██╔══██║
"    ███████║██║███████╗██║  ██║██║  ██║██║  ██║
"    ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝


" A Terminal Vim colorscheme 
" Author:       Alessandro Yorba 
" Maintainer:   Alessandro Yorba
" Script URL:   https://github.com/AlessandroYorba/Sierra
" License:      MIT


set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif


" Day Twilight Midnight Pitch Campire:
"----------------------------------------------------------------
let g:colors_name="sierra"

if !exists("g:sierra_Twilight") " {{{
    let g:sierra_Twilight = 0
endif " }}}

if !exists("g:sierra_Midnight") " {{{
    let g:sierra_Midnight = 0
endif " }}}

if !exists("g:sierra_Pitch") " {{{
    let g:sierra_Pitch = 0
endif " }}}

if !exists("g:sierra_Campfire") " {{{
    let g:sierra_Campfire = 0
endif " }}}

if !exists("g:sierra_MatchParen_Underline") " {{{
    let g:sierra_MatchParen_Underline = 0
endif " }}}


" Colors:
"----------------------------------------------------------------
let s:sierra = {}

let s:sierra.Abyss       = [ '000000', 16  ]
let s:sierra.Lilac       = [ '5f5f87', 60  ]
let s:sierra.Cactus      = [ '5f8700', 64  ]
let s:sierra.Lake        = [ '5f8787', 66  ]
let s:sierra.Dusk        = [ '875f5f', 95  ]
let s:sierra.Heather     = [ '8787af', 103 ]
let s:sierra.Sage        = [ '87af5f', 107 ]
let s:sierra.Marsh       = [ '87af87', 108 ]
let s:sierra.Oasis       = [ '87afaf', 109 ]
let s:sierra.Azure       = [ '87afd7', 110 ]
let s:sierra.Agave       = [ '87d787', 114 ]
let s:sierra.Bluebells   = [ 'af5f00', 130 ]
let s:sierra.Firecracker = [ 'af5f5f', 131 ]
let s:sierra.Evening     = [ 'af8787', 138 ]
"let s:sierra.Shrub      = [ 'afaf5f', 143 ]
let s:sierra.Flats       = [ 'afaf87', 144 ]
let s:sierra.Lavender    = [ 'afafd7', 146 ]
let s:sierra.Nolana      = [ 'afd7d7', 152 ]
"let s:sierra.Aloe       = [ 'afff87', 156 ]
let s:sierra.Rose        = [ 'd75f5f', 167 ]
let s:sierra.Bellflower  = [ 'd78787', 174 ]
let s:sierra.Mallow      = [ 'dfaf5f', 179 ]
"let s:sierra.Primrose   = [ 'dfdf87', 186 ]
let s:sierra.Dune        = [ 'dfdfaf', 187 ]
let s:sierra.Stars       = [ 'dfdfdf', 188 ]
"let s:sierra.Wildflower = [ 'dfff87', 192 ]
let s:sierra.Claret      = [ 'ff8787', 210 ]
let s:sierra.Sunset      = [ 'ffafaf', 217 ]
"let s:sierra.Marigold   = [ 'ffff87', 228 ]
"let s:sierra.Sunflower  = [ 'ffffaf', 229 ]
let s:sierra.Salt        = [ 'ffffff', 231 ]
let s:sierra.Pitch       = [ '080808', 232 ]
let s:sierra.Midnight    = [ '121212', 233 ]
let s:sierra.Twilight    = [ '1c1c1c', 234 ]
let s:sierra.Shadow      = [ '262626', 235 ]
let s:sierra.Day         = [ '303030', 236 ]
let s:sierra.Shade       = [ '3a3a3a', 237 ]
let s:sierra.Pebble      = [ '4e4e4e', 239 ]
let s:sierra.Graphite    = [ '585858', 240 ]
let s:sierra.Slate       = [ '767676', 243 ]
let s:sierra.Stone       = [ '8a8a8a', 245 ]
let s:sierra.Cloud       = [ 'e4e4e4', 254 ]


function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let highlightString = 'hi ' . a:group . ' '

    " Settings for highlight group ctermfg & guifg 
    if strlen(a:fg)
        if a:fg == 'fg'
            let highlightString .= 'guifg=fg ctermfg=fg '
        else
            let color = get(s:sierra, a:fg)
            let highlightString .= 'guifg=#' . color[0] . ' ctermfg=' . color[1] . ' '
        endif
    endif

    " Settings for highlight group termbg & guibg 
    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let highlightString .= 'guibg=bg ctermbg=bg '
        else
            let color = get(s:sierra, a:1)
            let highlightString .= 'guibg=#' . color[0] . ' ctermbg=' . color[1] . ' '
        endif
    endif

    " Settings for highlight group cterm & gui 
    if a:0 >= 2 && strlen(a:2)
        let highlightString .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    " Settings for highlight guisp
    if a:0 >= 3 && strlen(a:3)
        let color = get(s:sierra, a:3)
        let highlightString .= 'guisp=#' . color[0] . ' '
    endif

    " echom highlightString

    execute highlightString
endfunction


" Editor Settings:
"--------------------------------------------------------------------------------
call s:HL( 'Normal', 'Cloud', 'Day', 'none' )
call s:HL( 'CursorLine', '', 'Shade', 'none' )
call s:HL( 'LineNr', 'Slate', 'Day','none' )
call s:HL( 'CursorLineNR', 'Dune', '', 'none' )
"TODO
"call s:HL( 'Cursor', '', '',          '' )


" Number Column:
"--------------------------------------------------------------------------------
call s:HL( 'Folded', 'Dune', 'Lake', 'none' )
call s:HL( 'FoldColumn', 'Oasis', 'Day', '' )
call s:HL( 'SignColumn', 'Marsh', 'Day', 'none' )      
"TODO
"call s:HL( 'CursorColumn', '', '', '' )


" WindowTab Delimiters:
"--------------------------------------------------------------------------------
call s:HL( 'VertSplit', 'Shade', 'Shadow', 'none' )
call s:HL( 'TabLine', 'Pebble', 'Shadow', 'none' )
call s:HL( 'TabLineFill', '', 'Shadow', 'none' )
"TODO
"call s:HL( 'ColorColumn', '', '', '' )
"call s:HL( 'TabLineSel', '', '', 'none' )


" File Navigation: 
"--------------------------------------------------------------------------------
call s:HL( 'Directory', 'Evening', '', 'none' )
call s:HL( 'Search', 'Dune', 'Dusk', 'none' )
"TODO
"call s:HL( 'IncSearch', '', '', 'reverse' )


" Prompt Status:
"--------------------------------------------------------------------------------
call s:HL( 'StatusLine', 'Shadow', 'Flats', 'none' )
call s:HL( 'StatusLineNC', 'Slate', 'Shadow', 'none' )
call s:HL( 'WildMenu', 'Dune', 'Dusk', 'none' )
call s:HL( 'Title', 'Bellflower', '', 'none' )
call s:HL( 'ModeMsg', 'Flats', '', 'none' )
call s:HL( 'Question', 'Mallow', '', '' )
call s:HL( 'MoreMsg', 'Mallow', '', 'none' )


" Visual Aid: 
"-------------------------------------------------------------------------------
call s:HL( 'MatchParen', 'Midnight', 'Stone', 'none' )
call s:HL( 'Visual', 'Dune', 'Dusk', 'none' )
call s:HL( 'NonText', 'Pebble', '', 'none' )
call s:HL( 'Todo', 'Flats', 'Twilight', 'italic' )
call s:HL( 'Error', 'Firecracker', 'Shadow', 'reverse' )
call s:HL( 'ErrorMsg', 'Firecracker', 'Shadow', 'reverse' )
call s:HL( 'SpecialKey', 'Azure', '', '' )
call s:HL( 'Underlined', 'Azure', '', 'none' )
call s:HL( 'WarningMsg', 'Bluebells', '', 'none' )
"TODO
"call s:HL( 'Ignore', '', '', '' )
"call s:HL( 'VisualNOS', '', '', 'underline' )



" Variable Types:
"--------------------------------------------------------------------------------
call s:HL( 'Constant', 'Claret', '', 'none' )
call s:HL( 'String', 'Sunset', '', 'none' )
call s:HL( 'Identifier', 'Oasis', '', 'none' )
call s:HL( 'Function', 'Nolana', '', 'none' )
"TODO
"call s:HL( 'StringDelimiter', '', '', '' )
"call s:HL( 'Character', '', '', 'none' )
"call s:HL( 'Number', '', '', 'none' )
"call s:HL( 'Boolean', '', '', 'none' )
"call s:HL( 'Float', '', '', 'none' )


" Language Constructs:
"--------------------------------------------------------------------------------
call s:HL( 'Statement', 'Lake', '', 'none' )
call s:HL( 'Operator', 'Dune', '', 'none' )
call s:HL( 'Comment', 'Slate', '', 'none' )
call s:HL( 'Special', 'Mallow', '', 'none' )
"TODO
"call s:HL( 'SpecialChar', '', '', '' )
"call s:HL( 'Tag', '', '', '' )
"call s:HL( 'Delimiter', '', '', '' )
"call s:HL( 'SpecialComment', '', '', '' )
"call s:HL( 'Debug', '', '', '' )
"call s:HL( 'Conditional', '', '', 'none' )
"call s:HL( 'Repeat', '', '', 'none' )
"call s:HL( 'Label', '', '', 'none' )
"call s:HL( 'Keyword', '', '', 'none' )
"call s:HL( 'Exception', '', '', 'none' )


" C Like:
"--------------------------------------------------------------------------------
call s:HL( 'PreProc', 'Rose', '', 'none' )
call s:HL( 'Type', 'Evening', '', 'none' )
"TODO
"call s:HL( 'Include', '', '', 'none' )
"call s:HL( 'Define', '', '', 'none' )
"call s:HL( 'Macro', '', '', 'none' )
"call s:HL( 'PreCondit', '', '', 'none' )
"call s:HL( 'StorageClass', '', '', 'none' )
"call s:HL( 'Structure', '', '', 'none' )
"call s:HL( 'Typedef', '', '', 'none' )


" HTML:
"--------------------------------------------------------------------
call s:HL( 'htmlItalic', 'Rose', '', 'none' )
call s:HL( 'htmlArg', 'Mallow', '', 'none' )
"TODO
"call s:HL( 'htmlTagName', '', '', 'none' )
"call s:HL( 'htmlTag', '', '', 'none' )
"call s:HL( 'htmlEndTag', '', '', 'none' )
"call s:HL( 'htmlSpecialTagName', 'Mallow', '', 'none' )


" Diff:
"--------------------------------------------------------------------
call s:HL( 'DiffAdd', 'Twilight', 'Lavender', 'none' )
call s:HL( 'DiffChange', 'Twilight', 'Lilac', 'none' )
call s:HL( 'DiffDelete', 'Twilight', 'Firecracker', 'none' )
call s:HL( 'DiffText', 'Twilight', 'Heather', 'none' )


" Completion Menu:
"--------------------------------------------------------------------
call s:HL( 'Pmenu', 'Slate', 'Shadow', 'none' )
call s:HL( 'PmenuSel', 'Dune', 'Dusk', 'none' )
"TODO
"call s:HL( 'PmenuSbar', '', '', 'none' )
"call s:HL( 'PmenuThumb', '', '', '' )


" Spelling:                             
"--------------------------------------------------------------------
call s:HL( 'SpellBad', 'Firecracker', '', 'undercurl' )
"TODO
"call s:HL( 'SpellCap', '', '', '' )
"call s:HL( 'SpellLocal', '', '', '' )
"call s:HL( 'SpellRare', '', '', '' )


" Twilight: 
"--------------------------------------------------------------------
if g:sierra_Twilight 
    call s:HL( 'Normal', 'Stars', 'Twilight', 'none' )
    call s:HL( 'LineNr', 'Slate', 'Twilight', 'none' )
    call s:HL( 'SignColumn', 'Marsh', 'Twilight', 'none' )      
    call s:HL( 'NonText', 'Shade', '', '' )
    call s:HL( 'VertSplit', 'Day', 'Midnight', 'none' )
    call s:HL( 'CursorLine', '', 'Shadow', 'none' )
    call s:HL( 'Comment', 'Slate', '', 'none' )
    call s:HL( 'TabLineFill', '', 'Midnight', 'none' )
    call s:HL( 'TabLine', 'Shade', 'Midnight', 'none' )
    call s:HL( 'StatusLineNc', '', 'Midnight', 'none' )
    call s:HL( 'Pmenu', '', 'Shadow', 'none' )
    call s:HL( 'Error', 'Firecracker', 'Twilight', 'reverse' )
    call s:HL( 'ErrorMsg', 'Firecracker', 'Twilight', 'reverse' )
    call s:HL( 'FoldColumn', 'Oasis', 'Twilight', '' )
end


" Midnight: 
"--------------------------------------------------------------------
if g:sierra_Midnight
    call s:HL( 'Normal', 'Stars', 'Midnight', 'none')
    call s:HL( 'LineNr', 'Graphite', 'Midnight', 'none')
    call s:HL( 'SignColumn', 'Marsh', 'Midnight', 'none' )      
    call s:HL( 'NonText', 'Shade', '', '' )
    call s:HL( 'VertSplit', 'Twilight', 'Pitch', 'none' )
    call s:HL( 'CursorLine', '', 'Twilight', 'none' )
    call s:HL( 'Comment', 'Graphite', '', 'none' )
    call s:HL( 'TabLineFill', '', 'Pitch', 'none' )
    call s:HL( 'TabLine', 'Shade', 'Pitch', 'none' )
    call s:HL( 'StatusLineNc', '','Pitch', 'none' )
    call s:HL( 'Pmenu', 'Pebble', 'Twilight', 'none' )
    call s:HL( 'Error', 'Firecracker', 'Midnight', 'reverse' )
    call s:HL( 'ErrorMsg', 'Firecracker', 'Midnight', 'reverse' )
    call s:HL( 'FoldColumn', 'Oasis', 'Midnight', '' )
end


" Pitch: 
"--------------------------------------------------------------------
if g:sierra_Pitch
    call s:HL( 'Normal', 'Stars', 'Pitch', 'none')
    call s:HL( 'LineNr', 'Pebble', 'Pitch', 'none')
    call s:HL( 'SignColumn', 'Marsh', 'Pitch', 'none' )      
    call s:HL( 'NonText', 'Shadow', '', '' )
    call s:HL( 'VertSplit', 'Twilight', 'Abyss', 'none' )
    call s:HL( 'CursorLine', '', 'Midnight', 'none' )
    call s:HL( 'Comment', 'Pebble', '', 'none' )
    call s:HL( 'TabLineFill', '', 'Abyss', 'none' )
    call s:HL( 'TabLine', 'Shadow', 'Abyss', 'none' )
    call s:HL( 'StatusLineNc', '','Abyss', 'none' )
    call s:HL( 'Pmenu', 'Pebble', 'Midnight', 'none' )
    call s:HL( 'Error', 'Firecracker', 'Pitch', 'reverse' )
    call s:HL( 'ErrorMsg', 'Firecracker', 'Pitch', 'reverse' )
    call s:HL( 'FoldColumn', 'Oasis', 'Pitch', '' )
end


" MatchParen Underline:
"--------------------------------------------------------------------
if g:sierra_MatchParen_Underline
    call s:HL( 'MatchParen', 'Salt', 'Pitch', 'underline' )
end


" Campfire:
"--------------------------------------------------------------------
if g:sierra_Campfire
    let sierra_Hour = strftime("%H") 

    if 7 <= sierra_Hour && sierra_Hour < 17
        let g:sierra_Twilight = 0
        let g:sierra_Midnight = 0
        let g:sierra_Pitch = 0

    elseif 17 <= sierra_Hour && sierra_Hour < 20
        let g:sierra_Twilight = 1

    elseif 20 <= sierra_Hour && sierra_Hour < 24
        let g:sierra_Twilight = 0
        let g:sierra_Midnight = 1

    else 
        let g:sierra_Midnight = 0
        let g:sierra_Pitch = 1

    endif
end
