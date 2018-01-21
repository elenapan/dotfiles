" Maintainer:   Heiner Wohner
" Version:      0.1
" Last Change:  26 Jan 2011
" Credits:      based mainly on Vim color scheme "up" 

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "deepsea"

"————————————————+———————————————————————————————————————————————+———+———————————————————————————————————————————————"
"                | GUI                                           |   | TERMINAL                                      "
"      TYPE      +———————————————+———————————————+———————————————+———+———————————————+———————————————+———————————————"
"                | foreground    | background    |               |   | foreground    | background    |               "
"————————————————+———————————————+———————————————+———————————————+———+———————————————+———————————————+———————————————"

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" Guideline
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi Action          guifg=#ffdf00   guibg=NONE      gui=NONE             ctermfg=220    ctermbg=NONE    cterm=NONE
hi Key             guifg=#ffdf00   guibg=NONE      gui=NONE             ctermfg=220    ctermbg=NONE    cterm=NONE

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" Interface                                                                                                          "
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi CursorLine      guifg=NONE      guibg=#303030                                       ctermbg=236     cterm=NONE
hi CursorColumn    guifg=NONE      guibg=#303030                                       ctermbg=236     cterm=NONE
hi MatchParen                      guibg=#0000af   gui=bold                            ctermbg=18      cterm=bold
hi Pmenu           guifg=#ffffff   guibg=#202020                       ctermfg=255     ctermbg=238     cterm=NONE
hi PmenuSel        guifg=#000000   guibg=#b1d631                       ctermfg=0       ctermbg=148     cterm=NONE

hi Normal          guifg=#e2e2e5   guibg=#1c1c1c   gui=none            ctermfg=253     ctermbg=234     cterm=NONE
hi NonText         guifg=#808080   guibg=#262626   gui=none            ctermfg=244     ctermbg=235     cterm=NONE

hi LineNr          guifg=#808080   guibg=#303030   gui=none            ctermfg=244     ctermbg=236     cterm=NONE

hi StatusLine      guifg=#303030   guibg=#dfaf00   gui=none            ctermfg=236     ctermbg=178     cterm=NONE
hi StatusLineNC    guifg=#262626   guibg=#5f875f   gui=none            ctermfg=235     ctermbg=65      cterm=NONE
hi VertSplit       guifg=#828282   guibg=#828282   gui=none            ctermfg=238     ctermbg=238     cterm=NONE
hi Folded          guifg=#a0a8b0   guibg=#384048   gui=none            ctermfg=248     ctermbg=4       cterm=NONE
hi Title           guifg=#f6f3e8   guibg=NONE	     gui=bold            ctermfg=254                     cterm=bold
hi Visual          guifg=#faf4c6   guibg=#3c414c   gui=none            ctermfg=254     ctermbg=4       cterm=NONE
hi SpecialKey      guifg=#ff8080   guibg=#343434   gui=none            ctermfg=244     ctermbg=236     cterm=NONE

hi Cursor          guifg=#000000   guibg=#FF5555   gui=none            ctermfg=NONE     ctermbg=red    cterm=NONE
"hi CursorLine                      guibg=#3c3c3c
hi Search          guifg=#000000   guibg=#dfdf00                       ctermfg=0        ctermbg=184

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" VimL related colors
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi link vimGroup Action

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" Colorscheme related colors
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi link vimHiGroup Action
hi vimHiGuiRgb     guifg=#ABB78D   guibg=NONE      gui=NONE             ctermfg=NONE    ctermbg=NONE    cterm=NONE

" 7.3 features

hi ColorColumn     guifg=NONE      guibg=#323232   gui=NONE             ctermfg=NONE    ctermbg=NONE    cterm=NONE

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" Basic code highlight
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi Comment         guifg=#608A6E  guibg=#112211    gui=italic          ctermfg=244
hi Todo            guifg=#ffaf00                   gui=NONE            ctermfg=214
hi Boolean         guifg=#b1d631                   gui=NONE            ctermfg=148
hi Identifier      guifg=#b1d631                   gui=NONE            ctermfg=148
hi Function        guifg=#B7EF52                   gui=NONE            ctermfg=255
hi Type            guifg=#81C7FF                   gui=NONE            ctermfg=103
hi Statement       guifg=#88DD88                   gui=NONE            ctermfg=103
hi Keyword         guifg=#ff5555                   gui=NONE            ctermfg=208
hi Constant        guifg=#ff9800                   gui=NONE            ctermfg=208
hi Number          guifg=#FEFFD5                   gui=NONE            ctermfg=208
hi Special         guifg=#ff9800                   gui=NONE            ctermfg=208
hi PreProc         guifg=#caffc6                   gui=NONE            ctermfg=230

