" vim:fdm=marker:foldlevel=0
"  ____           _
" |  _ \ _ __ ___| |_ ___
" | |_) | '__/ _ \ __/ _ \
" |  __/| | |  __/ || (_) |
" |_|   |_|  \___|\__\___/
"
" A minimal dark theme for VIM

" Reset -------------------------------------------------------------------{{{1

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "preto"


" Palette ---------------------------------------------------------------- {{{1

let s:palette = {}

let s:palette.black  	 = [16 , "#000000"]
let s:palette.gray01 	 = [232, "#080808"]
let s:palette.gray02 	 = [233, "#121212"]
let s:palette.gray03 	 = [234, "#1c1c1c"]
let s:palette.gray04 	 = [235, "#262626"]
let s:palette.gray05 	 = [236, "#303030"]
let s:palette.gray06 	 = [237, "#3a3a3a"]
let s:palette.gray07 	 = [238, "#444444"]
let s:palette.gray08 	 = [239, "#4e4e4e"]
let s:palette.gray09 	 = [240, "#585858"]
let s:palette.gray10 	 = [241, "#606060"]
let s:palette.gray11 	 = [242, "#666666"]
let s:palette.gray12 	 = [243, "#767676"]
let s:palette.gray13 	 = [244, "#808080"]
let s:palette.gray14 	 = [245, "#8a8a8a"]
let s:palette.gray15 	 = [246, "#949494"]
let s:palette.gray16 	 = [247, "#9e9e9e"]
let s:palette.gray17 	 = [248, "#a8a8a8"]
let s:palette.gray18 	 = [249, "#b2b2b2"]
let s:palette.gray19 	 = [250, "#bcbcbc"]
let s:palette.gray20 	 = [251, "#c6c6c6"]
let s:palette.gray21 	 = [252, "#d0d0d0"]
let s:palette.gray22 	 = [253, "#dadada"]
let s:palette.gray23 	 = [254, "#e4e4e4"]
let s:palette.white  	 = [255, "#eeeeee"]

let s:palette.cyan 		 = [6  , "#008080"]
let s:palette.darkblue 	 = [18 , "#000087"]
let s:palette.darkgreen  = [22 , "#005f00"]
let s:palette.blue   	 = [33 , "#0087ff"]
let s:palette.green  	 = [42 , "#00d787"]
let s:palette.darkred 	 = [52 , "#5f0000"]
let s:palette.darkpurple = [53 , "#5f005f"]
let s:palette.darkyellow = [58 , "#5f5f00"]
let s:palette.red      	 = [124, "#af0000"]
let s:palette.purple 	 = [129, "#af00ff"]
let s:palette.brown 	 = [130, "#af5f00"]
let s:palette.orange 	 = [166, "#d75f00"]
let s:palette.pink 		 = [200, "#ff00d7"]
let s:palette.yellow	 = [228, "#ffff87"]


" Utilities -------------------------------------------------------------- {{{1

function! s:HL(item, fgColor, bgColor, style, ...)
	let undesirable_runtimes = a:000
	for runtime in undesirable_runtimes
		if has(runtime)
			return	
		end
	endfor

	let target = 'cterm'
	let pindex = 0
	if has('gui_running')
		let target = 'gui'
		let pindex = 1
	end

	let command  = 'hi ' . a:item
	let command .= ' ' . target . 'fg=' . a:fgColor[pindex]
	let command .= ' ' . target . 'bg=' . a:bgColor[pindex]
	let command .= ' ' . target . '=' . a:style

	execute command
endfunction


" Composition ------------------------------------------------------------ {{{1

