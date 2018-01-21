" ============================================================================
" File: saturn.vim
" Description: A light colorscheme
" License: MIT
" ============================================================================


set background=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "saturn"


fu! s:hsl2color(h, s, l)
    let [h, s, l] = s:normalize(a:h, a:s, a:l)
    let m2 = l <= 0.5 ? l * (s + 1) : l + s - l * s
    let m1 = l * 2 - m2
    let rgb = []
    for h_ in [h + (1/3.0), h, h - (1/3.0)]
        let h_ = h_ < 0 ? h_ + 1 : h_ > 1 ? h_ - 1 : h_
        let v =
            \ h_ * 6 < 1 ? m1 + (m2 - m1) * h_ * 6 :
            \ h_ * 2 < 1 ? m2 :
            \ h_ * 3 < 2 ? m1 + (m2 - m1) * (2/3.0 - h_) * 6 :
            \ m1
        let rgb += [float2nr(255 * v)]
    endfor
    return printf('%02x%02x%02x', rgb[0], rgb[1], rgb[2])
endfu

fu! s:normalize(h, s, l)
    let h = s:clamp(a:h, 0, 360)
    let s = s:clamp(a:s, 0, 100)
    let l = s:clamp(a:l, 0, 100)
    return [h/360.0, s/100.0, l/100.0]
endfu

fu! s:clamp(value, bottom, up)
    let value = a:value < a:up ? a:value : a:up
    let value = value > a:bottom ? value : a:bottom
    return value
endfu

let s:grey_very_dark =   [s:hsl2color(220, 10, 45), 239]
let s:grey_dark =        [s:hsl2color(220, 10, 55), 242]
let s:grey =             [s:hsl2color(220, 10, 70), 244]
let s:grey_light =       [s:hsl2color(220, 20, 90), 252]
let s:grey_very_light =  [s:hsl2color(220, 30, 97), 255]
let s:blue =             [s:hsl2color(215, 20, 60), 60 ]
let s:blue_light =       [s:hsl2color(210, 25, 65), 60 ]
let s:aqua =             [s:hsl2color(180, 20, 65), 65 ]
let s:green =            [s:hsl2color(90,  30, 65), 107]
let s:purple =           [s:hsl2color(310, 20, 60), 140]
let s:pink =             [s:hsl2color(310, 20, 80), 109]
let s:red =              [s:hsl2color(0,   60, 70), 203]
let s:orange =           [s:hsl2color(30,  65, 70), 215]
let s:gold =             [s:hsl2color(50,  90, 85), 221]


fu! <SID>H(group, fg, bg, attr)
    if !empty(a:fg)
        exe "hi" a:group "guifg=#".a:fg[0] "ctermfg=".a:fg[1]
    endif
    if !empty(a:bg)
        exe "hi" a:group "guibg=#".a:bg[0] "ctermbg=".a:bg[1]
    endif
    if a:attr != ""
         exe "hi" a:group "gui=".a:attr "cterm=".a:attr
    endif
endfu


