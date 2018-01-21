" Theme:        CandyPaper
" Author:       DF_XYZ
" License:      MIT

set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = "CandyPaper"

" Palette:
let s:pink         = "#de6fa6" "Include/Exception
let s:mongo        = "#dfde00" "Boolean/Special
let s:aqua         = "#6fd5de" "Keyword
let s:green        = "#6fde7c" "Type
let s:yellow       = "#dfad59" "String
let s:orange       = "#de7e38" "StorageClass
let s:red          = "#de4638" "Number
let s:purple       = "#a270df" "Repeat/Conditional
let s:blue         = "#6fb5de" "Operator/Delimiter

" Basic:
let s:foreground   = "#dddddd"
let s:background   = "#050505"
let s:nontext      = "#5a805a"
let s:window       = "#4d4d4d"
let s:divider      = "#ccc9ae"
let s:matchparen   = "#00805a"
let s:linenumber   = "#807c6d"
let s:comment      = "#5a805a"
let s:todo         = "#bcddbc"
let s:error        = "#de0000"

" Cursor:
let s:cursor_fg    = "#050505"
let s:cursor_bg    = "#dede9b"
let s:cursor_im_fg = "#050505"
let s:cursor_im_bg = "#9b9bde"
let s:cursorline   = "#262626"
let s:cursorcolumn = "#262626"

" ColorColumn:
let s:colorcolumn  = "#800000"

" Diff:
let s:difftext_bg  = "#cbb766"
let s:diffadd_bg   = "#264d26"
let s:diffdel_bg   = "#4d0000"
let s:diffmod_bg   = "#4d264d"

" Folded:
let s:folded_fg    = "#dddddd"
let s:folded_bg    = "#414d41"

" PMenu:
let s:pmenu_fg     = "#050505"
let s:pmenu_bg     = "#ccc5ad"
let s:pmenu_sel_fg = "#dddddd"
let s:pmenu_sel_bg = "#203780"
let s:pmenu_sbar   = "#4d4a41"
let s:pmenu_thumb  = "#ccccad"

" Search:
let s:search_fg    = "#dddddd"
let s:search_bg    = "#00805a"
let s:incsearch_fg = "#050505"
let s:incsearch_bg = "#dec837"

" StatusLine:
let s:statusline_active_fg   = "#050505"
let s:statusline_active_bg   = "#cbc8ad"
let s:statusline_inactive_fg = "#dddddd"
let s:statusline_inactive_bg = "#4a4d42"

" TabLine:
let s:tabline_bg          = "#cbc8ad"
let s:tabline_active_fg   = "#dddddd"
let s:tabline_active_bg   = "#050505"
let s:tabline_inactive_fg = "#050505"
let s:tabline_inactive_bg = "#cbc8ad"

" Visual:
let s:visual_fg    = "#dddddd"
let s:visual_bg    = "#2A3B4D"

" Returns an approximate grey index for the given grey level
function <SID>grey_number(x)
    if a:x < 14
        return 0
    else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
            return l:n
        else
            return l:n + 1
        endi
    endif
endfunction

" Returns the actual grey level represented by the grey index
function <SID>grey_level(n)
    if a:n == 0
        return 0
    else
        return 8 + (a:n * 10)
    endif
endfunction

" Returns the palette index for the given grey index
function <SID>grey_colour(n)
    if a:n == 0
        return 16
    elseif a:n == 25
        return 231
    else
        return 231 + a:n
    endif
endfunction

" Returns an approximate colour index for the given colour level
function <SID>rgb_number(x)
    if a:x < 75
        return 0
    else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
            return l:n
        else
            return l:n + 1
        endif
    endif
endfunction

" Returns the actual colour level for the given colour index
function <SID>rgb_level(n)
    if a:n == 0
        return 0
    else
        return 55 + (a:n * 40)
    endif
endfunction

" Returns the palette index for the given R/G/B colour indices
function <SID>rgb_colour(x, y, z)
    return 16 + (a:x * 36) + (a:y * 6) + a:z
endfunction

" Returns the palette index to approximate the given R/G/B colour levels
function <SID>colour(r, g, b)
    " Get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " Get the closest colour
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
        " There are two possibilities
        let l:dgr = <SID>grey_level(l:gx) - a:r
        let l:dgg = <SID>grey_level(l:gy) - a:g
        let l:dgb = <SID>grey_level(l:gz) - a:b
        let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
        let l:dr = <SID>rgb_level(l:gx) - a:r
        let l:dg = <SID>rgb_level(l:gy) - a:g
        let l:db = <SID>rgb_level(l:gz) - a:b
        let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
        if l:dgrey < l:drgb
            " Use the grey
            return <SID>grey_colour(l:gx)
        else
            " Use the colour
            return <SID>rgb_colour(l:x, l:y, l:z)
        endif
    else
        " Only one possibility
        return <SID>rgb_colour(l:x, l:y, l:z)
    endif
