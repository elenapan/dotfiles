" Vim color file
"
" Triple-Jelly, a modified jellybeans.vim based on the
" Triplet color scheme by Noel Cower.
"
" File:         triplejelly.vim
" URL:          ???
" Scripts URL:  ???
" Maintainer:   ???
" Version:      ???
" Last Change:  2014 January 10
" License:      MIT
" Contributors: Daniel Herbert (pocketninja)
"               Henry So, Jr. <henryso@panix.com>
"               David Liang <bmdavll at gmail dot com>
"               Rich Healey (richo)
"               Andrew Wong (w0ng)
"               Noel Cower (nilium)
"
" Copyright (c) 2009-2012, 2015 NanoTech
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation  files  (the “Software”), to deal in the Soft‐
" ware without restriction,  including  without  limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software,  and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice  and  this  permission  notice
" shall  be  included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "triplejelly"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  let s:low_color = 0
else
  let s:low_color = 1
endif

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellybeans.vim by Daniel Herbert

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
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
fun! s:grey_level(n)
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
fun! s:grey_color(n)
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
fun! s:rgb_number(x)
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
fun! s:rgb_level(n)
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
fun! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:fge = empty(a:lcfg)
    let l:bge = empty(a:lcbg)

    if !l:fge && !l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
    elseif !l:fge && l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
    endif
  else
    let l:fge = empty(a:fg)
    let l:bge = empty(a:bg)

    if !l:fge && !l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
    elseif !l:fge && l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
    endif
  endif

  if a:attr == ""
    exec "hi ".a:group." gui=none cterm=none"
  else
    let l:noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
    if empty(l:noitalic)
      let l:noitalic = "none"
    endif
    exec "hi ".a:group." gui=".a:attr." cterm=".l:noitalic
  endif
endfun
" }}}

if !exists("g:triplejelly_background_color")
  let g:triplejelly_background_color = "171719"
end

if !exists("g:triplejelly_foreground_color")
  let g:triplejelly_foreground_color="C6CFD2"
end

" Other color classes
let g:triplejelly_c_comment="74737E"
let g:triplejelly_c_type="FB97D2"
let g:triplejelly_c_func="FB97D2"
let g:triplejelly_c_func_name="FB97D2"
let g:triplejelly_c_call="BB95EF"
let g:triplejelly_c_namespace="FB97D2"
let g:triplejelly_c_operator="3D8F9A"
let g:triplejelly_c_keyword="00D2E5"
let g:triplejelly_c_control="DBCD5D"
let g:triplejelly_c_import="E160B4"
let g:triplejelly_c_storage="EC7967"
let g:triplejelly_c_number="99CC66"
let g:triplejelly_c_quote="FF91C5"
let g:triplejelly_c_string="BBE16C"
let g:triplejelly_c_interp="797BE6"
let g:triplejelly_c_var="47AEE8"
let g:triplejelly_c_const="34A2D9"
let g:triplejelly_c_lib_func="BB95EF"
let g:triplejelly_c_lib_type="6E9CBE"
let g:triplejelly_c_lib_const="99CC33"
let g:triplejelly_c_highlight="2B3448"

call s:X("Normal",g:triplejelly_foreground_color,g:triplejelly_background_color,"","White","")
set background=dark

if !exists("g:triplejelly_use_lowcolor_black") || g:triplejelly_use_lowcolor_black
    let s:termBlack = "Black"
else
    let s:termBlack = "Grey"
endif

if version >= 700
  call s:X("CursorLine","",g:triplejelly_c_highlight,"","",s:termBlack)
  call s:X("CursorColumn","",g:triplejelly_c_highlight,"","",s:termBlack)
  call s:X("MatchParen","F2E049","","underline","Yellow","")

  call s:X("TabLine","000000","b0b8c0","none","",s:termBlack)
  call s:X("TabLineFill","9098a0","","","",s:termBlack)
  call s:X("TabLineSel","000000","f0f0f0","none",s:termBlack,"White")

  " Auto-completion
  call s:X("Pmenu",g:triplejelly_foreground_color,"606060","","White",s:termBlack)
  call s:X("PmenuSel",g:triplejelly_background_color,"eeeeee","",s:termBlack,"White")
