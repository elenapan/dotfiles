" coffee color scheme
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "coffee"

function! s:translate_color(number)
  let color_number = a:number
  if color_number == 0
    return '#282828' " Normal Black
  endif
  if color_number == 1
    return '#c32c2c' " Normal Red
  endif
  if color_number == 2
    return '#647f2f' " Normal Green
  endif
  if color_number == 3
    return '#c8953d' " Normal Yellow
  endif
  if color_number == 4
    return '#5a84a1' " Normal Blue
  endif
  if color_number == 5
    return '#c85bb5' " Normal Magenta
  endif
  if color_number == 6
    return '#16826e' " Normal Cyan
  endif
  if color_number == 7
    return '#aaa5a4' " Normal White
  endif
  if color_number == 8
    return '#606060' " Bright Black
  endif
  if color_number == 9
    return '#b66326' " Bright Red
  endif
  if color_number == 10
    return '#569e4c' " Bright Green
  endif
  if color_number == 11
    return '#987414' " Bright Yellow
  endif
  if color_number == 12
    return '#7baed5' " Bright Blue
  endif
  if color_number == 13
    return '#292929' " Bright Magenta
  endif
  if color_number == 14
    return '#83d9cf' " Bright Cyan
  endif
  if color_number == 15
    return '#ffffff' " Bright White
  endif
endfunction
function! s:highlight(group, fg, bg, attr)
  exec "hi " . a:group . " guifg=" . s:translate_color(a:fg)
  exec "hi " . a:group . " ctermfg=" . a:fg
  exec "hi " . a:group . " guibg=" . s:translate_color(a:bg)
  exec "hi " . a:group . " ctermbg=" . a:bg
  exec "hi " . a:group . " gui=" . a:attr
  exec "hi " . a:group . " cterm=" . a:attr
endfunction

" General colors
call s:highlight("Normal", 7, 0, "NONE")
call s:highlight("NonText", 8, "NONE", "NONE")
call s:highlight("SpecialKey", "NONE", 13, "NONE")

"call s:highlight("Cursor", 0, 7, "reverse")
call s:highlight("LineNr", 8, 13, "NONE")
call s:highlight("VertSplit", 8, "NONE", "NONE")
call s:highlight("StatusLine", 7, 13, "NONE")
call s:highlight("StatusLineNC", 8, 13, "NONE")

call s:highlight("Folded", 8, "NONE", "NONE")
call s:highlight("Title", "NONE", "NONE", "NONE")
call s:highlight("Visual", 7, 8, "NONE")
call s:highlight("VisualNOS", 7, 8, "NONE")

call s:highlight("WildMenu", 0, 3, "NONE")
call s:highlight("PmenuSbar", 0, 7, "NONE")
"call s:highlight("Ignore", "NONE", "NONE", "NONE")

call s:highlight("Error", "NONE", 1, "NONE")
call s:highlight("ErrorMsg", "NONE", 1, "NONE")
call s:highlight("WarningMsg", "NONE", 9, "NONE")

" Message displayed in lower left, such as --INSERT--
call s:highlight("ModeMsg", 4, "NONE", "NONE")

if version >= 700 " Vim 7.x specific colors
  " For cursorline, if we set all the properties, things don't go well
  exe "hi CursorLine guibg=".s:translate_color(13)." gui=none ctermbg=13 cterm=none"
  exe "hi ColorColumn guibg=".s:translate_color(13)." gui=none ctermbg=13 cterm=none"
  call s:highlight("CursorColumn", "NONE", "NONE", "NONE")
  call s:highlight("TabLine", 8, "NONE", "NONE")
  call s:highlight("TabLineFill", "NONE", "NONE", "NONE")
  call s:highlight("TabLineSel", "NONE", "NONE", "BOLD")
  call s:highlight("MatchParen", 0, 6, "NONE")
  call s:highlight("Pmenu", 3, 8, "NONE")
  call s:highlight("PmenuSel", 9, 3, "NONE")
  call s:highlight("Search", 10, 2, "underline")
  call s:highlight("NERDTreeExecFile", 7, 0, "NONE")
  call s:highlight("NERDTreeClosable", 7, 0, "NONE")
  call s:highlight("NERDTreeOpenable", 7, 0, "NONE")
endif

" Syntax highlighting
call s:highlight("Comment", 11, "NONE", "NONE")
call s:highlight("String", 2, "NONE", "NONE")
call s:highlight("Number", 2, "NONE", "NONE")

call s:highlight("Keyword", 9, "NONE", "NONE")
call s:highlight("Statement", 9, "NONE", "NONE")
call s:highlight("PreProc", 9, "NONE", "NONE")

call s:highlight("Todo", 5, "NONE", "bold")
call s:highlight("Constant", 4, "NONE", "NONE")

call s:highlight("Identifier", 4, "NONE", "NONE")
call s:highlight("Function", 3, "NONE", "NONE")
call s:highlight("Class", 15, "NONE", "bold")
call s:highlight("Type", 3, "NONE", "NONE")

call s:highlight("Special", 5, "NONE", "NONE")
call s:highlight("Delimiter", 7, "NONE", "NONE")
call s:highlight("Operator", 9, "NONE", "NONE")

call s:highlight("Blue", 4, "NONE", "NONE")
call s:highlight("Green", 2, "NONE", "NONE")
call s:highlight("DarkGreen", 10, "NONE", "NONE")
call s:highlight("Grey", 8, "NONE", "NONE")
call s:highlight("Orange", 9, "NONE", "NONE")
call s:highlight("Red", 1, "NONE", "NONE")
call s:highlight("White", 15, "NONE", "NONE")
call s:highlight("Gold", 3, "NONE", "NONE")
call s:highlight("Purple", 6, "NONE", "NONE")

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
hi link Structure       Type
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
hi link htmlArg            Blue
hi link htmlLink           Normal
hi link javaScript         Normal

"" Special for PHP
hi link phpVarSelector  Purple
hi link phpIdentifier   Purple
hi link phpType         Red
hi link phpRepeat       Orange

"" Special for Coffeescript
hi link coffeeAssignSymbols White
hi link coffeeSpecialVar    Purple
hi link coffeeObjAssign     Gold

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
hi link cssClassName            Blue
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