endfunction

" Returns the palette index to approximate the '#rrggbb' hex string
function <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 1, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 3, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 5, 2)) + 0

    return <SID>colour(l:r, l:g, l:b)
endfunction

" Sets the highlighting for the given group
function <SID>X(group, fg, bg, attr)
    if a:fg != ""
        exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    if a:bg != ""
        exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
endfunction

" UI Highlighting
call <SID>X("Normal", s:foreground, s:background, "none")
call <SID>X("NonText", s:nontext, "", "none")
call <SID>X("SpecialKey", s:nontext, "", "none")
call <SID>X("Search", s:search_fg, s:search_bg, "none")
call <SID>X("IncSearch", s:incsearch_fg, s:incsearch_bg, "none")
call <SID>X("LineNr", s:linenumber, "", "none")
call <SID>X("TabLine", s:tabline_inactive_fg, s:tabline_inactive_bg, "none")
call <SID>X("TabLineFill", "", s:tabline_bg, "none")
call <SID>X("TabLineSel", s:tabline_active_fg, s:tabline_active_bg, "none")
call <SID>X("StatusLine", s:statusline_active_fg, s:statusline_active_bg, "none")
call <SID>X("StatusLineNC", s:statusline_inactive_fg, s:statusline_inactive_bg, "none")
call <SID>X("VertSplit", s:divider, s:background, "none")
call <SID>X("Visual", s:visual_fg, s:visual_bg, "none")
call <SID>X("Directory", s:aqua, "", "none")
call <SID>X("ModeMsg", s:yellow, "", "none")
call <SID>X("MoreMsg", s:yellow, "", "none")
call <SID>X("Question", s:yellow, "", "none")
call <SID>X("WarningMsg", s:green, "", "none")
call <SID>X("MatchParen", s:mongo, s:matchparen, "none")
call <SID>X("Folded", s:folded_fg, s:folded_bg, "none")
call <SID>X("FoldColumn", "", s:background, "none")
call <SID>X("Cursor", s:cursor_fg, s:cursor_bg, "none")
call <SID>X("CursorIM", s:cursor_im_fg, s:cursor_im_bg, "none")
call <SID>X("CursorLine", "", s:cursorline, "none")
call <SID>X("CursorColumn", "", s:cursorcolumn, "none")
call <SID>X("ColorColumn", "", s:colorcolumn, "none")
call <SID>X("DiffText", s:background, s:difftext_bg, "none")
call <SID>X("DiffAdd", s:foreground, s:diffadd_bg, "none")
call <SID>X("DiffDelete", s:diffdel_bg, s:diffdel_bg, "none")
call <SID>X("DiffChange", s:foreground, s:diffmod_bg, "none")
call <SID>X("SignColumn", "", s:background, "none")
call <SID>X("PMenu", s:pmenu_fg, s:pmenu_bg, "none")
call <SID>X("PMenuSel", s:pmenu_sel_fg, s:pmenu_sel_bg, "none")
call <SID>X("PMenuSBar", "", s:pmenu_sbar, "none")
call <SID>X("PMenuThumb", s:pmenu_thumb, "", "none")

" Standard Group Highlighting:
call <SID>X("Boolean", s:mongo, "", "none")
call <SID>X("Character", s:yellow, "", "none")
call <SID>X("Comment", s:comment, "", "none")
call <SID>X("Conditional", s:purple, "", "none")
call <SID>X("Constant", s:red, "", "none")
call <SID>X("Debug", s:red, "", "none")
call <SID>X("Define", s:aqua, "", "none")
call <SID>X("Delimiter",s:blue, "", "none")
call <SID>X("Error", s:foreground, s:error, "none")
call <SID>X("Exception", s:pink, "", "none")
call <SID>X("Float", s:red, "", "none")
call <SID>X("Function", s:foreground, "", "none")
call <SID>X("Global", s:aqua, "", "none")
call <SID>X("Identifier", s:orange, "", "none")
call <SID>X("Include", s:pink, "", "none")
call <SID>X("Keyword", s:aqua, "", "none")
call <SID>X("Label", s:aqua, "", "none")
call <SID>X("Macro", s:aqua, "", "none")
call <SID>X("Number", s:red, "", "none")
call <SID>X("Operator", s:blue, "", "none")
call <SID>X("PreProc", s:aqua, "", "none")
call <SID>X("Repeat", s:purple, "", "none")
call <SID>X("Special", s:mongo, "", "none")
call <SID>X("Statement", s:green, "", "none")
call <SID>X("String", s:yellow, "", "none")
call <SID>X("Tag", s:mongo, "", "none")
call <SID>X("Todo", s:todo, s:background, "none")
call <SID>X("Title", s:comment, "", "none")
call <SID>X("Type", s:green, "", "none")
call <SID>X("Typedef", s:green, "", "none")
call <SID>X("PreCondit", s:blue, "", "none")
call <SID>X("SpecialChar", s:foreground, "", "none")
call <SID>X("StorageClass", s:orange, "", "none")
call <SID>X("Structure", s:aqua, "", "none")
call <SID>X("SpecialComment", s:comment, "", "none")