" PRIMITIVES
call s:HL('Boolean'		  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Character'	  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Constant'	  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Float'		  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Number'		  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('String'		  , s:palette.gray12, s:palette.black , 'none'	   )
call s:HL('SpecialChar'	  , s:palette.white , s:palette.black , 'none'	   )

" COMMENTS
call s:HL('Comment'		  , s:palette.gray05, s:palette.black , 'bold'	   )
call s:HL('SpecialComment', s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Title'		  , s:palette.gray09, s:palette.black , 'bold'	   )
call s:HL('Todo'		  , s:palette.purple, s:palette.black , 'bold'	   )

" LINES, COLUMNS
call s:HL('LineNr'		  , s:palette.gray06, s:palette.black , 'bold'	   )
call s:HL('CursorLine'	  , s:palette.white , s:palette.gray03, 'none'	   )
call s:HL('CursorLineNr'  , s:palette.gray09, s:palette.black , 'bold'	   )

call s:HL('ColorColumn'	  , s:palette.white , s:palette.gray03, 'none'	   )
call s:HL('CursorColumn'  , s:palette.gray16, s:palette.gray03, 'none'	   )

" VISUAL MODE
call s:HL('Visual'		  , s:palette.green , s:palette.gray06, 'none'	   )
call s:HL('VisualNOS'	  , s:palette.green , s:palette.gray06, 'none'	   )

" SEARCH
call s:HL('Search'		  , s:palette.black , s:palette.yellow, 'bold'	   )
call s:HL('IncSearch'	  , s:palette.yellow, s:palette.black , 'bold'	   )

" SPELLING
call s:HL('SpellBad'	  , s:palette.white , s:palette.red	  , 'bold'	   )
call s:HL('SpellCap'	  , s:palette.white , s:palette.red	  , 'bold'	   )
call s:HL('SpellLocal'	  , s:palette.white , s:palette.red	  , 'bold'	   )
call s:HL('SpellRare'	  , s:palette.white , s:palette.red	  , 'bold'	   )

" ERROR
call s:HL('Error'		  , s:palette.red	, s:palette.black , 'bold'	   )

" COMMAND MODE MESSAGES
call s:HL('ErrorMsg'	  , s:palette.red	, s:palette.black , 'bold'	   )
call s:HL('WarningMsg'	  , s:palette.brown	, s:palette.black , 'bold'	   )
call s:HL('ModeMsg'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('MoreMsg'		  , s:palette.white	, s:palette.black , 'bold'	   )

" PREPROCESSOR DIRECTIVES
call s:HL('Include'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Define'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Macro'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('PreCondit'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('PreProc'		  , s:palette.white	, s:palette.black , 'bold'	   )

" BINDINGS
call s:HL('Identifier'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Function'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Keyword'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Operator'	  , s:palette.white	, s:palette.black , 'bold'	   )

" TYPES
call s:HL('Type'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Typedef'	  	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('StorageClass'  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Structure'	  , s:palette.white	, s:palette.black , 'bold'	   )

" FLOW CONTROL
call s:HL('Statement'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Conditional'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Repeat'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Label'		  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('Exception'	  , s:palette.white	, s:palette.black , 'bold'	   )

" MISC
call s:HL('Normal'		  , s:palette.gray19, s:palette.black , 'none'	   )
call s:HL('Cursor'		  , s:palette.white , s:palette.black , 'none'	   , 'gui_macvim')
call s:HL('Underlined'	  , s:palette.gray12, s:palette.black , 'underline')
call s:HL('SpecialKey'	  , s:palette.white	, s:palette.black , 'bold'	   )
call s:HL('NonText'		  , s:palette.white , s:palette.black , 'bold'	   )
call s:HL('Directory'  	  , s:palette.orange, s:palette.black , 'none'	   )

" FOLD
call s:HL('FoldColumn'	  , s:palette.gray06, s:palette.black , 'bold'	   )
call s:HL('Folded'		  , s:palette.gray06, s:palette.black , 'bold'	   )

" PARENTHESIS
call s:HL('MatchParen'	  , s:palette.orange, s:palette.black , 'bold'	   )

" POPUP
call s:HL('Pmenu'		  , s:palette.white , s:palette.gray09, 'none'	   )
call s:HL('PmenuSbar'	  , s:palette.black , s:palette.gray19, 'none'	   )
call s:HL('PmenuSel'	  , s:palette.black , s:palette.gray19, 'none'	   )
call s:HL('PmenuThumb'	  , s:palette.gray01, s:palette.gray09, 'none'	   )

" SPLITS
call s:HL('VertSplit'	  , s:palette.gray19, s:palette.black , 'none'	   )

" OTHERS
call s:HL('Debug'		  , s:palette.white	, s:palette.black , 'none'	   )
call s:HL('Delimiter'  	  , s:palette.white	, s:palette.black , 'none'	   )
call s:HL('Question'   	  , s:palette.white	, s:palette.black , 'none'	   )
call s:HL('Special'		  , s:palette.white	, s:palette.black , 'none'	   )
call s:HL('StatusLine' 	  , s:palette.white	, s:palette.black , 'none'	   , 'gui_macvim')
call s:HL('StatusLineNC'  , s:palette.white	, s:palette.black , 'none'	   , 'gui_macvim')
call s:HL('Tag'			  , s:palette.white	, s:palette.black , 'none'	   )
call s:HL('WildMenu'   	  , s:palette.white	, s:palette.black , 'none'	   )

" DIFF
call s:HL('DiffAdd'		  , s:palette.white , s:palette.green , 'none'	   )
call s:HL('DiffChange'	  , s:palette.white , s:palette.blue  , 'none'	   )
call s:HL('DiffDelete'	  , s:palette.white , s:palette.red   , 'none'	   )
call s:HL('DiffText'	  , s:palette.black , s:palette.yellow, 'none'	   )


" Links ------------------------------------------------------------------ {{{1

" TODO


" Filetype Specific ------------------------------------------------------ {{{1

" TODO


" Plugin Specific -------------------------------------------------------- {{{1

" RAINBOW PARENTHESIS

let g:rbpt_colorpairs = [
			\ s:palette.brown,
			\ s:palette.gray11,
			\ s:palette.purple,
			\ s:palette.green,
			\ s:palette.white,
			\ s:palette.blue,
			\ s:palette.yellow,
			\ s:palette.red,
			\ s:palette.brown,
			\ s:palette.gray13,
			\ s:palette.cyan,
			\ s:palette.darkpurple,
			\ s:palette.darkgreen,
			\ s:palette.darkblue,
			\ s:palette.darkyellow,
			\ s:palette.darkred
			\ ]
