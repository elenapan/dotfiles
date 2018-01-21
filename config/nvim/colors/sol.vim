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
" - gVim >= 7.3 for Linux, Mac and Windows. (Since, all colours are in hex
"   values, hence works with gvim. Terminal vim will be supported in future)
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
" Gvim Highlighting: (see :help highlight-groups)" {{{
" ---------------------------------------------------------------------
" First, the Normal
" hi Normal          guifg=#0b0e0f guibg=#ededed gui=NONE
" hi Normal          guifg=#0b0e0f guibg=#ecf0f1 gui=NONE " final one
hi Normal            guifg=#0b0e0f guibg=#eeeeee gui=NONE
" hi Normal          guifg=#0b0e0f guibg=#dde4e6 gui=NONE
" ---------------------------------------------------------------------
" The Languages stuff
hi Title             guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Comment           guifg=#bdbdbd guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Constant          guifg=#945db7 guibg=NONE    gui=NONE
" hi Constant          guifg=#00bcbc guibg=NONE    gui=NONE
" hi Constant          guifg=#1fba34 guibg=NONE    gui=NONE
" hi Constant          guifg=#0faf8d guibg=NONE    gui=NONE
" hi Constant          guifg=#0d3c6e guibg=NONE    gui=NONE
" hi Constant          guifg=#543978 guibg=NONE    gui=NONE
" hi Constant          guifg=#008000 guibg=NONE    gui=NONE
" hi Constant          guifg=#853823 guibg=NONE    gui=NONE
" hi Constant          guifg=#994128 guibg=NONE    gui=NONE
" hi Constant          guifg=#eb641a guibg=NONE    gui=NONE
" hi Constant          guifg=#09643f guibg=NONE    gui=NONE
" hi Constant          guifg=#e82ba1 guibg=NONE    gui=NONE
" hi Constant          guifg=#4aa874 guibg=NONE    gui=NONE
hi Constant          guifg=#09543f guibg=NONE    gui=NONE
" hi Constant          guifg=#c55d30 guibg=NONE    gui=NONE
" hi Constant          guifg=#bf760a guibg=NONE    gui=NONE
" hi String            guifg=#60bdf4    guibg=NONE    gui=NONE
hi String            guifg=#005aff    guibg=NONE    gui=NONE
" hi Character         guifg=#ff005a    guibg=NONE    gui=NONE
hi Character         guifg=#543978    guibg=NONE    gui=NONE
" hi Number            guifg=NONE    guibg=NONE    gui=NONE
" hi Boolean           guifg=#cc6600    guibg=NONE    gui=NONE
" hi Boolean           guifg=#ff6b00    guibg=NONE    gui=NONE
hi Boolean           guifg=#eb6300    guibg=NONE    gui=NONE
" hi Float             guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Identifier        guifg=#008080    guibg=NONE    gui=NONE
" hi Identifier        guifg=#ff8036    guibg=NONE    gui=NONE
" hi Identifier        guifg=#e95600    guibg=NONE    gui=NONE
" hi Identifier        guifg=#db5855    guibg=NONE    gui=NONE
hi Identifier        guifg=#d12c52    guibg=NONE    gui=NONE
" hi Function          guifg=#ff0000    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Statement         guifg=#4aa874    guibg=NONE    gui=NONE
" hi Statement         guifg=#c71585    guibg=NONE    gui=NONE
" hi Statement         guifg=#800080    guibg=NONE    gui=NONE
" hi Statement         guifg=#483d8b    guibg=NONE    gui=NONE
hi Statement         guifg=#007878    guibg=NONE    gui=NONE
" hi Statement         guifg=#543978    guibg=NONE    gui=NONE
" hi Statement         guifg=#0d0d8c    guibg=NONE    gui=NONE
" hi Conditional       guifg=#e69500    guibg=NONE    gui=NONE
" hi Conditional       guifg=#cd8400    guibg=NONE    gui=NONE
" hi Conditional       guifg=#c55d30    guibg=NONE    gui=NONE
" hi Conditional       guifg=#95b62e    guibg=NONE    gui=NONE
" hi Conditional       guifg=#eb641a    guibg=NONE    gui=NONE
hi Conditional       guifg=#994128    guibg=NONE    gui=NONE
" hi Conditional       guifg=#ba28bf    guibg=NONE    gui=NONE
" hi Repeat            guifg=NONE    guibg=NONE    gui=NONE
" hi Label             guifg=NONE    guibg=NONE    gui=NONE
" hi Operator          guifg=#ff8036    guibg=NONE    gui=NONE
" hi Operator          guifg=#ff3001    guibg=NONE    gui=NONE
" hi Operator          guifg=#ff4014    guibg=NONE    gui=NONE
" hi Operator          guifg=#eb641a    guibg=NONE    gui=NONE
" hi Operator          guifg=#ba28bf    guibg=NONE    gui=NONE
" hi Operator          guifg=#ce2dd3    guibg=NONE    gui=NONE
hi Operator          guifg=#ff8036    guibg=NONE    gui=NONE
" hi Operator          guifg=#ff9050    guibg=NONE    gui=NONE
" hi Keyword           guifg=NONE    guibg=NONE    gui=NONE
" hi Exception         guifg=#eb641a    guibg=NONE    gui=NONE
hi Exception         guifg=#994128    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi PreProc           guifg=#543978    guibg=NONE    gui=NONE
" hi PreProc           guifg=#e69500    guibg=NONE    gui=NONE
" hi PreProc           guifg=#853823    guibg=NONE    gui=NONE
" hi PreProc           guifg=#4aa874    guibg=NONE    gui=NONE
" hi PreProc           guifg=#3a855c    guibg=NONE    gui=NONE
" hi PreProc           guifg=#b14ceb    guibg=NONE    gui=NONE
" hi PreProc           guifg=#f26400    guibg=NONE    gui=NONE
" hi PreProc           guifg=#ff5028    guibg=NONE    gui=NONE
" hi PreProc           guifg=#ff8036    guibg=NONE    gui=NONE
" hi PreProc           guifg=#ff748c    guibg=NONE    gui=NONE
hi PreProc           guifg=#ff4162    guibg=NONE    gui=NONE
" hi PreProc           guifg=NONE    guibg=NONE    gui=NONE
" hi Include           guifg=NONE    guibg=NONE    gui=NONE
" hi Define            guifg=NONE    guibg=NONE    gui=NONE
" hi Macro             guifg=NONE    guibg=NONE    gui=NONE
" hi PreCondit         guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Type              guifg=#b22222    guibg=NONE    gui=NONE
" hi Type              guifg=#8b4513    guibg=NONE    gui=NONE
" hi Type              guifg=#808000    guibg=NONE    gui=NONE
" hi Type              guifg=#346d51    guibg=NONE    gui=NONE
" hi Type              guifg=#ba28bf    guibg=NONE    gui=NONE
" hi Type              guifg=#bf760a    guibg=NONE    gui=NONE
" hi Type              guifg=#5d7839    guibg=NONE    gui=NONE
" hi Type              guifg=#354420    guibg=NONE    gui=NONE
hi Type              guifg=#839a00    guibg=NONE    gui=NONE
" hi Type              guifg=#425529    guibg=NONE    gui=NONE
" hi Type              guifg=#ff0e38    guibg=NONE    gui=NONE
" hi StorageClass      guifg=#d06a3e    guibg=NONE    gui=NONE
" hi StorageClass      guifg=#c55d30    guibg=NONE    gui=NONE
" hi Structure         guifg=NONE    guibg=NONE    gui=NONE
" hi Typedef           guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Special           guifg=#ff0e38    guibg=NONE    gui=NONE
" hi Special           guifg=#5d7839    guibg=NONE    gui=NONE
" hi Special              guifg=#e95770    guibg=NONE    gui=NONE
" hi Special              guifg=#543978    guibg=NONE    gui=NONE
" hi Special              guifg=#b3003f    guibg=NONE    gui=NONE
" hi Special              guifg=#e60051    guibg=NONE    gui=NONE
hi Special              guifg=#8a41ea    guibg=NONE    gui=NONE
" hi Special              guifg=#ff005a    guibg=NONE    gui=NONE
" hi SpecialChar       guifg=NONE    guibg=NONE    gui=NONE
" hi Tag               guifg=NONE    guibg=NONE    gui=NONE
" hi Delimiter         guifg=NONE    guibg=NONE    gui=NONE
" hi SpecialComment    guifg=NONE    guibg=NONE    gui=NONE
" hi Debug             guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Underlined        guifg=#6a5acd    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
" hi Ignore            guifg=NONE    guibg=NONE    gui=NONE
" ---------------------------------------------------------------------
hi Error             guifg=#ff0000    guibg=#ffcdcd    gui=NONE
" hi Error             guifg=#ff0000    guibg=#ffe7e7    gui=NONE
" ---------------------------------------------------------------------
hi TODO              guifg=#dc143c    guibg=#ebcc1a    gui=NONE

" ---------------------------------------------------------------------
" }}}
"
" Extended Highlighting {{{
" ---------------------------------------------------------------------

hi NonText       guifg=#b0b0b0    guibg=NONE    gui=NONE
hi Visual        guifg=#0b0e0f    guibg=#aaaaaa gui=NONE
" hi ErrorMsg      guifg=#ff0000    guibg=#ffe7e7    gui=NONE
hi ErrorMsg      guifg=#ff0000    guibg=#ffff80    gui=NONE
hi IncSearch     guifg=#0b0e0f    guibg=#ffcc00    gui=NONE
hi Search        guifg=#0b0e0f    guibg=#ffcc00    gui=NONE
hi MoreMsg       guifg=#696969    guibg=NONE    gui=NONE
hi ModeMsg       guifg=#505050    guibg=NONE    gui=NONE
hi LineNr        guifg=#b0b0b0    guibg=NONE    gui=NONE
hi VertSplit     guifg=#5b5b5b    guibg=#d0d0d0    gui=NONE
hi VisualNOS     guifg=#0b0e0f    guibg=#ffff4d    gui=NONE
" hi Folded        guifg=#696969    guibg=#c7c7c7    gui=NONE
" hi Folded        guifg=#696969    guibg=#d4d4d4    gui=NONE
" hi Folded        guifg=#c7c7c7    guibg=#e1e1e1    gui=NONE
hi Folded        guifg=#a0a0a0    guibg=#e1e1e1    gui=NONE
hi FoldColumn    guifg=#a0a0a0    guibg=#eeeeee    gui=NONE
hi DiffAdd       guifg=#ffffff guibg=#006600 gui=NONE
hi DiffChange    guifg=#ffffff guibg=#007878 gui=NONE
hi DiffDelete    guifg=#ff0101 guibg=#9a0000 gui=NONE
hi DiffText      guifg=#000000 guibg=#ffb733 gui=NONE
" hi SpellBad      guifg=NONE    guibg=NONE    gui=NONE
" hi SpellCap      guifg=NONE    guibg=NONE    gui=NONE
" hi SpellRare     guifg=NONE    guibg=NONE    gui=NONE
" hi SpellLocal    guifg=NONE    guibg=NONE    gui=NONE
hi SpellBad      guifg=#ff0000 guibg=#ffff9a gui=NONE
hi SpellCap      guifg=#8b4600 guibg=#ffff9a gui=NONE
hi SpellRare     guifg=#d80000 guibg=#ffff9a gui=NONE
hi SpellLocal    guifg=#008b00 guibg=#ffff9a gui=NONE
" hi StatusLine    guifg=#787878    guibg=#dadada    gui=NONE
hi StatusLine    guifg=#5b5b5b    guibg=#d0d0d0    gui=NONE
" hi StatusLine    guifg=#787878    guibg=#c7c7c7    gui=NONE
" hi StatusLineNC  guifg=#c7c7c7    guibg=#787878    gui=NONE
hi StatusLineNC  guifg=#c7c7c7    guibg=#e3e3e3    gui=NONE
hi Pmenu         guifg=#454545    guibg=#bbbbbb    gui=NONE
hi PmenuSel      guifg=#eeeeee    guibg=#0d3c6e    gui=NONE
hi PmenuSbar     guifg=#bbbbbb    guibg=#bbbbbb    gui=NONE
hi PmenuThumb    guifg=#bbbbbb    guibg=#bbbbbb    gui=NONE
hi MatchParen    guifg=#ffffff    guibg=#ff4400    gui=NONE
" hi CursorLine    guifg=NONE    guibg=#c0cdd1 gui=NONE
" hi CursorLine    guifg=NONE    guibg=#c0cdd1 gui=NONE
" hi CursorLine    guifg=NONE    guibg=#dde4e6 gui=NONE
hi CursorLine    guifg=NONE guibg=#e5e5e5 gui=NONE
" hi CursorLineNr  guifg=#346d51    guibg=NONE    gui=NONE
" hi CursorLineNr  guifg=#e82ba1    guibg=NONE    gui=NONE
hi CursorLineNr  guifg=#e11896    guibg=NONE    gui=NONE
hi CursorColumn  guifg=NONE    guibg=#e5e5e5 gui=NONE
" hi ColorColumn   guifg=NONE    guibg=#ffa07a    gui=NONE
" hi ColorColumn   guifg=NONE    guibg=#ffc4ad    gui=NONE
hi ColorColumn   guifg=NONE    guibg=#ffd7c7    gui=NONE
" hi WildMenu      guifg=#eeeeee    guibg=#787878    gui=NONE
" hi WildMenu      guifg=#0b0e0f    guibg=#0faf8d    gui=NONE
hi WildMenu      guifg=#eeeeee    guibg=#b7410e    gui=NONE
hi SignColumn    guifg=NONE    guibg=#eeeeee    gui=NONE
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
"hi pythonDot        guifg=#00ffa5 guibg=NONE gui=NONE
"hi pythonDot        guifg=#ffff31 guibg=NONE gui=NONE
"hi pythonDot        guifg=#ff0800 guibg=NONE gui=NONE
" hi pythonDot                 guifg=#d70a53 guibg=NONE gui=NONE
" hi pythonDot                 guifg=#00bcbc guibg=NONE gui=NONE
" hi pythonDot                 guifg=#005aff guibg=NONE gui=NONE
" hi pythonDot                 guifg=#1a6bff guibg=NONE gui=NONE
hi pythonDot                 guifg=#003eb1 guibg=NONE gui=NONE
" hi pythonDot                 guifg=#800080 guibg=NONE gui=NONE
hi pythonParameters          guifg=#026440 guibg=NONE gui=NONE
hi pythonClassParameters     guifg=#026440 guibg=NONE gui=NONE
hi pythonClass               guifg=#d12c52 guibg=NONE gui=NONE
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
hi StartifyBracket  guifg=#b06bfc guibg=NONE gui=NONE
hi StartifyNumber   guifg=#bada55 guibg=NONE gui=NONE
hi StartifySpecial  guifg=#2e8857 guibg=NONE gui=NONE
hi StartifyPath     guifg=#545454 guibg=NONE gui=NONE
hi StartifySlash    guifg=#474747 guibg=NONE gui=NONE
" hi StartifyFile     guifg=#00ffa5 guibg=NONE gui=NONE
" hi StartifyFile     guifg=#2aa198 guibg=NONE gui=NONE
" hi StartifyFile     guifg=#f0e68c guibg=NONE gui=NONE
hi StartifyFile     guifg=#fa8072 guibg=NONE gui=NONE
hi StartifyHeader   guifg=#f0e68c guibg=NONE gui=NONE
hi StartifyFooter   guifg=#a0522d guibg=NONE gui=NONE
"
" ---------------------------------------------------------------------
"
" CtrlP (https://github.com/kien/ctrlp.vim)
"
" hi CtrlPMatch     guifg=#cf4910 guibg=NONE    gui=NONE
" hi CtrlPMatch     guifg=#839e2e guibg=#cee094    gui=NONE
" hi CtrlPMatch     guifg=#728927 guibg=NONE    gui=NONE
hi CtrlPMatch      guifg=#008000 guibg=#ddeedd    gui=NONE
" hi CtrlPMatch     guifg=#008000 guibg=#ddffdd    gui=NONE
" hi CtrlPMatch     guifg=#008000 guibg=#eeffee    gui=NONE
hi CtrlPLinePre    guifg=#aaaaaa guibg=NONE    gui=NONE
hi CtrlPPrtBase    guifg=#aaaaaa guibg=NONE    gui=NONE
hi CtrlPPrtCursor  guifg=#0b0e0f guibg=#cccccc gui=NONE
hi CtrlPTabExtra   guifg=#ff4162 guibg=NONE    gui=NONE
hi CtrlPBufName    guifg=#ff0000 guibg=#ffffff    gui=NONE
hi CtrlPMode1      guifg=#007fff guibg=NONE    gui=NONE
hi CtrlPMode2      guifg=#e95600 guibg=NONE    gui=NONE
"
" ---------------------------------------------------------------------
"
" }}}
"
"
" vim:foldmethod=marker:foldlevel=0:textwidth=79
"
