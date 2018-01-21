" scooby.vim - Vim color scheme
" ----------------------------------------------------------
" Author:   Jyota
" Version:  0.1
" License:  Creative Commons Attribution-NonCommercial
"           3.0 Unported License       
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Declare theme name
let g:colors_name = "scooby"

"}}}

" The Colors -----------------------------------------------{{{
"
" Define semantic category colors
  let s:bg         = { "gui": "#000020", "cterm": "016" }
  let s:norm       = { "gui": "#DBDBDB", "cterm": "188" }
  let s:comment    = { "gui": "#6272a4", "cterm": "061" }
  let s:dimmed     = { "gui": "#0abdaa", "cterm": "037" }
  let s:subtle     = { "gui": "#0abdaa", "cterm": "037" }
  let s:faint      = { "gui": "#3B3A32", "cterm": "059" }
  let s:accent1    = { "gui": "#3E3D32", "cterm": "230" }  
  let s:accent2    = { "gui": "#c0fecb", "cterm": "158" }
  let s:accent3    = { "gui": "#FEC2B1", "cterm": "217" }
  let s:accent4    = { "gui": "#8080ff", "cterm": "105" }  
  let s:hilite     = { "gui": "#49583E", "cterm": "059" }

"}}}
" Utility Function -----------------------------------------{{{
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
  call s:h("CursorLine",  { "bg": s:accent2 })
  call s:h("MatchParen",  { "fg": s:accent3, "bg": s:accent2, "gui": "bold" })
  call s:h("Pmenu",       { "bg": s:comment })
  call s:h("PmenuThumb",  { "bg": s:accent3 })
  call s:h("PmenuSBar",   { "bg": s:accent3 })
  call s:h("PmenuSel",    { "bg": s:faint })
  call s:h("ColorColumn", { "bg": s:faint })
  call s:h("SpellBad",    { "sp": s:faint, "gui": "undercurl" })
  call s:h("SpellCap",    { "sp": s:faint, "gui": "undercurl" })
  call s:h("SpellRare",   { "sp": s:faint, "gui": "undercurl" })
  call s:h("SpellLocal",  { "sp": s:faint, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:faint.cterm
  execute "hi! SpellCap   ctermbg=" s:accent1.cterm
  execute "hi! SpellRare  ctermbg=" s:accent1.cterm
  execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent2 })
call s:h("Visual",       { "bg": s:hilite })
call s:h("IncSearch",    { "bg": s:accent2 })
call s:h("Search",       { "bg": s:accent2 })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:subtle })
call s:h("VertSplit",    { "fg": s:subtle, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent3 })
call s:h("Title",        { "fg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faint })
call s:h("DiffAdd",      { "bg": s:accent1 })
call s:h("DiffChange",   { "bg": s:faint })
call s:h("DiffDelete",   { "fg": s:faint, "bg": s:faint })
call s:h("DiffText",     { "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:faint })
call s:h("User2",        { "fg": s:bg, "bg": s:faint })
call s:h("User3",        { "fg": s:bg, "bg": s:faint })
call s:h("LineNr",       { "fg": s:accent4, "bg": s:bg})
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link SpecialKey   NonText
hi! link NonText      LineNr

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": {"gui": "#50F198", "cterm": 230 }})
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent3, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent3, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "fg": s:norm, "cterm": "bold" })
call s:h("Number",     { "fg": s:accent4 })
call s:h("Constant",   { "fg": s:norm })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Special     Type
hi! link PreProc     Type
hi! link Error       ErrorMsg
hi! link Operator    Delimiter 

"}}}
" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag

"}}}
" Highlights - CSS -----------------------------------------{{{
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal

"}}}
" Highlights - Markdown ------------------------------------{{{
hi! link mkdListItem  mkdDelimiter

"}}}
" Highlights - Shell ---------------------------------------{{{
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter

"}}}
" Highlights - JavaScript ----------------------------------{{{
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal

"}}}
" Highlights - Help ----------------------------------------{{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}

" vim: fdm=marker:sw=2:sts=2:et

