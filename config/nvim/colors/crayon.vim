
" crayon.vim -- Vim color scheme.
" Author:      Dylan Araps (dyl@tfwno.gf)
" Webpage:     https://github.com/dylanaraps/crayone
" Description: A 16 color theme for vim

hi clear

set background=dark

" Neovim Terminal Mode Colors
let g:terminal_color_0 = "#101112"
let g:terminal_color_1 = "#C48D62"
let g:terminal_color_2 = "#99AE63"
let g:terminal_color_3 = "#D8C27A"
let g:terminal_color_4 = "#7495B6"
let g:terminal_color_5 = "#B59CD8"
let g:terminal_color_6 = "#8DC9C3"
let g:terminal_color_7 = "#BCC5D1"
let g:terminal_color_8 = "#586270"
let g:terminal_color_9 = "#B27B78"
let g:terminal_color_10 = "#282C33"
let g:terminal_color_11 = "#383E47"
let g:terminal_color_12 = "#798494"
let g:terminal_color_13 = "#D8D8D8"
let g:terminal_color_14 = "#CC99B3"
let g:terminal_color_15 = "#FDFEFF"

if exists("syntax_on")
syntax reset
endif

let colors_name = "crayon"

" highlight groups {{{

if &t_Co >= 256 || has("gui_running")
		hi Normal ctermbg=0 ctermfg=15 cterm=NONE guibg=#101112 guifg=#FDFEFF gui=NONE
	set background=dark
		hi NonText ctermbg=NONE ctermfg=0 cterm=NONE guibg=NONE guifg=#101112 gui=NONE
		hi Comment ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#586270 gui=NONE
		hi Constant ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Error ctermbg=9 ctermfg=15 cterm=NONE guibg=#B27B78 guifg=#FDFEFF gui=NONE
		hi Identifier ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi Ignore ctermbg=8 ctermfg=0 cterm=NONE guibg=#586270 guifg=#101112 gui=NONE
		hi PreProc ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Special ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#8DC9C3 gui=NONE
		hi Statement ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi String ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi Number ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Todo ctermbg=11 ctermfg=3 cterm=NONE guibg=#383E47 guifg=#D8C27A gui=NONE
		hi Type ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Underlined ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#B27B78 gui=underline
		hi StatusLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#586270 gui=NONE
		hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
		hi TabLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#586270 gui=NONE
		hi TabLineFill ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi TabLineSel ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi TermCursorNC ctermbg=3 ctermfg=0 cterm=NONE guibg=#D8C27A guifg=#101112 gui=NONE
		hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
		hi Title ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi CursorLine ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi LineNr ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi CursorLineNr ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi helpLeadBlank ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi helpNormal ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi Visual ctermbg=11 ctermfg=8 cterm=NONE guibg=#383E47 guifg=#586270 gui=NONE
		hi VisualNOS ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi Pmenu ctermbg=10 ctermfg=7 cterm=NONE guibg=#282C33 guifg=#BCC5D1 gui=NONE
		hi PmenuSbar ctermbg=6 ctermfg=15 cterm=NONE guibg=#8DC9C3 guifg=#FDFEFF gui=NONE
		hi PmenuSel ctermbg=4 ctermfg=0 cterm=bold guibg=#7495B6 guifg=#101112 gui=bold
		hi PmenuThumb ctermbg=8 ctermfg=8 cterm=NONE guibg=#586270 guifg=#586270 gui=NONE
		hi FoldColumn ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi Folded ctermbg=NONE ctermfg=11 cterm=bold guibg=NONE guifg=#383E47 gui=bold
		hi WildMenu ctermbg=2 ctermfg=0 cterm=NONE guibg=#99AE63 guifg=#101112 gui=NONE
		hi SpecialKey ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi DiffAdd ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi DiffChange ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi DiffDelete ctermbg=NONE ctermfg=9 cterm=bold guibg=NONE guifg=#B27B78 gui=bold
		hi DiffText ctermbg=NONE ctermfg=4 cterm=bold guibg=NONE guifg=#7495B6 gui=bold
		hi IncSearch ctermbg=3 ctermfg=0 cterm=NONE guibg=#D8C27A guifg=#101112 gui=NONE
		hi Search ctermbg=3 ctermfg=0 cterm=NONE guibg=#D8C27A guifg=#101112 gui=NONE
		hi Directory ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi MatchParen ctermbg=11 ctermfg=0 cterm=NONE guibg=#383E47 guifg=#101112 gui=NONE
		hi ColorColumn ctermbg=11 ctermfg=11 cterm=NONE guibg=#383E47 guifg=#383E47 gui=NONE
		hi signColumn ctermbg=NONE ctermfg=4 cterm=bold guibg=NONE guifg=#7495B6 gui=bold
		hi ErrorMsg ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi ModeMsg ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi MoreMsg ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi Question ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi WarningMsg ctermbg=9 ctermfg=0 cterm=NONE guibg=#B27B78 guifg=#101112 gui=NONE
		hi Cursor ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
		hi Structure ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi CursorColumn ctermbg=11 ctermfg=15 cterm=NONE guibg=#383E47 guifg=#FDFEFF gui=NONE
		hi ModeMsg ctermbg=NONE ctermfg=15 cterm=bold guibg=NONE guifg=#FDFEFF gui=bold
		hi SpellBad ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#B27B78 gui=underline guisp=#B27B78
		hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline guibg=NONE guifg=#7495B6 gui=underline guisp=#7495B6
		hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline guibg=NONE guifg=#B59CD8 gui=underline guisp=#B59CD8
		hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline guibg=NONE guifg=#8DC9C3 gui=underline guisp=#8DC9C3
		hi Boolean ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi Character ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi Conditional ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi Define ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi Delimiter ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi Float ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi Include ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi Keyword ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi Label ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Operator ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi Repeat ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi SpecialChar ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi Tag ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi Typedef ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi vimUserCommand ctermbg=NONE ctermfg=9 cterm=BOLD guibg=NONE guifg=#B27B78 gui=BOLD
			hi link vimMap vimUserCommand
			hi link vimLet vimUserCommand
			hi link vimCommand vimUserCommand
			hi link vimFTCmd vimUserCommand
			hi link vimAutoCmd vimUserCommand
			hi link vimNotFunc vimUserCommand
		hi vimNotation ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi vimMapModKey ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi vimBracket ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi vimCommentString ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#586270 gui=NONE
		hi htmlLink ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#B27B78 gui=underline
		hi htmlBold ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi htmlItalic ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi htmlEndTag ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi htmlTag ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi htmlTagName ctermbg=NONE ctermfg=9 cterm=BOLD guibg=NONE guifg=#B27B78 gui=BOLD
		hi htmlH1 ctermbg=NONE ctermfg=15 cterm=BOLD guibg=NONE guifg=#FDFEFF gui=BOLD
			hi link htmlH2 htmlH1
			hi link htmlH3 htmlH1
			hi link htmlH4 htmlH1
			hi link htmlH5 htmlH1
			hi link htmlH6 htmlH1
		hi cssMultiColumnAttr ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
			hi link cssFontAttr cssMultiColumnAttr
			hi link cssFlexibleBoxAttr cssMultiColumnAttr
		hi cssBraces ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
			hi link cssAttrComma cssBraces
		hi cssValueLength ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi cssUnitDecorators ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi cssValueNumber ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
			hi link cssValueLength cssValueNumber
		hi cssNoise ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#586270 gui=NONE
		hi cssTagName ctermbg=NONE ctermfg=9 cterm=bold guibg=NONE guifg=#B27B78 gui=bold
		hi cssFunctionName ctermbg=NONE ctermfg=4 cterm=bold guibg=NONE guifg=#7495B6 gui=bold
		hi scssSelectorChar ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi scssAttribute ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
			hi link scssDefinition cssNoise
		hi sassidChar ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi sassClassChar ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi sassInclude ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi sassMixing ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi sassMixinName ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi javaScript ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi javaScriptBraces ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi javaScriptNumber ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi markdownAutomaticLink ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#B27B78 gui=underline
			hi link markdownUrl markdownAutomaticLink
		hi markdownError ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi markdownCode ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi markdownCodeBlock ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi markdownCodeDelimiter ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#C48D62 gui=NONE
		hi xdefaultsValue ctermbg=NONE ctermfg=13 cterm=NONE guibg=NONE guifg=#D8D8D8 gui=NONE
		hi rubyInclude ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi rubyDefine ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi rubyFunction ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi rubyStringDelimiter ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi rubyInteger ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi rubyAttribute ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi rubyConstant ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi rubyInterpolation ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#D8C27A gui=NONE
		hi rubyRegexp ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#8DC9C3 gui=NONE
		hi rubySymbol ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi rubyTodo ctermbg=NONE ctermfg=8 cterm=bold guibg=NONE guifg=#586270 gui=bold
		hi rubyRegexpAnchor ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#BCC5D1 gui=NONE
			hi link rubyRegexpQuantifier rubyRegexpAnchor
		hi pythonOperator ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi pythonFunction ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi pythonRepeat ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi pythonStatement ctermbg=NONE ctermfg=9 cterm=Bold guibg=NONE guifg=#B27B78 gui=Bold
		hi pythonBuiltIn ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi phpMemberSelector ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi phpComparison ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi phpParent ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
		hi cOperator ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#8DC9C3 gui=NONE
		hi cPreCondit ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#B59CD8 gui=NONE
		hi SignifySignAdd ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#99AE63 gui=NONE
		hi SignifySignChange ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi SignifySignDelete ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#B27B78 gui=NONE
		hi NERDTreeDirSlash ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#7495B6 gui=NONE
		hi NERDTreeExecFile ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#FDFEFF gui=NONE
elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
set t_Co=16
		hi Normal ctermbg=black ctermfg=white cterm=NONE
	set background=dark
		hi NonText ctermbg=NONE ctermfg=black cterm=NONE
		hi Comment ctermbg=NONE ctermfg=darkgray cterm=NONE
		hi Constant ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Error ctermbg=red ctermfg=white cterm=NONE
		hi Identifier ctermbg=NONE ctermfg=red cterm=NONE
		hi Ignore ctermbg=darkgray ctermfg=black cterm=NONE
		hi PreProc ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Special ctermbg=NONE ctermfg=darkcyan cterm=NONE
		hi Statement ctermbg=NONE ctermfg=red cterm=NONE
		hi String ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi Number ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Todo ctermbg=yellow ctermfg=darkyellow cterm=NONE
		hi Type ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Underlined ctermbg=NONE ctermfg=red cterm=underline
		hi StatusLine ctermbg=NONE ctermfg=darkgray cterm=NONE
		hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=NONE
		hi TabLine ctermbg=NONE ctermfg=darkgray cterm=NONE
		hi TabLineFill ctermbg=NONE ctermfg=yellow cterm=NONE
		hi TabLineSel ctermbg=NONE ctermfg=yellow cterm=NONE
		hi TermCursorNC ctermbg=darkyellow ctermfg=black cterm=NONE
		hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE
		hi Title ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi CursorLine ctermbg=NONE ctermfg=yellow cterm=NONE
		hi LineNr ctermbg=NONE ctermfg=yellow cterm=NONE
		hi CursorLineNr ctermbg=NONE ctermfg=yellow cterm=NONE
		hi helpLeadBlank ctermbg=NONE ctermfg=white cterm=NONE
		hi helpNormal ctermbg=NONE ctermfg=white cterm=NONE
		hi Visual ctermbg=yellow ctermfg=darkgray cterm=NONE
		hi VisualNOS ctermbg=NONE ctermfg=red cterm=NONE
		hi Pmenu ctermbg=green ctermfg=gray cterm=NONE
		hi PmenuSbar ctermbg=darkcyan ctermfg=white cterm=NONE
		hi PmenuSel ctermbg=darkblue ctermfg=black cterm=bold
		hi PmenuThumb ctermbg=darkgray ctermfg=darkgray cterm=NONE
		hi FoldColumn ctermbg=NONE ctermfg=white cterm=NONE
		hi Folded ctermbg=NONE ctermfg=yellow cterm=bold
		hi WildMenu ctermbg=darkgreen ctermfg=black cterm=NONE
		hi SpecialKey ctermbg=NONE ctermfg=yellow cterm=NONE
		hi DiffAdd ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi DiffChange ctermbg=NONE ctermfg=yellow cterm=NONE
		hi DiffDelete ctermbg=NONE ctermfg=red cterm=bold
		hi DiffText ctermbg=NONE ctermfg=darkblue cterm=bold
		hi IncSearch ctermbg=darkyellow ctermfg=black cterm=NONE
		hi Search ctermbg=darkyellow ctermfg=black cterm=NONE
		hi Directory ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi MatchParen ctermbg=yellow ctermfg=black cterm=NONE
		hi ColorColumn ctermbg=yellow ctermfg=yellow cterm=NONE
		hi signColumn ctermbg=NONE ctermfg=darkblue cterm=bold
		hi ErrorMsg ctermbg=NONE ctermfg=yellow cterm=NONE
		hi ModeMsg ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi MoreMsg ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi Question ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi WarningMsg ctermbg=red ctermfg=black cterm=NONE
		hi Cursor ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Structure ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi CursorColumn ctermbg=yellow ctermfg=white cterm=NONE
		hi ModeMsg ctermbg=NONE ctermfg=white cterm=bold
		hi SpellBad ctermbg=NONE ctermfg=red cterm=underline
		hi SpellCap ctermbg=NONE ctermfg=darkblue cterm=underline
		hi SpellLocal ctermbg=NONE ctermfg=darkmagenta cterm=underline
		hi SpellRare ctermbg=NONE ctermfg=darkcyan cterm=underline
		hi Boolean ctermbg=NONE ctermfg=darkred cterm=NONE
		hi Character ctermbg=NONE ctermfg=red cterm=NONE
		hi Conditional ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi Define ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi Delimiter ctermbg=NONE ctermfg=darkred cterm=NONE
		hi Float ctermbg=NONE ctermfg=darkred cterm=NONE
		hi Include ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi Keyword ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi Label ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Operator ctermbg=NONE ctermfg=white cterm=NONE
		hi Repeat ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi SpecialChar ctermbg=NONE ctermfg=darkred cterm=NONE
		hi Tag ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi Typedef ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi vimUserCommand ctermbg=NONE ctermfg=red cterm=BOLD
			hi link vimMap vimUserCommand
			hi link vimLet vimUserCommand
			hi link vimCommand vimUserCommand
			hi link vimFTCmd vimUserCommand
			hi link vimAutoCmd vimUserCommand
			hi link vimNotFunc vimUserCommand
		hi vimNotation ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi vimMapModKey ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi vimBracket ctermbg=NONE ctermfg=white cterm=NONE
		hi vimCommentString ctermbg=NONE ctermfg=darkgray cterm=NONE
		hi htmlLink ctermbg=NONE ctermfg=red cterm=underline
		hi htmlBold ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi htmlItalic ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi htmlEndTag ctermbg=NONE ctermfg=white cterm=NONE
		hi htmlTag ctermbg=NONE ctermfg=white cterm=NONE
		hi htmlTagName ctermbg=NONE ctermfg=red cterm=BOLD
		hi htmlH1 ctermbg=NONE ctermfg=white cterm=BOLD
			hi link htmlH2 htmlH1
			hi link htmlH3 htmlH1
			hi link htmlH4 htmlH1
			hi link htmlH5 htmlH1
			hi link htmlH6 htmlH1
		hi cssMultiColumnAttr ctermbg=NONE ctermfg=darkgreen cterm=NONE
			hi link cssFontAttr cssMultiColumnAttr
			hi link cssFlexibleBoxAttr cssMultiColumnAttr
		hi cssBraces ctermbg=NONE ctermfg=white cterm=NONE
			hi link cssAttrComma cssBraces
		hi cssValueLength ctermbg=NONE ctermfg=white cterm=NONE
		hi cssUnitDecorators ctermbg=NONE ctermfg=white cterm=NONE
		hi cssValueNumber ctermbg=NONE ctermfg=white cterm=NONE
			hi link cssValueLength cssValueNumber
		hi cssNoise ctermbg=NONE ctermfg=darkgray cterm=NONE
		hi cssTagName ctermbg=NONE ctermfg=red cterm=bold
		hi cssFunctionName ctermbg=NONE ctermfg=darkblue cterm=bold
		hi scssSelectorChar ctermbg=NONE ctermfg=white cterm=NONE
		hi scssAttribute ctermbg=NONE ctermfg=white cterm=NONE
			hi link scssDefinition cssNoise
		hi sassidChar ctermbg=NONE ctermfg=red cterm=NONE
		hi sassClassChar ctermbg=NONE ctermfg=darkred cterm=NONE
		hi sassInclude ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi sassMixing ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi sassMixinName ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi javaScript ctermbg=NONE ctermfg=white cterm=NONE
		hi javaScriptBraces ctermbg=NONE ctermfg=white cterm=NONE
		hi javaScriptNumber ctermbg=NONE ctermfg=darkred cterm=NONE
		hi markdownAutomaticLink ctermbg=NONE ctermfg=red cterm=underline
			hi link markdownUrl markdownAutomaticLink
		hi markdownError ctermbg=NONE ctermfg=white cterm=NONE
		hi markdownCode ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi markdownCodeBlock ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi markdownCodeDelimiter ctermbg=NONE ctermfg=darkred cterm=NONE
		hi xdefaultsValue ctermbg=NONE ctermfg=magenta cterm=NONE
		hi rubyInclude ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi rubyDefine ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi rubyFunction ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi rubyStringDelimiter ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi rubyInteger ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi rubyAttribute ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi rubyConstant ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi rubyInterpolation ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=darkyellow cterm=NONE
		hi rubyRegexp ctermbg=NONE ctermfg=darkcyan cterm=NONE
		hi rubySymbol ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi rubyTodo ctermbg=NONE ctermfg=darkgray cterm=bold
		hi rubyRegexpAnchor ctermbg=NONE ctermfg=gray cterm=NONE
			hi link rubyRegexpQuantifier rubyRegexpAnchor
		hi pythonOperator ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi pythonFunction ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi pythonRepeat ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi pythonStatement ctermbg=NONE ctermfg=red cterm=Bold
		hi pythonBuiltIn ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi phpMemberSelector ctermbg=NONE ctermfg=white cterm=NONE
		hi phpComparison ctermbg=NONE ctermfg=white cterm=NONE
		hi phpParent ctermbg=NONE ctermfg=white cterm=NONE
		hi cOperator ctermbg=NONE ctermfg=darkcyan cterm=NONE
		hi cPreCondit ctermbg=NONE ctermfg=darkmagenta cterm=NONE
		hi SignifySignAdd ctermbg=NONE ctermfg=darkgreen cterm=NONE
		hi SignifySignChange ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi SignifySignDelete ctermbg=NONE ctermfg=red cterm=NONE
		hi NERDTreeDirSlash ctermbg=NONE ctermfg=darkblue cterm=NONE
		hi NERDTreeExecFile ctermbg=NONE ctermfg=white cterm=NONE
endif


" Generated with RNB (https://gist.github.com/romainl/5cd2f4ec222805f49eca)

" }}}
