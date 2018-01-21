" vim: et sw=2 sts=2

" Plugin:      https://github.com/mhinz/vim-janah
" Description: A 256 colors colorscheme for Vim.
" Maintainer:  Marco Hinz <http://github.com/mhinz>

highlight clear

if exists('syntax_on')
  syntax reset
endif

highlight Normal guifg=#dadada ctermfg=253 guibg=#262626 gui=NONE cterm=NONE

" Misc {{{1

highlight Comment guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
highlight Constant guifg=#87dfdf ctermfg=116 ctermbg=NONE gui=NONE cterm=NONE
highlight Directory guifg=#ffaf87 ctermfg=216 ctermbg=NONE gui=NONE cterm=NONE
highlight Identifier guifg=#ffaf87 ctermfg=216 ctermbg=NONE gui=NONE cterm=NONE
highlight MatchParen guifg=#df005f ctermfg=161 ctermbg=NONE gui=bold cterm=bold
highlight NonText guifg=#ff00af ctermfg=199 ctermbg=NONE gui=bold cterm=bold
highlight Number guifg=#87dfdf ctermfg=116 ctermbg=NONE gui=NONE cterm=NONE
highlight PreProc guifg=#ffdfaf ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
highlight Special guifg=#dfafaf ctermfg=181 ctermbg=NONE gui=NONE cterm=NONE
highlight SpecialKey guifg=#3a3a3a ctermfg=237 ctermbg=NONE gui=NONE cterm=NONE
highlight Statement guifg=#afdf87 ctermfg=150 ctermbg=NONE gui=NONE cterm=NONE
highlight String guifg=#87afdf ctermfg=110 ctermbg=NONE gui=NONE cterm=NONE
highlight Title guifg=#afff87 ctermfg=156 ctermbg=NONE gui=NONE cterm=NONE
highlight Todo guifg=#ffdfaf ctermfg=223 ctermbg=NONE gui=NONE cterm=NONE
highlight Type guifg=#87dfaf ctermfg=115 ctermbg=NONE gui=NONE cterm=NONE
highlight VertSplit guifg=#3a3a3a ctermfg=237 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE
highlight WildMenu guifg=#df005f ctermfg=161 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold

" Cursor lines {{{1

highlight CursorColumn ctermfg=NONE guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
highlight CursorLine ctermfg=NONE guibg=#303030 ctermbg=236 gui=NONE cterm=NONE

" Tabline {{{1

highlight TabLine guifg=#808080 ctermfg=244 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
highlight TabLineFill guifg=#dfdfaf ctermfg=187 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
highlight TabLineSel guifg=#e4e4e4 ctermfg=254 guibg=#303030 ctermbg=236 gui=bold cterm=bold

" Statusline {{{1

highlight StatusLine guifg=#e4e4e4 ctermfg=254 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE
highlight StatusLineNC guifg=#808080 ctermfg=244 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

" Number column {{{1

highlight CursorLineNr guifg=#878787 ctermfg=102 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE
highlight LineNr guifg=#878787 ctermfg=102 guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

" Color column {{{1

highlight ColorColumn ctermfg=NONE guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

" Diff & Signs {{{1

highlight SignColumn ctermfg=NONE guibg=#3a3a3a ctermbg=237 gui=NONE cterm=NONE

highlight DiffAdd guifg=#87ff5f ctermfg=119 ctermbg=NONE gui=NONE cterm=NONE
highlight DiffDelete guifg=#df5f5f ctermfg=167 ctermbg=NONE gui=NONE cterm=NONE
highlight DiffChange guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=NONE cterm=NONE
highlight DiffText guifg=#ff5f5f ctermfg=203 guibg=#5f0000 ctermbg=52 gui=bold cterm=bold

" Folds {{{1

highlight FoldColumn ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#3a3a3a gui=NONE
highlight Folded ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#3a3a3a gui=NONE

" Search {{{1

highlight IncSearch guifg=#c0c0c0 ctermfg=7 guibg=#005fff ctermbg=27 gui=NONE cterm=NONE
highlight Search guifg=#c0c0c0 ctermfg=7 guibg=#df005f ctermbg=161 gui=NONE cterm=NONE

" Messages {{{1