" C Highlighting
call <SID>X("cType", s:green, "", "none")
call <SID>X("cFormat", s:yellow, "", "none")
call <SID>X("cStorageClass", s:orange, "", "none")
call <SID>X("cBoolean", s:mongo, "", "none")
call <SID>X("cCharacter", s:yellow, "", "none")
call <SID>X("cConstant", s:mongo, "", "none")
call <SID>X("cConditional", s:purple, "", "none")
call <SID>X("cSpecial", s:yellow, "", "none")
call <SID>X("cDefine", s:aqua, "", "none")
call <SID>X("cNumber", s:red, "", "none")
call <SID>X("cPreCondit", s:blue, "", "none")
call <SID>X("cRepeat", s:purple, "", "none")
call <SID>X("cLabel",s:blue, "", "none")
call <SID>X("cOperator",s:blue, "", "none")
call <SID>X("cOctalZero", s:purple, "", "none")

" CPP highlighting
call <SID>X("cppBoolean", s:orange, "", "none")
call <SID>X("cppExceptions", s:pink, "", "none")
call <SID>X("cppStatement", s:aqua, "", "none")
call <SID>X("cppStorageClass", s:orange, "", "none")
call <SID>X("cppAccess",s:aqua, "", "none")

" HTML Highlighting
call <SID>X("htmlTitle", s:mongo, "", "none")
call <SID>X("htmlH1", s:mongo, "", "none")
call <SID>X("htmlH2", s:blue, "", "none")
call <SID>X("htmlH3", s:purple, "", "none")
call <SID>X("htmlH4", s:red, "", "none")
call <SID>X("htmlTag", s:green, "", "none")
call <SID>X("htmlTagN", s:green, "", "none")
call <SID>X("htmlTagName", s:green, "", "none")
call <SID>X("htmlEndTag", s:green, "", "none")
call <SID>X("htmlArg", s:aqua, "", "none")
call <SID>X("htmlScriptTag", s:green, "", "none")
call <SID>X("htmlBold", s:foreground, "", "none")
call <SID>X("htmlItalic", s:comment, "", "none")
call <SID>X("htmlBoldItalic", s:orange, "", "none")
call <SID>X("htmlSpecialTagName", s:red, "", "none")

" Java Highlighting
call <SID>X("javaExternal", s:pink, "", "none")
call <SID>X("javaAnnotation", s:red, "", "none")
call <SID>X("javaTypedef", s:blue, "", "none")
call <SID>X("javaClassDecl", s:aqua, "", "none")
call <SID>X("javaScopeDecl", s:purple, "", "none")
call <SID>X("javaStorageClass", s:orange, "", "none")
call <SID>X("javaBoolean", s:orange, "", "none")

" JavaScript Highlighting
call <SID>X("javaScriptBraces", s:aqua, "", "none")
call <SID>X("javaScriptParens", s:aqua, "", "none")
call <SID>X("javaScriptIdentifier", s:orange, "", "none")
call <SID>X("javaScriptFunction", s:green, "", "none")
call <SID>X("javaScriptConditional", s:purple, "", "none")
call <SID>X("javaScriptRepeat", s:purple, "", "none")
call <SID>X("javaScriptBoolean", s:red, "", "none")
call <SID>X("javaScriptMember", s:orange, "", "none")

