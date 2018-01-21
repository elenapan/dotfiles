" sprinkles - a vim colorscheme with a configurable color palette
" Maintainer: Alex Griffin <alex@alexjgriffin.com>
" Version:    0.2.0-pre
" License:    This file is placed under an ISC-style license. See the included
"             LICENSE file for details.

" Standard Colorscheme Boilerplate {{{

highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "sprinkles"

" }}}

" Utility Functions {{{

" prints a warning message
function! s:Warn(msg)
  echohl WarningMsg
  echomsg "sprinkles: " . a:msg
  echohl NONE
endfunction

" ensures the given dictionary only contains rgb hex colors
function! s:CheckPalette(palette)
  for color in values(a:palette)
    if color !~# '^#\x\{6}$'
      call s:Warn("invalid palette color: " . color)
      return 0
    endif
  endfor
  return 1
endfunction

" Sets the text color, background color, and attributes for the given
" highlight group, in both terminal and gui vim. The values of a:hlgroup and
" a:attr are directly inserted into a highlight command. Valid values for
" a:fg and a:bg include the empty string (indicating NONE) and the first
" eight items in s:color_indices.
function! s:Style(hlgroup, fg, bg, attr)
  " get terminal color index
  let l:fg_idx = index(s:color_indices, a:fg)
  let l:bg_idx = index(s:color_indices, a:bg)

  let l:ctermfg = l:fg_idx == -1 ? "NONE" : l:fg_idx
  let l:ctermbg = l:bg_idx == -1 ? "NONE" : l:bg_idx
  let l:guifg   = a:fg     == "" ? "NONE" : a:fg
  let l:guibg   = a:bg     == "" ? "NONE" : a:bg
  let l:attr    = a:attr   == "" ? "NONE" : a:attr

  " use bright colors with the bold attr
  if a:attr =~# "bold" && (0 <= l:fg_idx && l:fg_idx < 8)
    let l:guifg = s:color_indices[l:fg_idx + 8]
  endif

  execute "highlight " . a:hlgroup . " ctermfg=" . l:ctermfg . " ctermbg=" .
    \ l:ctermbg . " cterm=" . l:attr . " guifg=" . l:guifg . " guibg=" .
    \ l:guibg . " gui=" . l:attr
endfunction

" }}}

" Set Color Palette {{{

" Default gui colors if background is *light* and no custom palette is used.
" This is the Tango theme from gnome-terminal.
let s:default_light = {
  \'text':       '#000000',
  \'background': '#ffffff',
  \'black':      '#000000',  'dark_grey':      '#555753',
  \'red':        '#cc0000',  'bright_red':     '#ef2929',
  \'green':      '#4e9a06',  'bright_green':   '#8ae234',
  \'yellow':     '#c4a000',  'bright_yellow':  '#fce94f',
  \'blue':       '#3465a4',  'bright_blue':    '#729fcf',
  \'magenta':    '#75507b',  'bright_magenta': '#ad7fa8',
  \'cyan':       '#06989a',  'bright_cyan':    '#34e2e2',
  \'white':      '#d3d7cf',  'bright_white':   '#eeeeec',
  \}

" Default gui colors if background is *dark* and no custom palette is used.
" This is the Tango theme from gnome-terminal.
let s:default_dark = {
  \'text':       '#d3d7cf',
  \'background': '#222222',
  \'black':      '#000000',  'dark_grey':      '#555753',
  \'red':        '#cc0000',  'bright_red':     '#ef2929',
  \'green':      '#4e9a06',  'bright_green':   '#8ae234',
  \'yellow':     '#c4a000',  'bright_yellow':  '#fce94f',
  \'blue':       '#3465a4',  'bright_blue':    '#729fcf',
  \'magenta':    '#75507b',  'bright_magenta': '#ad7fa8',
  \'cyan':       '#06989a',  'bright_cyan':    '#34e2e2',
  \'white':      '#d3d7cf',  'bright_white':   '#eeeeec',
  \}

" choose default colors based on background
if &background == "light"
  let s:palette = s:default_light
else
  let s:palette = s:default_dark
endif

" override default colors with custom palette
if exists("g:sprinkles_palette")
  if s:CheckPalette(g:sprinkles_palette)
    call extend(s:palette, g:sprinkles_palette)
  else
    call s:Warn("using default palette instead")
  endif
endif

" Set some convenience variables so that, e.g. s:palette.red can be referred
" to as s:red.
call extend(s:, s:palette)

