"evening - dark colorscheme for vim-editor
"Author - Haron Prime
"License - © 2015 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/

" Default GUI Colours
let s:foreground      = "bbbbbb"
let s:background      = "252525"
let s:selection       = "404040"
let s:line            = "252525"
let s:activeline      = "353535"
let s:non_text        = "252525"
let s:comment         = "757575"
let s:window          = "252525"
let s:tab_bg          = "353535"
let s:tab_fg          = "bbbbbb"
let s:linenr_bg       = "252525"
let s:linenr_fg       = "656565"
let s:statusline_bg   = "303030"
let s:statusline_fg   = "65aaca"
let s:cursor_bg       = "555555"

let s:red             = "cc6666"
let s:lyme            = "afdf00"
let s:peach           = "cca68e"
let s:orange          = "de935f"
let s:wine            = "af8787"
let s:purple          = "b14cc2"
let s:yellow          = "f0c674"
let s:green           = "95bf68"
let s:aqua            = "20af75"
let s:olive           = "afaf4f"
let s:blue            = "6ad6e5"
let s:lightblue       = "65aaca"

" Console 256 Colours
if !has("gui_running")
	let s:background  = "252525"
	let s:window      = "252525"
	let s:line        = "252525"
	let s:selection   = "404040"
end

set background=dark
hi clear
syntax reset

