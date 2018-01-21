" Eddie Colorscheme for 256 and GUI
" Author: Matt Sacks , kk , Mitko Kostov <mitkok@7thoughts.com>
" 
" This is my adaptation of the pastelmod eclipse theme from my co-worker Eddie
" who spent too much time developing these specific colors.
" Hex color conversion functions borrowed from the themes 'Desert256' and
" Chris Kempson's Tomorrow

" Default GUI Colours
let s:foreground   = "c0bfbf"
let s:background   = "101010"
let s:bg1   = "111111"
let s:bg2   = "050505"
let s:bg2   = "0f0f0f"
let s:bg3   = "171717"
let s:bg4   = "1f1f1f"
let s:bg5   = "272727"
let s:bg6   = "2f272f"
let s:bg7   = "372737"
let s:tabselection = "506775"
let s:selection    = "eE1F29"

"cursor
let s:line         = "81869A"
let s:status_line  = "202527"
let s:cursorline   = "2F393C"
let s:statusline   = "4A5A5F"
let s:comment      = "ad6b1d"
let s:red          = "e76481"
let s:diff_red     = "542D32"
let s:orange       = "CAaC81"
let s:diff_orange  = "574133"
let s:task_tag     = "A58B61"
let s:yellow       = "e8e267"
let s:green        = "93C79F"
let s:diff_green   = "3E5443"
let s:aqua         = "53ccc2"
let s:blue         = "aa46c8"
let s:dark_blue    = "4E778E"
let s:diff_blue    = "2E4754"
let s:purple       = "A072BD"
let s:cond         = "ee829D"
let s:window       = "616161"
let s:xml_tag      = "a87F4A"
let s:xml_end      = "E03F8A"

set background=dark
hi clear
syntax reset

