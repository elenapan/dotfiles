" __ MuShROOM.vim ________________
" _ Subdued dark-colorscheme _____

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mushroom"

hi clear Statement
hi clear Type
hi clear DiffDelete
hi clear DiffText
hi clear Error

" Colorscheme
hi TabLine                ctermfg=96  ctermbg=236 cterm=bold gui=BOLD guifg=#875f87 guibg=#303030
hi TabLineFill            ctermfg=16  ctermbg=236 cterm=none gui=NONE guifg=#000000 guibg=#303030
hi TabLineSel             ctermfg=216 ctermbg=239 cterm=bold gui=BOLD guifg=#ffaf87 guibg=#4e4e4e
hi Folded                 ctermfg=130 ctermbg=233 cterm=bold gui=BOLD guifg=#af5f00 guibg=#121212
hi StatusLineNC           ctermfg=16  ctermbg=236 cterm=bold gui=BOLD guifg=#000000 guibg=#303030
hi StatusLine             ctermfg=173 ctermbg=236 cterm=bold gui=BOLD guifg=#d7875f guibg=#303030
hi MatchParen             ctermfg=231 ctermbg=25  cterm=none gui=NONE guifg=#ffffff guibg=#005faf
hi VertSplit              ctermfg=16  ctermbg=236 cterm=none gui=NONE guifg=#000000 guibg=#303030
hi PmenuSel               ctermfg=208 ctermbg=239 cterm=bold gui=BOLD guifg=#ff8700 guibg=#4e4e4e
hi WarningMsg             ctermfg=225 ctermbg=236 cterm=bold gui=BOLD guifg=#ffd7ff guibg=#303030
hi ErrorMsg               ctermfg=167 ctermbg=236 cterm=bold gui=BOLD guifg=#d75f5f guibg=#303030
hi CursorLineNr           ctermfg=216 ctermbg=236 cterm=bold gui=BOLD guifg=#ffaf87 guibg=#303030
hi Wildmenu               ctermbg=239 ctermfg=178 cterm=bold gui=BOLD guifg=#4e4e4e guibg=#d7af00
hi FoldColumn             ctermbg=233 ctermfg=102 cterm=bold gui=BOLD guibg=#121212 guifg=#878787
hi CtrlPMode1             ctermfg=130 ctermbg=236 cterm=bold gui=BOLD guifg=#af5f00 guibg=#303030
hi CtrlPMode2             ctermfg=178 ctermbg=236 cterm=bold gui=BOLD guifg=#d7af00 guibg=#303030
hi CtrlPPrtBase           ctermfg=79  ctermbg=16  cterm=bold gui=BOLD guifg=#5fd7af guibg=#000000
hi GitGutterAddDefault    ctermfg=101 ctermbg=235 guifg=#87875f guibg=#262626
hi GitGutterChangeDefault ctermfg=131 ctermbg=235 guifg=#af5f5f guibg=#262626
hi GitGutterDeleteDefault ctermfg=174 ctermbg=235 guifg=#d78787 guibg=#262626
hi Todo                   ctermbg=234 ctermfg=213 guifg=#ff87ff guibg=#1c1c1c
hi PmenuSbar              ctermfg=208 ctermbg=236 guifg=#ff8700 guibg=#303030
hi Pmenu                  ctermfg=130 ctermbg=233 guifg=#af5f00 guibg=#121212
hi Error                  ctermfg=136 ctermbg=52  guifg=#af8700 guibg=#5f0000
hi Search                 ctermfg=173 ctermbg=237 guifg=#d7875f guibg=#3a3a3a
hi Comment                ctermfg=95  ctermbg=0   guifg=#875f5f guibg=#000000
hi Comment                ctermfg=242 ctermbg=0   guifg=#6c6c6c guibg=#000000
hi LineNr                 ctermfg=95  ctermbg=232 guifg=#875f5f guibg=#080808
hi SpellBad               ctermfg=16  ctermbg=88  guifg=#000000 guibg=#870000
hi SpellCap               ctermfg=16  ctermbg=58  guifg=#000000 guibg=#5f5f00
hi SpellLocal             ctermfg=16  ctermbg=53  guifg=#000000 guibg=#5f005f
hi SpellRare              ctermfg=16  ctermbg=28  guifg=#000000 guibg=#008700
hi Normal                 ctermfg=103 ctermbg=16  guifg=#8787af guibg=#000000
hi Title                  ctermfg=209 cterm=bold  guifg=#ff875f gui=BOLD
hi MoreMsg                ctermfg=216 cterm=bold  guifg=#ffaf87 gui=BOLD
hi Question               ctermfg=215 cterm=bold  guifg=#ffaf5f gui=BOLD
hi NonText                ctermfg=236 cterm=bold  guifg=#303030 gui=BOLD
hi CursorLine             ctermbg=234 cterm=none  guibg=#1c1c1c gui=NONE
hi DiffAdd                ctermfg=101 ctermbg=234 guifg=#87875f guibg=#1c1c1c
hi DiffDelete             ctermfg=174 ctermbg=235 guifg=#d78787 guibg=#262626
hi DiffChange             ctermfg=22  ctermbg=234 guifg=#005f00 guibg=#1c1c1c
hi DiffText               ctermbg=235 guibg=#262626
hi SignColumn             ctermbg=233 guibg=#121212
hi PmenuThumb             ctermbg=58  guibg=#5f5f00
hi SpecialKey             ctermfg=172 guifg=#d78700
hi Statement              ctermfg=136 guifg=#af8700
hi Conditional            ctermfg=178 guifg=#d7af00
hi Special                ctermfg=141 guifg=#af87ff
hi String                 ctermfg=64  guifg=#5f8700
hi Identifier             ctermfg=131 guifg=#af5f5f
hi Constant               ctermfg=130 guifg=#af5f00
hi Visual                 ctermbg=236 guibg=#303030
hi CursorColumn           ctermbg=234 guibg=#1c1c1c
hi ColorColumn            ctermbg=234 guibg=#1c1c1c
hi Type                   ctermfg=67  guifg=#5f87af
hi PreProc                ctermfg=96  guifg=#875f87
hi Directory              ctermfg=95  guifg=#875f5f
hi Underlined             ctermfg=127 guifg=#af00af
hi Special                ctermfg=173 guifg=#d7875f
