" inori color scheme
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inori"

let g:inori_colors = {}

function! s:set_color(name, num, hex)
	let g:inori_colors[a:name] = [a:num, a:hex]
endfunction

" Noew set color board
"
call s:set_color("BLACK", 0, "#000000")
call s:set_color("RED", 1, "#800000")
call s:set_color("GREEN", 2, "#008000")
call s:set_color("YELLOW", 3, "#808000")
call s:set_color("BLUE", 4, "#000080")
call s:set_color("MAGENTA", 5, "#800080")
call s:set_color("CYAN", 6, "#008080")
call s:set_color("WHITE", 7, "#c0c0c0")
call s:set_color("BRIGHT_BLACK", 8, "#808080")
call s:set_color("BRIGHT_RED", 9, "#ff0000")
call s:set_color("BRIGHT_GREEN", 10, "#00ff00")
call s:set_color("BRIGHT_YELLOW", 11, "#ffff00")
call s:set_color("BRIGHT_BLUE", 12, "#0000ff")
call s:set_color("BRIGHT_MAGENTA", 13, "#ff00ff")
call s:set_color("BRIGHT_CYAN", 14, "#00ffff")
call s:set_color("BRIGHT_WHITE", 15, "#ffffff")
call s:set_color("NONE", "NONE", "NONE")

" colors for syntax hightlight

call s:set_color("ORANGE", 172, "#d78700")
call s:set_color("DARK_ORANGE", 130, "#af5f00")
call s:set_color("DARK_SEA_GREEN", 65, "#5f875f")
call s:set_color("GREY", 235, "#262626")
call s:set_color("DARK_MAGENTA", 133, "#af5faf")

function! s:highlight(group, fg, bg, attr)
	let fg = g:inori_colors[a:fg]
	let bg = g:inori_colors[a:bg]
	exec "hi " . a:group . " guifg=" . fg[1]
  exec "hi " . a:group . " ctermfg=" . fg[0]
  exec "hi " . a:group . " guibg=" . bg[1]
  exec "hi " . a:group . " ctermbg=" . bg[0]
  exec "hi " . a:group . " gui=" . a:attr
  exec "hi " . a:group . " cterm=" . a:attr
endfunction