let g:colors_name = "evening"

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

	"UI hlighting
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("LineNr", s:linenr_fg, s:linenr_bg, "")
	call <SID>X("NonText", s:non_text, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:background, s:lightblue, "")
	call <SID>X("TabLine", s:tab_fg, s:tab_bg, "none")
	call <SID>X("TabLineFill", s:tab_bg, s:foreground, "reverse")
	call <SID>X("TabLineSel", s:comment, s:background, "reverse")
	call <SID>X("StatusLine", s:statusline_bg, s:statusline_fg, "reverse")
	call <SID>X("StatusLineNC", s:statusline_bg, s:comment, "reverse")
	call <SID>X("VertSplit", s:window, s:window, "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:lightblue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:lyme, "", "")
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
	call <SID>X("Todo", s:comment, s:background, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Statement", s:lyme, "", "")
	call <SID>X("Conditional", s:foreground, "", "")
	call <SID>X("Repeat", s:foreground, "", "")
	call <SID>X("Label", s:blue, "", "")
	call <SID>X("Function", s:blue, "", "")
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:aqua, "", "")
	call <SID>X("SpecialChar", s:foreground, "", "")
	call <SID>X("PreProc", s:purple, "", "")
	call <SID>X("Operator", s:aqua, "", "none")
	call <SID>X("Keyword", s:blue, "", "")
	call <SID>X("Exception", s:red, "", "")
	call <SID>X("Type", s:lyme, "", "none")
	call <SID>X("Typedef", s:lyme, "", "bold")
	call <SID>X("Define", s:blue, "", "none")
	call <SID>X("Include", s:blue, "", "")
	"call <SID>X("Ignore", "666666", "", "")
	call <SID>X("Number", s:orange, "" , "")
	call <SID>X("Character", s:olive, "", "")
	call <SID>X("Number", s:orange, "", "")
	call <SID>X("Boolean", s:green, "", "bold")
	call <SID>X("Float", s:orange, "", "")
	call <SID>X("Identifier", s:peach, "", "")
	call <SID>X("Function", s:foreground, "", "")
	call <SID>X("Include", s:red, "", "")
	call <SID>X("Macro", s:blue, "", "")
	call <SID>X("PreCondit", s:aqua, "", "")
	call <SID>X("StorageClass", s:peach, "", "bold")
	call <SID>X("Structure", s:blue, "", "bold")
	call <SID>X("Delimiter",s:aqua, "", "")
	call <SID>X("SpecialComment", s:comment, "", "bold")
	call <SID>X("Debug", s:orange, "", "")
	call <SID>X("Global", s:blue, "", "")
	call <SID>X("Macro", s:blue, "", "")

	" Vim Highlighting
	call <SID>X("vimCommand", s:red, "", "none")
	call <SID>X("vimVar", s:peach, "", "")
	call <SID>X("vimFuncKey", s:lyme, "", "")
	call <SID>X("vimFunction", s:blue, "", "bold")
	call <SID>X("vimNotFunc", s:lyme, "", "")
	call <SID>X("vimMap", s:red, "", "")
	call <SID>X("vimAutoEvent", s:aqua, "", "bold")
	call <SID>X("vimMapModKey", s:aqua, "", "")
	call <SID>X("vimFuncName", s:purple, "", "")
	call <SID>X("vimIsCommand", s:foreground, "", "")
	call <SID>X("vimFuncVar", s:aqua, "", "")
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
	call <SID>X("cType", s:lyme, "", "bold")
	call <SID>X("cFormat", s:olive, "", "")
	call <SID>X("cBoolean", s:green, "", "")
	call <SID>X("cCharacter", s:olive, "", "")
	call <SID>X("cConstant", s:green, "", "bold")
	call <SID>X("cStorageClass", s:purple, "", "")
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

	" Shell/Bash highlighting
	call <SID>X("bashStatement", s:foreground, "", "bold")
	call <SID>X("shDerefVar", s:aqua, "", "bold")
	call <SID>X("shDerefSimple", s:aqua, "", "")
	call <SID>X("shFunction", s:orange, "", "bold")
	call <SID>X("shStatement", s:foreground, "", "")
	call <SID>X("shOperator", s:purple, "", "")
	call <SID>X("shConditional", s:orange, "", "")
	call <SID>X("shLoop", s:purple, "", "bold")
	call <SID>X("shQuote", s:olive, "", "")
	call <SID>X("shCaseEsac", s:aqua, "", "bold")
	call <SID>X("shSnglCase", s:purple, "", "none")
	call <SID>X("shFunctionOne", s:peach, "", "")
	call <SID>X("shCase", s:peach, "", "")
	call <SID>X("shSetList", s:peach, "", "")

	" PHP Highlighting
	call <SID>X("phpVarSelector", s:red, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpIdentifier", s:blue, "", "")
	call <SID>X("phpType", s:aqua, "", "")
	call <SID>X("phpOperator", s:yellow,"","")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")
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
	call <SID>X("pythonImport", s:lyme, "", "bold")
	call <SID>X("pythonInclude", s:purple, "", "")
	call <SID>X("pythonStatement", s:lyme, "", "")
	call <SID>X("pythonConditional", s:purple, "", "")
	call <SID>X("pythonRepeat", s:purple, "", "")
	call <SID>X("pythonExceptions", s:red, "", "")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFunction", s:blue, "", "")
	call <SID>X("pythonPreCondit", s:purple, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")
	call <SID>X("pythonOperator", s:purple, "", "bold")
	call <SID>X("pythonBuiltin", s:foreground, "", "")
	call <SID>X("pythonDecorator", s:orange, "", "")
	call <SID>X("pythonString", s:olive, "", "")
	call <SID>X("pythonEscape", s:olive, "", "bold")
	call <SID>X("pythonStrFormatting", s:olive, "", "bold")
	call <SID>X("pythonBoolean", s:green, "", "bold")
	call <SID>X("pythonExClass", s:red, "", "")
	call <SID>X("pythonBytesEscape", s:olive, "", "bold")
	call <SID>X("pythonDottedName", s:purple, "", "")
	call <SID>X("pythonStrFormat", s:foreground, "", "")
	call <SID>X("pythonBuiltinFunc", s:foreground, "", "")
	call <SID>X("pythonBuiltinObj", s:foreground, "", "")

	" Go Highlighting
	call <SID>X("goStatement", s:lyme, "", "")
	call <SID>X("goConditional", s:purple, "", "")
	call <SID>X("goRepeat", s:purple, "", "")
	call <SID>X("goException", s:purple, "", "")
	call <SID>X("goDeclaration", s:blue, "", "")
	call <SID>X("goConstants", s:yellow, "", "")
	call <SID>X("goBuiltins", s:orange, "", "")

	" CoffeeScript Highlighting
	call <SID>X("coffeeKeyword", s:purple, "", "")
	call <SID>X("coffeeConditional", s:purple, "", "")

	" Java Highlighting
	call <SID>X("javaExternal", s:lyme, "", "")
	call <SID>X("javaAnnotation", s:orange, "", "")
	call <SID>X("javaTypedef", s:aqua, "", "")
	call <SID>X("javaClassDecl", s:aqua, "", "bold")
	call <SID>X("javaScopeDecl", s:blue, "", "bold")
	call <SID>X("javaStorageClass", s:peach, "", "bold")
	call <SID>X("javaBoolean", s:peach, "", "")

	" JavaScript Highlighting
	call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptParens", s:blue, "", "")
	call <SID>X("javaScriptIdentifier", s:peach, "", "bold")
	call <SID>X("javaScriptFunction", s:lyme, "", "bold")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptBoolean", s:orange, "", "")
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
	call <SID>X("htmlTitle", s:green, "", "bold")
	call <SID>X("htmlH1", s:green, "", "bold")
	call <SID>X("htmlH2", s:aqua, "", "bold")
	call <SID>X("htmlH3", s:purple, "", "bold")
	call <SID>X("htmlH4", s:orange, "", "bold")
	call <SID>X("htmlTag", s:red, "", "")
	call <SID>X("htmlTagName", s:lyme, "", "")
	call <SID>X("htmlArg", s:red, "", "")
	call <SID>X("htmlString", s:olive, "", "")
	call <SID>X("htmlScriptTag", s:lyme, "", "")
	call <SID>X("htmlBold", s:foreground, "", "bold")
	call <SID>X("htmlItalic", s:comment, "", "bold")
	call <SID>X("htmlBoldItalic", s:peach, "", "bold")
	call <SID>X("htmlTagN", s:lyme, "", "bold")
	call <SID>X("htmlSpecialTagName", s:orange, "", "bold")
	call <SID>X("htmlComment", s:comment, "", "bold")
	call <SID>X("htmlCommentPart", s:comment, "", "")

	" Markdown Highlighting
	call <SID>X("markdownH1", s:lyme, "", "bold")
	call <SID>X("markdownBlockquote", s:lyme, "", "")
	call <SID>X("markdownCodeBlock", s:purple, "", "bold")
	call <SID>X("markdownLink", s:blue, "", "bold")
	call <SID>X("mkdCode", s:olive, "", "none")
	call <SID>X("mkdLink", s:blue, "", "bold")
	call <SID>X("mkdURL", s:comment, "", "none")
	call <SID>X("mkdString", s:foreground, "", "none")
	call <SID>X("mkdBlockQuote", s:foreground, s:window, "none")
	call <SID>X("mkdLinkTitle", s:lyme, "", "none")
	call <SID>X("mkdDelimiter", s:aqua, "", "")
	call <SID>X("mkdRule", s:lyme, "", "")

	" Systemtap Highlighting
	call <SID>X("stapComment", s:comment, "", "none")
	call <SID>X("stapProbe", s:aqua, "", "bold")
	call <SID>X("stapStat", s:peach, "", "bold")
	call <SID>X("stapFunc", s:foreground, "", "")
	call <SID>X("stapString", s:olive, "", "")
	call <SID>X("stapTarget", s:peach, "", "")
	call <SID>X("stapStatement", s:lyme, "", "")
	call <SID>X("stapType", s:lyme, "", "bold")
	call <SID>X("stapSharpBang", s:comment, "", "")
	call <SID>X("stapDeclaration", s:lyme, "", "")
	call <SID>X("stapCMacro", s:blue, "", "")

	" DTrace Highlighting
	call <SID>X("dtraceProbe", s:blue, "", "")
	call <SID>X("dtracePredicate", s:purple, "", "bold")
	call <SID>X("dtraceComment", s:comment, "", "")
	call <SID>X("dtraceFunction", s:foreground, "", "")
	call <SID>X("dtraceAggregatingFunction", s:blue, "", "bold")
	call <SID>X("dtraceStatement", s:peach, "", "bold")
	call <SID>X("dtraceIdentifier", s:lyme, "", "")
	call <SID>X("dtraceOption", s:lyme, "", "")
	call <SID>X("dtraceConstant", s:orange, "", "")
	call <SID>X("dtraceType", s:lyme, "", "bold")

	" PlantUML Highlighting
	call <SID>X("plantumlPreProc", s:orange, "", "bold")
	call <SID>X("plantumlDirectedOrVerticalArrowRL", s:lyme, "", "")
	call <SID>X("plantumlDirectedOrVerticalArrowLR", s:lyme, "", "")
	call <SID>X("plantumlString", s:olive, "", "")
	call <SID>X("plantumlActivityThing", s:purple, "", "")
	call <SID>X("plantumlText", s:peach, "", "")
	call <SID>X("plantumlClassPublic", s:olive, "", "bold")
	call <SID>X("plantumlClassPrivate", s:red, "", "")
	call <SID>X("plantumlColonLine", s:orange, "", "")
	call <SID>X("plantumlClass", s:peach, "", "")
	call <SID>X("plantumlHorizontalArrow", s:lyme, "", "")
	call <SID>X("plantumlTypeKeyword", s:blue, "", "bold")
	call <SID>X("plantumlKeyword", s:lyme, "", "bold")
	call <SID>X("plantumlType", s:blue, "", "bold")
	call <SID>X("plantumlBlock", s:purple, "", "bold")
	call <SID>X("plantumlPreposition", s:orange, "", "")
	call <SID>X("plantumlLayout", s:blue, "", "bold")
	call <SID>X("plantumlNote", s:orange, "", "")
	call <SID>X("plantumlLifecycle", s:aqua, "", "")
	call <SID>X("plantumlParticipant", s:foreground, "", "bold")

	" Haskell Highlighting
	call <SID>X("haskellType", s:aqua, "", "bold")
	call <SID>X("haskellIdentifier", s:orange, "", "bold")
	call <SID>X("haskellOperators", s:lyme, "", "")
	call <SID>X("haskellWhere", s:foreground, "", "bold")
	call <SID>X("haskellDelimiter", s:aqua, "", "")
	call <SID>X("haskellImportKeywords", s:lyme, "", "")
	call <SID>X("haskellStatement", s:purple, "", "bold")

	" SQL/MySQL Highlighting
	call <SID>X("sqlStatement", s:lyme, "", "bold")
	call <SID>X("sqlType", s:blue, "", "bold")
	call <SID>X("sqlKeyword", s:lyme, "", "")
	call <SID>X("sqlOperator", s:aqua, "", "")
	call <SID>X("sqlSpecial", s:green, "", "bold")
	call <SID>X("mysqlVariable", s:olive, "", "bold")
	call <SID>X("mysqlType", s:blue, "", "bold")
	call <SID>X("mysqlKeyword", s:lyme, "", "")
	call <SID>X("mysqlOperator", s:aqua, "", "")
	call <SID>X("mysqlSpecial", s:green, "", "bold")

	" Octave/MATLAB Highlighting
	call <SID>X("octaveVariable", s:foreground, "", "")
	call <SID>X("octaveDelimiter", s:lyme, "", "")
	call <SID>X("octaveQueryVar", s:foreground, "", "")
	call <SID>X("octaveSemicolon", s:purple, "", "")
	call <SID>X("octaveFunction", s:peach, "", "")
	call <SID>X("octaveSetVar", s:blue, "", "")
	call <SID>X("octaveUserVar", s:foreground, "", "")
	call <SID>X("octaveArithmeticOperator", s:aqua, "", "")
	call <SID>X("octaveBeginKeyword", s:purple, "", "bold")
	call <SID>X("octaveElseKeyword", s:purple, "", "bold")
	call <SID>X("octaveEndKeyword", s:purple, "", "bold")
	call <SID>X("octaveStatement", s:lyme, "", "")

	" Fortran Highlighting
	call <SID>X("fortranUnitHeader", s:foreground, "", "bold")
	call <SID>X("fortranType", s:lyme, "", "bold")
	call <SID>X("fortranStructure", s:blue, "", "bold")
	call <SID>X("fortranStorageClass", s:peach, "", "bold")
	call <SID>X("fortranStorageClassR", s:peach, "", "bold")
	call <SID>X("fortranKeyword", s:lyme, "", "")
	call <SID>X("fortranReadWrite", s:blue, "", "")
	call <SID>X("fortranIO", s:peach, "", "")

	" R Highlighting
	call <SID>X("rType", s:blue, "", "")
	call <SID>X("rArrow", s:lyme, "", "")
	call <SID>X("rDollar", s:blue, "", "")

	" XXD Highlighting
	call <SID>X("xxdAddress", s:peach, "", "")
	call <SID>X("xxdSep", s:lyme, "", "")
	call <SID>X("xxdAscii", s:lyme, "", "")
	call <SID>X("xxdDot", s:aqua, "", "")

	" Perl Highlighting
	call <SID>X("perlFiledescRead", s:green, "", "")
	call <SID>X("perlMatchStartEnd", s:lyme, "", "")
	call <SID>X("perlStatementFlow", s:lyme, "", "")
	call <SID>X("perlStatementStorage", s:lyme, "", "")
	call <SID>X("perlFunction", s:lyme, "", "bold")
	call <SID>X("perlMethod", s:foreground, "", "")
	call <SID>X("perlStatementFiledesc", s:orange, "", "")
	call <SID>X("perlVarPlain", s:peach, "", "")
	call <SID>X("perlSharpBang", s:comment, "", "")
	call <SID>X("perlStatementInclude", s:aqua, "", "bold")
	call <SID>X("perlStatementScalar", s:purple, "", "")
	call <SID>X("perlSubName", s:aqua, "", "bold")
	call <SID>X("perlSpecialString", s:olive, "", "bold")

	" Lua Highlighting
	call <SID>X("luaFunc", s:foreground, "", "")
	call <SID>X("luaIn", s:blue, "", "bold")
	call <SID>X("luaFunction", s:lyme, "", "")
	call <SID>X("luaStatement", s:blue, "", "")
	call <SID>X("luaRepeat", s:blue, "", "bold")
	call <SID>X("luaCondStart", s:purple, "", "bold")
	call <SID>X("luaTable", s:aqua, "", "bold")
	call <SID>X("luaConstant", s:green, "", "bold")
	call <SID>X("luaElse", s:purple, "", "bold")
	call <SID>X("luaCondElseif", s:purple, "", "bold")
	call <SID>X("luaCond", s:purple, "", "bold")

	" Clojure highlighting:
	call <SID>X("clojureConstant", s:blue, "", "")
	call <SID>X("clojureBoolean", s:orange, "", "")
	call <SID>X("clojureCharacter", s:olive, "", "")
	call <SID>X("clojureKeyword", s:lyme, "", "")
	call <SID>X("clojureNumber", s:orange, "", "")
	call <SID>X("clojureString", s:olive, "", "")
	call <SID>X("clojureRegexp", s:purple, "", "")
	call <SID>X("clojureRegexpEscape", s:lyme, "", "")
	call <SID>X("clojureParen", s:aqua, "", "")
	call <SID>X("clojureVariable", s:olive, "", "")
	call <SID>X("clojureCond", s:blue, "", "")
	call <SID>X("clojureDefine", s:blue, "", "bold")
	call <SID>X("clojureException", s:red, "", "")
	call <SID>X("clojureFunc", s:peach, "", "")
	call <SID>X("clojureMacro", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureSpecial", s:blue, "", "bold")
	call <SID>X("clojureQuote", s:blue, "", "")
	call <SID>X("clojureUnquote", s:blue, "", "")
	call <SID>X("clojureMeta", s:blue, "", "")
	call <SID>X("clojureDeref", s:blue, "", "")
	call <SID>X("clojureAnonArg", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureDispatch", s:aqua, "", "")

	" Yaml Highlighting
	call <SID>X("yamlBlockMappingKey", s:blue, "", "")
	call <SID>X("yamlKeyValueDelimiter", s:lyme, "", "")
	call <SID>X("yamlBlockCollectionItemStart", s:lyme, "", "")

	" Qt QML Highlighting
	call <SID>X("qmlObjectLiteralType", s:lyme, "", "")
	call <SID>X("qmlReserved", s:purple, "", "")
	call <SID>X("qmlBindingProperty", s:peach, "", "")
	call <SID>X("qmlType", s:peach, "", "")

	" Dosini Highlighting
	call <SID>X("dosiniHeader", s:lyme, "", "")
	call <SID>X("dosiniLabel", s:blue, "", "")

	" Mail highlighting
	call <SID>X("mailHeaderKey", s:blue, "", "")
	call <SID>X("mailHeaderEmail", s:purple, "", "")
	call <SID>X("mailSubject", s:lyme, "", "")
	call <SID>X("mailHeader", s:comment, "", "")
	call <SID>X("mailURL", s:aqua, "", "")
	call <SID>X("mailEmail", s:purple, "", "")
	call <SID>X("mailQuoted1", s:olive, "", "")
	call <SID>X("mailQuoted2", s:peach, "", "")

	" XML Highlighting
	call <SID>X("xmlProcessingDelim", s:lyme, "", "")
	call <SID>X("xmlString", s:olive, "", "")
	call <SID>X("xmlEqual", s:orange, "", "")
	call <SID>X("xmlAttrib", s:peach, "", "")
	call <SID>X("xmlAttribPunct", s:lyme, "", "")
	call <SID>X("xmlTag", s:wine, "", "")
	call <SID>X("xmlTagName", s:wine, "", "")
	call <SID>X("xmlEndTag", s:wine, "", "")
	call <SID>X("xmlNamespace", s:blue, "", "")

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
