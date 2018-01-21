" Vim Color File
" Name:       bubblegum.vim
" Version:    0.2
" Maintainer: baskerville <nihilhill *at* gmail *dot* com>

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name="bubblegum"

" Cf. `:h w18`

if &background == "dark"
	" Main
	hi Normal          ctermfg=249    ctermbg=235    cterm=none    guifg=#B2B2B2    guibg=#262626    gui=none
	hi Comment         ctermfg=244    guifg=#808080

	" Constant
	hi Constant        ctermfg=186    guifg=#D7D787
	hi String          ctermfg=187    guifg=#D7D7AF
	hi Character       ctermfg=187    guifg=#D7D7AF
	hi Number          ctermfg=179    guifg=#D7AF5F
	hi Boolean         ctermfg=187    guifg=#D7D7AF
	hi Float           ctermfg=179    guifg=#D7AF5F

	" Variable
	hi Identifier      ctermfg=182    guifg=#D7AFD7
	hi Function        ctermfg=182    guifg=#D7AFD7

	" Keyword
	hi Statement       ctermfg=110    guifg=#87AFD7
	hi Conditional     ctermfg=110    guifg=#87AFD7
	hi Repeat          ctermfg=110    guifg=#87AFD7
	hi Label           ctermfg=110    guifg=#87AFD7
	hi Operator        ctermfg=110    guifg=#87AFD7
	hi Keyword         ctermfg=110    guifg=#87AFD7
	hi Exception       ctermfg=110    guifg=#87AFD7

	" Meta
	hi PreProc         ctermfg=150    guifg=#AFD787
	hi Include         ctermfg=150    guifg=#AFD787
	hi Define          ctermfg=150    guifg=#AFD787
	hi Macro           ctermfg=150    guifg=#AFD787
	hi PreCondit       ctermfg=150    guifg=#AFD787

	" Type
	hi Type            ctermfg=146    guifg=#AFAFD7
	hi StorageClass    ctermfg=146    guifg=#AFAFD7
	hi Structure       ctermfg=146    guifg=#AFAFD7
	hi Typedef         ctermfg=146    guifg=#AFAFD7

	" Special
	hi Special         ctermfg=174    guifg=#D78787
	hi SpecialChar     ctermfg=174    guifg=#D78787
	hi Tag             ctermfg=174    guifg=#D78787
	hi Delimiter       ctermfg=174    guifg=#D78787
	hi SpecialComment  ctermfg=174    guifg=#D78787
	hi Debug           ctermfg=174    guifg=#D78787
	hi Underlined      ctermfg=fg    guifg=fg
	hi Ignore          ctermfg=bg    guifg=bg
	hi Error           ctermfg=231    ctermbg=167    guifg=#FFFFFF    guibg=#D75F5F
	hi Todo            ctermfg=244    ctermbg=bg     cterm=none    guifg=#808080    guibg=bg    gui=none

	" Misc
	hi StatusLine      ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none
	hi StatusLineNC    ctermfg=244    ctermbg=237    cterm=none    guifg=#808080    guibg=#3A3A3A    gui=none
	hi TabLine         ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none
	hi TabLineSel      ctermfg=253    ctermbg=238    cterm=none    guifg=#DADADA    guibg=#444444    gui=none
	hi TabLineFill     ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none

	hi Pmenu           ctermfg=fg     ctermbg=237    guifg=fg    guibg=#3A3A3A
	hi PmenuSel        ctermfg=231    ctermbg=244    guifg=#FFFFFF    guibg=#808080
	hi PmenuSbar       ctermfg=231    ctermbg=244    guifg=#FFFFFF    guibg=#808080
	hi PmenuThumb      ctermbg=187    ctermfg=187    guibg=#D7D7AF    guifg=#D7D7AF
	hi WildMenu        ctermfg=71     ctermbg=237    cterm=none    guifg=#5FAF5F    guibg=#3A3A3A    gui=none

	hi Visual          ctermfg=bg     ctermbg=117    guifg=bg    guibg=#87D7FF
	hi VisualNOS       ctermfg=bg     ctermbg=116    guifg=bg    guibg=#87D7D7
	hi VertSplit       ctermfg=237    ctermbg=237    cterm=none    guifg=#3A3A3A    guibg=#3A3A3A    gui=none
	hi LineNr          ctermfg=244    ctermbg=237    guifg=#808080    guibg=#3A3A3A

	hi Title           ctermfg=109    guifg=#87AFAF
	hi SpecialKey      ctermfg=114    guifg=#87D787
	hi NonText         ctermfg=244    guifg=#808080
	hi Conceal         ctermfg=77     ctermbg=bg    guifg=#5FD75F    guibg=bg
	hi MatchParen      ctermfg=16     ctermbg=215    guifg=#000000    guibg=#FFAF5F
	hi Directory       ctermfg=103    guifg=#8787AF

	hi ErrorMsg        ctermfg=210    ctermbg=bg    guifg=#FF8787    guibg=bg
	hi WarningMsg      ctermfg=140    guifg=#AF87D7
	hi MoreMsg         ctermfg=72    guifg=#5FAF87
	hi ModeMsg         ctermfg=222    guifg=#FFD787

	hi Search          ctermfg=16     ctermbg=179     cterm=none    guifg=#000000    guibg=#D7AF5F    gui=none
	hi IncSearch       ctermfg=231    ctermbg=168     cterm=none    guifg=#FFFFFF    guibg=#D75F87    gui=none
	hi Question        ctermfg=38    guifg=#00AFD7

	hi Folded          ctermfg=244    ctermbg=bg    guifg=#808080    guibg=bg
	hi FoldColumn      ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A
	hi SignColumn      ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A
	hi ColorColumn     ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A

	hi CursorColumn    ctermbg=237    cterm=none    guibg=#3A3A3A    gui=none
	hi CursorLine      ctermbg=237    cterm=none    guibg=#3A3A3A    gui=none

	hi vimFold         ctermfg=244    guifg=#808080
	hi vimCommentTitle ctermfg=fg    guifg=fg
	hi helpHyperTextJump ctermfg=74    guifg=#5FAFD7

	hi htmlTag         ctermfg=147    guifg=#AFAFFF
	hi htmlEndTag      ctermfg=147    guifg=#AFAFFF
	hi htmlTagName     ctermfg=175    guifg=#D787AF
	hi htmlString      ctermfg=144    guifg=#AFAF87

	hi diffFile        ctermfg=244    guifg=#808080
	hi diffLine        ctermfg=244    guifg=#808080
	hi diffAdded       ctermfg=107    guifg=#87AF5F
	hi diffRemoved     ctermfg=175    guifg=#D787AF
	hi diffChanged     ctermfg=179    guifg=#D7AF5F

	hi diffAdd         ctermfg=16     ctermbg=149    guifg=#000000    guibg=#AFD75F
	hi diffDelete      ctermfg=231    ctermbg=fg    guifg=#FFFFFF    guibg=fg
	hi diffText        ctermfg=16     ctermbg=211    guifg=#000000    guibg=#FF87AF
	hi diffChange      ctermfg=16     ctermbg=217    guifg=#000000    guibg=#FFAFAF
	hi diffOldLine     ctermfg=104    guifg=#8787D7

	hi SpellBad        ctermfg=210    ctermbg=bg    cterm=underline    guifg=#FF8787    guibg=bg    gui=underline
	hi SpellCap        ctermfg=174    ctermbg=bg    cterm=underline    guifg=#D78787    guibg=bg    gui=underline
	hi SpellRare       ctermfg=181    ctermbg=bg    cterm=underline    guifg=#D7AFAF    guibg=bg    gui=underline
	hi SpellLocal      ctermfg=180    ctermbg=bg    cterm=underline    guifg=#D7AF87    guibg=bg    gui=underline

	hi mkdCode         ctermfg=244    guifg=#808080
	hi mkdURL          ctermfg=111    guifg=#87AFFF
	hi mkdLink         ctermfg=181    guifg=#D7AFAF