" General colors
call s:highlight("Normal", "WHITE", "GREY", "NONE")
call s:highlight("NonText", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("SpecialKey", "NONE", "BRIGHT_BLACK", "NONE")

"call s:highlight("Cursor", "GREY", "WHITE", "reverse")
call s:highlight("LineNr", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("VertSplit", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("StatusLine", "WHITE", "BRIGHT_BLACK", "NONE")
call s:highlight("StatusLineNC", "WHITE", "BRIGHT_BLACK", "NONE")

call s:highlight("Folded", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("Title", "NONE", "NONE", "NONE")
call s:highlight("Visual", "WHITE", "BRIGHT_BLACK", "NONE")
call s:highlight("VisualNOS", "WHITE", "BRIGHT_BLACK", "NONE")

call s:highlight("WildMenu", "GREY", "WHITE", "NONE")
call s:highlight("PmenuSbar", "GREY", "WHITE", "NONE")
"call s:highlight("Ignore", "NONE", "NONE", "NONE")

call s:highlight("Error", "NONE", "RED", "NONE")
call s:highlight("ErrorMsg", "NONE", "RED", "NONE")
call s:highlight("WarningMsg", "NONE", "BRIGHT_RED", "NONE")

" Message displayed in lower left, such as --INSERT--
call s:highlight("ModeMsg", "CYAN", "NONE", "NONE")

if version >= 700 " Vim 7.x specific colors
  call s:highlight("CursorLine", "BRIGHT_WHITE", "BRIGHT_BLACK", "NONE")
  call s:highlight("ColorColumn", "BRIGHT_WHITE", "BRIGHT_BLACK", "NONE")
  call s:highlight("CursorColumn", "NONE", "NONE", "NONE")
  call s:highlight("TabLine", "BRIGHT_BLACK", "NONE", "NONE")
  call s:highlight("TabLineFill", "NONE", "NONE", "NONE")
  call s:highlight("TabLineSel", "NONE", "NONE", "BOLD")
  call s:highlight("MatchParen", "CYAN", "NONE", "NONE")
  call s:highlight("Pmenu", "GREY", "BRIGHT_BLACK", "NONE")
  call s:highlight("PmenuSel", "GREY", "WHITE", "NONE")
  call s:highlight("Search", "NONE", "DARK_SEA_GREEN", "NONE")
  call s:highlight("NERDTreeExecFile", "WHITE", "GREY", "NONE")
  call s:highlight("NERDTreeClosable", "WHITE", "GREY", "NONE")
  call s:highlight("NERDTreeOpenable", "WHITE", "GREY", "NONE")
endif

" Syntax highlighting
call s:highlight("Comment", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("String", "DARK_SEA_GREEN", "NONE", "NONE")
call s:highlight("Number", "DARK_SEA_GREEN", "NONE", "NONE")

call s:highlight("Keyword", "ORANGE", "NONE", "NONE")
call s:highlight("Statement", "ORANGE", "NONE", "NONE")
call s:highlight("PreProc", "ORANGE", "NONE", "NONE")
call s:highlight("PreCondit", "BRIGHT_YELLOW", "NONE", "NONE")
call s:highlight("Structure", "DARK_MAGENTA", "NONE", "NONE")

call s:highlight("Todo", "DARK_MAGENTA", "NONE", "NONE")
call s:highlight("Constant", "CYAN", "NONE", "NONE")

call s:highlight("Identifier", "BRIGHT_RED", "NONE", "NONE")
call s:highlight("Function", "BRIGHT_RED", "NONE", "NONE")
call s:highlight("Class", "BRIGHT_RED", "NONE", "NONE")
call s:highlight("Type", "DARK_ORANGE", "NONE", "NONE")

call s:highlight("Special", "WHITE", "NONE", "NONE")
call s:highlight("Delimiter", "WHITE", "NONE", "NONE")
call s:highlight("Operator", "WHITE", "NONE", "NONE")

call s:highlight("BLUE", "BLUE", "NONE", "NONE")
call s:highlight("GREEN", "GREEN", "NONE", "NONE")
call s:highlight("DarkGreen", "BRIGHT_GREEN", "NONE", "NONE")
call s:highlight("Grey", "BRIGHT_BLACK", "NONE", "NONE")
call s:highlight("Orange", "BRIGHT_RED", "NONE", "NONE")
call s:highlight("RED", "RED", "NONE", "NONE")
call s:highlight("WHITE", "BRIGHT_WHITE", "NONE", "NONE")
call s:highlight("Gold", "ORANGE", "NONE", "NONE")
call s:highlight("Purple", "DARK_MAGENTA", "NONE", "NONE")

hi link Character       Constant
hi link Conditional     Keyword
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

"" Special for HTML
hi link htmlTagName        Gold
hi link htmlSpecialTagName Gold
hi link htmlTag            Gold
hi link htmlEndTag         Gold
hi link htmlArg            Orange
hi link htmlLink           Normal
hi link javaScript         Normal

"" Special for PHP
hi link phpVarSelector  Purple
hi link phpIdentifier   Purple
hi link phpType         Red
hi link phpRepeat       Orange

"" Special for Coffeescript
"hi link inoriAssignSymbols White
"hi link inoriSpecialVar    Purple
"hi link inoriObjAssign     Gold
hi link coffeeParens Gold

"" Special for Javascript
"hi link javaScriptNumber         Number
"hi link javaScriptPrototype      Identifier " prototype
"hi link javaScriptSource         Keyword " import export
"hi link javaScriptType           Identifier " const this undefined var void yield
"hi link javaScriptOperator       Keyword " delete new in instanceof let typeof
"hi link javaScriptBoolean        Keyword " true false
"hi link javaScriptNull           Keyword " null
"hi link javaScriptConditional    Keyword " if else
"hi link javaScriptRepeat         Keyword " do while for
"hi link javaScriptBranch         Keyword " break continue switch case default return
"hi link javaScriptStatement      Keyword " try catch throw with finally
"hi link javaScriptGlobalObjects  Keyword " Array Boolean Date Function Infinity JavaArray JavaClass JavaObject JavaPackage Math Number NaN Object Packages RegExp String Undefined java netscape sun
"hi shCommandSub		ctermfg=white

"" Sepcial for CSS
hi link cssType                 Green
hi link cssIdentifier           Gold
hi link cssClassName            Orange
hi link cssTagName              Orange
hi link cssBraces               Normal
hi link cssColor                DarkGreen
hi link cssCommonAttr           Green
hi link cssTextAttr             Green
hi link cssFontAttr             Green
hi link cssBoxAttr              Green
hi link cssRenderAttr           Green
hi link cssUIAttr               Green
hi link cssPseudoClass          Orange
hi link cssPseudoClassId        Orange
hi link cssSelectorOp           Normal
hi link cssSelectorOp2          Normal
hi link cssMedia                Orange
hi link cssMediaType            Green
hi link cssBraces               White
hi link cssFontProp             White
hi link cssColorProp            White
hi link cssTextProp             White
hi link cssBoxProp              White
hi link cssRenderProp           White
hi link cssAuralProp            White
hi link cssRenderProp           White
hi link cssGeneratedContentProp White
hi link cssPagingProp           White
hi link cssTableProp            White
hi link cssUIProp               White
hi link cssFontDescriptorProp   White