" Lua Highlighting
call <SID>X("luaFunc", s:foreground, "", "none")
call <SID>X("luaIn", s:aqua, "", "none")
call <SID>X("luaFunction", s:green, "", "none")
call <SID>X("luaStatement", s:aqua, "", "none")
call <SID>X("luaRepeat", s:aqua, "", "none")
call <SID>X("luaTable", s:blue, "", "none")
call <SID>X("luaConstant", s:mongo, "", "none")
call <SID>X("luaElse", s:purple, "", "none")
call <SID>X("luaCond", s:purple, "", "none")

" Makefile Highlighting
call <SID>X("makeIdent", s:aqua, "", "none")
call <SID>X("makeSpecTarget", s:yellow, "", "none")
call <SID>X("makeTarget", s:pink, "", "none")
call <SID>X("makeStatement", s:blue, "", "none")
call <SID>X("makeCommands", s:foreground, "", "none")
call <SID>X("makeSpecial", s:red, "", "none")

" Markdown Highlighting
call <SID>X("markdownH1", s:green, "", "none")
call <SID>X("markdownBlockquote", s:green, "", "none")
call <SID>X("markdownCodeBlock", s:purple, "", "none")
call <SID>X("markdownLink", s:aqua, "", "none")
call <SID>X("mkdCode", s:foreground, s:window, "none")
call <SID>X("mkdLink", s:aqua, "", "none")
call <SID>X("mkdURL", s:comment, "", "none")
call <SID>X("mkdString", s:foreground, "", "none")
call <SID>X("mkdBlockQuote", s:foreground, s:window, "none")
call <SID>X("mkdLinkTitle", s:green, "", "none")
call <SID>X("mkdDelimiter", s:blue, "", "none")
call <SID>X("mkdRule", s:green, "", "none")

" Perl Highlighting
call <SID>X("perlFiledescRead", s:mongo, "", "none")
call <SID>X("perlMatchStartEnd", s:green, "", "none")
call <SID>X("perlStatementFlow", s:green, "", "none")
call <SID>X("perlStatementFiledesc", s:red, "", "none")
call <SID>X("perlStatementStorage", s:green, "", "none")
call <SID>X("perlFunction", s:green, "", "none")
call <SID>X("perlMethod", s:foreground, "", "none")
call <SID>X("perlVarPlain", s:orange, "", "none")
call <SID>X("perlSharpBang", s:comment, "", "none")
call <SID>X("perlStatementInclude", s:blue, "", "none")
call <SID>X("perlStatementScalar", s:purple, "", "none")
call <SID>X("perlSubName", s:blue, "", "none")
call <SID>X("perlSpecialString", s:yellow, "", "none")

" PHP Highlighting
call <SID>X("phpIdentifier", s:foreground, "", "none")
call <SID>X("phpVarSelector", s:green, "", "none")
call <SID>X("phpKeyword", s:aqua, "", "none")
call <SID>X("phpStatement", s:green, "", "none")
call <SID>X("phpAssignByRef", s:blue, "", "none")
call <SID>X("phpComparison", s:blue, "", "none")
call <SID>X("phpBackslashSequences", s:yellow, "", "none")
call <SID>X("phpMemberSelector", s:aqua, "", "none")
call <SID>X("phpStorageClass", s:purple, "", "none")
call <SID>X("phpDefine", s:orange, "", "none")

" Python Highlighting
call <SID>X("pythonExceptions", s:pink, "", "none")
call <SID>X("pythonException", s:purple, "", "none")
call <SID>X("pythonInclude", s:pink, "", "none")
call <SID>X("pythonStatement", s:green, "", "none")
call <SID>X("pythonConditional", s:purple, "", "none")
call <SID>X("pythonRepeat", s:purple, "", "none")
call <SID>X("pythonFunction", s:blue, "", "none")
call <SID>X("pythonOperator", s:purple, "", "none")
call <SID>X("pythonBuiltin", s:foreground, "", "none")
call <SID>X("pythonDecorator", s:red, "", "none")
call <SID>X("pythonString", s:yellow, "", "none")
call <SID>X("pythonEscape", s:yellow, "", "none")