hi String          guifg=#b5c2a5   guibg=#333333   gui=NONE            ctermfg=148

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" NERDTree highlight
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi Directory       guifg=#4784AA
hi treeCWD         guifg=#BBE7FB

hi treeDirSlash    guifg=#4D4D4D
hi treePart        guifg=#919191

hi treeUp          guifg=#4D4D4D

hi treeHelp        guifg=#4D4D4D

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" Ruby
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi rubyClass       guifg=#5fffff ctermfg=119
hi rubyDefine      guifg=#7AFFAA ctermfg=121
hi link rubyModule rubyClass
hi link rubyFunction Action

hi rubySymbol      guifg=#00afdf ctermfg=38

"hi rubyConditionalExpression guifg=#FF0000

"hi rubyLocalVariableOrMethod guifg=#FF0000

hi link rubyString String
hi rubyStringDelimiter guifg=#B5F964 guibg=#333333

hi rubyInteger guifg=#6195E8

hi rubyBlockParameter        guifg=#7bcfff ctermfg=15
hi rubyConstant              guifg=#ffdf00 ctermfg=220
hi rubyInstanceVariable      guifg=#4596ff ctermfg=189
hi rubyInterpolation         guifg=#d990de ctermfg=107
hi rubyLocalVariableOrMethod guifg=#d990de ctermfg=189
hi rubyPredefinedConstant    guifg=#4596ff ctermfg=167
hi rubyPseudoVariable        guifg=#4596ff ctermfg=221

hi rubyIdentifier            guifg=#58c353     ctermfg=143

hi rubyOperator              guifg=#afaf5f     ctermfg=143
hi rubyInclude               guifg=#808080 ctermfg=244
hi rubyConditional           guifg=#ff8f30
hi rubyOptionalDo            guifg=#ff0000     ctermfg=196

hi rubyConditionalModifier   guifg=#ff6f30
hi rubyControl               guifg=#8fe040
hi rubyClassVariable         guifg=#00ffff ctermfg=51
hi rubyAttribute             guifg=#af0b15
hi rubyEval                  guifg=#48d1f0

hi rubyPseudoVariable        guifg=#b09fb0 
hi rubyPredifinedIdentifier  guifg=#aa4400


"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" HTML
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi htmlTagName     guifg=#7AFFFD

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" HAML
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi link hamlTag       htmlTagName

hi link hamlClass     Action
hi link hamlClassChar hamlClass

hi hamlId         guifg=#9FDC42
hi link hamlIdChar    hamlId


hi hamlRubyChar guifg=#C86161
hi link hamlInterpolationDelimiter hamlRubyChar


"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" CSS
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi link cssTagName    htmlTagName
hi link cssClassName  hamlClass
hi link cssInentifier hamlId
hi cssBoxProp  guifg=#9BA789
hi link cssColorProp cssBoxProp
hi link cssRenderProp cssBoxProp
hi link cssFontProp cssBoxProp
hi link cssTextProp cssBoxProp

hi cssImportant guifg=#E8D1D1

hi cssUIAttr   guifg=#F5F0C7
hi link cssValueLength cssUIAttr
hi link cssColor cssUIAttr
hi link cssColorAttr cssUIAttr
hi link cssCommonAttr cssUIAttr
hi link cssTextAttr cssUIAttr
hi link cssFontAttr cssUIAttr
hi link cssRenderAttr cssUIAttr

"hi cssBoxProp     guibg=#3E2A2A
"hi cssColorProp   guibg=#403E31

"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"
" SASS
"————————————————————————————————————————————————————————————————————————————————————————————————————————————————————"

hi link sassClassChar cssClass
hi link sassProperty  cssDefinition