if has("gui_running") || &t_Co == 88 || &t_Co == 256

    " normal text
    call <SID>H("Normal", s:grey_very_dark, s:grey_very_light, "")

    " custom highlighting
    call <SID>H("NormalBlue", s:blue, "", "none")
    call <SID>H("NormalBlueReverse", s:blue, "", "reverse")
    call <SID>H("NormalBlueBold", s:blue, "", "bold")
    call <SID>H("NormalBlueBoldReverse", s:blue, "", "reverse,bold")
    call <SID>H("NormalBlueLight", s:blue_light, "", "none")
    call <SID>H("NormalBlueLightReverse", s:blue_light, "", "reverse")
    call <SID>H("NormalBlueLightBold", s:blue_light, "", "bold")
    call <SID>H("NormalBlueLightBoldReverse", s:blue_light, "", "reverse,bold")
    call <SID>H("NormalRed", s:red, "", "none")
    call <SID>H("NormalRedReverse", s:red, "", "reverse")
    call <SID>H("NormalRedBold", s:red, "", "bold")
    call <SID>H("NormalRedBoldReverse", s:red, "", "reverse,bold")
    call <SID>H("NormalOrange", s:orange, "", "none")
    call <SID>H("NormalOrangeReverse", s:orange, "", "reverse")
    call <SID>H("NormalOrangeBold", s:orange, "", "bold")
    call <SID>H("NormalOrangeBoldReverse", s:orange, "", "reverse,bold")
    call <SID>H("NormalAqua", s:aqua, "", "none")
    call <SID>H("NormalAquaReverse", s:aqua, "", "reverse")
    call <SID>H("NormalAquaBold", s:aqua, "", "bold")
    call <SID>H("NormalAquaBoldReverse", s:aqua, "", "reverse,bold")
    call <SID>H("NormalGreen", s:green, "", "none")
    call <SID>H("NormalGreenReverse", s:green, "", "reverse")
    call <SID>H("NormalGreenBold", s:green, "", "bold")
    call <SID>H("NormalGreenBoldReverse", s:green, "", "reverse,bold")
    call <SID>H("NormalPurple", s:purple, "", "none")
    call <SID>H("NormalPurpleReverse", s:purple, "", "reverse")
    call <SID>H("NormalPurpleBold", s:purple, "", "bold")
    call <SID>H("NormalPurpleBoldReverse", s:purple, "", "reverse,bold")
    call <SID>H("NormalGrey", s:grey, "", "none")
    call <SID>H("NormalGreyReverse", s:grey, "", "reverse")
    call <SID>H("NormalGreyBold", s:grey, "", "reverse")
    call <SID>H("NormalGreyBoldReverse", s:grey, "", "reverse,bold")
    call <SID>H("NormalGreyDark", s:grey_dark, "", "none")
    call <SID>H("NormalGreyDarkReverse", s:grey_dark, "", "reverse")
    call <SID>H("NormalGreyDarkBold", s:grey_dark, "", "bold")
    call <SID>H("NormalGreyDarkBoldReverse", s:grey_dark, "", "reverse")

    " the character under the cursor
    call <SID>H("Cursor", "", s:pink, "")

    " '~' and '@' at the end of the window, characters from 'showbreak' and
    " other characters that do not really exist in the text (e.g., '>'
    " displayed when a double-wide character doesn't fit at the end of the
    " line).
    call <SID>H("NonText", s:grey, "", "none")

    " meta and special keys listed with ':map', also for text used to show
    " unprintable characters in the text, 'listchars'. Generally: text that is
    " displayed differently from what it really is.
    call <SID>H("SpecialKey", s:grey_light, "", "none")

    " last search pattern highlighting (see 'hlsearch'). Also used for
    " highlighting the current line in the quickfix window and similar items
    " that need to stand out.
    call <SID>H("Search", "", s:gold, "")

    " 'incsearch' highlighting; also used for the text replaced with ':s///c'
    call <SID>H("IncSearch", s:gold, s:grey_very_dark, "")

    " status line of current window
    call<SID>H("StatusLine", s:blue, s:grey_light, "none")

    " status lines of not-current windows
    call <SID>H("StatusLineNC", s:grey_light, s:grey, "inverse")

    " custom highlighting
    call <SID>H("StatusLineBold", s:blue, s:grey_light, "bold")
    call <SID>H("StatusLineBlueLight", s:blue_light, s:grey_light, "none")
    call <SID>H("StatusLineBlueLightBold", s:blue_light, s:grey_light, "bold")
    call <SID>H("StatusLineRed", s:red, s:grey_light, "none")
    call <SID>H("StatusLineRedBold", s:red, s:grey_light, "bold")
    call <SID>H("StatusLineOrange", s:orange, s:grey_light, "none")
    call <SID>H("StatusLineOrangeBold", s:orange, s:grey_light, "bold")
    call <SID>H("StatusLineAqua", s:aqua, s:grey_light, "none")
    call <SID>H("StatusLineAquaBold", s:aqua, s:grey_light, "bold")
    call <SID>H("StatusLineGreen", s:green, s:grey_light, "none")
    call <SID>H("StatusLineGreenBold", s:green, s:grey_light, "bold")
    call <SID>H("StatusLinePurple", s:purple, s:grey_light, "none")
    call <SID>H("StatusLinePurpleBold", s:purple, s:grey_light, "bold")
    call <SID>H("StatusLineGrey", s:grey, s:grey_light, "none")
    call <SID>H("StatusLineGreyBold", s:grey, s:grey_light, "bold")
    call <SID>H("StatusLineGreyDark", s:grey_dark, s:grey_light, "none")
    call <SID>H("StatusLineGreyDarkBold", s:grey_dark, s:grey_light, "bold")

    " the column separating vertically split windows
    call <SID>H("VertSplit", s:grey_very_light, s:aqua, "inverse")

    " visual mode selection
    call <SID>H("Visual", s:grey_very_dark, s:grey_light, "")

    " The character under the cursor or just before it, if it is a paired bracket, and its match.
    call <SID>H("MatchParen", s:grey_very_dark, s:grey_light, "")

    " directory names (and other special names in listings
    call <SID>H("Directory", s:purple, "", "")

    " line used for closed folds
    call <SID>H("Folded", s:grey, s:grey_very_light, "")
    " see 'foldcolumn'
    call <SID>H("FoldColumn", s:grey_very_light, s:grey_very_light, "")  " hidden

    " warning messages
    call <SID>H("WarningMsg", s:red, s:grey_very_light, "")

    " error messages on the command line
    call <SID>H("ErrorMsg", s:red, s:grey_very_light, "")

    " 'showmode' message (e.g., '-- INSERT --')
    call <SID>H("ModeMsg", s:green, "", "none")

    " more-prompt
    call <SID>H("MoreMsg", s:green, "", "none")

    " hit-enter prompt and yes/no questions
    call <SID>H("Question", s:green, "", "none")

    " current match in 'wildmenu' completion
    call <SID>H("WildMenu", s:grey_light, s:blue, "")

    " column where signs are displayed
    call <SID>H("SignColumn", "", s:grey_very_light, "")

    " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    call <SID>H("Linenr", s:grey, "", "")

    " diff mode: Added line
    call <SID>H("DiffAdd", s:grey_very_light, s:green, "none")

    " diff mode: Deleted line
    call <SID>H("DiffDelete", s:grey_very_light, s:red, "none")

    " diff mode: Changed line
    call <SID>H("DiffChange", s:grey_very_light, s:gold, "none")

    " diff mode: Changed text within a changed line
    call <SID>H("DiffText", s:grey_very_light, s:red, "none")

    if version >= 700

    " Cursorline
    call <SID>H("CursorLine", "", s:grey_light, "none")

    " Cursorline number
    call <SID>H("CursorLineNr", s:red, "", "none")

    " the screen column that the cursor is in when 'cursorcolumn' is set
    call <SID>H("CursorColumn", "", s:grey_dark, "")

    " popup menu: normal item
    call <SID>H("PMenu", s:blue, s:grey_light, "none")

    " popup menu: selected item
    call <SID>H("PMenuSel", s:grey_light, s:blue, "none")

    " popup menu: scrollbar
    call <SID>H("PMenuSBar", s:grey_light, s:grey_light, "none")

    " popup menu: Thumb of the scrollbar
    call <SID>H("PMenuThumb", s:grey_light, s:grey_dark, "none")

    " tab pages line, not active tab page label
    call <SID>H("TabLine", s:grey_dark, s:grey_light, "none")

    " tab pages line, active tab page label
    call <SID>H("TabLineSel", s:grey_dark, s:grey_very_light, "none")

    " tab pages line, where there are no labels
    call <SID>H("TabLineFill", s:grey_light, s:grey_light, "none")

    endif

    if version >= 703

    " used for the columns set with 'colorcolumn'
    call <SID>H("ColorColumn", "", s:grey_dark, "")

    " placeholder characters substituted for concealed text (see
    " 'conceallevel')
    call <SID>H("Conceal", s:grey_dark, s:grey_very_light, "")

    " word that is not recognized by the spellchecker. This will be combined with the
    " highlighting used otherwise
    call <SID>H("SpellBad", "", "", "undercurl")

    " word that should start with a capital. This will be combined with the highlighting
    " used otherwise
    call <SID>H("SpellCap", "", "", "")

    " word that is recognized by the spellchecker as one that is used in another region.
    " This will be combined with the highlighting used otherwise
    call <SID>H("SpellLocal", "", "", "")

    " word that is recognized by the spellchecker as one that is hardly ever used.
    " This will be combined with the highlighting used otherwise
    call <SID>H("SpellRare", "", "", "")

    " placeholder characters substituted for concealed text (see
    " 'conceallevel')
    call <SID>H("Hidden", s:grey_very_light, s:grey_very_light, "none")

    endif

    " any constant
    call <SID>H("Constant", s:grey_dark, "", "")

   " a string constant: 'this is a string'
    call <SID>H("String", s:green, "", "")

    " a character constant: 'c', '\n'
    call <SID>H("Character", s:aqua, "", "")

    " a number constant: 234, 0xff
    call <SID>H("Number", s:grey_dark, "", "")

    " a boolean constant: TRUE, false
    call <SID>H("Boolean", s:grey_dark, "", "")

    " a floating point constant: 2.3e10
    call <SID>H("Float", s:grey_dark, "", "")

    " any variable name
    call <SID>H("Identifier", s:grey_very_dark, "", "none")

    " function name (also: methods for classes)
    call <SID>H("Function", s:grey_dark, "", "")

    " any statement
    call <SID>H("Statement", s:blue, "", "none")

    " if, then, else, endif, switch, etc
    call <SID>H("Conditional", s:purple, "", "")

    "  case, default, etc.
    call <SID>H("Label", s:purple, "", "")

    " for, do, while, etc.
    call <SID>H("Repeat", s:orange, "", "")

    " any comment
    call <SID>H("Comment", s:grey, "", "")

    " 'sizeof', '+', '*', etc.
    call <SID>H("Operator", s:blue_light, "", "none")

    " any other keyword
    call <SID>H("Keyword", s:grey_very_dark, "", "")

    " try, catch, throw
    call <SID>H("Exception", s:red, "", "")

    " generic Preprocessor
    call <SID>H("PreProc", s:aqua, "", "")

    " preprocessor #include
    call <SID>H("Include", s:orange, "", "")

    " preprocessor #define
    call <SID>H("Define", s:orange, "", "none")

    " preprocessor #define
    call <SID>H("Macro", s:orange, "", "none")

    " preprocessor #if, #else, #endif, etc
    call <SID>H("PreCondit", s:purple, "", "")

    " int, long, char, etc.
    call <SID>H("Type", s:aqua, "", "none")

    " static, register, volatile, etc.
    call <SID>H("StorageClass", s:blue_light, "", "")

    " struct, union, enum, etc.
    call <SID>H("Structure", s:aqua, "", "")

    " a typedef
    call <SID>H("Typedef", s:aqua, "", "")

    " any special symbol
    call <SID>H("Special", s:grey, "", "")

    " text that stands out, HTML links
    call <SID>H("Underlined", s:grey_light, "", "underline")

    call <SID>H("Title", s:blue, "", "none")

    " any erroneous construct
    call <SID>H("Error", s:red, s:grey_very_light, "reverse")

    " anything that needs extra attention; mostly the keywords TODO, FIXME, XXX
    call <SID>H("Todo", s:red, s:grey_very_light, "bold")

    " Python
    call <SID>H("pythonDecorator", s:purple, "", "")
    call <SID>H("pythonDottedName", s:purple, "", "")

    " Html
    call <SID>H("htmlTitle", s:grey_very_dark, "", "")
    call <SID>H("htmlTagName", s:blue, "", "")
    call <SID>H("htmlArg", s:purple, "", "")
    call <SID>H("htmlEndTag", s:grey, "", "")
    call <SID>H("htmlTag", s:grey, "", "")
    call <SID>H("htmlSpecialChar", s:grey_dark, "", "")
    for header in range(1, 6)
        call <SID>H("htmlH" . header, s:grey_very_dark, "", "")
    endfor

    " Jinja
    call <SID>H("jinjaFilter", s:grey, "", "")

    " Css
    call <SID>H("cssIncludeKeyword", s:red, "", "")
    call <SID>H("cssTagName", s:purple, "", "")
    call <SID>H("cssClassName", s:purple, "", "")
    call <SID>H("cssPseudoClassId", s:purple, "", "")
    call <SID>H("cssIdName", s:purple, "", "")
    call <SID>H("cssIdentifier", s:purple, "", "")
    call <SID>H("cssProp", s:blue, "", "")
    call <SID>H("cssAttr", s:aqua, "", "")
    call <SID>H("cssColor", s:aqua, "", "")
    call <SID>H("cssValueLength", s:aqua, "", "")
    call <SID>H("cssValueNumber", s:aqua, "", "")
    call <SID>H("cssValueInteger", s:aqua, "", "")
    call <SID>H("cssValueFrequency", s:aqua, "", "")
    call <SID>H("cssValueTime", s:aqua, "", "")
    call <SID>H("cssUnitDecorators", s:aqua, "", "")

    " Javascript
    call <SID>H("jsStorageClass", s:blue, "", "")
    call <SID>H("jsGlobalObjects", s:grey_dark, "", "")
    call <SID>H("jsArgsObj", s:grey_dark, "", "")
    call <SID>H("jsExceptions", s:grey_dark, "", "")
    call <SID>H("jsBuiltins", s:grey_dark, "", "")
    call <SID>H("jsThis", s:grey_dark, "", "")
    call <SID>H("jsPrototype", s:grey_dark, "", "")
    call <SID>H("jsNull", s:grey_dark, "", "")
    call <SID>H("jsUndefined", s:grey_dark, "", "")
    call <SID>H("jsNaN", s:grey_dark, "", "")
    call <SID>H("jsBooleanFalse", s:grey_dark, "", "")
    call <SID>H("jsBooleanTrue", s:grey_dark, "", "")

    " Markdown
    call <SID>H("markdownCode", s:grey, "", "")
    call <SID>H("markdownUrl", s:blue, "", "")
    call <SID>H("markdownListMarker", s:aqua, "", "")
    call <SID>H("markdownBlockquote", s:aqua , "", "")
    call <SID>H("markdownBold", "", "", "bold")
    for header in range(1, 3)
        call <SID>H("htmlH" . header, s:purple, "", "bold")
    endfor
    for header in range(4, 6)
        call <SID>H("htmlH" . header, s:pink, "", "bold")
    endfor

endif

delf <SID>H

" vim: foldmethod=marker