endif

call s:X("Visual","","344E6D","none","","DarkCyan")
call s:X("VisualNOS","","344E6D","none","","DarkCyan")
call s:X("Cursor",g:triplejelly_background_color,"33DDFF","",s:termBlack,"LightCyan")

call s:X("LineNr","404040",g:triplejelly_background_color,"none",s:termBlack,"")
call s:X("CursorLineNr","3aafe0","","none","DarkCyan","")
" Color test for comment
call s:X("Comment",g:triplejelly_c_comment,"","none","Grey","")
" TODO: Color test for todo
call s:X("Todo","FF9F00","","none","White",s:termBlack)

call s:X("StatusLine",g:triplejelly_background_color,"3EB2FC","none","","White")
call s:X("StatusLineNC","757575","212121","none","Grey","DarkGrey")
call s:X("VertSplit","","a6a6a6","",s:termBlack,s:termBlack)
call s:X("WildMenu","f0a0c0","302028","","Magenta","")

call s:X("Folded","a0a8b0","384048","none",s:termBlack,"")
call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
call s:X("SignColumn","404040",g:triplejelly_background_color,"","",s:termBlack)
call s:X("ColorColumn","","222222","","",s:termBlack)

call s:X("Title","70b950","","none","Green","")

call s:X("Number",g:triplejelly_c_number,"","","LightBlue","")
call s:X("Constant",g:triplejelly_c_const,"","","LightBlue","")
call s:X("Special",g:triplejelly_c_interp,"","","LightYellow","")
call s:X("Delimiter",g:triplejelly_c_interp,"","","LightMagenta","")

call s:X("String",g:triplejelly_c_string,"","","Green","")
call s:X("StringDelimiter",g:triplejelly_c_quote,"","","LightRed","")
call s:X("SpecialChar",g:triplejelly_c_interp,"","","LightMagenta","")

call s:X("Control",g:triplejelly_c_control,"","","LightYellow","")
hi! link Conditional Control

call s:X("Identifier",g:triplejelly_c_var,"","","LightCyan","")
call s:X("Structure",g:triplejelly_c_type,"","","LightMagenta","")
call s:X("Function",g:triplejelly_c_keyword,"","","LightYellow","")
call s:X("FunctionName",g:triplejelly_c_func_name,"","","LightMagenta","")
hi! link Statement Control
call s:X("PreProc","8fbfdc","","","LightBlue","")
call s:X("StorageClass",g:triplejelly_c_storage,"","","Red","")
call s:X("MemberAccess", g:triplejelly_c_call, "", "", "LightBlue", "")

call s:X("Operator",g:triplejelly_c_operator,"","","LightBlue","")

call s:X("Type",g:triplejelly_c_type,"","","Yellow","")
call s:X("NonText","555E4F","","","Grey","")

call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")

call s:X("Search","DFDFDF","5F00FF","none","White","DarkCyan")

call s:X("Directory","dad085","","","Yellow","")
call s:X("ErrorMsg","","902020","","","DarkRed")
hi! link Error ErrorMsg
hi! link MoreMsg Special
call s:X("Question","65C254","","","Green","")


" Spell Checking

call s:X("SpellBad","","902020","underline","","DarkRed")
call s:X("SpellCap","","0000df","underline","","Blue")
call s:X("SpellRare","","540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2D7067","underline","","Green")

" VimDiff

call s:X("DiffAdd","D2EBBE","437019","","White","DarkGreen")
call s:X("DiffDelete","40000A","700009","","DarkRed","DarkRed")
call s:X("DiffChange","","2B5B77","","White","DarkBlue")
call s:X("DiffText","8fbfdc","000000","reverse","Yellow","")

" Diff

hi! link diffRemoved DiffDelete
hi! link diffAdded DiffAdd

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass",g:triplejelly_c_type,"","","DarkBlue","")
call s:X("rubyIdentifier",g:triplejelly_c_var,"","","Cyan","")
hi! link rubyConstant Constant
hi! link rubyFunction Function

