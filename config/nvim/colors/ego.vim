" Vim color file
" Maintainer: Robby Colvin
" Last Change: 2010-04-30
" Version: 0.1
" based on 'ego' theme for Xcode:
" http://developers.enormego.com/view/xcode_ego_theme

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ego"

" GUI Colors
hi Cursor               gui=NONE guibg=#8DA1A1 ctermbg=247 guifg=#ffffff ctermfg=15
hi CursorIM             gui=bold guifg=#ffffff ctermfg=15 guibg=#8DA1A1 ctermbg=247
hi CursorLine           gui=NONE guibg=#3D4646 ctermbg=238 " Uncomment for lighter line bgcolor: #202129
hi CursorColumn         gui=NONE guibg=#3D4646 ctermbg=238 " Uncomment for lighter line bgcolor: #202129
hi Directory            gui=NONE guifg=#82c057 ctermfg=107 guibg=bg
hi DiffAdd              gui=NONE guifg=fg      guibg=#9bb2ee ctermbg=111
hi DiffChange           gui=NONE guifg=fg      guibg=#82c057 ctermbg=107
hi DiffDelete           gui=NONE guifg=fg      guibg=#000000 ctermbg=0
hi DiffText             gui=bold guifg=fg      guibg=bg
hi ErrorMsg             gui=NONE guifg=#FFFF99 ctermfg=228 guibg=#FF0000 ctermbg=9
hi VertSplit            gui=NONE guifg=#000000 ctermfg=0 guibg=#686868 ctermbg=242
hi Folded               gui=bold guibg=#305060 ctermbg=239 guifg=#b0d0e0 ctermfg=152
hi FoldColumn           gui=NONE guibg=#305060 ctermbg=239 guifg=#b0d0e0 ctermfg=152
hi IncSearch            gui=reverse guifg=fg guibg=bg
hi LineNr               gui=NONE guibg=#000000 ctermbg=0 guifg=#686868 ctermfg=242
hi ModeMsg              gui=NONE guibg=#82c057 ctermbg=107 guifg=#C8F482 ctermfg=192
hi MoreMsg              gui=bold guifg=#C8F482 ctermfg=192 guibg=bg
hi NonText              gui=NONE guibg=#000000 ctermbg=0 guifg=#95D5F1 ctermfg=117
hi Normal               gui=NONE guibg=#18191F ctermbg=234 guifg=#F6F6F6 ctermfg=15
hi Question             gui=bold guifg=#C8F482 ctermfg=192 guibg=bg
hi Search               gui=NONE guibg=#95D5F1 ctermbg=117 guifg=#18191F ctermfg=234
hi SpecialKey           gui=NONE guibg=#103040 ctermbg=235 guifg=#324262 ctermfg=238
hi StatusLine           gui=bold guibg=#484848 ctermbg=238 guifg=#000000 ctermfg=0
hi StatusLineNC         gui=NONE guibg=#686868 ctermbg=242  guifg=#E0E0E0 ctermfg=7
hi Title                gui=bold guifg=#9d7ff2 ctermfg=141 guibg=bg
hi Visual               gui=reverse guibg=#ffffff ctermbg=15 guifg=#55747c ctermfg=66
hi VisualNOS            gui=bold,underline guifg=fg guibg=bg
hi WarningMsg           gui=bold guifg=#FF0000 ctermfg=9 guibg=bg
hi WildMenu             gui=bold guibg=#F6DA7B ctermbg=222 guifg=#000000 ctermfg=0
hi Pmenu                guibg=#e38081 ctermbg=174 guifg=#ffffff ctermfg=15
hi PmenuSel             guibg=#3D4646 ctermbg=238 guifg=#ffffff ctermfg=15
hi NonText              guibg=bg guifg=#e29aeb ctermfg=176
hi Scrollbar            guibg=bg

hi ColorColumn          guibg=#3D4646 ctermbg=238

" General Syntax Colors

" Light green
hi Comment              gui=NONE guifg=#C8F482 ctermfg=192 guibg=bg

" Green
hi Identifier           gui=NONE guifg=#82c057 ctermfg=107 guibg=bg
hi Type                 gui=NONE guifg=#82c057 ctermfg=107 guibg=bg
hi Function             gui=NONE guifg=#82c057 ctermfg=107 guibg=bg

" Yellow
hi Statement            gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg
hi Conditional          gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg
hi Operator             gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg
hi Label                gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg
hi Define               gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg
hi Macro                gui=NONE guifg=#F6DA7B ctermfg=222 guibg=bg

" Rose
hi String               gui=NONE guifg=#E38081 ctermfg=174 guibg=bg

" Pink
hi Todo                 gui=bold guifg=#e29aeb ctermfg=176 guibg=bg

" Light Purple
hi Character            gui=NONE guifg=#9d7ff2 ctermfg=141 guibg=bg

" Dark Purple
hi Number               gui=NONE guifg=#776CC4 ctermfg=98 guibg=bg
hi Float                gui=NONE guifg=#776CC4 ctermfg=98 guibg=bg
hi Boolean              gui=bold guifg=#776CC4 ctermfg=98 guibg=bg

" Cyan
hi StorageClass         gui=NONE guifg=#95D5F1 ctermfg=117 guibg=bg
hi Structure            gui=NONE guifg=#95D5F1 ctermfg=117 guibg=bg
hi Typedef              gui=NONE guifg=#95D5F1 ctermfg=117 guibg=bg
hi Constant             gui=NONE guifg=#95D5F1 ctermfg=117 guibg=bg

" Blue #9bb2ee

" Dunno color
hi Special              gui=NONE guifg=#55747c ctermfg=66 guibg=bg
hi Delimiter            gui=NONE guifg=#55747c ctermfg=66 guibg=bg
hi SpecialChar          gui=NONE guifg=#55747c ctermfg=66 guibg=bg
hi SpecialComment       gui=NONE guifg=#55747c ctermfg=66 guibg=bg
hi Tag                  gui=NONE guifg=#55747c ctermfg=66 guibg=bg
hi Debug                gui=NONE guifg=#55747c ctermfg=66 guibg=bg

" Brown
hi Repeat               gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg
hi PreProc              gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg
hi Include              gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg
hi PreCondit            gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg
hi Keyword              gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg
hi Exception            gui=NONE guifg=#C67C48 ctermfg=173 guibg=bg

" Other
hi Underlined           gui=underline guifg=#C8F482 ctermfg=192 guibg=bg
hi Ignore               guifg=#55747c ctermfg=66
hi Error                guifg=#FFFF99 ctermfg=228  guibg=#FF0000 ctermbg=9

" Ruby-specific
hi rubySharpBang        gui=bold guifg=#e29aeb ctermfg=176
hi rubyRegexp           guifg=#9BB2EE ctermfg=111