highlight Error guifg=#eeeeee ctermfg=255 guibg=#df0000 ctermbg=160 gui=NONE cterm=NONE
highlight ErrorMsg guifg=#eeeeee ctermfg=255 guibg=#df0000 ctermbg=160 gui=NONE cterm=NONE
highlight ModeMsg guifg=#afff87 ctermfg=156 ctermbg=NONE gui=bold cterm=bold
highlight MoreMsg guifg=#c0c0c0 ctermfg=7 guibg=#005fdf ctermbg=26 gui=NONE cterm=NONE
highlight WarningMsg guifg=#c0c0c0 ctermfg=7 guibg=#005fdf ctermbg=26 gui=NONE cterm=NONE

" Visual {{{1

highlight Visual guifg=#c0c0c0 ctermfg=7 guibg=#005f87 ctermbg=24 gui=NONE cterm=NONE
highlight VisualNOS guifg=#c0c0c0 ctermfg=7 guibg=#5f5f87 ctermbg=60 gui=NONE cterm=NONE

" Pmenu {{{1

highlight Pmenu guifg=#e4e4e4 ctermfg=254 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
highlight PmenuSbar ctermfg=NONE guibg=#444444 ctermbg=238 gui=NONE cterm=NONE
highlight PmenuSel guifg=#df5f5f ctermfg=167 guibg=#444444 ctermbg=238 gui=bold cterm=bold
highlight PmenuThumb ctermfg=NONE guibg=#df5f5f ctermbg=167 gui=NONE cterm=NONE

" Spell {{{1
highlight SpellBad guifg=#c0c0c0 ctermfg=7 guibg=#df5f5f ctermbg=167 gui=NONE cterm=NONE
highlight SpellCap guifg=#c0c0c0 ctermfg=7 guibg=#005fdf ctermbg=26 gui=NONE cterm=NONE
highlight SpellLocal guifg=#c0c0c0 ctermfg=7 guibg=#8700af ctermbg=91 gui=NONE cterm=NONE
highlight SpellRare guifg=#c0c0c0 ctermfg=7 guibg=#00875f ctermbg=29 gui=NONE cterm=NONE

" Quickfix {{{1
highlight qfLineNr    ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
highlight qfSeparator ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE

" Plugin: vim-easymotion {{{1
highlight EasyMotionTarget guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=bold cterm=bold
highlight EasyMotionTarget2First guifg=#df005f ctermfg=161 ctermbg=NONE gui=NONE cterm=NONE
highlight EasyMotionTarget2Second guifg=#ffff5f ctermfg=227 ctermbg=NONE gui=NONE cterm=NONE

" Plugin: vim-rfc {{{1
highlight RFCType guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
highlight RFCID guifg=#ffaf5f ctermfg=215 ctermbg=NONE gui=NONE cterm=NONE
highlight RFCTitle guifg=#eeeeee ctermfg=255 ctermbg=NONE gui=NONE cterm=NONE
highlight RFCDelim guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE

" Plugin: vim-signify {{{1
highlight SignifySignAdd guifg=#87ff5f ctermfg=119 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold
highlight SignifySignDelete guifg=#df5f5f ctermfg=167 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold
highlight SignifySignChange guifg=#ffff5f ctermfg=227 guibg=#3a3a3a ctermbg=237 gui=bold cterm=bold

" Plugin: vim-startify {{{1
highlight StartifyBracket guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifyFile guifg=#eeeeee ctermfg=255 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifyFooter guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifyHeader guifg=#87df87 ctermfg=114 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifyNumber guifg=#ffaf5f ctermfg=215 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifyPath guifg=#8a8a8a ctermfg=245 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifySection guifg=#dfafaf ctermfg=181 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifySelect guifg=#5fdfff ctermfg=81 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifySlash guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE
highlight StartifySpecial guifg=#585858 ctermfg=240 ctermbg=NONE gui=NONE cterm=NONE

" Neovim {{{1

if has('nvim')
  highlight EndOfBuffer guifg=#262626 ctermfg=235 ctermbg=NONE gui=NONE cterm=NONE

  highlight TermCursor ctermfg=NONE guibg=#ff00af ctermbg=199 gui=NONE cterm=NONE
  highlight TermCursorNC ctermfg=NONE ctermbg=NONE gui=NONE cterm=NONE
endif

let g:colors_name = 'janah'
