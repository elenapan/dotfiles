" File:       last256.vim
" Maintainer: Kai Yuan
" URL:        https://github.com/sk1418/last256
"      __               __     ___   ___________
"     / /   ____ ______/ /_   |__ \ / ____/ ___/
"    / /   / __ `/ ___/ __/   __/ //___ \/ __ \ 
"   / /___/ /_/ (__  ) /_    / __/____/ / /_/ / 
"  /_____/\__,_/____/\__/   /____/_____/\____/  
"                                                               "
" License: {{{
" Copyright (c) 2013-2016 Kai Yuan
"
" Permission is hereby granted, free of charge, to any per‐ son obtaining a
" copy of this software and associated doc‐ umentation files (the “Software”),
" to deal in the Soft‐ ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐ ute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICU‐ LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
" THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CON‐ TRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CON‐ NECTION WITH THE SOFTWARE OR THE USE OR OTHER
" DEALINGS IN THE SOFTWARE.
"
" }}}

" ChangeLog: {{{
"
" 2014-01-12   v1.1.0
" - adjusted many colors
" - fit terminal if terminal has solarized color scheme
" - add tabline colors
" - add new screenshot (github readme.md)
"
" 2013-03-28   v1.0.0
" inital release
" }}}
" Description:"{{{
" ----------------------------------------------------------------------------
"vim color scheme based on hybrid (https://github.com/w0ng/vim-hybrid)
"
" compare to hybrid:
"- Xresource based color highlighting was removed
"- colors are refined. e.g. comments color, visual selection ...
"- add FIXME, !Important!, !MARK1, !MARK2, !MARK3 hi-groups
"
"
"}}}
" Requirements And Recommendations:"{{{
" ----------------------------------------------------------------------------
" This colourscheme is intended for use on:
"   - gVim 7.3 for Linux, Mac and Windows.
"   - Vim 7.3 for Linux, using a 256 colour enabled terminal.
"}}}
" Initialisation:"{{{
" ----------------------------------------------------------------------------
if !has("gui_running") && &t_Co < 256
  finish
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "last256"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------
if has("gui_running")
  let s:vmode      = "gui"
	let s:white      = "#c6c6c6"
	let s:background = "#002b30"
  let s:window     = "#5f5f5f"
  let s:darkcolumn = "#1c1c1c"
  let s:addbg      = "#5f875f"
  let s:addfg      = "#d7ffaf"
  let s:changebg   = "#5f5f87"
  let s:changefg   = "#d7d7ff"
  let s:brown      = "#87875f"
  let s:foreground = "#808080"
  let s:selection  = "#585858"
  let s:visual     = "#5f8787"
  let s:line       = "#204444"
  let s:comment    = "#585858"
  let s:red        = "#d75f5f"
  let s:orange     = "#d78700"
  let s:yellow     = "#d7af5f"
  let s:green      = "#5faf5f"
  let s:aqua       = "#5fafd7"
  let s:blue       = "#5f87ff"
  let s:purple     = "#8787ff"
else
  let s:vmode      = "cterm"
	let s:white      = "251"
  let s:background = "16"
  let s:window     = "59"
  let s:darkcolumn = "234"
  let s:addbg      = "65"
  let s:addfg      = "193"
  let s:changebg   = "60"
  let s:changefg   = "189"
  let s:brown      = "101"
  let s:foreground = "244"
  let s:selection  = "240"
  let s:visual     = "66"
  let s:line       = "236"
  let s:comment    = "240"
  let s:red        = "167"
  let s:orange     = "172"
  let s:yellow     = "178"
  let s:green      = "71"
  let s:aqua       = "111"
  let s:blue       = "69"
  let s:purple     = "105"
endif

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
exe "let s:bg_none       = ' ".s:vmode."bg = ".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg = ".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg = ".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg = ".s:selection ."'"
exe "let s:bg_visual     = ' ".s:vmode."bg = ".s:visual ."'"
exe "let s:bg_line       = ' ".s:vmode."bg = ".s:line      ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg = ".s:comment   ."'"
exe "let s:bg_brown      = ' ".s:vmode."bg = ".s:brown   ."'"
exe "let s:bg_white      = ' ".s:vmode."bg = ".s:white   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg = ".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg = ".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg = ".s:yellow    ."'"
exe "let s:bg_green      = ' ".s:vmode."bg = ".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg = ".s:aqua      ."'"
exe "let s:bg_blue       = ' ".s:vmode."bg = ".s:blue      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg = ".s:purple    ."'"
exe "let s:bg_window     = ' ".s:vmode."bg = ".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg = ".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg = ".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg = ".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg = ".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg = ".s:changefg  ."'"

exe "let s:fg_none       = ' ".s:vmode."fg = ".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg = ".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg = ".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg = ".s:selection ."'"
exe "let s:fg_visual     = ' ".s:vmode."fg = ".s:visual ."'"
exe "let s:fg_line       = ' ".s:vmode."fg = ".s:line      ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg = ".s:comment   ."'"
exe "let s:fg_brown      = ' ".s:vmode."fg = ".s:brown   ."'"
exe "let s:fg_white      = ' ".s:vmode."fg = ".s:white   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg = ".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg = ".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg = ".s:yellow    ."'"
exe "let s:fg_green      = ' ".s:vmode."fg = ".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg = ".s:aqua      ."'"
exe "let s:fg_blue       = ' ".s:vmode."fg = ".s:blue      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg = ".s:purple    ."'"
exe "let s:fg_window     = ' ".s:vmode."fg = ".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg = ".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg = ".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg = ".s:addfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg = ".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg = ".s:changefg  ."'"

exe "let s:fmt_none      = ' ".s:vmode."   = NONE".          " term = NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."   = NONE".s:b.      " term = NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."   = NONE".s:b.      " term = NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."   = NONE".s:u.      " term = NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."   = NONE".s:u.s:b.  " term = NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."   = NONE".s:u.      " term = NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."   = NONE".s:c.      " term = NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."   = NONE".s:i.      " term = NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."   = NONE".s:s.      " term = NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."   = NONE".s:r.      " term = NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."   = NONE".s:r.s:b.  " term = NONE".s:r.s:b."'"

if has("gui_running")
  exe "let s:sp_none       = ' guisp=".s:none      ."'"
  exe "let s:sp_foreground = ' guisp=".s:foreground."'"
  exe "let s:sp_background = ' guisp=".s:background."'"
  exe "let s:sp_selection  = ' guisp=".s:selection ."'"
  exe "let s:sp_visual  = ' guisp=".s:visual ."'"
  exe "let s:sp_line       = ' guisp=".s:line      ."'"
  exe "let s:sp_comment    = ' guisp=".s:comment   ."'"
  exe "let s:sp_brown    = ' guisp=".s:brown   ."'"
  exe "let s:sp_red        = ' guisp=".s:red       ."'"
  exe "let s:sp_orange     = ' guisp=".s:orange    ."'"
  exe "let s:sp_yellow     = ' guisp=".s:yellow    ."'"
  exe "let s:sp_green      = ' guisp=".s:green     ."'"
  exe "let s:sp_aqua       = ' guisp=".s:aqua      ."'"
  exe "let s:sp_blue       = ' guisp=".s:blue      ."'"
  exe "let s:sp_purple     = ' guisp=".s:purple    ."'"
  exe "let s:sp_window     = ' guisp=".s:window    ."'"
  exe "let s:sp_addbg      = ' guisp=".s:addbg     ."'"
  exe "let s:sp_addfg      = ' guisp=".s:addfg     ."'"
  exe "let s:sp_changebg   = ' guisp=".s:changebg  ."'"
  exe "let s:sp_changefg   = ' guisp=".s:changefg  ."'"
else
  let s:sp_none       = ""
  let s:sp_foreground = ""
  let s:sp_background = ""
  let s:sp_selection  = ""
  let s:sp_line       = ""
  let s:sp_comment    = ""
  let s:sp_brown    = ""
  let s:sp_red        = ""
  let s:sp_orange     = ""
  let s:sp_yellow     = ""
  let s:sp_green      = ""
  let s:sp_aqua       = ""
  let s:sp_blue       = ""
  let s:sp_purple     = ""
  let s:sp_window     = ""
  let s:sp_addbg      = ""
  let s:sp_addfg      = ""
  let s:sp_changebg   = ""
  let s:sp_changefg   = ""
endif

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"		Conceal"
"		Cursor"
"		CursorIM"
exe "hi! Title"         .s:fg_white       .s:bg_none        .s:fmt_bold
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_red         .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_brown      .s:bg_none        .s:fmt_stnd
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"		Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_bold
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_bold
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_background  .s:bg_visual   .s:fmt_none
"		PmenuSbar" 
"		PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellBad"      .s:fg_red         .s:bg_none        .s:fmt_undr
exe "hi! SpellCap"      .s:fg_blue        .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_background     .s:bg_brown  .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr

"		VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
"		WildMenu"

if has('gui_running')
  exe "hi! Normal"        .s:fg_foreground  .s:bg_background  .s:fmt_none
else
  exe "hi! Normal"        .s:fg_foreground  .s:bg_none        .s:fmt_none
endif

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
"		Character"
"		Number"
"		Boolean"
"		Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_aqua        .s:bg_none        .s:fmt_bold
"		Conditional"
"		Repeat"
"		Label"
exe "hi! Operator"        .s:fg_foreground  .s:bg_none        .s:fmt_none
"		Keyword"
"		Exception"

exe "hi! PreProc"         .s:fg_blue        .s:bg_none        .s:fmt_none
"		Include"
"		Define"
"		Macro"
"		PreCondit"

exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_bold
"		StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_bold
"		Typedef"

exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! SpecialComment"         .s:fg_brown       .s:bg_none        .s:fmt_none
"		SpecialChar"
"		Tag"
"		Delimiter"
"		SpecialComment"
"		Debug"
"
exe "hi! Underlined"      .s:fg_aqua       .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_none        .s:fmt_undr

exe "hi! Todo"            .s:fg_background       .s:bg_green        .s:fmt_none


" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"add Important and mark1-3 groups
exe "hi! MK1"       . s:fg_background . s:bg_blue   . s:fmt_none
exe "hi! MK2"       . s:fg_background . s:bg_purple . s:fmt_none
exe "hi! MK3"       . s:fg_background . s:bg_orange . s:fmt_none
exe "hi! Important" . s:fg_background . s:bg_red    . s:fmt_bold
exe "hi! FIXME"     . s:fg_addfg      . s:bg_red    . s:fmt_bold
"add autocommands
autocmd BufWinEnter * call matchadd("Important","!Important!")
autocmd BufWinEnter * call matchadd("MK1","!MARK1")
autocmd BufWinEnter * call matchadd("MK2","!MARK2")
autocmd BufWinEnter * call matchadd("MK3","!MARK3")
autocmd BufWinEnter * call matchadd("FIXME","FIXME")
"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"		diffOldFile
"		diffNewFile
"		diffFile
"		diffOnly
"		diffIdentical
"		diffDiffer
"		diffBDiffer
"		diffIsA
"		diffNoEOL
"		diffCommon
hi! link diffRemoved Constant
"		diffChanged
hi! link diffAdded Special
"		diffLine
"		diffSubname
"		diffComment

" Tabline
hi! link TabLineFill StatusLineNC
hi! link TabLineSel  StatusLine 
hi! link TabLine Pmenu
"}}}

" vim: fdm=marker:sw=2:ts=2:tw=80