else
	" Main
	hi Normal          ctermfg=241    ctermbg=231    cterm=none    guifg=#626262    guibg=#FFFFFF    gui=none
	hi Comment         ctermfg=246    guifg=#949494

	" Constant
	hi Constant        ctermfg=64    guifg=#5F8700
	hi String          ctermfg=101    guifg=#87875F
	hi Character       ctermfg=101    guifg=#87875F
	hi Number          ctermfg=136    guifg=#AF8700
	hi Boolean         ctermfg=101    guifg=#87875F
	hi Float           ctermfg=136    guifg=#AF8700

	" Variable
	hi Identifier      ctermfg=133    guifg=#AF5FAF
	hi Function        ctermfg=133    guifg=#AF5FAF

	" Keyword
	hi Statement       ctermfg=32    guifg=#0087D7
	hi Conditional     ctermfg=32    guifg=#0087D7
	hi Repeat          ctermfg=32    guifg=#0087D7
	hi Label           ctermfg=32    guifg=#0087D7
	hi Operator        ctermfg=32    guifg=#0087D7
	hi Keyword         ctermfg=32    guifg=#0087D7
	hi Exception       ctermfg=32    guifg=#0087D7

	" Meta
	hi PreProc         ctermfg=22    guifg=#005F00
	hi Include         ctermfg=22    guifg=#005F00
	hi Define          ctermfg=22    guifg=#005F00
	hi Macro           ctermfg=22    guifg=#005F00
	hi PreCondit       ctermfg=22    guifg=#005F00

	" Type
	hi Type            ctermfg=61    guifg=#5F5FAF
	hi StorageClass    ctermfg=61    guifg=#5F5FAF
	hi Structure       ctermfg=61    guifg=#5F5FAF
	hi Typedef         ctermfg=61    guifg=#5F5FAF

	" Special
	hi Special         ctermfg=167    guifg=#D75F5F
	hi SpecialChar     ctermfg=167    guifg=#D75F5F
	hi Tag             ctermfg=167    guifg=#D75F5F
	hi Delimiter       ctermfg=167    guifg=#D75F5F
	hi SpecialComment  ctermfg=167    guifg=#D75F5F
	hi Debug           ctermfg=167    guifg=#D75F5F
	hi Underlined      ctermfg=fg    guifg=fg
	hi Ignore          ctermfg=bg    guifg=bg
	hi Error           ctermfg=235    ctermbg=160    guifg=#262626    guibg=#D70000
	hi Todo            ctermfg=246    ctermbg=bg     cterm=none    guifg=#949494    guibg=bg    gui=none

	" Misc
	hi StatusLine      ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none
	hi StatusLineNC    ctermfg=246    ctermbg=254    cterm=none    guifg=#949494    guibg=#E4E4E4    gui=none
	hi TabLine         ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none
	hi TabLineSel      ctermfg=238    ctermbg=188    cterm=none    guifg=#444444    guibg=#D7D7D7    gui=none
	hi TabLineFill     ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none

	hi Pmenu           ctermfg=fg     ctermbg=254    guifg=fg    guibg=#E4E4E4
	hi PmenuSel        ctermfg=235    ctermbg=246    guifg=#262626    guibg=#949494
	hi PmenuSbar       ctermfg=235    ctermbg=246    guifg=#262626    guibg=#949494
	hi PmenuThumb      ctermbg=101    ctermfg=101    guibg=#87875F    guifg=#87875F
	hi WildMenu        ctermfg=34     ctermbg=254    cterm=none    guifg=#00AF00    guibg=#E4E4E4    gui=none

	hi Visual          ctermfg=bg     ctermbg=24    guifg=bg    guibg=#005F87
	hi VisualNOS       ctermfg=bg     ctermbg=23    guifg=bg    guibg=#005F5F
	hi VertSplit       ctermfg=254    ctermbg=254    cterm=none    guifg=#E4E4E4    guibg=#E4E4E4    gui=none
	hi LineNr          ctermfg=246    ctermbg=254    guifg=#949494    guibg=#E4E4E4

	hi Title           ctermfg=30    guifg=#008787
	hi SpecialKey      ctermfg=41    guifg=#00D75F
	hi NonText         ctermfg=246    guifg=#949494
	hi Conceal         ctermfg=40     ctermbg=bg    guifg=#00D700    guibg=bg
	hi MatchParen      ctermfg=255     ctermbg=166    guifg=#EEEEEE    guibg=#D75F00
	hi Directory       ctermfg=104    guifg=#8787D7

	hi ErrorMsg        ctermfg=197    ctermbg=bg    guifg=#FF005F    guibg=bg
	hi WarningMsg      ctermfg=134    guifg=#AF5FD7
	hi MoreMsg         ctermfg=35    guifg=#00AF5F
	hi ModeMsg         ctermfg=130    guifg=#AF5F00

	hi Search          ctermfg=255     ctermbg=136     cterm=none    guifg=#EEEEEE    guibg=#AF8700    gui=none
	hi IncSearch       ctermfg=235    ctermbg=198     cterm=none    guifg=#262626    guibg=#FF0087    gui=none
	hi Question        ctermfg=38    guifg=#00AFD7

	hi Folded          ctermfg=246    ctermbg=bg    guifg=#949494    guibg=bg
	hi FoldColumn      ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4
	hi SignColumn      ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4
	hi ColorColumn     ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4

	hi CursorColumn    ctermbg=254    cterm=none    guibg=#E4E4E4    gui=none
	hi CursorLine      ctermbg=254    cterm=none    guibg=#E4E4E4    gui=none

	hi vimFold         ctermfg=246    guifg=#949494
	hi vimCommentTitle ctermfg=fg    guifg=fg
	hi helpHyperTextJump ctermfg=31    guifg=#0087AF

	hi htmlTag         ctermfg=26    guifg=#005FD7
	hi htmlEndTag      ctermfg=26    guifg=#005FD7
	hi htmlTagName     ctermfg=169    guifg=#D75FAF
	hi htmlString      ctermfg=58    guifg=#5F5F00

	hi diffFile        ctermfg=246    guifg=#949494
	hi diffLine        ctermfg=246    guifg=#949494
	hi diffAdded       ctermfg=28    guifg=#008700
	hi diffRemoved     ctermfg=169    guifg=#D75FAF
	hi diffChanged     ctermfg=136    guifg=#AF8700

	hi diffAdd         ctermfg=255     ctermbg=70    guifg=#EEEEEE    guibg=#5FAF00
	hi diffDelete      ctermfg=235    ctermbg=fg    guifg=#262626    guibg=fg
	hi diffText        ctermfg=255     ctermbg=162    guifg=#EEEEEE    guibg=#D70087
	hi diffChange      ctermfg=255     ctermbg=88    guifg=#EEEEEE    guibg=#870000
	hi diffOldLine     ctermfg=69    guifg=#5F87FF

	hi SpellBad        ctermfg=197    ctermbg=bg    cterm=underline    guifg=#FF005F    guibg=bg    gui=underline
	hi SpellCap        ctermfg=167    ctermbg=bg    cterm=underline    guifg=#D75F5F    guibg=bg    gui=underline
	hi SpellRare       ctermfg=95    ctermbg=bg    cterm=underline    guifg=#875F5F    guibg=bg    gui=underline
	hi SpellLocal      ctermfg=94    ctermbg=bg    cterm=underline    guifg=#875F00    guibg=bg    gui=underline

	hi mkdCode         ctermfg=246    guifg=#949494
	hi mkdURL          ctermfg=33    guifg=#0087FF
	hi mkdLink         ctermfg=95    guifg=#875F5F
endif
