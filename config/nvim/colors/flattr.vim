hi clear
if version > 580
hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="flattr"
hi Boolean        guifg=#8DEFB5 ctermfg=121
hi Character      guifg=#FFF382 ctermfg=228
hi ColorColumn    guibg=#232526 ctermbg=235
hi Conditional    guifg=#FF8A3C ctermfg=209 gui=bold
hi Conceal        guifg=#BA7FFA ctermfg=141 guibg=#1B1D1E ctermbg=234 gui=bold
hi Constant       guifg=#A1DD63 ctermfg=149 gui=bold
hi Comment        guifg=#5C5C5C ctermfg=59
hi CursorLine     guibg=#293739 ctermbg=236
hi CursorLineNr   guifg=#FFB761 ctermfg=215 gui=none
hi CursorColumn   guibg=#293739 ctermbg=236
hi Cursor         guifg=#000000 ctermfg=0   guibg=#F8F8F0 ctermbg=15
hi Debug          guifg=#FF154A ctermfg=197 gui=bold
hi Define         guifg=#FF9E56 ctermfg=215
hi Delimiter      guifg=#8F8F8F ctermfg=245
hi DiffAdd        guifg=#000000 ctermfg=0   guibg=#7EC4EF ctermbg=117
hi DiffChange     guifg=#4EDC44 ctermfg=77  guibg=#4C4745 ctermbg=238
hi DiffDelete     guifg=#FF311D ctermfg=202 guibg=#4F4F4F ctermbg=239
hi DiffText       guibg=#4C4745 ctermbg=238 gui=italic,bold
hi Directory      guifg=#45E22E ctermfg=76  gui=bold
hi Error          guifg=#E6DB74 ctermfg=186 guibg=#555555 ctermbg=240
hi ErrorMsg       guifg=#F94226 ctermfg=202 guibg=#232526 ctermbg=235 gui=bold
hi Exception      guifg=#8ABD25 ctermfg=106 gui=bold
hi Float          guifg=#ECE352 ctermfg=221
hi FoldColumn     guifg=#465457 ctermfg=239 guibg=#000000 ctermbg=234
hi Folded         guifg=#465457 ctermfg=239 guibg=#000000 ctermbg=234
hi Function       guifg=#FFB792 ctermfg=216
hi helpExample    guifg=#65AE8D ctermfg=79
hi iCursor        guifg=#000000 ctermfg=0   guibg=#F8F8F0 ctermbg=15
hi Identifier     guifg=#F9A33D ctermfg=215
hi Ignore         guifg=#656565 ctermfg=241 guibg=bg
hi IncSearch      guifg=#DCCA2D ctermfg=184 guibg=#000000 ctermbg=234
hi Keyword        guifg=#78D3F4 ctermfg=117 gui=bold
hi Label          guifg=#FFD554 ctermfg=221 gui=none
hi LineNr         guifg=#465457 ctermfg=239 guibg=#232526 ctermbg=235
hi Macro          guifg=#CF8BA8 ctermfg=175 gui=italic
hi MatchParen     guifg=#000000 ctermfg=0   guibg=#FFAE4F ctermbg=215 gui=bold
hi ModeMsg        guifg=#3DFBA5 ctermfg=85
hi MoreMsg        guifg=#8EFCCD ctermfg=122
hi NonText        guifg=#465457 ctermfg=239
hi Normal         guifg=#E5E5E5 ctermfg=250 guibg=#1B1D1E ctermbg=0
hi Number         guifg=#8DEFB5 ctermfg=121
hi Operator       guifg=#F92672 ctermfg=197
" complete menu
hi Pmenu          guifg=#66D9EF ctermfg=81  guibg=#000000 ctermbg=234
hi PmenuSel       guibg=#808080 ctermbg=236
hi PmenuSbar      guibg=#080808 ctermbg=0
hi PmenuThumb     guifg=#66D9EF ctermfg=81
hi PreCondit      guifg=#C6F961 ctermfg=191 gui=bold
hi PreProc        guifg=#1DFFB0 ctermfg=49
hi Question       guifg=#8D8FF8 ctermfg=105
hi Repeat         guifg=#FF7499 ctermfg=210 gui=bold
hi Search         guifg=#000000 ctermfg=0   guibg=#F3C82F ctermbg=220
" marks
hi SignColumn     guifg=#C2FF46 ctermfg=155 guibg=#232526 ctermbg=235
hi Special        guifg=#94DBE9 ctermfg=116 guibg=bg      gui=italic
hi SpecialChar    guifg=#85D99A ctermfg=114 gui=bold
hi SpecialComment guifg=#6A6E6F ctermfg=242 gui=bold
hi SpecialKey     guifg=#D466EF ctermfg=171 gui=italic
if has("spell")
    hi SpellBad       guisp=#FF976D gui=undercurl
    hi SpellCap       guisp=#9999FD gui=undercurl
    hi SpellLocal     guisp=#5CD8F5 gui=undercurl
    hi SpellRare      guisp=#E5CBCB gui=undercurl
endif
hi Statement      guifg=#61D1FD ctermfg=81  gui=bold
hi StorageClass   guifg=#ECA756 ctermfg=215 gui=italic
hi String         guifg=#FFF382 ctermfg=228
hi Structure      guifg=#7CC3F6 ctermfg=111
hi Tabline        guifg=#000000 ctermfg=016 guibg=#888888 ctermbg=14
hi Tag            guifg=#F7547C ctermfg=204 gui=italic
hi Title          guifg=#ef5939 ctermfg=203
hi Todo           guifg=#E962FB ctermfg=171 guibg=bg      ctermbg=0   gui=bold
hi Typedef        guifg=#F6D94B ctermfg=221
hi Type           guifg=#BEEF66 ctermfg=155 gui=none
hi Underlined     guifg=#808080 ctermfg=244 gui=underline
hi VertSplit      guifg=#808080 ctermfg=244 guibg=#080808 ctermbg=0   gui=bold
hi VisualNOS      guibg=#403D3D ctermbg=237
hi Visual         guibg=#403D3D ctermbg=237
hi WarningMsg     guifg=#FF914C ctermfg=209 guibg=#333333 ctermbg=236 gui=bold
hi WildMenu       guifg=#ABBAFF ctermfg=147 guibg=#000000 ctermbg=234
" for TagHighlight
hi Class          guifg=#18E28D ctermfg=42
hi DefinedName    guifg=#838ED7 ctermfg=104
hi Enumerator     guifg=#F5A281 ctermfg=216
hi EnumeratorName guifg=#FD6161 ctermfg=203
hi Member         guifg=#66C1FF ctermfg=75
hi Structure      guifg=#90B4B7 ctermfg=109
hi Union          guifg=#F1C40F ctermfg=220
hi GlobalConstant guifg=#16A085 ctermfg=36
hi GlobalVariable guifg=#1ABC9C ctermfg=37
hi LocalVariable  guifg=#2ECC71 ctermfg=41
set background=dark