" used to look up the corresponding terminal color index for a color
let s:color_indices = [
  \s:black, s:red, s:green, s:yellow, s:blue, s:magenta, s:cyan, s:white,
  \s:dark_grey,
  \         s:bright_red,
  \                s:bright_green,
  \                         s:bright_yellow,
  \                                   s:bright_blue,
  \                                           s:bright_magenta,
  \                                                      s:bright_cyan,
  \                                                              s:bright_white,
  \]

" }}}

" Standard Syntax Highlighting Groups {{{

if has("gui_running")
  call s:Style("Normal", s:text, s:background, "")
else
  call s:Style("Normal", "", "", "")
endif

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("Constant",       "",        "",        "")
call s:Style("Identifier",     "",        "",        "")
call s:Style("Ignore",         "",        "",        "")
call s:Style("Type",           "",        "",        "")
call s:Style("Statement",      "",        "",        "bold")
call s:Style("Comment",        s:blue,    "",        "")
call s:Style("String",         s:red,     "",        "")
call s:Style("Special",        s:magenta, "",        "")
call s:Style("SpecialComment", s:blue,    "",        "")
call s:Style("PreProc",        s:magenta, "",        "")
call s:Style("Underlined",     "",        "",        "underline")
call s:Style("Error",          s:white,   s:red,     "bold")
call s:Style("Todo",           s:black,   s:yellow,  "")
call s:Style("MatchParen",     "",        s:cyan,    "")

" }}}

" FileType-specific Tweaks {{{

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("javaStorageClass","",       "",        "bold")
call s:Style("javascriptFunction",   "",  "",        "bold")
call s:Style("javascriptIdentifier", "",  "",        "bold")
call s:Style("luaFunction",    "",        "",        "bold")
call s:Style("phpDefine",      "",        "",        "bold")
call s:Style("rubyDefine",     "",        "",        "bold")

" this might be a bit too invasive, but for some reason phpVarSelector doesn't
" respond to normal styling
highlight link phpVarSelector phpIdentifier

" }}}

" Vim UI Highlight Groups {{{

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("NonText",        s:cyan,    "",        "")
call s:Style("SpecialKey",     s:cyan,    "",        "")
call s:Style("LineNr",         s:cyan,    "",        "")
call s:Style("CursorLineNr",   s:cyan,    "",        "")
call s:Style("ErrorMsg",       s:white,   s:red,     "bold")
call s:Style("MoreMsg",        s:cyan,    "",        "")
call s:Style("ModeMsg",        "",        "",        "bold")
call s:Style("Question",       s:cyan,    "",        "")
call s:Style("Title",          s:magenta, "",        "")
call s:Style("WarningMsg",     s:red,     "",        "")
call s:Style("Cursor",         "",        "",        "reverse")
call s:Style("lCursor",        "",        "",        "reverse")
call s:Style("Visual",         "",        "",        "reverse")
call s:Style("VisualNOS",      "",        "",        "bold,underline")
call s:Style("TabLine",        "",        "",        "")
call s:Style("TabLineSel",     s:cyan,    "",        "")
call s:Style("TabLineFill",    "",        "",        "")
call s:Style("ColorColumn",    "",        s:red,     "")
call s:Style("CursorColumn",   "",        "",        "reverse")
call s:Style("CursorLine",     "",        "",        "underline")
call s:Style("VertSplit",      "",        "",        "reverse")
call s:Style("StatusLine",     "",        "",        "reverse,bold")
call s:Style("StatusLineNC",   "",        "",        "reverse")
call s:Style("WildMenu",       s:white,   s:magenta, "bold")
call s:Style("Search",         s:black,   s:yellow,  "")
call s:Style("IncSearch",      s:black,   s:cyan,    "")
call s:Style("Directory",      s:blue,    "",        "bold")
call s:Style("DiffAdd",        s:green,   "",        "")
call s:Style("DiffDelete",     s:red,     "",        "bold")
call s:Style("DiffChange",     s:magenta, "",        "")
call s:Style("DiffText",       s:magenta, "",        "bold")
call s:Style("Folded",         s:cyan,    "",        "")
call s:Style("FoldColumn",     s:cyan,    "",        "")
call s:Style("SignColumn",     s:cyan,    "",        "")
call s:Style("Pmenu",          s:white,   s:magenta, "")
call s:Style("PmenuSel",       "",        "",        "reverse")
call s:Style("PmenuSbar",      "",        s:white,   "")
call s:Style("PmenuThumb",     "",        s:black,   "")
call s:Style("SpellBad",       "",        s:red,     "")
call s:Style("SpellCap",       "",        s:green,   "")
call s:Style("SpellRare",      "",        s:green,   "")
call s:Style("SpellLocal",     "",        s:green,   "")

" Purposefully left unset: Conceal

" }}}
