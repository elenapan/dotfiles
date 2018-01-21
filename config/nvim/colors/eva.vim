" eva.vim - Vim color scheme
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
let g:colors_name = "eva"

"}}}
" The Colors -----------------------------------------------{{{

  let s:bg         = { "gui": "#280000", "cterm": "016"  }
  let s:norm       = { "gui": "#FF5701", "cterm": "202" }
  let s:comment    = { "gui": "#601000", "cterm": "052" }
  let s:dimmed     = { "gui": "#1A921C", "cterm": "028" }
  let s:subtle     = { "gui": "#444444", "cterm": "059" }
  let s:faint      = { "gui": "#DA6606", "cterm": "166" }
  let s:accent1    = { "gui": "#9FD3E6", "cterm": "152" }
  let s:accent2    = { "gui": "#B1D631", "cterm": "149" }
  let s:accent3    = { "gui": "#d09000", "cterm": "172" }
  let s:accent4    = { "gui": "#ECE1C8", "cterm": "224" }
  let s:accent5    = { "gui": "#2E4D0F", "cterm": "022"  }
  let s:accent6    = { "gui": "#63001C", "cterm": "052"  }  
  let s:accent7    = { "gui": "#D65E76", "cterm": "168" }
  let s:accent8    = { "gui": "#B1D631", "cterm": "149" }
  let s:accent9    = { "gui": "#9FD3E6", "cterm": "152" }
  let s:accent10   = { "gui": "#5F5F00", "cterm": "000"  }
  let s:accent11   = { "gui": "#005F87", "cterm": "024"  }
  let s:accent12   = { "gui": "#932b00", "cterm": "088" }
  let s:accent13   = { "gui": "#00AA00", "cterm": "034" }
  let s:accent14   = { "gui": "#9abf10", "cterm": "000" }

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
  call s:h("CursorLine",  { "bg": s:accent5 })
  call s:h("MatchParen",  { "fg": s:accent5, "bg": s:accent2, "gui": "bold" })
  call s:h("Pmenu",       { "bg": s:comment })
  call s:h("PmenuThumb",  { "bg": s:accent3 })
  call s:h("PmenuSBar",   { "bg": s:accent3 })
  call s:h("PmenuSel",    { "bg": s:accent4 })
  call s:h("ColorColumn", { "bg": s:accent6 })
  call s:h("SpellBad",    { "sp": s:accent7, "gui": "undercurl" })
  call s:h("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
  call s:h("SpellRare",   { "sp": s:accent8, "gui": "undercurl" })
  call s:h("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:accent6.cterm
  execute "hi! SpellCap   ctermbg=" s:accent11.cterm
  execute "hi! SpellRare  ctermbg=" s:accent10.cterm
  execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:accent12 })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent2 })
call s:h("Visual",       { "bg": s:accent5 })
call s:h("IncSearch",    { "bg": s:accent11 })
call s:h("Search",       { "bg": s:accent10 })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:accent12 })
call s:h("VertSplit",    { "fg": s:subtle, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent3 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:accent6 })
call s:h("DiffAdd",      { "bg": s:accent10 })
call s:h("DiffChange",   { "bg": s:accent6 })
call s:h("DiffDelete",   { "fg": s:accent7, "bg": s:accent6 })
call s:h("DiffText",     { "bg": s:accent6, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:accent8 })
call s:h("User2",        { "fg": s:bg, "bg": s:accent7 })
call s:h("User3",        { "fg": s:bg, "bg": s:accent9 })
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link LineNr       SignColumn
hi! link SpecialKey   NonText

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent3, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:accent7, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "fg": s:accent14, "cterm": "bold" })
call s:h("Number",     { "fg": s:accent13 })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

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

