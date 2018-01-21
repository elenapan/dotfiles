"    Filetype: .vim, Vim color file
"    Name: Otaku _   _
"                  ω
"    Version: Prerelease party
"    Prerelease party covers the basics; good enough for ordinary use.
"    Date: 2014 April 09
"    Source: http://www.vim.org/scripts/script.php?script_id=
"    Otaku Artist: Carson Fire <carsonfire@gmail.com>
"    Extraneous Website Link: http://elfhero.com
"    Instructions: Place this file where it goes
"    THEN DELETE ALL THE OTHERS! *smirk*
"    Add to your settings (vimrc) :colo otaku 
"    or type :colo otaku any old time.
"    Terminal Usage: This irresponsible color scheme is GUI only but
"    may become an interesting purple thing when used with ColorSupport.
"    ColorSupport: http://www.vim.org/scripts/script.php?script_id=2682
"    Warning: Otaku creates some decorations in order to prettify Gvim.
"    Have not yet found a graceful way to reset when changing schemes.
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="otaku"
if g:colors_name == "otaku"
		set t_Co=256
		set fillchars=vert::,fold:+,stl::,stlnc::
endif
if g:colors_name != "otaku"
	set fillchars=vert:\|,fold:-
endif
let s:NormalFg = '#a7a8e8'
let s:NormalBg = '#372e85'
let s:CommentFg = '#5766c9'
let s:CommentBg = s:NormalBg 
let s:ConstantFg = '#bf8095'
let s:ConstantBg = s:NormalBg 
let s:NumberFg = '#C6C536'
let s:FloatBg = s:NormalBg 
let s:FloatFg = '#A3CE54'
let s:NumberBg = s:NormalBg 
let s:CharacterFg = '#8D523D'
let s:CharacterBg = s:NormalBg 
let s:BooleanFg = '#1BD1DD'
let s:BooleanBg = s:NormalBg 
let s:StringFg = '#d6d9b6'
let s:StringBg = s:NormalBg 
let s:htmlTagNameFg = '#6c5ebf'
let s:htmlTagNameBg = s:NormalBg 
let s:IdentifierFg = '#9d5abf'
let s:IdentifierBg = s:NormalBg
let s:SpecialFg = s:IdentifierFg
let s:SpecialBg = s:NormalBg
" note to self: identifier and special both used for brackets in html? Hmmm...
let s:SpecialKeyFg = s:IdentifierFg
let s:SpecialKeyBg = s:NormalBg
let s:Statement = 'bold'
let s:StatementFg = '#1C1745'
let s:StatementBg = s:NormalBg 
let s:PreProcFg = '#b58848'
let s:PreProcBg = s:NormalBg 
let s:Type = 'NONE'
let s:TypeFg = '#778D92'
let s:TypeBg = s:NormalBg 
let s:Function = 'bold'
let s:FunctionFg = '#6947a1'
let s:FunctionBg = s:NormalBg 
let s:Repeat = 'bold'
let s:RepeatFg = '#4a827c'
let s:RepeatBg = s:NormalBg 
let s:OperatorFg = '#DC1794'
let s:OperatorBg = s:NormalBg 
let s:Error = 'bold'
let s:ErrorBg = s:OperatorFg
let s:ErrorFg = s:StringFg
let s:TODO = 'bold'
let s:TODOBg = '#3F52FF'
let s:TODOFg = s:StringFg
let s:Folded = 'underline'
let s:FoldedBg = s:IdentifierFg
let s:FoldedFg = s:NormalBg
let s:FoldColumn = 'underline'
let s:FoldColumnBg = s:IdentifierFg
let s:FoldColumnFg = s:NormalBg
let s:LineNr = 'bold,underline'
let s:LineNrBg = s:FunctionFg
let s:LineNrFg = s:NormalBg
let s:NonTextFg = '#414F6C' 
let s:NonTextBg = s:NormalBg 
let s:Directory = 'italic'
let s:DirectoryFg = s:NormalFg 
let s:DirectoryBg = s:NormalBg
let s:Title = 'bold'
let s:TitleFg = s:NormalFg 
let s:TitleBg = s:NormalBg
let s:Search = 'reverse'
let s:SearchFg = s:IdentifierFg 
let s:SearchBg = s:StringFg
let s:Cursor = 'reverse'
let s:CursorFg = s:StringFg 
let s:CursorBg = s:StatementFg
let s:CursorLine = 'reverse'
let s:CursorLineFg = s:CommentFg 
let s:CursorLineBg = s:StringFg
let s:StatusLineNC = 'reverse,underline' 
let s:StatusLineNCFg = s:FunctionFg 
let s:StatusLineNCBg = s:NormalBg
let s:StatusLine = 'reverse,underline' 
let s:StatusLineFg = s:FunctionFg 
let s:StatusLineBg = s:StatementFg
let s:VertSplit = 'reverse,underline' 
let s:VertSplitFg = s:FunctionFg 
let s:VertSplitBg = s:NormalBg
let s:ConcealFg = s:NormalBg 
let s:ConcealBg = s:NormalBg
let s:MatchParenFg = '#ffffff' 
let s:MatchParenBg = s:NormalBg
let s:VisualFg = s:ErrorBg 
let s:VisualBg = s:StatementFg

