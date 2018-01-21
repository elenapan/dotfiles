" Vim color file
" Maintainer:   Dan Church
" Last Change:  2015 Jul 01

" Forked from evening.vim with the following tweaks:

" ** Aesthetic fixes **
" - Almost black backgrounds
" - Cursorline not so bright as to make comments disappear
" - Brighter cursor
" - Brighter green messages
" - Nicer colors on line numbers (like comments with the current line
"   highlighted if &cursorline)
" - Replace awful-looking yellow-on-white when using wildmenu
" - Turn delimiters white instead of orange

" ** Bug fixes **
" - Text mode: fix invisible visual mode selection
" - Fix inability to see netrw marked files when using gui fonts that don't
"   like bold (type mf in netrw, controlled by TabLineSel highlight)
" - Fix many inconsistencies between gui and console (evening.vim):
"   * PreProc: blue in console, magenta in gui
"   * Comment: cyan in console, blue in gui
"   * CursorLine: underline in console (256 colors), gray in gui
"   * Special: salmon in console (256 colors), red in console (8 colors),
"     orange in gui

" This color scheme uses a *really* dark grey background.
set background=dark

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "late_evening"

hi Normal		ctermfg=white ctermbg=black						guifg=white guibg=grey5

" Cursor only applies to GUI mode
hi Cursor		guifg=black guibg=lightgreen
hi lCursor		guifg=black guibg=cyan

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg		ctermbg=160										guifg=white guibg=#d70000
hi Error		ctermbg=160										guifg=white guibg=#d70000
hi SpellBad		ctermbg=160										guifg=white guibg=#d70000
hi IncSearch	cterm=reverse									gui=reverse
hi ModeMsg		cterm=bold										gui=bold
hi StatusLine	cterm=none ctermbg=238							gui=bold guibg=grey20
hi StatusLineNC cterm=reverse									gui=reverse
hi VertSplit	cterm=reverse									gui=reverse
hi Visual		cterm=reverse ctermbg=black						guibg=grey40
hi VisualNOS	cterm=underline,bold							gui=underline,bold
hi DiffText		cterm=bold ctermbg=red							gui=bold guibg=red
hi Directory	ctermfg=lightcyan								guifg=cyan
hi LineNr		ctermfg=32 ctermbg=234							guifg=steelblue guibg=grey20
hi MoreMsg		ctermfg=82										gui=bold guifg=#60ff60
hi NonText		ctermfg=lightblue ctermbg=233					gui=bold guifg=lightblue guibg=grey10
hi Question		ctermfg=82										gui=bold guifg=#60ff60
hi Search		ctermfg=black ctermbg=226						guifg=black guibg=yellow
hi SpecialKey	ctermfg=lightblue								guifg=cyan
hi Title		ctermfg=165										gui=bold guifg=magenta
hi WarningMsg	ctermfg=196										guifg=red
hi WildMenu		ctermfg=black ctermbg=226						guifg=black guibg=yellow
hi Folded		ctermfg=darkblue ctermbg=lightgrey				guifg=darkblue guibg=lightgrey
hi FoldColumn	ctermfg=darkblue ctermbg=lightgrey				guifg=darkblue guibg=grey
hi DiffAdd		ctermbg=darkblue								guibg=darkblue
hi DiffChange	ctermbg=darkmagenta								guibg=darkmagenta
hi DiffDelete	ctermfg=blue ctermbg=darkcyan					gui=bold guifg=blue guibg=darkcyan
hi CursorColumn ctermbg=238										guibg=grey30
hi CursorLine	cterm=none ctermbg=238							guibg=grey30
hi CursorLineNr	ctermbg=238										guibg=grey30
hi Comment		cterm=bold ctermfg=63							guifg=#80a0ff
hi TabLineSel	cterm=reverse									gui=reverse
hi Type			ctermfg=82										guifg=#60ff60

hi MatchParen	ctermbg=81										guifg=#5fd7ff

hi Ignore		ctermfg=darkgrey								guifg=grey20
" Groups for syntax highlighting
hi Constant		ctermfg=217 ctermbg=234							guifg=#ffa0a0 guibg=grey5
hi Special		ctermfg=lightred								guifg=orange guibg=grey5
hi Delimiter	ctermfg=white									guifg=white
" bug fix
hi PreProc		cterm=bold ctermfg=207

" Modifications for more colors
if &t_Co > 8
  hi Statement	cterm=bold ctermfg=yellow						gui=bold guifg=#ffff60
endif

" Low color support
if &t_Co < 17
  hi ErrorMsg		ctermbg=darkred
  hi NonText		ctermbg=black
  hi CursorLine		cterm=reverse ctermbg=none
  hi CursorColumn	cterm=reverse ctermbg=black
  hi LineNr			ctermfg=blue ctermbg=black
  hi StatusLine		cterm=bold ctermbg=black
  hi Type			ctermfg=green
  hi MoreMsg		ctermfg=lightgreen
  hi Question       ctermfg=lightgreen
  hi Search			ctermbg=yellow
  hi Title			ctermfg=lightmagenta
  hi WarningMsg		ctermfg=lightred
  hi WildMenu		ctermbg=yellow
  hi Comment		ctermfg=blue
  hi Constant		ctermfg=magenta ctermbg=black
  hi PreProc		ctermfg=magenta
  hi MatchParen		ctermbg=cyan
endif

" Monochrome terminal support
hi Constant		term=underline
hi CursorColumn	term=reverse
hi CursorLine	term=underline
hi Delimiter	term=bold
hi DiffAdd		term=bold
hi DiffChange	term=bold
hi DiffDelete	term=bold
hi DiffText		term=reverse
hi Directory	term=bold
hi ErrorMsg		term=standout
hi FoldColumn	term=standout
hi Folded		term=standout
hi IncSearch	term=reverse
hi LineNr		term=underline
hi ModeMsg		term=bold
hi MoreMsg		term=bold
hi NonText		term=bold
hi Question		term=standout
hi Search		term=reverse
hi Special		term=bold
hi SpecialKey	term=bold
hi Statement	term=bold
hi StatusLine	term=bold
hi StatusLineNC	term=reverse
hi TabLineSel	term=bold
hi Title		term=bold
hi VertSplit	term=reverse
hi Visual		term=reverse
hi VisualNOS	term=underline,bold
hi WarningMsg	term=standout
hi WildMenu		term=standout

" vim: sw=2 ts=4
