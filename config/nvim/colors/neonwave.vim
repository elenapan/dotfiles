" Vim color file


" Name:               NeonWave
" Author:             Sclarki

" Just as a side note, themes like these are generally what happens
" when you go off on Vaporwave binges >.>


" Huge, HUGE thank you to ByteFluent for the creation of Vivify!!
" Without this site it would have been far more troublesome to
" get a working theme going, as well as the inertia to get going.
" That is to say, without having seen the names associated with the
" highlights.

" http://bytefluent.com/vivify



" I'm sure this will work for *most* (or all?) Vim versions below 7.0,
" or even 7.3; I just have 7.0 as the lowest possible version.
" I can't be sure. I am by no means a v[i]teran x3
if v:version >= 700
	if exists("syntax_on")
		" Originally, I left this commented out for simplicity's sake
		" as it is not vital, but apparently "t_Co" is automatically set
		" to 8 if you open through the GUI.
		" Meaning, Vim is set as your default editor. Or through a keyboard
		" shortcut like ./x-terminal-emulator --command=vim
		" (Oh, the irony.)
		
		" If you do not need it then do with it as you wish.
		set t_Co=256
		syntax reset
		hi clear
		let g:colors_name = "neonwave"
	else
		finish
	endif
endif


hi Boolean           ctermfg=45    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00d7ff  guibg=NONE
hi Cursor            ctermfg=66    ctermbg=15    gui=NONE       cterm=NONE      guifg=#080808  guibg=#6c6c6c
hi Constant          ctermfg=33    ctermbg=NONE  gui=bold       cterm=bold      guifg=#0087ff  guibg=NONE
hi Character         ctermfg=207   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff5fff  guibg=NONE
hi Conditional       ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi Comment           ctermfg=244   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#808080  guibg=NONE
hi CursorLine        ctermfg=NONE  ctermbg=235   gui=NONE       cterm=NONE      guifg=NONE     guibg=#262626
hi cursorcolumn      ctermfg=NONE  ctermbg=235   gui=NONE       cterm=NONE      guifg=NONE     guibg=#262626
hi CursorLineNr      ctermfg=45    ctermbg=235   gui=bold       cterm=bold      guifg=#00d7ff  guibg=#262626
hi Define            ctermfg=61    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#5f5faf  guibg=NONE
hi DefinedName       ctermfg=200   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00d7  guibg=NONE
hi Delimiter         ctermfg=207   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff5fff  guibg=NONE
hi Directory         ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi Error             ctermfg=196   ctermbg=232   gui=bold       cterm=bold      guifg=#ff0000  guibg=#080808
hi ErrorMsg          ctermfg=196   ctermbg=232   gui=bold       cterm=bold      guifg=#ff0000  guibg=#080808
hi Exception         ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi Float             ctermfg=37    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afaf  guibg=NONE
hi FoldColumn        ctermfg=33    ctermbg=233   gui=NONE       cterm=NONE      guifg=#0087ff  guibg=#121212
hi Folded            ctermfg=33    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#0087ff  guibg=NONE
hi Function          ctermfg=38    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afd7  guibg=NONE
hi Identifier        ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi Include           ctermfg=69    ctermbg=NONE  gui=bold       cterm=bold      guifg=#5f87ff  guibg=NONE
hi IncSearch         ctermfg=232   ctermbg=33    gui=NONE       cterm=NONE      guifg=#080808  guibg=#0087ff
hi jsonKeyword       ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi Keyword           ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi Label             ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi LineNr            ctermfg=36    ctermbg=233   gui=NONE       cterm=NONE      guifg=#00af87  guibg=#121212
hi Macro             ctermfg=69    ctermbg=NONE  gui=bold       cterm=bold      guifg=#5f87ff  guibg=NONE
hi MatchParen        ctermfg=50    ctermbg=39    gui=NONE       cterm=NONE      guifg=#00ffd7  guibg=#00afff
hi ModeMsg           ctermfg=39    ctermbg=232   gui=bold       cterm=bold      guifg=#00afff  guibg=#080808
hi MoreMsg           ctermfg=46    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00ff00  guibg=NONE
hi NonText           ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi Normal            ctermfg=105   ctermbg=234   gui=NONE       cterm=NONE      guifg=#8787ff  guibg=#1c1c1c
hi Number            ctermfg=31    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#0087af  guibg=NONE
hi Operator          ctermfg=39    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afff  guibg=NONE
                                                               
                                                               
" For matching over X length of chars; non-essential.
" That is, if you have a match property in your vimrc.
hi OverLength        ctermfg=46    ctermbg=234   gui=bold       cterm=bold      guifg=#00ff00  guibg=#1c1c1c
hi perlIdentifier    ctermfg=39    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afff  guibg=NONE
hi perlNumber        ctermfg=30    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#008787  guibg=NONE
hi perlOperator      ctermfg=45    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00d7ff  guibg=NONE
hi PMenu             ctermfg=36    ctermbg=233   gui=NONE       cterm=NONE      guifg=#00af87  guibg=#121212
hi PMenuSel          ctermfg=75    ctermbg=235   gui=NONE       cterm=NONE      guifg=#5fafff  guibg=#262626
hi PMenuSbar         ctermfg=NONE  ctermbg=232   gui=NONE       cterm=NONE      guifg=NONE     guibg=#080808
hi PMenuThumb        ctermfg=NONE  ctermbg=237   gui=NONE       cterm=NONE      guifg=NONE     guibg=#3a3a3a
hi PreCondit         ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi PreProc           ctermfg=63    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#5f5fff  guibg=NONE
hi pythonFunction    ctermfg=38    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afd7  guibg=NONE
hi pythonException   ctermfg=196   ctermbg=232   gui=NONE       cterm=NONE      guifg=#ff0000  guibg=#080808
hi pythonEscape      ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi pythonStatement   ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi Question          ctermfg=46    ctermbg=232   gui=bold       cterm=bold      guifg=#00ff00  guibg=#080808
hi Repeat            ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi Search            ctermfg=232   ctermbg=33    gui=NONE       cterm=NONE      guifg=#080808  guibg=#0087ff
hi shDeref           ctermfg=69    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#5f87ff  guibg=NONE
hi shDerefDelim      ctermfg=171   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#d75fff  guibg=NONE
hi shDerefOp         ctermfg=207   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff5fff  guibg=NONE
hi shDerefVar        ctermfg=69    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#5f87ff  guibg=NONE
hi shHereDoc         ctermfg=205   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff5faf  guibg=NONE
hi shOperator        ctermfg=171   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#d75fff  guibg=NONE
hi shShellVariables  ctermfg=207   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff5fff  guibg=NONE
hi shSnglCase        ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi shTestOpr         ctermfg=39    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#00afff  guibg=NONE
hi shVariable        ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi SignColumn        ctermfg=46    ctermbg=234   gui=NONE       cterm=NONE      guifg=#00ff00  guibg=#1c1c1c
hi Special           ctermfg=13    ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi SpecialChar       ctermfg=165   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#d700ff  guibg=NONE
hi SpecialComment    ctermfg=231   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ffffff  guibg=NONE
hi SpecialKey        ctermfg=105   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#8787ff  guibg=NONE
hi SpellBad          ctermfg=196   ctermbg=232   gui=bold       cterm=bold      guifg=#ff0000  guibg=#080808
hi StatusLine        ctermfg=32    ctermbg=232   gui=bold       cterm=bold      guifg=#0087d7  guibg=#080808
hi StatusLineNC      ctermfg=105   ctermbg=236   gui=bold       cterm=bold      guifg=#8787ff  guibg=#303030
hi Statement         ctermfg=201   ctermbg=NONE  gui=bold       cterm=bold      guifg=#ff00ff  guibg=NONE
hi StorageClass      ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi String            ctermfg=171   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#d75fff  guibg=NONE
hi Structure         ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi TabLine           ctermfg=105   ctermbg=234   gui=NONE       cterm=NONE      guifg=#8787ff  guibg=#1c1c1c
hi TabLineFill       ctermfg=105   ctermbg=236   gui=NONE       cterm=NONE      guifg=#8787ff  guibg=#303030
hi TabLineSel        ctermfg=32    ctermbg=233   gui=bold       cterm=bold      guifg=#0087d7  guibg=#121212
hi Title             ctermfg=201   ctermbg=NONE  gui=NONE       cterm=NONE      guifg=#ff00ff  guibg=NONE
hi Todo              ctermfg=231   ctermbg=201   gui=bold       cterm=bold      guifg=#ffffff  guibg=#ff00ff
hi Type              ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi Typedef           ctermfg=45    ctermbg=NONE  gui=bold       cterm=bold      guifg=#00d7ff  guibg=NONE
hi Underlined        ctermfg=69    ctermbg=NONE  gui=underline  cterm=underline guifg=#5f87ff  guibg=NONE
hi VertSplit         ctermfg=105   ctermbg=236   gui=NONE       cterm=NONE      guifg=#8787ff  guibg=#303030
hi Visual            ctermfg=111   ctermbg=237   gui=NONE       cterm=NONE      guifg=#87afff  guibg=#3a3a3a
hi WarningMsg        ctermfg=254   ctermbg=1     gui=NONE       cterm=NONE      guifg=#e4e4e4  guibg=#800000
