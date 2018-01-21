" Vim color file
" An easy-breezy color theme that acts as a soothing balm for your eyes.

" Maintainer:   Bidit Mazumder <biditm[AT]users[DOT]sf[DOT]net>
" Last Change:  May 16, 2012

" background
set background=light
if version > 580
" remove existing highlighting and set the defaults
    hi clear
    if exists("syntax_on")
" load syntax highlighting defaults, if it's enabled
    syntax reset
    endif
endif

let g:colors_name="sonoma"

" colors used from rgb.txt
" RoyalBlue      #4169E1
" MediumBlue     #0000CD
" GhostWhite     #F8F8FF
" Black          #000000
" FireBrick      #B22222
" Red            #FF0000
" Crimson        #DC143C
" Peru           #CD853F
" DarkGrey       #A9A9A9
" Silver         #C0C0C0
" Gainsboro      #DCDCDC

" custom colors
" Sonoma         #DFDBC3
" CoffeeBean     #4D2F2D
" Lavender       #FDD7FF
" DarkOrchid     #B91BC7
" Bubblegum      #FDD7D6
" Suede          #943A20
" Aqua           #B4FFFF
" VeryGreen      #4BA50E
" Turquoise      #3AE6E7
" DarkCyan       #2BA3B8
" MellowYellow   #E7E700
" KissTheSky     #69D7FF

" highlight normal
hi Normal                          guifg=#4D2F2D  guibg=#DFDBC3

" gui highlight cursor
hi iCursor                         guifg=#DFDBC3  guibg=#943A20
hi Cursor                          guifg=#000000  guibg=#4169E1

set guicursor+=n-c:blinkwait800-iCursor

set guicursor+=i-v:ver10-Cursor
set guicursor+=r:hor10-Cursor

set guicursor+=ci:ver10-iCursor
set guicursor+=cr:hor10-iCursor

set guicursor+=sm:iCursor
set guicursor+=o:hor50-Error

" highlight groups
hi SpecialKey                      guifg=#4169E1
hi NonText       gui=bold          guifg=#4169E1
hi Directory                       guifg=#4169E1
hi ErrorMsg                        guifg=#F8F8FF  guibg=#DC143C
hi IncSearch     gui=reverse
hi Search                                         guibg=#E7E700
hi MoreMsg       gui=bold          guifg=#4BA50E
hi ModeMsg       gui=bold          guifg=#943A20
hi LineNr                          guifg=#CD853F
hi Question                        guifg=#4BA50E
hi StatusLine    gui=bold          guifg=bg       guibg=#943A20
hi StatusLineNC  gui=reverse
hi VertSplit     gui=reverse
hi Title         gui=bold          guifg=#B91BC7
hi Visual                                         guibg=#C0C0C0
" hi VisualNOS
hi WarningMsg                      guifg=#B22222
hi WildMenu                        guifg=#000000  guibg=#E7E700
hi Folded                          guifg=#0000CD  guibg=#A9A9A9
hi FoldColumn                      guifg=#0000CD  guibg=#A9A9A9
hi DiffAdd                                        guibg=#69D7FF
hi DiffChange                                     guibg=#FDD7FF
hi DiffDelete    gui=bold          guifg=#4169E1  guibg=#B4FFFF
hi DiffText      gui=bold          guifg=#DCDCDC  guibg=#FF0000
hi SignColumn                      guifg=#0000CD  guibg=#A9A9A9
" hi Conceal
hi SpellBad      gui=bold,undercurl                              guisp=#FF0000
hi SpellCap      gui=undercurl                                   guisp=#4169E1
hi SpellRare     gui=undercurl                                   guisp=#B91BC7
hi SpellLocal    gui=undercurl                                   guisp=#2BA3B8
hi Pmenu                                          guibg=#FDD7FF
hi PmenuSel                                       guibg=#C0C0C0
hi PmenuSbar                                      guibg=#A9A9A9
hi PmenuThumb    gui=reverse
hi TabLine       gui=underline                    guibg=#C0C0C0
hi TabLineSel    gui=bold          guifg=#943A20
hi TabLineFill   gui=reverse
hi CursorColumn                                   guibg=#C0C0C0
" hi CursorLine
hi ColorColumn                                    guibg=#FDD7D6

" syntax highlight
hi MatchParen                                     guibg=#3AE6E7
hi Comment                         guifg=#4169E1
hi Constant                        guifg=#B22222
hi Special                         guifg=#B91BC7
hi Identifier                      guifg=#2BA3B8
hi Statement     gui=bold          guifg=#CD853F
hi PreProc                         guifg=#B91BC7
hi Type          gui=bold          guifg=#4BA50E
hi Underlined    gui=underline     guifg=#B91BC7
hi Ignore                          guifg=#F8F8FF
hi Error                           guifg=#F8F8FF  guibg=#FF0000
hi Todo                            guifg=#4169E1  guibg=#E7E700

" linked groups
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
