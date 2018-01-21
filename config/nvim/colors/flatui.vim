" flatui.vim - Vim color scheme (http://flatuicolors.com)
" ----------------------------------------------------------
" Author:	  John Louis Del Rosario (http://john2x.com/)
" Version:	0.5
" License:	Same as Vim's. See ":help license".
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
	syntax reset
endif

" Declare theme name
let g:colors_name="flatui"

"}}}

" The Colors -----------------------------------------------{{{
" Define reusable colors
let s:midnightBlue=   { "gui": "#2c3e50", "cterm": "236"  }
let s:clouds=         { "gui": "#ecf0f1", "cterm": "255" }
let s:silver=         { "gui": "#e8e8e8", "cterm": "7" }
let s:wetAsphalt=     { "gui": "#34495e", "cterm": "237" }
let s:concrete=       { "gui": "#95a5a6", "cterm": "247" }
let s:asbestos=       { "gui": "#7f8c8d", "cterm": "245" }

let s:turquoise=      { "gui": "#1abc9c", "cterm": "36"  }
let s:greenSea=       { "gui": "#16a085", "cterm": "29" }
let s:emerald=        { "gui": "#2ecc71", "cterm": "41" }
let s:nephritis=      { "gui": "#27ae60", "cterm": "35" }

let s:peterRiver=     { "gui": "#3498db", "cterm": "33"  }
let s:belizeHole=     { "gui": "#2980b9", "cterm": "26"  }
let s:amethyst=       { "gui": "#9b59b6", "cterm": "133" }
let s:wisteria=       { "gui": "#8e44ad", "cterm": "97" }

let s:carrot=         { "gui": "#e67e22", "cterm": "172"  }
let s:pumpkin=        { "gui": "#d35400", "cterm": "166"  }
let s:sunFlower=      { "gui": "#f1c40f", "cterm": "220" }
let s:orange=         { "gui": "#f39c12", "cterm": "214" }

let s:alizarin=       { "gui": "#e74c3c", "cterm": "196"  }
let s:pomegranate=    { "gui": "#c0392b", "cterm": "124" }


if &background=="light"
  let s:bg=s:clouds
  let s:norm=s:midnightBlue
  let s:lightNorm=s:wetAsphalt
  let s:lightBg=s:silver

  let s:neutral1=s:concrete
  let s:neutral2=s:asbestos

  let s:lightAccent1=s:turquoise
  let s:lightAccent2=s:emerald
  let s:lightAccent3=s:peterRiver
  let s:lightAccent4=s:amethyst
  let s:lightAccent5=s:sunFlower
  let s:lightAccent6=s:carrot
  let s:lightAccent7=s:alizarin

  let s:darkAccent1=s:greenSea
  let s:darkAccent2=s:nephritis
  let s:darkAccent3=s:belizeHole
  let s:darkAccent4=s:wisteria
  let s:darkAccent5=s:orange
  let s:darkAccent6=s:pumpkin
  let s:darkAccent7=s:pomegranate
else
  let s:bg=s:midnightBlue
  let s:norm=s:clouds
  let s:lightNorm=s:silver
  let s:lightBg=s:wetAsphalt

  let s:neutral1=s:concrete
  let s:neutral2=s:asbestos

  let s:darkAccent1=s:turquoise
  let s:darkAccent2=s:emerald
  let s:darkAccent3=s:peterRiver
  let s:darkAccent4=s:amethyst
  let s:darkAccent5=s:sunFlower
  let s:darkAccent6=s:carrot
  let s:darkAccent7=s:alizarin

  let s:lightAccent1=s:greenSea
  let s:lightAccent2=s:nephritis
  let s:lightAccent3=s:belizeHole
  let s:lightAccent4=s:wisteria
  let s:lightAccent5=s:orange
  let s:lightAccent6=s:pumpkin
  let s:lightAccent7=s:pomegranate
endif
"}}}

" Utilility Function ---------------------------------------{{{
function! s:h(group, style)
	execute "highlight" a:group
		\ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
		\ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
		\ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
		\ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
		\ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
		\ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
		\ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"}}}