let g:colors_name = "kkruby"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " Color Calculations {{{
  " Returns an approximate grey index for the given grey level
  fun <SID>grey_number(x)
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

  " Returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
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

  " Returns the palette index for the given grey index
  fun <SID>grey_colour(n)
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

  " Returns an approximate colour index for the given colour level
  fun <SID>rgb_number(x)
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

  " Returns the actual colour level for the given colour index
  fun <SID>rgb_level(n)
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

  " Returns the palette index for the given R/G/B colour indices
  fun <SID>rgb_colour(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " Returns the palette index to approximate the given R/G/B colour levels
  fun <SID>colour(r, g, b)
    " Get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " Get the closest colour
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " There are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " Use the grey
        return <SID>grey_colour(l:gx)
      else
        " Use the colour
        return <SID>rgb_colour(l:x, l:y, l:z)
      endif
    else
      " Only one possibility
      return <SID>rgb_colour(l:x, l:y, l:z)
    endif
  endfun

  " Returns the palette index to approximate the 'rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>colour(l:r, l:g, l:b)
  endfun

  " END Color Calculations }}}

  " Sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      " there's no green in 256 that looks like s:green
      if !has("gui_running") && a:fg == s:green
        exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=010"
      else
        exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
      endif
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun

  " Vim Highlighting
  call <SID>X("Normal", s:foreground, s:background, "")
  call <SID>X("LineNr", s:line, "", "")
  call <SID>X("NonText", s:selection, "", "")
  call <SID>X("SpecialKey", s:selection, "", "")
  call <SID>X("Search", "", s:yellow, "")
  call <SID>X("TabLine", s:foreground, s:background, "underline")
  call <SID>X("TabLineSel", s:foreground, s:tabselection, "none")
  call <SID>X("TabLineFill", s:foreground, s:background, "underline")
  call <SID>X("StatusLine", s:statusline, s:foreground, "reverse")
  call <SID>X("StatusLineNC", s:cursorline, s:comment, "")
  call <SID>X("VertSplit", s:window, s:window, "none")
  call <SID>X("Visual", "", s:selection, "none")
  call <SID>X("Directory", s:blue, "", "")
  call <SID>X("ModeMsg", "83cc9f", "", "")
  call <SID>X("MoreMsg", s:green, "", "")
  call <SID>X("Question", s:green, "", "")
  call <SID>X("WarningMsg", s:red, "", "")
  call <SID>X("MatchParen", "", s:selection, "")
  call <SID>X("Folded", s:comment, s:background, "")
  call <SID>X("FoldColumn", "", s:background, "")
  if version >= 700
    call <SID>X("CursorLine", "", s:cursorline, "none")
    call <SID>X("Cursor", "", s:line, "underline")
    call <SID>X("CursorColumn", "", s:line, "none")
    call <SID>X("PMenu", s:foreground, s:selection, "none")
    call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
  end
  if version >= 703
    call <SID>X("ColorColumn", "", "8181ee" , "none")
  end

  " Standard Highlighting
  call <SID>X("Comment", s:comment, "", "")
  call <SID>X("Todo", s:comment, s:background, "")
  call <SID>X("Title", s:comment, "", "")
  call <SID>X("Identifier", s:red, "", "none")
  call <SID>X("Statement", "fa6203" , "", "")
  call <SID>X("Conditional", "22ee11", "", "")
  call <SID>X("Repeat", "345678" , "88aaaa", "")
  call <SID>X("Structure", s:purple, "", "")
  call <SID>X("Function", s:blue, "", "")
  call <SID>X("Constant", s:orange, "", "")
  call <SID>X("String", "1baf10", "", "")
  call <SID>X("Special","ab8b83", "", "")
  call <SID>X("PreProc", s:purple, "", "")
  call <SID>X("Operator", s:aqua, "", "none")
  call <SID>X("Type", s:blue, "", "none")
  call <SID>X("Define", s:purple, "", "none")
  call <SID>X("Include", s:blue, "", "")
  call <SID>X("Ignore", "666666", "", "")

  " Vim Highlighting
  call <SID>X("vimCommand", s:red, "", "none")

  " C Highlighting
  call <SID>X("cType", s:yellow, "", "")
  call <SID>X("cStorageClass", s:purple, "", "")
  call <SID>X("cConditional", s:cond, "", "")
  call <SID>X("cRepeat", s:purple, "", "")
  call <SID>X("cCppOutWrapper","aacc99" , "", "")
  call <SID>X("cPreCondit","3a9ce9" , "", "")
  call <SID>X("cDefine","4acc49" , "", "")
  call <SID>X("cPreConditMatch","3a9ce9" , "", "")
  call <SID>X("cOperator","aa5ce9" , "", "")
  call <SID>X("cConstant","9a4c49" , "", "")
  call <SID>X("cBlock","8afcd9" , "555555", "")
  call <SID>X("cParen","fafcd9" , "f55555", "")

  " PHP Highlighting
  call <SID>X("phpVarSelector", s:red, "", "")
  call <SID>X("phpKeyword", s:purple, "", "")
  call <SID>X("phpRepeat", s:purple, "", "")
  call <SID>X("phpConditional", s:cond , "", "")
  call <SID>X("phpStatement", s:purple, "", "")
  call <SID>X("phpMemberSelector", s:foreground, "888888", "")

  " Ruby Highlighting
  call <SID>X("rubySymbol", s:task_tag, "", "")
  call <SID>X("rubyConstant", s:yellow, "", "")
  call <SID>X("rubyAttribute", s:blue, "", "")
  call <SID>X("rubyInclude", "aa55bb" , "", "")
  call <SID>X("rubyStringDelimiter", "99cf50" , s:bg1, "")
  call <SID>X("rubyInterpolationDelimiter", s:orange, s:bg2 , "")
  call <SID>X("rubyConditional", s:purple, "", "")
  call <SID>X("rubyRepeat", s:purple, s:bg5 , "")
  call <SID>X("rubyClass", s:aqua, "", "")
  call <SID>X("rubyControl", s:dark_blue, s:bg4, "")
  call <SID>X("rubyDefine", "a08556", s:bg3, "reverse")
  call <SID>X("rubyPredefinedConstant", "4596ff", s:bg1, "")
  highlight rubyIdentifier            guifg=#7518a7     ctermfg=143
  highlight rubyConstant              guifg=#72b6ef ctermfg=167
  highlight rubyInstanceVariable      guifg=#1165c1 ctermfg=189
  highlight rubyInterpolation         guifg=#b173d7 ctermfg=107
  highlight rubyLocalVariableOrMethod guifg=#d9903e ctermfg=189
  highlight rubyPseudoVariable        guifg=#4596ff ctermfg=221

  " Python Highlighting
  call <SID>X("pythonInclude", s:purple, "", "")
  call <SID>X("pythonStatement", s:purple, "", "")
  call <SID>X("pythonConditional", s:purple, "", "")
  call <SID>X("pythonFunction", s:blue, "", "")

  " HTML Highlighting
  call <SID>X("htmlTag", s:xml_tag, "", "")
  call <SID>X("htmlTagName", s:xml_tag, "", "")
  call <SID>X("xmlTag", s:xml_tag, "", "")
  call <SID>X("xmlTagName", s:xml_tag, "", "")
  call <SID>X("xmlEndTag", s:xml_end, "", "")
  call <SID>X("htmlSpecialTagName", s:orange, "", "")
  call <SID>X("htmlEndTag", s:aqua, "", "")
  call <SID>X("htmlTitle", "", "", "none")

  " CSS Highlighting
  call <SID>X("cssIdentifier", s:red, "", "")
  call <SID>X("cssClassName", s:aqua, "", "")
  call <SID>X("cssTagName", s:yellow, "", "")
  call <SID>X("cssPseudoClass", s:purple, "", "")

  " JavaScript Highlighting
  call <SID>X("javaScriptFunction", s:purple, "", "")
  call <SID>X("javaScriptConditional", s:yellow, "", "")
  call <SID>X("javaScriptRepeat", s:purple, "", "")
  call <SID>X("javaScriptNumber", s:orange, "", "")
  call <SID>X("javaScriptMember", s:orange, "", "")
  call <SID>X("javaScriptParens", s:aqua, "", "")
  call <SID>X("javaScriptBrackets", s:aqua, "", "")
  call <SID>X("javaScriptBlocks", s:task_tag, "", "")
  call <SID>X("javaScriptLabel", s:red, "", "none")

  " HAML Highlighting
  call <SID>X("hamlTag", s:orange, "", "")
  call <SID>X("hamlAttributesDelimiter", s:aqua, "", "")

  " SASS Highlighting
  call <SID>X("sassClass", s:aqua, "", "")

  " CoffeeScript Highlighting
  call <SID>X("coffeeStatement", s:orange, "", "none")
  call <SID>X("coffeeConditional", s:yellow, "", "")
  call <SID>X("coffeeBracket", s:aqua, "", "none")
  call <SID>X("coffeeParen", s:aqua, "", "none")
  call <SID>X("coffeeRepeat", s:purple, "", "none")
  call <SID>X("coffeeKeyword", s:yellow, "", "none")
  call <SID>X("coffeeSpecialVar", s:blue, "", "none")

  " ZSH Highlighting
  call <SID>X("zshCommands", s:red, "", "none")
  call <SID>X("zshKeyword", s:blue, "", "none")

  " Diff Highlighting
  call <SID>X("DiffAdd", "", s:diff_green, "")
  call <SID>X("diffAdded", s:green, "", "")
  call <SID>X("DiffDelete", s:diff_blue, s:diff_red, "")
  call <SID>X("diffRemoved", s:red, "", "")
  call <SID>X("DiffChange", "", s:diff_orange, "")
  call <SID>X("DiffText", "", s:diff_blue, "none")

  " Fugitive Highlighting
  call <SID>X("gitcommitUntrackedFile", s:red, "", "")
  call <SID>X("gitcommitSelectedFile", s:green, "", "")

  " Delete Functions
  delf <SID>X
  delf <SID>rgb
  delf <SID>colour
  delf <SID>rgb_colour
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_colour
  delf <SID>grey_level
  delf <SID>grey_number

  " 256-color cterm fixes for theme colors
  if !has("gui_running") && &t_Co == 256
    hi Normal ctermbg=234
    hi DiffChange ctermbg=094
    hi CursorLine ctermbg=235
    hi StatusLine ctermfg=239
    hi StatusLineNC ctermfg=234
    hi TabLineSel ctermbg=239
    hi Visual ctermbg=236
  endif
endif


