" Vim color scheme
"
" Name:         swamplight.vim
" Maintainer:   suija <2drealm@gmail.com>
" Created:      Friday, 13 Dec 2013
" Last Change:  14 Dec 2013
" License:      WTFPL <http://sam.zoy.org/wtfpl/>
" Version:      1.0
"
" Light vim colorscheme, made from scratch.
" Works better if the font is not a single pixel bitmap.

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "swamplight"

" GUI Colors
" ====================================================================
"
" Interface Elements
hi StatusLine				guifg=#edeccc	guibg=#65876b	gui=BOLD
hi StatusLineNC				guifg=#edeccc	guibg=#b0b393	gui=BOLD
hi VertSplit				guifg=#edeccc	guibg=#65876b	gui=BOLD
hi Folded					guifg=#edeccc	guibg=#b0b393	gui=NONE
hi FoldColumn				guifg=#edeccc	guibg=#b0b393	gui=BOLD
hi LineNr					guifg=#edeccc	guibg=#b0b393	gui=NONE
hi CursorLineNr												gui=BOLD
hi TabLine					guifg=#edeccc	guibg=#b0b393	gui=BOLD
hi TabLineFill								guibg=#b0b393	gui=BOLD
hi TabLineSel				guifg=#edeccc	guibg=#65876b	gui=BOLD
hi Pmenu					guifg=#000000	guibg=#b0b393	gui=NONE
hi PmenuSel					guifg=#edeccc	guibg=#65876b	gui=BOLD
hi PmenuSbar								guibg=#b0b393	gui=NONE
hi PmenuThumb								guibg=#65876b	gui=NONE
hi ColorColumn				guifg=NONE		guibg=#b0b393	gui=BOLD
hi ToDo						guifg=#cc8014	guibg=#b0b393	gui=BOLD
hi Directory				guifg=#2e8c0e	guibg=bg		gui=NONE

hi Normal					guifg=#000000	guibg=#edeccc
hi Cursor					guifg=#edeccc	guibg=#65876b	gui=BOLD
hi CursorLine								guibg=#edeccc	gui=NONE

hi Title					guifg=#0e588c
hi Question					guifg=#cc8014					gui=BOLD
hi ModeMsg					guifg=#8c230e	guibg=NONE		gui=BOLD
hi MoreMsg					guifg=#2e8c0e
hi ErrorMsg					guifg=#8c230e	guibg=NONE		gui=BOLD
hi WarningMsg				guifg=#cc8014	guibg=bg		gui=BOLD
hi NonText					guifg=#65876b	guibg=#b0b393	gui=BOLD

hi Visual					guifg=#000000	guibg=#aab472	gui=NONE
hi Search					guifg=#000000	guibg=#cccc8f	gui=NONE
hi IncSearch				guifg=#000000	guibg=#cccc8f	gui=BOLD
hi Error					guifg=#edeccc	guibg=#8c230e	gui=NONE
hi MatchParen				guifg=#8c230e	guibg=#b0b393	gui=BOLD

hi Comment					guifg=#778066					gui=NONE
hi Boolean					guifg=#0e588c					gui=BOLD
hi String					guifg=#733900	guibg=#e6e4ac	gui=NONE
hi Statement				guifg=#2e8c0e					gui=NONE
hi Function					guifg=#0e8c77					gui=NONE
hi Include					guifg=#828c0e					gui=NONE
hi Type						guifg=#8c230e					gui=NONE
hi Special					guifg=#8c230e					gui=NONE
hi Number					guifg=#cc8014					gui=BOLD
hi Constant					guifg=#cc8014
hi Identifier				guifg=#620e8c
hi PreProc					guifg=#0e588c
hi SpecialKey				guifg=#778066	guibg=#edeccc	gui=NONE
hi Operator					guifg=#0e588c					gui=BOLD
hi Delimiter				guifg=#8c230e					gui=BOLD
hi Exeption					guifg=#2e8c0e					gui=BOLD
hi Keyword					guifg=#000000					gui=NONE
hi PreCondit				guifg=#2e8c0e
hi Define					guifg=#2e8c0e

" Python
hi pythonBuiltin			guifg=#cc8014					gui=NONE
hi pythonOperator			guifg=#0e588c					gui=BOLD
hi pythonException			guifg=#2e8c0e	guibg=NONE		gui=BOLD

" Ruby
hi rubyConstant					guifg=#8c230e
hi rubyClass					guifg=#2e8c0e				gui=BOLD
hi rubyBlockParameter			guifg=#8c230e				gui=BOLD
hi rubyStringDelimiter			guifg=#8c230e				gui=BOLD
hi rubyPseudoVariable			guifg=#000000

" Lua
hi luaOperator				guifg=#0e588c					gui=BOLD

" html, xml
hi link htmlTag				xmlTag
hi link htmlTagName			xmlTagName
hi link htmlEndTag			xmlEndTag
hi xmlTag					guifg=#2e8c0e
hi xmlTagName				guifg=#0e8c77
hi xmlEndTag				guifg=#2e8c0e

hi mailSubject				guifg=#2e8c0e
hi mailHeaderKey			guifg=#8c230e
hi mailEmail				guifg=#2e8c0e					gui=NONE

" Diff
hi DiffText					guifg=#edeccc	guibg=#a68e6c	gui=BOLD
hi DiffChange				guifg=#000000	guibg=#bfb699	gui=BOLD
hi DiffDelete				guifg=#8c230e	guibg=#edeccc	gui=BOLD
hi DiffAdd					guifg=#000000	guibg=#afbf99	gui=BOLD

