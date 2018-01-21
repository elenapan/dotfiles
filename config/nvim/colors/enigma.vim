" Based on the base-16 template

let s:enigma = {}
let s:enigma.smoke = 235
let s:enigma.aurora = 67
let s:enigma.ash = 245
let s:enigma.coral = 174
let s:enigma.sun = 138
let s:enigma.purple = 140
let s:enigma.sea = 25
let s:enigma.ocean = 24
let s:enigma.moss = 66
let s:enigma.adobe = 59
let s:enigma.mist = 67
let s:enigma.eclipse = 234
let s:enigma.white = 250
let s:enigma.gold = 226
let s:enigma.orange = 180 "145
let s:enigma.lacquer = 232
let s:enigma.lava = 167
let s:enigma.dusk = 239

" Theme setup    31
hi clear
syntax reset
let g:colors_name = "enigma"

" highlighting function
fun <sid>HL(group, ctermfg, ctermbg, attr)
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:enigma[a:ctermfg]
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:enigma[a:ctermbg]
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Vim editor colors
call <sid>HL("Bold",           "", "", "bold")
call <sid>HL("Debug",          "", "", "")
call <sid>HL("Directory",      "ash", "", "")
call <sid>HL("ErrorMsg",       "", "", "")
call <sid>HL("Exception",      "", "", "")
call <sid>HL("FoldColumn",     "", "", "")
call <sid>HL("Folded",         "", "", "")
call <sid>HL("IncSearch",      "", "sea", "none")
call <sid>HL("Italic",         "", "", "none")
call <sid>HL("Macro",          "", "", "")
call <sid>HL("MatchParen",     "gold", "smoke",  "")
call <sid>HL("ModeMsg",        "", "", "")
call <sid>HL("MoreMsg",        "", "", "")
call <sid>HL("Question",       "", "", "")
call <sid>HL("Search",         "", "",  "")
call <sid>HL("SpecialKey",     "", "", "")
call <sid>HL("TooLong",        "", "", "")
call <sid>HL("Underlined",     "", "", "")
call <sid>HL("Visual",         "white", "adobe", "")
call <sid>HL("VisualNOS",      "sea", "", "")
call <sid>HL("WarningMsg",     "", "", "")
call <sid>HL("WildMenu",       "", "", "")
call <sid>HL("Title",          "", "", "none")
call <sid>HL("Conceal",        "", "", "")
call <sid>HL("Cursor",         "", "", "")
call <sid>HL("NonText",        "", "", "")
call <sid>HL("Normal",         "ash", "smoke", "")
call <sid>HL("LineNr",         "ash", "", "")
call <sid>HL("SignColumn",     "", "", "")
call <sid>HL("SpecialKey",     "", "", "")
call <sid>HL("StatusLine",     "ash", "smoke", "none")
call <sid>HL("StatusLineNC",   "ash", "smoke", "none")
call <sid>HL("VertSplit",      "", "", "none")
call <sid>HL("ColorColumn",    "", "", "none")
call <sid>HL("CursorColumn",   "", "", "none")
call <sid>HL("CursorLine",     "", "lacquer", "none")
call <sid>HL("CursorLineNr",   "gold", "", "")
call <sid>HL("PMenu",          "mist", "ocean", "none")
call <sid>HL("PMenuSel",       "", "", "")
call <sid>HL("TabLine",        "", "", "none")
call <sid>HL("TabLineFill",    "", "", "none")
call <sid>HL("TabLineSel",     "", "", "none")

" Standard syntax highlighting
call <sid>HL("Boolean",      "lava", "", "")
call <sid>HL("Character",    "", "", "")
call <sid>HL("Comment",      "dusk", "", "")
call <sid>HL("Conditional",  "ash", "", "")
call <sid>HL("Constant",     "", "", "")
call <sid>HL("Define",       "", "", "none")
call <sid>HL("Delimiter",    "", "", "")
call <sid>HL("Float",        "", "", "")
call <sid>HL("Function",     "", "", "")
call <sid>HL("Identifier",   "ash", "", "none")
call <sid>HL("Include",      "", "", "")
call <sid>HL("Keyword",      "purple", "", "")
call <sid>HL("Label",        "", "", "")
call <sid>HL("Number",       "sun", "", "")
call <sid>HL("Operator",     "lava", "", "none")
call <sid>HL("PreProc",      "", "", "")
call <sid>HL("Repeat",       "coral", "", "")
call <sid>HL("Special",      "purple", "", "")
call <sid>HL("SpecialChar",  "", "", "")
call <sid>HL("Statement",    "", "", "")
call <sid>HL("StorageClass", "moss", "", "")
call <sid>HL("String",       "mist", "", "")
call <sid>HL("Structure",    "", "", "")
call <sid>HL("Tag",          "", "", "")
call <sid>HL("Todo",         "", "", "")
call <sid>HL("Type",         "", "", "none")
call <sid>HL("Typedef",      "", "", "")

" C highlighting
call <sid>HL("cOperator",    "", "", "")
call <sid>HL("cPreCondit",   "", "", "")