exe 'hi Normal guifg='.s:NormalFg.' guibg='.s:NormalBg
exe 'hi Comment guifg='.s:CommentFg.' guibg='.s:CommentBg
exe 'hi Constant guifg='.s:ConstantFg.' guibg='.s:ConstantBg
exe 'hi Number guifg='.s:NumberFg.' guibg='.s:NumberBg
exe 'hi Float guifg='.s:FloatFg.' guibg='.s:FloatBg
exe 'hi Character guifg='.s:CharacterFg.' guibg='.s:CharacterBg
exe 'hi Boolean guifg='.s:BooleanFg.' guibg='.s:BooleanBg
exe 'hi String guifg='.s:StringFg.' guibg='.s:StringBg
exe 'hi htmlTagName guifg='.s:htmlTagNameFg.' guibg='.s:htmlTagNameBg
exe 'hi Identifier guifg='.s:IdentifierFg.' guibg='.s:IdentifierBg
exe 'hi Special guifg='.s:SpecialFg.' guibg='.s:SpecialBg
exe 'hi SpecialKey guifg='.s:SpecialKeyFg.' guibg='.s:SpecialKeyBg
exe 'hi Statement gui='.s:Statement.' guifg='.s:StatementFg ' guibg='.s:StatementBg
exe 'hi PreProc guifg='.s:PreProcFg.' guibg='.s:PreProcBg
exe 'hi Type gui='.s:Type.' guifg='.s:TypeFg.' guibg='.s:TypeBg
exe 'hi Function guifg='.s:FunctionFg.' guibg='.s:FunctionBg
exe 'hi Repeat gui='.s:Repeat.' guifg='.s:RepeatFg.' guibg='.s:RepeatBg
exe 'hi Operator guifg='.s:OperatorFg.' guibg='.s:OperatorBg
exe 'hi Error gui='.s:Error.' guibg='.s:ErrorBg.' guifg='.s:ErrorFg
exe 'hi ErrorMsg gui='.s:Error.' guibg='.s:ErrorBg.' guifg='.s:ErrorFg
exe 'hi TODO gui='.s:TODO.' guibg='.s:TODOBg.' guifg='.s:TODOFg
exe 'hi Folded gui='.s:Folded.' guibg='.s:FoldedBg.' guifg='.s:FoldedFg
exe 'hi FoldColumn gui='.s:FoldColumn.' guibg='.s:FoldColumnBg.' guifg='.s:FoldColumnFg
exe 'hi LineNr gui='.s:LineNr.' guibg='.s:LineNrBg.' guifg='.s:LineNrFg
hi Underlined gui='none'
exe 'hi Directory gui='.s:Directory.'  guibg='.s:DirectoryBg.' guifg='.s:DirectoryFg
exe 'hi Title gui='.s:Title.'  guibg='.s:TitleBg.' guifg='.s:TitleFg
exe 'hi Search gui='.s:Search.'  guibg='.s:SearchBg.' guifg='.s:SearchFg
exe 'hi Cursor gui='.s:Cursor.'  guibg='.s:CursorBg.' guifg='.s:CursorFg
exe 'hi CursorLine gui='.s:CursorLine.'  guibg='.s:CursorLineBg.' guifg='.s:CursorLineFg
exe 'hi NonText guibg='.s:NonTextBg.' guifg='.s:NonTextFg
exe 'hi StatusLineNC gui='.s:StatusLineNC.' guibg='.s:StatusLineNCBg.' guifg='.s:StatusLineNCFg
exe 'hi StatusLine gui='.s:StatusLine.' guibg='.s:StatusLineBg.' guifg='.s:StatusLineFg
exe 'hi VertSplit gui='.s:VertSplit.' guibg='.s:VertSplitBg.' guifg='.s:VertSplitFg
exe 'hi Conceal guibg='.s:ConcealBg.' guifg='.s:ConcealFg
exe 'hi MatchParen guibg='.s:MatchParenBg.' guifg='.s:MatchParenFg
exe 'hi Visual guibg='.s:VisualBg.' guifg='.s:VisualFg


exe 'hi SpellBad gui=undercurl guisp='.s:FunctionFg
exe 'hi SpellCap gui=undercurl guisp='.s:NormalFg
exe 'hi SpellRare gui=undercurl guisp='.s:BooleanFg
exe 'hi SpellLocal gui=undercurl guisp='.s:NormalFg
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

exe 'hi link markdownValid Normal'
" exe 'hi link markdownLineStart'
exe 'hi link markdownH1 htmlH1 '
exe 'hi link markdownH2 htmlH2'
exe 'hi link markdownH3 htmlH3 '
exe 'hi link markdownH4 htmlH4'
exe 'hi link markdownH5 htmlH5'
exe 'hi link markdownH6 htmlH6'
exe 'hi link markdownBlockquote String'
exe 'hi link markdownListMarker Operator'
exe 'hi link markdownOrderedListMarker markdownListMarker'
exe 'hi link markdownCodeBlock markdownCode'
exe 'hi markdownLineBreak guibg='.s:NormalFg
exe 'hi link markdownLinkText htmlLink'
exe 'hi markdownCode guifg='.s:StatementFg
exe 'hi markdownEscape guifg='.s:TypeFg
exe 'hi link markdownHeadingRule Comment'
exe 'hi link markdownHeadingDelimiter Comment'
exe 'hi link markdownLinkDelimiter Comment'
exe 'hi link markdownUrl htmlString'
"exe 'hi markdownIdDeclaration'
exe 'hi link markdownUrlTitle Label'
exe 'hi link markdownUrlDelimiter Comment'
exe 'hi link markdownUrlTitleDelimiter Comment'
exe 'hi link markdownRule Comment'
exe 'hi link markdownLinkTextDelimiter Comment'
"exe 'hi markdownLink'
"exe 'hi markdownId'
"exe 'hi markdownIdDelimiter'
exe 'hi link markdownAutomaticLink htmlLink'
exe 'hi markdownBoldItalic gui=bold,italic'
"exe 'hi markdownCodeDelimiter'
exe 'hi markdownBold gui=bold'
exe 'hi markdownItalic gui=italic'