" Highlights - Vim >= 7 ------------------------------------{{{
if version >= 700
    call s:h("CursorLine",  { "bg": s:lightBg })
    call s:h("MatchParen",  { "fg": s:norm, "bg": s:lightAccent5, "gui": "bold" })
    call s:h("Pmenu",       { "fg": s:bg, "bg": s:lightNorm })
    call s:h("PmenuThumb",  { "bg": s:lightAccent5 })
    call s:h("PmenuSBar",   { "bg": s:norm })
    call s:h("PmenuSel",    { "bg": s:lightAccent5 })
    call s:h("ColorColumn", { "bg": s:lightBg })
    call s:h("SpellBad",    { "sp": s:darkAccent7, "gui": "undercurl" })
    call s:h("SpellCap",    { "sp": s:darkAccent7, "gui": "undercurl" })
    call s:h("SpellRare",   { "sp": s:darkAccent6, "gui": "undercurl" })
    call s:h("SpellLocal",  { "sp": s:darkAccent7, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

	" Use background for cterm Spell*, which does not support undercurl
	execute "hi! SpellBad   ctermbg=" s:alizarin.cterm
	execute "hi! SpellCap   ctermbg=" s:alizarin.cterm
	execute "hi! SpellRare  ctermbg=" s:carrot.cterm
	execute "hi! SpellLocal ctermbg=" s:alizarin.cterm
endif

"}}}

" Highlights - UI ------------------------------------------{{{
  call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
  call s:h("NonText",      { "fg": s:neutral1 })
  call s:h("Cursor",       { "fg": s:bg, "bg": s:lightNorm })
  call s:h("Visual",       { "bg": s:lightAccent2, "fg": s:bg })
  call s:h("IncSearch",    { "bg": s:lightAccent5 })
  call s:h("Search",       { "bg": s:lightAccent1 })
  call s:h("StatusLine",   { "fg": s:bg, "bg": s:lightAccent1, "gui": "italic", "cterm": "bold" })
  call s:h("StatusLineNC", { "fg": s:lightBg, "bg": s:lightBg })
  call s:h("SignColumn",   { "fg": s:lightBg })
  call s:h("VertSplit",    { "fg": s:lightBg, "bg": s:lightBg })
  call s:h("TabLine",      { "fg": s:lightBg, "bg": s:lightBg })
  call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
  call s:h("Folded",       { "fg": s:bg, "bg": s:lightBg })
  call s:h("Directory",    { "fg": s:lightAccent3 })
  call s:h("Title",        { "fg": s:lightAccent6, "gui": "bold", "cterm": "bold" })
  call s:h("ErrorMsg",     { "fg": s:lightAccent7, "bg": s:darkAccent7, "gui": "bold", "cterm": "bold" })
  call s:h("WarningMsg",   { "fg": s:lightAccent6, "bg": s:darkAccent6, "gui": "bold", "cterm": "bold" })
  call s:h("DiffAdd",      { "bg": s:lightAccent2 })
  call s:h("DiffChange",   { "bg": s:lightAccent6 })
  call s:h("DiffDelete",   { "bg": s:lightAccent7 })
  call s:h("DiffText",     { "bg": s:lightAccent6, "gui": "bold", "cterm": "bold" })
  call s:h("User1",        { "fg": s:bg, "bg": s:darkAccent1 })
  call s:h("User2",        { "fg": s:bg, "bg": s:darkAccent2 })
  call s:h("User3",        { "fg": s:bg, "bg": s:darkAccent3 })
hi! link WildMenu	IncSearch
hi! link FoldColumn	SignColumn
hi! link MoreMsg	Title
hi! link Question	MoreMsg
hi! link ModeMsg	MoreMsg
hi! link TabLineFill	StatusLineNC
hi! link LineNr		NonText
hi! link SpecialKey	NonText

"}}}

" Highlights - Generic Syntax ------------------------------{{{
  call s:h("Comment",    { "fg": s:lightBg, "gui": "italic" })

  call s:h("Constant",   { "fg": s:lightAccent3, "gui": "bold", "cterm": "bold" })
  call s:h("String",     { "fg": s:darkAccent3 })
  call s:h("Character",  { "fg": s:darkAccent3, "gui": "bold", "cterm": "bold" })

  call s:h("Identifier", { "fg": s:darkAccent2 })
  call s:h("Function",   { "fg": s:lightNorm, "gui": "bold", "cterm": "bold" })

  call s:h("Statement",  { "fg": s:darkAccent4 })
  call s:h("Operator",   { "fg": s:darkAccent1 })
  call s:h("Keyword",    { "fg": s:lightAccent1, "gui": "bold", "cterm": "bold" })
  call s:h("Exception",  { "fg": s:lightAccent7 })

  call s:h("PreProc",    { "fg": s:lightAccent2, "gui": "bold", "cterm": "bold" })

  call s:h("Type",       { "fg": s:lightAccent4 })

  call s:h("Special",    { "fg": s:darkAccent6 })
  call s:h("Delimiter",  { "fg": s:neutral2 })

  call s:h("Underlined", { "fg": s:norm, "gui": "underline", "cterm": "underline" })

  call s:h("Todo",       { "fg": s:lightAccent5, "bg": s:darkAccent5, "gui": "bold", "cterm": "bold" })

hi! link Error		ErrorMsg

"}}}

" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink	Underlined
hi! link htmlTag	Type
hi! link htmlEndTag	htmlTag

"}}}

" Highlights - CSS -----------------------------------------{{{
hi! link cssBraces	Delimiter
hi! link cssSelectorOp	cssBraces
hi! link cssClassName	Type
hi! link cssIdentifier Identifier

"}}}

" Highlights - Markdown ------------------------------------{{{
hi! link mkdListItem	mkdDelimiter

"}}}

" Highlights - Shell ---------------------------------------{{{
hi! link shOperator	Operator
hi! link shCaseBar	Delimiter

"}}}

" Highlights - JavaScript ----------------------------------{{{
hi! link javaScriptValue	Constant
hi! link javaScriptNull	Constant
hi! link jsObjectKey Keyword
hi! link jsFunction Function
hi! link jsBraces Delimiter
hi! link jsParens Delimiter
hi! link jsFuncBraces jsBraces
hi! link jsFuncParens jsParens
hi! link jsNoise Comment

"}}}

" Highlights - Help ----------------------------------------{{{
hi! link helpExample	String
hi! link helpHeadline	Title
hi! link helpSectionDelim	Comment
hi! link helpHyperTextEntry	Statement
hi! link helpHyperTextJump	Underlined
hi! link helpURL	Underlined

"}}}

" Highlights - Python ----------------------------------------{{{
hi! link pythonBuiltin Identifier
hi! link pythonBuiltinFunc Operator
hi! link pythonBuiltinObj Constant
hi! link pythonDecorator Operator
hi! link pythonDottedName pythonDecorator

"}}}

" Highlights - Clojure ----------------------------------------{{{
hi! link clojureSpecial Special
hi! link clojureDefn Operator
hi! link clojureDefMacro Macro
hi! link clojureKeyword Keyword
hi! link clojureFunc Operator
hi! link clojureMacro Function
hi! link clojureAnonArg Comment
hi! link clojureDefine Type

"}}}

" Highlights - Elixir ----------------------------------------{{{
hi! link elixirDefine Special

"}}}

" vim: fdm=marker