" Diff highlighting
call <sid>HL("DiffAdd",      "", "", "")
call <sid>HL("DiffChange",   "", "", "")
call <sid>HL("DiffDelete",   "", "", "")
call <sid>HL("DiffText",     "", "", "")
call <sid>HL("DiffAdded",    "", "", "")
call <sid>HL("DiffFile",     "", "", "")
call <sid>HL("DiffNewFile",  "", "", "")
call <sid>HL("DiffLine",     "", "", "")
call <sid>HL("DiffRemoved",  "", "", "")

" Git highlighting
call <sid>HL("gitCommitOverflow",  "", "", "")
call <sid>HL("gitCommitSummary",   "", "", "")
  
" GitGutter highlighting
call <sid>HL("GitGutterAdd",     "", "smoke", "")
call <sid>HL("GitGutterChange",  "", "smoke", "")
call <sid>HL("GitGutterDelete",  "", "smoke", "")
call <sid>HL("GitGutterChangeDelete", "", "smoke", "")

" HTML highlighting
call <sid>HL("htmlBold",    "", "", "")
call <sid>HL("htmlItalic",  "", "", "")
call <sid>HL("htmlEndTag",  "", "", "")
call <sid>HL("htmlTag",     "", "", "")
call <sid>HL("htmlTagName", "", "", "")

" JavaScript highlighting
call <sid>HL("javaScript",        "", "", "")
call <sid>HL("javaScriptBraces",  "", "", "")
call <sid>HL("javaScriptNumber",  "", "", "")

" Markdown highlighting
call <sid>HL("markdownCode",              "", "", "")
call <sid>HL("markdownError",             "", "", "")
call <sid>HL("markdownCodeBlock",         "", "", "")
call <sid>HL("markdownHeadingDelimiter",  "", "", "")

" NERDTree highlighting
call <sid>HL("NERDTreeDirSl",       "", "", "")
call <sid>HL("NERDTreeExecFile",   "", "", "")

" Python highlighting
call <sid>HL("pythonOperator",   "", "", "")
call <sid>HL("pythonRepeat",     "", "", "")

" Ruby highlighting
call <sid>HL("rubyAttribute",               "", "", "")
call <sid>HL("rubyConstant",                "", "", "")
call <sid>HL("rubyInterpolation",           "", "", "")
call <sid>HL("rubyInterpolationDelimiter",  "", "", "")
call <sid>HL("rubyRegexp",                  "", "", "")
call <sid>HL("rubySymbol",                  "", "", "")
call <sid>HL("rubyStringDelimiter",         "", "", "")

" SASS highlighting
call <sid>HL("sassidChar",     "", "", "")
call <sid>HL("sassClassChar",  "", "", "")
call <sid>HL("sassInclude",    "", "", "")
call <sid>HL("sassMixing",     "coral", "", "")
call <sid>HL("sassMixinName",  "", "", "")

" CSS highlighting
call <sid>HL("cssTagName",  "aurora", "", "")

" Spelling highlighting
call <sid>HL("SpellBad",     "white", "eclipse", "")
call <sid>HL("SpellLocal",   "white", "eclipse", "")
call <sid>HL("SpellCap",     "white", "eclipse", "")
call <sid>HL("SpellRare",    "white", "eclipse", "")


" Custom highlighting
" --------------------------------------
" ---------     javascript    ----------
" --------------------------------------
call <sid>HL("jsObjectKey",    "sun", "", "")
call <sid>HL("jsFuncAssignIdent", "", "", "")
call <sid>HL("jsFuncAssignObjChain", "", "", "")
call <sid>HL("jsFuncBlock", "", "", "")
call <sid>HL("jsFuncCall", "", "", "")
call <sid>HL("jsAssignExpIdent", "", "", "")
call <sid>HL("jsAssignmentExpr", "", "", "")
call <sid>HL("jsBraces", "mist", "", "")
call <sid>HL("jsParens", "", "", "")
call <sid>HL("jsParen", "moss", "", "")
call <sid>HL("jsBrackets", "", "", "")
call <sid>HL("jsBracket", "coral", "", "")
call <sid>HL("jsFuncBraces", "", "", "")
call <sid>HL("jsFunction", "moss", "", "")
call <sid>HL("jsFuncArgs", "orange", "", "")
call <sid>HL("jsReturn", "coral", "", "")
call <sid>HL("jsNoise", "", "", "")
call <sid>HL("jsConditional", "", "", "")
call <sid>HL("jsTHLs", "", "", "")
call <sid>HL("jsFuncName", "aurora", "", "")
call <sid>HL("jsBlock", "", "", "")
call <sid>HL("jsUndefined", "purple", "", "")
call <sid>HL("jsNull", "coral", "", "")
call <sid>HL("jsException", "orange", "", "")
call <sid>HL("jsTernaryIfOperator", "orange", "", "")

call <sid>HL("vimLet", "coral", "", "")

" --------------------------------------
" ------------     go    ---------------
" --------------------------------------
call <sid>HL("goMethod", "moss", "", "")

" Remove functions
delf <sid>HL

" Remove color variables
unlet s:enigma