" Spell Check
hi SpellBad					guifg=#cc2200				gui=undercurl
hi SpellCap					guifg=#000000				gui=undercurl
hi SpellLocal				guifg=#000000				gui=undercurl
hi SpellRare				guifg=#000000				gui=undercurl

" 256 Colors
" ===================================================================
"
" Interface Elements
hi StatusLine				ctermfg=230		ctermbg=65		cterm=BOLD
hi StatusLineNC				ctermfg=230		ctermbg=144		cterm=BOLD
hi VertSplit				ctermfg=230		ctermbg=65		cterm=BOLD
hi Folded					ctermfg=230		ctermbg=144		cterm=NONE
hi FoldColumn				ctermfg=230		ctermbg=144		cterm=BOLD
hi LineNr					ctermfg=230		ctermbg=144		cterm=NONE
hi CursorLineNr												cterm=BOLD
hi TabLine					ctermfg=230		ctermbg=144		cterm=BOLD
hi TabLineFill								ctermbg=144		cterm=BOLD
hi TabLineSel				ctermfg=230		ctermbg=65		cterm=BOLD
hi Pmenu					ctermfg=16		ctermbg=144		cterm=NONE
hi PmenuSel					ctermfg=230		ctermbg=65		cterm=BOLD
hi PmenuSbar								ctermbg=144		cterm=NONE
hi PmenuThumb								ctermbg=65		cterm=NONE
hi ColorColumn				ctermfg=NONE	ctermbg=144		cterm=BOLD
hi ToDo						ctermfg=130		ctermbg=144		cterm=BOLD
hi Directory				ctermfg=28		ctermbg=NONE	cterm=NONE

hi Normal					ctermfg=16		ctermbg=230
hi Cursor					ctermfg=230		ctermbg=65		cterm=BOLD
hi CursorLine								ctermbg=230		cterm=NONE

hi Title					ctermfg=24
hi Question					ctermfg=130						cterm=BOLD
hi ModeMsg					ctermfg=88	ctermbg=NONE		cterm=BOLD
hi MoreMsg					ctermfg=28
hi ErrorMsg					ctermfg=88	ctermbg=NONE		cterm=BOLD
hi WarningMsg				ctermfg=130	ctermbg=NONE		cterm=BOLD
hi NonText					ctermfg=65		ctermbg=144		cterm=BOLD

hi Visual					ctermfg=16	ctermbg=106		cterm=NONE
hi Search					ctermfg=16	ctermbg=186		cterm=NONE
hi IncSearch				ctermfg=16	ctermbg=186		cterm=BOLD
hi Error					ctermfg=230	ctermbg=88		cterm=NONE
hi MatchParen				ctermfg=88	ctermbg=144		cterm=BOLD

hi Comment					ctermfg=101					cterm=NONE
hi Boolean					ctermfg=24					cterm=BOLD
hi String					ctermfg=94	ctermbg=229		cterm=NONE
hi Statement				ctermfg=28					cterm=NONE
hi Function					ctermfg=30					cterm=NONE
hi Include					ctermfg=100					cterm=NONE
hi Type						ctermfg=88					cterm=NONE
hi Special					ctermfg=88					cterm=NONE
hi Number					ctermfg=130					cterm=BOLD
hi Constant					ctermfg=130
hi Identifier				ctermfg=54
hi PreProc					ctermfg=24
hi SpecialKey				ctermfg=101		ctermbg=230	cterm=NONE
hi Operator					ctermfg=24					cterm=BOLD
hi Delimiter				ctermfg=88					cterm=BOLD
hi Exeption					ctermfg=28					cterm=BOLD
hi Keyword					ctermfg=16					cterm=NONE
hi PreCondit				ctermfg=28
hi Define					ctermfg=28

" Python
hi pythonBuiltin			ctermfg=130					cterm=NONE
hi pythonOperator			ctermfg=24					cterm=BOLD
hi pythonException			ctermfg=28	ctermbg=NONE		cterm=BOLD

" Ruby
hi rubyConstant					ctermfg=88
hi rubyClass					ctermfg=28				cterm=BOLD
hi rubyBlockParameter			ctermfg=88				cterm=BOLD
hi rubyStringDelimiter			ctermfg=88				cterm=BOLD
hi rubyPseudoVariable			ctermfg=16

" Lua
hi luaOperator				ctermfg=24					cterm=BOLD

" html, xml
hi link htmlTag				xmlTag
hi link htmlTagName			xmlTagName
hi link htmlEndTag			xmlEndTag
hi xmlTag					ctermfg=28
hi xmlTagName				ctermfg=30
hi xmlEndTag				ctermfg=28

hi mailSubject				ctermfg=28
hi mailHeaderKey			ctermfg=88
hi mailEmail				ctermfg=28					cterm=NONE

" Diff
hi DiffText					ctermfg=230	ctermbg=136		cterm=BOLD
hi DiffChange				ctermfg=16	ctermbg=137		cterm=BOLD
hi DiffDelete				ctermfg=88	ctermbg=230		cterm=BOLD
hi DiffAdd					ctermfg=16	ctermbg=108		cterm=BOLD

" Spell Check
hi SpellBad					ctermfg=160				cterm=undercurl
hi SpellCap					ctermfg=16				cterm=undercurl
hi SpellLocal				ctermfg=16				cterm=undercurl
hi SpellRare				ctermfg=16				cterm=undercurl