call s:X("rubyInstanceVariable",g:triplejelly_c_var,"","","Cyan","")
call s:X("rubySymbol",g:triplejelly_c_string,"","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
hi! link rubyControl Control

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

hi! link rubyRegexpDelimiter StringDelimiter
hi! link rubyRegexp String
call s:X("rubyRegexpSpecial",g:triplejelly_c_interp,"","","LightYellow","")

call s:X("rubyPredefinedIdentifier",g:triplejelly_c_lib_const,"","","LightGreen","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Go

hi! link goDirective Function
hi! link goDeclaration Function
hi! link goBoolean Constant
hi! link goCharacter String

hi! link goSignedInts Number
hi! link goUnsignedInts Number
hi! link goFloats Number
hi! link goComplexes Number

call s:X("goStorage", g:triplejelly_c_storage, "", "", "LightRed", "")
hi! link goType goStorage
hi! link goSignedInts goStorage
hi! link goUnsignedInts goStorage
hi! link goFloats goStorage
hi! link goComplexes goStorage

call s:X("goFunction", g:triplejelly_c_func_name, "", "", "LightMagenta", "")
hi! link goType StorageClass
hi! link goStructDef goFunction
hi! link goStruct goFunction
hi! link goMethod goFunction

" PHP

func! s:OverridePHPSyntax()
  hi! link phpFunctions Function
  hi! link phpSuperglobal Constant
  hi! link phpArrayPair Operator

  hi! link phpType StorageClass
  hi! link phpFunction FunctionName
  hi! link phpMethod FunctionName

  hi! link phpVarSelector Identifier
  hi! link phpMethodsVar MemberAccess

  " Doc tags
  hi! link phpDocTags Keyword
  hi! link phpDocParam StorageClass
  hi! link phpDocIdentifier Identifier
endfunc

augroup triplejellyPHP
au!
au FileType php call <SID>OverridePHPSyntax()
augroup END

" Vimscript

hi! link vimOper Normal
hi! link vimUserFunc FunctionName

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","1d1d1d","","","")
call s:X("IndentGuidesEven","","28292a","","","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","B9ED67","405026","","White","Green")

if !exists("g:triplejelly_background_color_256")
  let g:triplejelly_background_color_256=233
end
" Manual overrides for 256-color terminals. Dark colors auto-map badly.
" TODO: Port from jellybeans
if !s:low_color
  hi Search ctermbg=57 ctermfg=188
  hi StatusLineNC ctermbg=232 ctermfg=244
  hi Folded ctermbg=235
  hi FoldColumn ctermbg=235
  hi CursorColumn ctermbg=234
  hi ColorColumn ctermbg=234
  hi CursorLine ctermbg=234
  hi CursorLineNr ctermbg=234
  hi SpecialKey ctermbg=234
  exec "hi NonText ctermbg=".g:triplejelly_background_color_256." ctermfg=236"
  exec "hi LineNr ctermbg=".g:triplejelly_background_color_256
  exec "hi SignColumn ctermbg=".g:triplejelly_background_color_256
  hi DiffText ctermfg=75
  exec "hi Normal ctermbg=".g:triplejelly_background_color_256
  hi DbgBreakPt ctermbg=26
  hi IndentGuidesOdd ctermbg=234
  hi IndentGuidesEven ctermbg=235
endif

hi UnderWord term=underline cterm=underline gui=underline

if exists("g:triplejelly_overrides")
  fun! s:load_colors(defs)
    for [l:group, l:v] in items(a:defs)
      call s:X(l:group, get(l:v, 'guifg', ''), get(l:v, 'guibg', ''),
      \                 get(l:v, 'attr', ''),
      \                 get(l:v, 'ctermfg', ''), get(l:v, 'ctermbg', ''))
      if !s:low_color
        for l:prop in ['ctermfg', 'ctermbg']
          let l:override_key = '256'.l:prop
          if has_key(l:v, l:override_key)
            exec "hi ".l:group." ".l:prop."=".l:v[l:override_key]
          endif
        endfor
      endif
      unlet l:group
      unlet l:v
    endfor
  endfun
  call s:load_colors(g:triplejelly_overrides)
  delf s:load_colors
endif

"hi Visual term=none cterm=none ctermbg=23 guibg=#344E6D gui=none

" delete functions {{{
delf s:X
delf s:rgb
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
" }}}
