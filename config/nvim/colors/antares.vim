" Antares - dark colorscheme for vim-editor
" Author - Haron Prime
" License - © 2015 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/

" Default GUI Colours
let s:foreground       = "bbbbbb"
let s:background       = "151515"
let s:selection        = "505050"
let s:line             = "151515"
let s:activeline       = "252525"
let s:non_text         = "151515"
let s:comment          = "757575"
let s:red              = "DE575C"
let s:orange           = "ED934C"
let s:yellow           = "EBE971"
let s:lyme             = "afdf00"
let s:peach            = "cca68e"
let s:green            = "00b853"
let s:aqua             = "4ae5e8"
let s:olive            = "afaf4f"
let s:blue             = "7fc6f0"
let s:lightblue        = "90d0f0"
let s:purple           = "CF9FFA"
let s:window           = "151515"
let s:tab_bg           = "353535"
let s:tab_fg           = "bbbbbb"
let s:linenr_bg        = "151515"
let s:linenr_fg        = "777777"
let s:statusline_bg    = "151515"
let s:statusline_fg    = "90d0f0"
let s:cursor_bg        = "555555"

" Console 256 Colours
if !has("gui_running")
	let s:background  = "151515"
	let s:window      = "151515"
	let s:line        = "151515"
	let s:selection   = "505050"
end

set background=dark
hi clear
syntax reset

