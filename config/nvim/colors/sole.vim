" See http://vimdoc.sourceforge.net/htmldoc/syntax.html for documentation on
" the following esoteric values.
" A list of colours is at the end of http://www.devdaily.com/linux/vi-vim-editor-color-scheme-syntax

highlight clear

set background=light

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "sole"

hi Comment		cterm=bold			gui=italic			ctermfg=Magenta		ctermbg=White		guifg=Magenta	guibg=White
hi Constant		cterm=bold			gui=bold			ctermfg=DarkGreen	guifg=DarkGreen
hi Cursor							gui=reverse			ctermfg=Blue		guifg=Blue
hi Identifier	cterm=bold			gui=bold			ctermfg=DarkMagenta	ctermbg=White		guifg=DarkMagenta
hi LineNr		cterm=reverse		gui=reverse			ctermfg=DarkGray	guifg=#333333		guibg=#efefef
hi NonText		ctermfg=DarkGray	gui=bold			guifg=DarkGray
hi Normal		ctermbg=LightGray	ctermfg=Black		guibg=LightGray		guifg=Black
hi Search												ctermbg=Yellow		guibg=Yellow
hi Statement	cterm=bold			gui=bold			ctermfg=DarkBlue	guifg=DarkBlue
hi StatusLine	cterm=reverse		gui=bold			ctermfg=Black		guifg=#000000		guibg=#ffffbb
hi StatusLineNC cterm=NONE			gui=NONE			ctermfg=DarkGray	guifg=#333333		guibg=#aaaaaa
hi Todo			cterm=italic		gui=italic 			ctermfg=White		ctermbg=DarkBlue	guifg=DarkBlue guibg=White
hi Visual		cterm=NONE			gui=NONE			ctermfg=black		ctermbg=LightCyan	guibg=LightMagenta

