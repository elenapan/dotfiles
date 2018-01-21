
set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "aurora"

if version >= 700
  hi CursorLine                 guibg=#f6f6f6                      ctermbg=231
  hi CursorColumn               guibg=#eaeaea                      ctermbg=188
  hi MatchParen   guifg=#ffffff guibg=#cccccc gui=NONE ctermfg=231 ctermbg=188

  " Tabpages
  hi TabLine     guifg=#000000 guibg=#b0b8c0 gui=italic      ctermfg=16  ctermbg=145
  hi TabLineFill guifg=#9098a0                               ctermfg=103
  hi TabLineSel  guifg=#000000 guibg=#f0f0f0 gui=italic,bold ctermfg=16  ctermbg=231

  "P-Menu (auto-completion)
  hi Pmenu guifg=#ffffff guibg=#808080 ctermfg=231 ctermbg=102
  "PmenuSel
  "PmenuSbar
  "PmenuThumb
endif

"
" Html-Titles
hi Title       guifg=#202020 gui=bold      ctermfg=16
hi Underlined  guifg=#202020 gui=underline ctermfg=16

hi Cursor    guifg=#000000 guibg=#b0b4b8 ctermfg=16 ctermbg=145
hi lCursor   guifg=#000000 guibg=#ffffff ctermfg=16 ctermbg=231
hi LineNr    guifg=#333333 guibg=#eeeeee ctermfg=59 ctermbg=231

hi Normal    guifg=#404850 guibg=#fafafa ctermfg=59  ctermbg=231
hi NonText   guifg=#a0a0a0 guibg=#fafafa ctermfg=145 ctermbg=231

hi StatusLine   guifg=#ffffff guibg=#8090a0 gui=bold,italic ctermfg=231 ctermbg=103
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 gui=NONE        ctermfg=59  ctermbg=145
hi VertSplit    guifg=#a0b0c0 guibg=#a0b0c0 gui=NONE        ctermfg=145 ctermbg=145

hi Folded      guifg=#a0a0a0 guibg=#e8e8e8 gui=NONE ctermfg=145 ctermbg=188
hi Comment     guifg=#007020               gui=NONE ctermfg=22

hi Constant    guifg=#a07040 gui=NONE ctermfg=131
hi String      guifg=#4070a0 gui=NONE ctermfg=61
hi Number      guifg=#40a070 gui=NONE ctermfg=71
hi Float       guifg=#70a040 gui=NONE ctermfg=71
hi Statement   guifg=#06287e gui=NONE ctermfg=18

hi Type        guifg=#06287e gui=NONE ctermfg=18
hi Structure   guifg=#06287e gui=NONE ctermfg=18
hi Function    guifg=#06287e gui=NONE ctermfg=18
hi Identifier  guifg=#5b3674 gui=NONE ctermfg=60

hi Repeat      guifg=#06287e gui=NONE ctermfg=18
hi Conditional guifg=#06287e gui=NONE ctermfg=18

hi PreProc     guifg=#1060a0 gui=NONE ctermfg=25
hi Define      guifg=#1060a0 gui=NONE ctermfg=25

hi Error       guifg=#ff0000 guibg=#ffffff gui=bold,underline        ctermfg=196 ctermbg=231
hi Todo        guifg=#a0b0c0 guibg=NONE    gui=italic,bold,underline ctermfg=145 ctermbg=NONE

hi Operator guifg=#06287e ctermfg=18

hi Special        guifg=#5f8787 gui=NONE ctermfg=66
hi SpecialChar    guifg=#5f8787 gui=NONE ctermfg=66
hi SpecialComment guifg=#5f8787 gui=NONE ctermfg=66

" Spaces and Tabs
hi SpecialKey guifg=#d0b0b0 guibg=#fafafa gui=NONE ctermfg=181 ctermbg=231

" Diff
hi DiffChange guifg=NONE guibg=#e0e0e0 gui=italic,bold ctermfg=NONE ctermbg=188
hi DiffText   guifg=NONE guibg=#f0c8c8 gui=italic,bold ctermfg=NONE ctermbg=224
hi DiffAdd    guifg=NONE guibg=#c0e0d0 gui=italic,bold ctermfg=NONE ctermbg=152
hi DiffDelete guifg=NONE guibg=#f0e0b0 gui=italic,bold ctermfg=NONE ctermbg=223

" Indent-guides
hi IndentGuidesOdd  guifg=#c6c6c6 guibg=#eeeeee ctermfg=251 ctermbg=255
hi IndentGuidesEven guifg=#c6c6c6 guibg=#dadada ctermfg=251 ctermbg=253

" Doxygen
hi doxygenBrief                  guifg=#007020 gui=NONE ctermfg=22
hi doxygenSpecialTypeOnelineDesc guifg=#007020 gui=NONE ctermfg=22
hi doxygenParamName              guifg=#878787 gui=NONE ctermfg=102
hi doxygenParamDirection         guifg=#5f8787 gui=NONE ctermfg=66
hi doxygenSpecialOnelineDesc     guifg=#007020 gui=NONE ctermfg=22
