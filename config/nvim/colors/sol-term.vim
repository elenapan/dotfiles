" Name: Sol vim colorscheme
" Author: Pratheek
" URL: http://github.com/Pychimp/vim-sol
" (see this url for latest release & screenshots)
" License: MIT (see LICENSE.rst in the root of project)
" Created: In the middle of Earth's Rotation
" Version: 0.0.3
"
"
" TODO: {{{
" ---------------------------------------------------------------------
" -- Clean up !
" -- create a terminal version
" -- add more lang specifics
" -- (Will think of some more sutff !)
" }}}
"
" Usage and Requirements "{{{
" ---------------------------------------------------------------------
" REQUIREMENTS:
" ---------------------------------------------------------------------
" Currently,
"
" This colourscheme is intended for use on:
" - Console Vim >= 7.3 for Linux, Mac and Windows.
"   (Use sol.vim, if you use gvim rather than console vim)
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" Two options for installation: manual or pathogen
"
" ---------------------------------------------------------------------
" MANUAL INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1. Download the sol distribution
" (as a zip archive, available on the github page)
" and unarchive the file.
" 2. Move `sol.vim` to your `.vim/colors` directory.
" 3. Enjoy !
"
" ---------------------------------------------------------------------
" HIGHLY RECOMMENDED PATHOGEN INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1. Download and install Tim Pope's Pathogen from:
" https://github.com/tpope/vim-pathogen
"
" 2. Next, move or clone the `vim-sol` directory so that it is
" a subdirectory of the `.vim/bundle` directory.
"
" a. **clone with git:**
"
" $ cd ~/.vim/bundle
" $ git clone git://github.com/Pychimp/vim-sol.git
"
" ---------------------------------------------------------------------
" MODIFY VIMRC:
" ---------------------------------------------------------------------
"
" After either manual or pathogen installation, put the following two lines in your
" .vimrc:
"
" syntax enable
" colorscheme sol
" }}}
"
" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "sol"
" }}}
"
" Console vim Highlighting: (see :help highlight-groups)" {{{
" ---------------------------------------------------------------------
" First, the Normal
hi Normal       ctermfg=232  ctermbg=255  cterm=NONE
" ---------------------------------------------------------------------
" The Languages stuff
hi Title        ctermfg=NONE ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Comment      ctermfg=250  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Constant     ctermfg=23   ctermbg=NONE cterm=NONE
hi String       ctermfg=27   ctermbg=NONE cterm=NONE
hi Character    ctermfg=54   ctermbg=NONE cterm=NONE
hi Boolean      ctermfg=160  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Identifier   ctermfg=161  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Statement    ctermfg=30   ctermbg=NONE cterm=NONE
hi Conditional  ctermfg=124  ctermbg=NONE cterm=NONE
hi Operator     ctermfg=202  ctermbg=NONE cterm=NONE
hi Exception    ctermfg=124  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi PreProc      ctermfg=197  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Type         ctermfg=106  ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Special      ctermfg=93   ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Underlined   ctermfg=62   ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Ignore       ctermfg=NONE ctermbg=NONE cterm=NONE
" ---------------------------------------------------------------------
hi Error        ctermfg=196  ctermbg=224  cterm=NONE
" ---------------------------------------------------------------------
hi TODO         ctermfg=197  ctermbg=220  cterm=NONE

" ---------------------------------------------------------------------
" }}}
"
" Extended Highlighting {{{
" ---------------------------------------------------------------------

hi NonText       ctermfg=145  ctermbg=NONE cterm=NONE
hi Visual        ctermfg=232  ctermbg=248  cterm=NONE
hi ErrorMsg      ctermfg=196  ctermbg=228  cterm=NONE
hi IncSearch     ctermfg=232  ctermbg=220  cterm=NONE
hi Search        ctermfg=232  ctermbg=220  cterm=NONE
hi MoreMsg       ctermfg=242  ctermbg=NONE cterm=NONE
hi ModeMsg       ctermfg=239  ctermbg=NONE cterm=NONE
hi LineNr        ctermfg=145  ctermbg=NONE cterm=NONE
hi VertSplit     ctermfg=240  ctermbg=252  cterm=NONE
hi VisualNOS     ctermfg=232  ctermbg=227  cterm=NONE
hi Folded        ctermfg=247  ctermbg=254  cterm=NONE
hi FoldColumn    ctermfg=247  ctermbg=255  cterm=NONE
hi DiffAdd       ctermfg=231  ctermbg=22   cterm=NONE
hi DiffChange    ctermfg=231  ctermbg=30   cterm=NONE
hi DiffDelete    ctermfg=196  ctermbg=88   cterm=NONE
hi DiffText      ctermfg=16   ctermbg=214  cterm=NONE
hi SpellBad      ctermfg=196  ctermbg=228  cterm=NONE
hi SpellCap      ctermfg=130  ctermbg=228  cterm=NONE
hi SpellRare     ctermfg=160  ctermbg=228  cterm=NONE
hi SpellLocal    ctermfg=28   ctermbg=228  cterm=NONE
hi StatusLine    ctermfg=240  ctermbg=252  cterm=NONE
hi StatusLineNC  ctermfg=251  ctermbg=254  cterm=NONE
hi Pmenu         ctermfg=238  ctermbg=250  cterm=NONE
hi PmenuSel      ctermfg=255  ctermbg=25   cterm=NONE
hi PmenuSbar     ctermfg=250  ctermbg=250  cterm=NONE
hi PmenuThumb    ctermfg=250  ctermbg=250  cterm=NONE
hi MatchParen    ctermfg=231  ctermbg=202  cterm=NONE
hi CursorLine    ctermbg=254  ctermbg=NONE cterm=NONE
hi CursorLineNr  ctermfg=162  ctermbg=NONE cterm=NONE
hi CursorColumn  ctermbg=254  ctermbg=NONE cterm=NONE
hi ColorColumn   ctermbg=224  ctermbg=NONE cterm=NONE
hi WildMenu      ctermfg=255  ctermbg=160  cterm=NONE
hi SignColumn    ctermbg=255  ctermbg=NONE cterm=NONE
"
" ---------------------------------------------------------------------
" }}}
"
" Language Specifics: {{{
" ---------------------------------------------------------------------
" These are language specifics. These are set explicitly to override the group
" highlighting provided by vim (Simply to make the language that you're working
" on more awesome, and fun to work with !)
" ---------------------------------------------------------------------
" Python Specifics
hi pythonDot                 ctermfg=25   ctermbg=NONE cterm=NONE
hi pythonParameters          ctermfg=23   ctermbg=NONE cterm=NONE
hi pythonClassParameters     ctermfg=23   ctermbg=NONE cterm=NONE
hi pythonClass               ctermfg=125  ctermbg=NONE cterm=NONE
"
" ---------------------------------------------------------------------
"  Ruby Specifics
""" hi rubyInterpolation      guifg=#ff4040 guibg=NONE gui=NONE
""" "hi rubyMethodBlock        guifg=#ff8da1 guibg=NONE gui=NONE
""" "hi rubyMethodBlock        guifg=#8ddaff guibg=NONE gui=NONE
""" hi rubyMethodBlock        guifg=#ffb28d guibg=NONE gui=NONE
""" hi rubyCurlyBlock         guifg=#f64a8a guibg=NONE gui=NONE
""" hi rubyDoBlock            guifg=#f64a8a guibg=NONE gui=NONE
""" hi rubyBlockExpression    guifg=#f64a8a guibg=NONE gui=NONE
""" hi rubyArrayDelimiter     guifg=#00bcbc guibg=NONE gui=NONE
"
" ---------------------------------------------------------------------
" }}}
"
" Extras: {{{
" ---------------------------------------------------------------------
" These are extra parts for highlighting certain external plugins
" ---------------------------------------------------------------------
"
" Startify (https://github.com/mhinz/vim-startify)
"
highlight StartifyBracket guifg=#b06bfc guibg=NONE gui=NONE ctermfg=135 cterm=NONE
highlight StartifyNumber guifg=#bada55 guibg=NONE gui=NONE ctermfg=149 cterm=NONE
highlight StartifySpecial guifg=#2e8857 guibg=NONE gui=NONE ctermfg=29 cterm=NONE
highlight StartifyPath guifg=#545454 guibg=NONE gui=NONE ctermfg=240 cterm=NONE
highlight StartifySlash guifg=#474747 guibg=NONE gui=NONE ctermfg=238 cterm=NONE
" hi StartifyFile     guifg=#00ffa5 guibg=NONE gui=NONE
" hi StartifyFile     guifg=#2aa198 guibg=NONE gui=NONE
" hi StartifyFile     guifg=#f0e68c guibg=NONE gui=NONE
highlight StartifyFile guifg=#fa8072 guibg=NONE gui=NONE ctermfg=210 cterm=NONE
highlight StartifyHeader guifg=#f0e68c guibg=NONE gui=NONE ctermfg=186 cterm=NONE
highlight StartifyFooter guifg=#a0522d guibg=NONE gui=NONE ctermfg=130 cterm=NONE
"
" ---------------------------------------------------------------------
"
" CtrlP (https://github.com/kien/ctrlp.vim)
"
hi CtrlPMatch      ctermfg=28   ctermbg=194  cterm=NONE
hi CtrlPLinePre    ctermfg=248  ctermbg=NONE cterm=NONE
hi CtrlPPrtBase    ctermfg=248  ctermbg=NONE cterm=NONE
hi CtrlPPrtCursor  ctermfg=232  ctermbg=252  cterm=NONE
hi CtrlPTabExtra   ctermfg=197  ctermbg=NONE cterm=NONE
hi CtrlPBufName    ctermfg=196  ctermbg=231  cterm=NONE
hi CtrlPMode1      ctermfg=33   ctermbg=NONE cterm=NONE
hi CtrlPMode2      ctermfg=166  ctermbg=NONE cterm=NONE
"
" ---------------------------------------------------------------------
" }}}
"
"
" vim:foldmethod=marker:foldlevel=0:textwidth=79
"
