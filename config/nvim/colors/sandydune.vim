" Vim color file
" Maintainer:	David Briscoe <idbrii@gmail.com>
" Last Change:	22 Dec 2014
" Origin:   Based on desert.vim
" Version:	0.3

" Relevant help screens
" :h group-name
" :h highlight-groups
" :h cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="sandydune"

hi Normal	guifg=White guibg=grey20


" highlight groups {{{

hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=grey30
hi Question	guifg=springgreen
hi Search	guibg=brown guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
hi Visual	gui=none guifg=lightgrey guibg=black
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
hi Pmenu 		guifg=#f6f3e8 guibg=#444444
hi PmenuSel 	guifg=#000000 guibg=SkyBlue
"hi Scrollbar
"hi Tooltip
"}}}

" syntax highlighting groups {{{
" http://www.tayloredmktg.com/rgb/
hi Comment	guifg=SkyBlue
hi Constant	guifg=#ffa0a0
hi String	guifg=#ffa0c0	"a string constant: "this is a string"
"Character	guifg=#000000	"a character constant: 'c', '\n'
"Number		guifg=#000000	"a number constant: 234, 0xff
"Boolean	guifg=#000000	"a boolean constant: TRUE, false
hi Float	guifg=#ffc0b0	"a floating point constant: 2.3e10

hi Identifier	guifg=palegreen
"hi Identifier	guifg=#d0ffe0   " Used for cpp custom member/static function
hi Function	    guifg=#90e090   " Used for cpp custom function definition

"hi Statement	guifg=khaki     " break, return, and all below
hi Statement	guifg=palegoldenrod     " break, return, and all below
hi Conditional	guifg=yellow	"if, then, else, endif, switch, etc.
hi Repeat		guifg=orange	"for, do, while, etc.
hi Label		guifg=gold		"case, default, etc.
hi Operator     guifg=goldenrod	""sizeof", "+", "*", etc.
"hi Keyword	    guifg=#000000	"any other keyword (never used?)
hi Exception	guifg=orangered	"try, catch, throw

hi PreProc	    guifg=tan
hi Define	    guifg=tan   	"named constants
hi Macro	  	guibg=grey21 guifg=sandybrown       "preprocessor #define
hi PreCondit	guibg=grey21 guifg=peru         	"preprocessor #if, #else, #endif, etc.
hi Include	    guibg=grey21 guifg=chocolate

"almost white
"hi Include	guifg=beige

hi Type		guifg=darkkhaki
"StorageClass	guifg=#000000	"static, register, volatile, etc.
"Structure	guifg=#000000	"struct, union, enum, etc.
"darkkhaki=#bdb76b
hi Typedef	guifg=#cdc79b

hi Special	guifg=navajowhite
hi SpecialChar	guifg=#cf7696	"special character in a constant
hi Tag			guifg=#ffffe0	"you can use CTRL-] on this
hi Delimiter	guifg=#ffe0ff	"character that needs attention
hi SpecialComment	guifg=#e0ffff	"special things inside a comment
hi Debug		guifg=#f0f0f0	"debugging statements

"hi Underlined

hi Ignore	guifg=grey40
"hi Error
hi Todo		guifg=orangered guibg=yellow2

" }}}

" color terminal definitions {{{
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE

" Diff colours from jellybeans
" Source: https://github.com/nanotech/jellybeans.vim
hi DiffAdd gui=none cterm=none
hi DiffAdd guibg=#336009 ctermfg=193 ctermbg=22
hi DiffChange gui=none cterm=none
hi DiffChange guibg=#2B5B77 ctermfg=NONE ctermbg=24
hi DiffDelete gui=none cterm=none
hi DiffDelete guifg=#40000A guibg=#700009 ctermfg=16 ctermbg=52
hi DiffText guibg=#000000 ctermfg=110 ctermbg=16
hi DiffText gui=reverse cterm=reverse
hi DiffText guifg=#8fbfdc guibg=#000000 ctermfg=110 ctermbg=16

" jellybeans-inspired colours for patch-format diffs
hi diffAdded gui=none cterm=none
hi diffAdded guifg=#d2ebbe guibg=#437019 ctermfg=193 ctermbg=22
hi diffRemoved gui=none cterm=none
hi diffRemoved guifg=#b05059 guibg=#40000a ctermfg=16 ctermbg=52

hi Comment	ctermfg=darkcyan
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1
" }}}


" vim: sw=4 fdm=marker