" Ruby Highlighting
call <SID>X("rubyModule", s:orange, "", "none")
call <SID>X("rubyClass", s:green, "", "none")
call <SID>X("rubyPseudoVariable", s:comment, "", "none")
call <SID>X("rubyKeyword", s:green, "", "none")
call <SID>X("rubyInstanceVariable", s:purple, "", "none")
call <SID>X("rubyFunction", s:foreground, "", "none")
call <SID>X("rubyDefine", s:green, "", "none")
call <SID>X("rubySymbol", s:blue, "", "none")
call <SID>X("rubyConstant", s:aqua, "", "none")
call <SID>X("rubyAccess", s:orange, "", "none")
call <SID>X("rubyAttribute", s:mongo, "", "none")
call <SID>X("rubyInclude", s:pink, "", "none")
call <SID>X("rubyLocalVariableOrMethod", s:red, "", "none")
call <SID>X("rubyCurlyBlock", s:foreground, "", "none")
call <SID>X("rubyCurlyBlockDelimiter", s:blue, "", "none")
call <SID>X("rubyArrayDelimiter", s:blue, "", "none")
call <SID>X("rubyStringDelimiter", s:yellow, "", "none")
call <SID>X("rubyInterpolationDelimiter", s:red, "", "none")
call <SID>X("rubyConditional", s:purple, "", "none")
call <SID>X("rubyRepeat", s:purple, "", "none")
call <SID>X("rubyControl", s:purple, "", "none")
call <SID>X("rubyException", s:purple, "", "none")
call <SID>X("rubyExceptional", s:purple, "", "none")
call <SID>X("rubyBoolean", s:mongo, "", "none")

" Shell Highlighting
call <SID>X("shDerefVar", s:blue, "", "none")
call <SID>X("shDerefSimple", s:blue, "", "none")
call <SID>X("shFunction", s:red, "", "none")
call <SID>X("shStatement", s:foreground, "", "none")
call <SID>X("shLoop", s:purple, "", "none")
call <SID>X("shQuote", s:yellow, "", "none")
call <SID>X("shCaseEsac", s:blue, "", "none")
call <SID>X("shSnglCase", s:purple, "", "none")
call <SID>X("shFunctionOne", s:orange, "", "none")
call <SID>X("shCase", s:orange, "", "none")
call <SID>X("bashStatement", s:foreground, "", "none")

" SQL Highlighting
call <SID>X("sqlStatement", s:green, "", "none")
call <SID>X("sqlType", s:aqua, "", "none")
call <SID>X("sqlKeyword", s:green, "", "none")
call <SID>X("sqlOperator", s:blue, "", "none")
call <SID>X("sqlSpecial", s:mongo, "", "none")
call <SID>X("mysqlVariable", s:yellow, "", "none")
call <SID>X("mysqlType", s:aqua, "", "none")
call <SID>X("mysqlKeyword", s:green, "", "none")
call <SID>X("mysqlOperator", s:blue, "", "none")
call <SID>X("mysqlSpecial", s:mongo, "", "none")

" TeX Highlighting
call <SID>X("texBoldStyle", s:pink, "", "none")
call <SID>X("texItalStyle", s:pink, "", "none")
call <SID>X("texBoldItalStyle", s:purple, "", "none")
call <SID>X("texItalBoldStyle", s:purple, "", "none")

" Vim Highlighting
call <SID>X("vimCommand", s:green, "", "none")
call <SID>X("vimVar", s:orange, "", "none")
call <SID>X("vimFuncKey", s:green, "", "none")
call <SID>X("vimFunction", s:aqua, "", "none")
call <SID>X("vimNotFunc", s:green, "", "none")
call <SID>X("vimMap", s:pink, "", "none")
call <SID>X("vimAutoEvent", s:blue, "", "none")
call <SID>X("vimMapModKey", s:blue, "", "none")
call <SID>X("vimFuncName", s:purple, "", "none")
call <SID>X("vimIsCommand", s:foreground, "", "none")
call <SID>X("vimFuncVar", s:blue, "", "none")
call <SID>X("vimLet", s:pink, "", "none")
call <SID>X("vimMapRhsExtend", s:foreground, "", "none")
call <SID>X("vimCommentTitle", s:comment, "", "none")
call <SID>X("vimBracket", s:blue, "", "none")
call <SID>X("vimParenSep", s:blue, "", "none")
call <SID>X("vimSynType", s:yellow, "", "none")
call <SID>X("vimNotation", s:blue, "", "none")
call <SID>X("vimOper", s:foreground, "", "none")
call <SID>X("vimOperParen", s:foreground, "", "none")

" XML Highlighting
call <SID>X("xmlTag", s:green, "", "none")
call <SID>X("xmlTagName", s:green, "", "none")
call <SID>X("xmlEndTag", s:green, "", "none")
call <SID>X("xmlAttrib", s:aqua, "", "none")

" Delete Functions
delfunction <SID>X
delfunction <SID>rgb
delfunction <SID>colour
delfunction <SID>rgb_colour
delfunction <SID>rgb_level
delfunction <SID>rgb_number
delfunction <SID>grey_colour
delfunction <SID>grey_level
delfunction <SID>grey_number
