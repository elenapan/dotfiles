" Vim color file
"
" Name:     desertink.vim
" Version:  1.2
" Author:   Markus Koller <markus-koller@gmx.ch>
"
" Note: Only works in GUI and 88/256 color terminals
"
" This is a version of the default desert colorscheme with a
" darker background and more colorful foreground colors.
"
" It also adds highlighting for folds, diffs, line numbers,
" signcolumn, completion menus, and cursor line/column.

" The colors are automatically converted for 88/256 color terminals,
" adapted from http://www.vim.org/scripts/script.php?script_id=1243
"
" You can find the latest version at https://github.com/toupeira/desertink.vim
"

set background=dark
if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name="desertink"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " functions {{{
  " returns an approximate grey index for the given grey level
  fun! <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " returns the palette index for the given grey index
  fun! <SID>grey_color(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
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
    endif
  endfun

  " returns the actual color level for the given color index
  fun! <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! <SID>rgb_color(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " returns the palette index to approximate the given R/G/B color levels
  fun! <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " there are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " use the grey
        return <SID>grey_color(l:gx)
      else
        " use the color
        return <SID>rgb_color(l:x, l:y, l:z)
      endif
    else
      " only one possibility
      return <SID>rgb_color(l:x, l:y, l:z)
    endif
  endfun

  " returns the palette index to approximate the 'rrggbb' hex string
  fun! <SID>rgb(rgb)
    if a:rgb == "ffffff"
      return 15
    endif

    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
  endfun

  " sets the highlighting for the given group, add optional fg, bg and attr
  " values to override the terminal settings
  fun! <SID>X(group, fg, bg, attr, ...)
    let l:ctermfg   = (a:0 > 0 && a:1 != "") ? a:1 : <SID>rgb(a:fg)
    let l:ctermbg   = (a:0 > 1 && a:2 != "") ? a:2 : <SID>rgb(a:bg)
    let l:ctermattr = (a:0 > 2 && a:3 != "") ? a:3 : a:attr

    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . l:ctermfg
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . l:ctermbg
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr
    endif
    if l:ctermattr != ""
      exec "hi " . a:group . " cterm=" . l:ctermattr
    endif
  endfun
  " }}}

  call <SID>X("Normal", "ffffff", "222222", "")
  call <SID>X("NonText", "addbe7", "3D3D3D", "bold")

  highlight! link TabLineFill Normal

  " highlight groups
  "CursorIM
  "Directory
  "WildMenu
  "Menu
  "Scrollbar
  "Tooltip

  call <SID>X("Cursor", "708090", "f0e68c", "")

  " setting a background color for the cursor line can hide
  " other background colors such as Error and ErrorMsg
  call <SID>X("CursorLine", "", "2a2a2a", "", "", "235", "none")
  call <SID>X("CursorColumn", "", "2a2a2a", "", "", "235")

  " use only bold for the cursorline to avoid covering the background
  "highlight clear CursorLine
  "highlight clear CursorColumn
  "highlight CursorLine cterm=bold gui=bold
  "highlight CursorColumn cterm=bold gui=bold

  call <SID>X("ColorColumn", "", "333333", "", "")

  call <SID>X("StatusLine", "262626", "ffffff", "reverse", "", "", "reverse")
  call <SID>X("StatusLineNC", "262626", "808080", "reverse", "")

  call <SID>X("Question", "00ff7f", "", "bold")
  call <SID>X("Error", "ffffff", "913d3b", "bold")
  call <SID>X("ErrorMsg", "ffffff", "913d3b", "bold")
  call <SID>X("ModeMsg", "daa520", "", "")
  call <SID>X("MoreMsg", "00ff7f", "", "bold")
  call <SID>X("Ignore", "666666", "", "")
  call <SID>X("Todo", "f9f747", "d75f00", "bold")

  "call <SID>X("VertSplit", "c2bfa5", "7f7f7f", "reverse")
  highlight! link VertSplit LineNr

  call <SID>X("LineNr", "444444", "1a1a1a", "", "239")
  "call <SID>X("CursorLineNr", "aaaaaa", "1a1a1a", "", "253")
  highlight! link CursorLineNr Folded

  call <SID>X("Folded", "ffa500", "333333", "bold")
  call <SID>X("FoldColumn", "d2b48c", "222222", "")
  call <SID>X("SignColumn", "", "2a2a2a", "", "", "236")

  call <SID>X("Search", "ffffff", "6b8e23", "bold")
  call <SID>X("IncSearch", "ffffff", "3a663a", "bold")

  call <SID>X("SpecialKey", "9acd32", "", "")

  call <SID>X("Title", "cd5c5c", "", "")
  call <SID>X("Visual", "", "2e5e73", "bold")
  call <SID>X("VisualNOS", "", "254A59", "bold")
  call <SID>X("WarningMsg", "fa8072", "", "")
  call <SID>X("MatchParen", "", "606060", "bold")

  call <SID>X("DiffAdd", "d7ffaf", "5f875f", "")
  call <SID>X("DiffChange", "d7d7ff", "5f5f87", "")
  call <SID>X("DiffDelete", "ff8080", "cc6666", "")
  call <SID>X("DiffText", "5f5f87", "81a2be", "")

  call <SID>X("Pmenu", "eeeeee", "444444", "")
  call <SID>X("PmenuSel", "ffffff", "555555", "bold")
  call <SID>X("PmenuSbar", "", "666666", "")
  call <SID>X("PmenuThumb", "", "606060", "")

  " syntax highlighting groups
  call <SID>X("Comment", "87ceeb", "", "")
  call <SID>X("Constant", "ff8080", "", "")
  call <SID>X("Identifier", "98fb98", "", "none")
  call <SID>X("Statement", "f0e260", "", "bold")
  call <SID>X("PreProc", "cd5c5c", "", "bold")
  call <SID>X("Type", "91b365", "", "bold")
  call <SID>X("Special", "ffc266", "", "")
  "Underlined

  " delete functions {{{
  delf <SID>X
  delf <SID>rgb
  delf <SID>color
  delf <SID>rgb_color
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_color
  delf <SID>grey_level
  delf <SID>grey_number
  " }}}
else
  " basic colorscheme for 16-color terminals
  highlight Statement ctermfg=Yellow
  highlight Identifier ctermfg=Green
  highlight Type ctermfg=DarkGreen
  highlight Comment ctermfg=Cyan
  highlight PreProc ctermfg=Blue
  highlight LineNr ctermfg=DarkGray
  highlight Special ctermfg=Brown
  highlight Constant ctermfg=Red

  highlight Search ctermfg=Black ctermbg=Green
  highlight IncSearch ctermfg=DarkGray ctermbg=White
  highlight Visual ctermfg=White ctermbg=Blue
  highlight Folded cterm=bold,reverse ctermfg=DarkGray ctermbg=Brown

  highlight Pmenu cterm=reverse ctermfg=DarkGray ctermbg=White
  highlight PmenuSel ctermfg=Black ctermbg=White
  highlight PmenuSbar ctermbg=Black
  highlight PmenuThumb ctermfg=White

  " use only bold for the cursorline to avoid covering the background
  highlight clear CursorLine
  highlight clear CursorColumn
  highlight CursorLine cterm=bold gui=bold
  highlight CursorColumn cterm=bold gui=bold
endif

" vim: set fdl=0 fdm=marker:
