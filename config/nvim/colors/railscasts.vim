"
" Name:    railscasts.vim
" URL:     https://github.com/jpo/vim-railscasts-theme
" License: MIT <http://opensource.org/licenses/MIT>
"

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

hi Normal                    guifg=#e4e4e4 guibg=#121212 ctermfg=254 ctermbg=233
hi Search                    guifg=#000000 guibg=#5f5f87 ctermfg=0 ctermbg=60 cterm=NONE
hi Visual                    guibg=#5f5f87 ctermbg=60
hi LineNr                    guifg=#666666 ctermfg=242
hi Cursor                    guifg=#000000 guibg=#FFFFFF ctermfg=0 ctermbg=15
hi CursorLine                guibg=#1c1c1c gui=NONE ctermbg=234 cterm=NONE
hi CursorLineNr              guifg=#a9a8a8 gui=NONE ctermfg=248 cterm=NONE
hi ColorColumn               guibg=#1c1c1c ctermbg=234
hi! link CursorColumn ColorColumn
hi VertSplit                 guifg=#444444 guibg=#121212 gui=NONE ctermfg=238 ctermbg=233 cterm=NONE
hi SignColumn                guifg=#FFFFFF guibg=NONE ctermfg=15 ctermbg=NONE

" StatusLine
" Bold
hi User1                     guifg=#eeeeee guibg=#606060 gui=bold ctermfg=255 ctermbg=241 cterm=bold
" Yellow
hi User2                     guifg=#FFAF00 guibg=#606060 gui=bold ctermfg=214 ctermbg=241 cterm=bold
" Green
hi User3                     guifg=#5fff00 guibg=#606060 gui=bold ctermfg=82 ctermbg=241 cterm=bold
" Red
hi User4                     guifg=#870000 guibg=#606060 gui=bold ctermfg=88 ctermbg=241 cterm=bold
hi User5                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User6                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User7                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User8                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi User9                     guifg=#e4e4e4 guibg=#606060 gui=bold ctermfg=254 ctermbg=241 cterm=bold
hi StatusLine                guifg=#e4e4e4 guibg=#606060 gui=NONE ctermfg=254 ctermbg=241 cterm=NONE
hi StatusLineNC              guifg=#585858 guibg=#303030 gui=NONE ctermfg=240 ctermbg=236 cterm=NONE

" Folds
" -----
" line used for closed folds
hi Folded                    guifg=#ffffff guibg=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
hi! link FoldColumn SignColumn

" Invisible Characters
" ------------------
hi NonText                   guifg=#767676 gui=NONE cterm=NONE ctermfg=243
hi SpecialKey                guifg=#767676 gui=NONE cterm=NONE ctermfg=243

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#87af5f gui=NONE ctermfg=107 cterm=NONE

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#ffffff guibg=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#87af5f gui=NONE ctermfg=0 ctermbg=107 cterm=NONE
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E gui=NONE ctermfg=15 ctermbg=60 cterm=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb                guifg=#ffffff guibg=#a8a8a8 gui=NONE ctermfg=15 ctermbg=248 cterm=NONE

" Code constructs
" ---------------
hi Comment                   guifg=#af875f ctermfg=137
hi Todo                      guifg=#df5f5f guibg=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
" hi Todo                      guifg=#000000 guibg=ffff00 gui=bold ctermfg=16 ctermbg=11 cterm=bold
hi Constant                  guifg=#6D9CBE ctermfg=73
hi Error                     guifg=#FFFFFF guibg=#990000 ctermfg=221 ctermbg=88
hi WarningMsg                guifg=#800000 guibg=NONE ctermfg=1 ctermbg=NONE
hi Identifier                guifg=#af5f5f gui=NONE ctermfg=221 cterm=NONE
hi Keyword                   guifg=#af5f00 gui=NONE ctermfg=130 cterm=NONE
hi Number                    guifg=#87af5f ctermfg=107
hi Statement                 guifg=#af5f00 gui=NONE ctermfg=130 cterm=NONE
hi String                    guifg=#87af5f ctermfg=107
hi Title                     guifg=#FFFFFF ctermfg=15
hi Type                      guifg=#df5f5f gui=NONE ctermfg=167 cterm=NONE
hi PreProc                   guifg=#ff8700 ctermfg=208
hi Special                   guifg=#005f00 ctermfg=22

" Diffs
" -----
hi DiffAdd                   guifg=#e4e4e4 guibg=#519F50 ctermfg=254 ctermbg=22
hi DiffDelete                guifg=#000000 guibg=#660000 gui=bold ctermfg=16 ctermbg=52 cterm=bold
hi DiffChange                guifg=#FFFFFF guibg=#870087 ctermfg=15 ctermbg=90
hi DiffText                  guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=9 cterm=bold

hi diffAdded                 guifg=#008700 ctermfg=28
hi diffRemoved               guifg=#800000 ctermfg=1
hi diffNewFile               guifg=#FFFFFF guibg=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi diffFile                  guifg=#FFFFFF guibg=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold


" Ruby
" ----
hi rubyTodo                  guifg=#df5f5f guibg=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold
hi rubyClass                 guifg=#FFFFFF ctermfg=15
hi rubyConstant              guifg=#df5f5f ctermfg=167
hi rubyInterpolation         guifg=#FFFFFF ctermfg=15
hi rubyBlockParameter        guifg=#dfdfff ctermfg=189
hi rubyPseudoVariable        guifg=#ffdf5f ctermfg=221
hi rubyStringDelimiter       guifg=#87af5f ctermfg=107
hi rubyInstanceVariable      guifg=#dfdfff ctermfg=189
hi rubyPredefinedConstant    guifg=#df5f5f ctermfg=167
hi rubyLocalVariableOrMethod guifg=#dfdfff ctermfg=189

" Python
" ------
hi pythonExceptions          guifg=#ffaf87 ctermfg=216
hi pythonDoctest             guifg=#8787ff ctermfg=105
hi pythonDoctestValue        guifg=#87d7af ctermfg=115

" Mail
" ----
hi mailEmail                 guifg=#87af5f ctermfg=107 gui=italic cterm=underline
hi mailHeaderKey             guifg=#ffdf5f ctermfg=221
hi! link mailSubject mailHeaderKey

" Spell
" ----
hi SpellBad                  guifg=#D70000 guibg=NONE gui=undercurl ctermfg=160 ctermbg=NONE cterm=underline
hi SpellRare                 guifg=#df5f87 guibg=NONE gui=underline ctermfg=168 ctermbg=NONE cterm=underline
hi SpellCap                  guifg=#dfdfff guibg=NONE gui=underline ctermfg=189 ctermbg=NONE cterm=underline
hi SpellLocal                guifg=#00FFFF guibg=NONE gui=undercurl ctermfg=51 ctermbg=NONE cterm=underline
hi MatchParen                guifg=#FFFFFF guibg=#005f5f ctermfg=15 ctermbg=23

" XML
" ---
hi xmlTag                    guifg=#dfaf5f ctermfg=179
hi xmlTagName                guifg=#dfaf5f ctermfg=179
hi xmlEndTag                 guifg=#dfaf5f ctermfg=179

" HTML
" ----
hi! link htmlTag              xmlTag
hi! link htmlTagName          xmlTagName
hi! link htmlEndTag           xmlEndTag

hi checkbox guifg=#3a3a3a guibg=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
hi checkboxDone guifg=#5fff00 guibg=NONE gui=BOLD ctermfg=82 ctermbg=NONE cterm=BOLD
hi checkboxNotDone guifg=#005fdf guibg=NONE gui=BOLD ctermfg=26 ctermbg=NONE cterm=BOLD