let g:colors_name = "antares"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
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

  " Sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun

  "UI Highlighting
  call <SID>X("Normal", s:foreground, s:background, "none")
  call <SID>X("LineNr", s:linenr_fg, s:linenr_bg, "")
  call <SID>X("NonText", s:non_text, "", "")
  call <SID>X("SpecialKey", s:selection, "", "")
  call <SID>X("Search", s:background, s:lightblue, "")
  call <SID>X("TabLine", s:tab_fg, s:tab_bg, "none")
  call <SID>X("TabLineFill", s:tab_bg, s:foreground, "")
  call <SID>X("TabLineSel", s:tab_fg, s:background, "")
  call <SID>X("StatusLine", s:statusline_bg, s:statusline_fg, "")
  call <SID>X("StatusLineNC", s:linenr_fg, s:linenr_bg, "none")
  call <SID>X("VertSplit", s:linenr_bg, s:linenr_bg, "none")
  call <SID>X("Visual", "", s:selection, "")
  call <SID>X("Directory", s:blue, "", "")
  call <SID>X("ModeMsg", s:green, "", "")
  call <SID>X("MoreMsg", s:green, "", "")
  call <SID>X("Question", s:green, "", "")
  call <SID>X("WarningMsg", s:red, "", "")
  call <SID>X("MatchParen", "", s:selection, "")
  call <SID>X("Folded", s:comment, s:background, "")
  call <SID>X("FoldColumn", "", s:background, "")

  hi CursorLine guibg=#202020
  hi Cursor guifg=NONE guibg=#555555 gui=none

  if version >= 700
    call <SID>X("CursorLine", "", s:activeline, "none")
    call <SID>X("CursorColumn", "", s:line, "none")
    call <SID>X("PMenu", s:foreground, s:selection, "none")
    call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
    call <SID>X("SignColumn", "", s:background, "none")
  end
  if version >= 703
    call <SID>X("ColorColumn", "", s:line, "none")
  end

  " Standard Highlighting
  call <SID>X("Comment", s:comment, "", "")
  call <SID>X("Todo", s:red, s:background, "bold")
  call <SID>X("Title", s:comment, "", "")
  call <SID>X("Identifier", s:aqua, "", "none")
  call <SID>X("Statement", s:yellow, "", "none")
  call <SID>X("Conditional", s:blue, "", "")
  call <SID>X("Repeat", s:yellow, "", "")
  call <SID>X("Label", s:blue, "", "")
  call <SID>X("Structure", s:yellow, "", "")
  call <SID>X("Function", s:blue,"","")
  call <SID>X("Constant", s:orange, "", "")
  call <SID>X("String", s:green, "", "")
  call <SID>X("Special", s:blue, "", "")
  call <SID>X("PreProc", s:purple, "", "")
  call <SID>X("Operator", s:blue, "", "none")
  call <SID>X("Keyword", s:blue, "", "")
  call <SID>X("Exception", s:red, "", "")
  call <SID>X("Type", s:blue, "", "none")
  call <SID>X("Define", s:red, "", "none")
  call <SID>X("Include", s:blue, "", "")
  "call <SID>X("Ignore","666666","","")
  call <SID>X("Number", s:orange, "" , "")
  call <SID>X("Character", s:olive, "", "")
  call <SID>X("Boolean", s:green, "", "bold")
  call <SID>X("Float", s:orange, "", "")
  call <SID>X("Identifier", s:peach, "", "")
  call <SID>X("Macro", s:blue, "", "")
  call <SID>X("PreCondit", s:aqua, "", "")
  call <SID>X("StorageClass", s:peach, "", "bold")
  call <SID>X("Structure", s:blue, "", "bold")
  call <SID>X("Delimiter",s:aqua, "", "")
  call <SID>X("SpecialComment", s:comment, "", "bold")
  call <SID>X("Debug", s:orange, "", "")
  call <SID>X("Global", s:blue, "", "")

  " Vim Highlighting
  call <SID>X("vimCommand", s:red, "", "none")
  call <SID>X("vimVar", s:blue, "", "")
  call <SID>X("vimFuncKey", s:lyme, "", "")
  call <SID>X("vimFunction", s:blue, "", "bold")
  call <SID>X("vimNotFunc", s:lyme, "", "")
  call <SID>X("vimMap", s:red, "", "")
  call <SID>X("vimAutoEvent", s:aqua, "", "bold")
  call <SID>X("vimMapModKey", s:aqua, "", "")
  call <SID>X("vimFuncVar", s:aqua, "", "")
  call <SID>X("vimFuncName", s:aqua, "", "")
  call <SID>X("vimIsCommand", s:foreground, "", "")
  call <SID>X("vimLet", s:red, "", "")
  call <SID>X("vimMapRhsExtend", s:foreground, "", "")
  call <SID>X("vimCommentTitle", s:comment, "", "bold")
  call <SID>X("vimBracket", s:aqua, "", "")
  call <SID>X("vimParenSep", s:aqua, "", "")
  call <SID>X("vimSynType", s:olive, "", "bold")
  call <SID>X("vimNotation", s:aqua, "", "")
  call <SID>X("vimOper", s:foreground, "", "")

  " Makefile Highlighting
  call <SID>X("makeIdent", s:blue, "", "")
  call <SID>X("makeSpecTarget", s:olive, "", "")
  call <SID>X("makeTarget", s:red, "", "")
  call <SID>X("makeStatement", s:aqua, "", "bold")
  call <SID>X("makeCommands", s:foreground, "", "")
  call <SID>X("makeSpecial", s:orange, "", "bold")

  " CMake Highlighting
  call <SID>X("cmakeStatement", s:lyme, "", "")
  call <SID>X("cmakeArguments", s:foreground, "", "")
  call <SID>X("cmakeVariableValue", s:blue, "", "")
  call <SID>X("cmakeOperators", s:red, "", "")

  " C Highlighting
  call <SID>X("cType", s:blue, "", "")
  call <SID>X("cFormat", s:olive, "", "")
  call <SID>X("cBoolean", s:green, "", "")
  call <SID>X("cCharacter", s:olive, "", "")
  call <SID>X("cConstant", s:green, "", "bold")
  call <SID>X("cStorageClass", s:yellow, "", "")
  call <SID>X("cConditional", s:blue, "", "")
  call <SID>X("cSpecial", s:olive, "", "bold")
  call <SID>X("cNumber", s:orange, "", "")
  call <SID>X("cPreCondit", s:purple, "", "")
  call <SID>X("cRepeat", s:yellow, "", "")
  call <SID>X("cLabel",s:aqua, "", "")
  call <SID>X("cDefine", s:red, "", "")
  call <SID>X("cInclude", s:red, "", "")
  call <SID>X("cDelimiter",s:blue, "", "")
  call <SID>X("cOperator",s:aqua, "", "")
  call <SID>X("cFunction", s:foreground, "", "")
  call <SID>X("cCustomParen", s:foreground, "", "")
  call <SID>X("cOctalZero", s:purple, "", "bold")

  " CPP highlighting
  call <SID>X("cppBoolean", s:peach, "", "")
  call <SID>X("cppSTLnamespace", s:purple, "", "")
  call <SID>X("cppSTLconstant", s:foreground, "", "")
  call <SID>X("cppSTLtype", s:foreground, "", "")
  call <SID>X("cppSTLexception", s:lyme, "", "")
  call <SID>X("cppSTLfunctional", s:foreground, "", "bold")
  call <SID>X("cppSTLiterator", s:foreground, "", "bold")
  call <SID>X("cppExceptions", s:red, "", "")
  call <SID>X("cppStatement", s:blue, "", "")
  call <SID>X("cppStorageClass", s:peach, "", "bold")
  call <SID>X("cppAccess",s:blue, "", "")

  " Lex highlighting
  call <SID>X("lexCFunctions", s:foreground, "", "")
  call <SID>X("lexAbbrv", s:purple, "", "")
  call <SID>X("lexAbbrvRegExp", s:aqua, "", "")
  call <SID>X("lexAbbrvComment", s:comment, "", "")
  call <SID>X("lexBrace", s:peach, "", "")
  call <SID>X("lexPat", s:aqua, "", "")
  call <SID>X("lexPatComment", s:comment, "", "")
  call <SID>X("lexPatTag", s:orange, "", "")
  call <SID>X("lexSlashQuote", s:foreground, "", "")
  call <SID>X("lexSep", s:foreground, "", "")
  call <SID>X("lexStartState", s:orange, "", "")
  call <SID>X("lexPatTagZone", s:olive, "", "bold")
  call <SID>X("lexMorePat", s:olive, "", "bold")
  call <SID>X("lexOptions", s:olive, "", "bold")
  call <SID>X("lexPatString", s:olive, "", "")

  " Yacc highlighting
  call <SID>X("yaccNonterminal", s:peach, "", "")
  call <SID>X("yaccDelim", s:orange, "", "")
  call <SID>X("yaccInitKey", s:aqua, "", "")
  call <SID>X("yaccInit", s:peach, "", "")
  call <SID>X("yaccKey", s:purple, "", "")
  call <SID>X("yaccVar", s:aqua, "", "")

  " NASM highlighting
  call <SID>X("nasmStdInstruction", s:peach, "", "")
  call <SID>X("nasmGen08Register", s:aqua, "", "")
  call <SID>X("nasmGen16Register", s:aqua, "", "")
  call <SID>X("nasmGen32Register", s:aqua, "", "")
  call <SID>X("nasmGen64Register", s:aqua, "", "")
  call <SID>X("nasmHexNumber", s:purple, "", "")
  call <SID>X("nasmStorage", s:aqua, "", "bold")
  call <SID>X("nasmLabel", s:lyme, "", "")
  call <SID>X("nasmDirective", s:blue, "", "bold")
  call <SID>X("nasmLocalLabel", s:orange, "", "")

  " GAS highlighting
  call <SID>X("gasSymbol", s:lyme, "", "")
  call <SID>X("gasDirective", s:blue, "", "bold")
  call <SID>X("gasOpcode_386_Base", s:peach, "", "")
  call <SID>X("gasDecimalNumber", s:purple, "", "")
  call <SID>X("gasSymbolRef", s:lyme, "", "")
  call <SID>X("gasRegisterX86", s:blue, "", "")
  call <SID>X("gasOpcode_P6_Base", s:peach, "", "")
  call <SID>X("gasDirectiveStore", s:foreground, "", "bold")

  " MIPS highlighting
  call <SID>X("mipsInstruction", s:lyme, "", "")
  call <SID>X("mipsRegister", s:peach, "", "")
  call <SID>X("mipsLabel", s:aqua, "", "bold")
  call <SID>X("mipsDirective", s:purple, "", "bold")

  " PHP Highlighting
  call <SID>X("phpVarSelector", s:yellow, "", "")
  call <SID>X("phpKeyword", s:yellow, "", "")
  call <SID>X("phpIdentifier", s:blue, "", "")
  call <SID>X("phpType", s:aqua, "", "")
  call <SID>X("phpOperator", s:yellow,"","")
  call <SID>X("phpRepeat", s:yellow, "", "")
  call <SID>X("phpConditional", s:blue, "", "")
  call <SID>X("phpStatement", s:yellow, "", "")
  call <SID>X("phpMemberSelector", s:blue, "", "")
  call <SID>X("phpStringSingle", s:orange, "", "")
  call <SID>X("phpStringDelimiter", s:foreground, "", "")
  call <SID>X("phpDefine", s:red, "", "")
  call <SID>X("phpStorageClass", s:blue, "", "")
  call <SID>X("phpStructure", s:blue, "", "")
  call <SID>X("phpParent", s:foreground, "", "")
  call <SID>X("phpInclude", s:red, "", "")
  call <SID>X("phpMagicConstants", s:aqua, "", "")
  call <SID>X("phpFCKeyword", s:red, "", "")
  call <SID>X("phpSCKeyword", s:red, "", "")
  call <SID>X("phpConstant", s:aqua, "", "")
  call <SID>X("phpEnvVar", s:aqua, "", "")
  call <SID>X("phpIntVar", s:aqua, "", "")
  call <SID>X("phpCoreConstant", s:aqua, "", "")

  " Ruby Highlighting
  call <SID>X("rubySymbol", s:green, "", "")
  call <SID>X("rubyConstant", s:yellow, "", "")
  call <SID>X("rubyAttribute", s:blue, "", "")
  call <SID>X("rubyInclude", s:blue, "", "")
  call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
  call <SID>X("rubyCurlyBlock", s:orange, "", "")
  call <SID>X("rubyStringDelimiter", s:green, "", "")
  call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
  call <SID>X("rubyConditional", s:purple, "", "")
  call <SID>X("rubyRepeat", s:purple, "", "")

  " Python Highlighting
  call <SID>X("pythonInclude", s:purple, "", "")
  call <SID>X("pythonConditional", s:blue, "", "")
  call <SID>X("pythonRepeat", s:yellow, "", "")
  call <SID>X("pythonException", s:blue, "", "")
  call <SID>X("pythonStatement", s:yellow, "", "")
  call <SID>X("pythonImport", s:red, "", "")

  " Go Highlighting
  call <SID>X("goStatement", s:purple, "", "")
  call <SID>X("goConditional", s:purple, "", "")
  call <SID>X("goRepeat", s:purple, "", "")
  call <SID>X("goException", s:purple, "", "")
  call <SID>X("goDeclaration", s:blue, "", "")
  call <SID>X("goConstants", s:yellow, "", "")
  call <SID>X("goBuiltins", s:orange, "", "")

  " CoffeeScript Highlighting
  call <SID>X("coffeeKeyword", s:purple, "", "")
  call <SID>X("coffeeConditional", s:blue, "", "")

  " JavaScript Highlighting
  call <SID>X("javaScriptBraces", s:foreground, "", "")
  call <SID>X("javaScriptFunction", s:red, "", "")
  call <SID>X("javaScriptConditional", s:purple, "", "")
  call <SID>X("javaScriptRepeat", s:purple, "", "")
  call <SID>X("javaScriptNumber", s:orange, "", "")
  call <SID>X("javaScriptMember", s:orange, "", "")
  call <SID>X("javaScriptGlobal", s:yellow, "", "")

  " for https://github.com/pangloss/vim-javascript
  call <SID>X("jsModules", s:red, "", "")
  call <SID>X("jsModuleWords", s:red, "", "")
  call <SID>X("jsFunction", s:red, "", "")
  call <SID>X("jsClass", s:yellow, "", "")
  call <SID>X("jsOperator", s:foreground, "", "")
  call <SID>X("jsOperatorWords", s:blue, "", "")
  call <SID>X("jsKeyword", s:blue, "", "")

  " HTML Highlighting
  call <SID>X("htmlTag", s:red,"","")
  call <SID>X("htmlTagName", s:red,"","")
  call <SID>X("htmlArg", s:red,"","")
  call <SID>X("htmlScriptTag", s:red,"","")

  " Shell/Bash highlighting
  call <SID>X("bashStatement", s:lightblue, "", "bold")
  call <SID>X("shDerefVar", s:aqua, "", "bold")
  call <SID>X("shDerefSimple", s:aqua, "", "")
  call <SID>X("shFunction", s:orange, "", "bold")
  call <SID>X("shStatement", s:lightblue, "", "")
  call <SID>X("shOperator", s:purple, "", "")
  call <SID>X("shConditional", s:orange, "", "")
  call <SID>X("shLoop", s:purple, "", "bold")
  call <SID>X("shQuote", s:olive, "", "")
  call <SID>X("shCaseEsac", s:aqua, "", "bold")
  call <SID>X("shSnglCase", s:purple, "", "none")
  call <SID>X("shFunctionOne", s:peach, "", "")
  call <SID>X("shCase", s:peach, "", "")
  call <SID>X("shSetList", s:peach, "", "")

  " Diff Highlighting
  let s:diffbackground = "494e56"

  call <SID>X("diffAdded", s:green, "", "")
  call <SID>X("diffRemoved", s:red, "", "")
  call <SID>X("DiffAdd", s:green, s:diffbackground, "")
  call <SID>X("DiffDelete", s:red, s:diffbackground, "")
  call <SID>X("DiffChange", s:yellow, s:diffbackground, "")
  call <SID>X("DiffText", s:diffbackground, s:orange, "")

  " ShowMarks Highlighting
  call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
  call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
  call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
  call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

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
endif
