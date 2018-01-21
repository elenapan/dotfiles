" Vim color file
" Maintainer: Marco Paganini <paganini@paganini.net>
"
" This theme is based on the "desert" theme by Hans Fugal <hans@fugal.net> and
" some subsequent modifications by Henry So, Jr. <henryso@panix.com>.  I've
" used the original theme for years and introduced a sizable number of
" modifications to make it run better in 256-color terminals.
"
" For full documentation, updates, etc:
" http://github.com/marcopaganini/mojave-vim-theme
"
" Note: this requires vim 5.8+ (which should be the norm at this time)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="mojave"

hi SpecialKey     term=bold ctermfg=112 guifg=#9acd32
hi NonText        term=bold ctermfg=147 ctermbg=16 gui=bold guifg=#a0a0ff guibg=#000000
hi Directory      term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse ctermfg=66 ctermbg=222 gui=reverse guifg=#708090 guibg=#f0e68c
hi Search         term=reverse ctermfg=16 ctermbg=172 guifg=#000000 guibg=#cd853f
hi MoreMsg        term=bold ctermfg=29 gui=bold guifg=#2e8b57
hi ModeMsg        term=bold cterm=bold ctermfg=178 gui=bold guifg=#daa520
hi LineNr         term=underline ctermfg=11 guifg=Yellow
hi CursorLineNr   term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question       term=standout ctermfg=48 gui=bold guifg=#00ff7f
hi StatusLine     term=bold,reverse ctermfg=16 ctermbg=145 guifg=#000000 guibg=#c2bfa5
hi StatusLineNC   term=reverse ctermfg=243 ctermbg=145 guifg=#7f7f7f guibg=#c2bfa5
hi VertSplit      term=reverse ctermfg=243 ctermbg=145 guifg=#7f7f7f guibg=#c2bfa5
hi Title          term=bold ctermfg=167 gui=bold guifg=#cd5c5c
hi Visual         term=reverse ctermfg=16 ctermbg=30 guifg=#000000 guibg=#009999
hi VisualNOS      term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg     term=standout ctermfg=209 guifg=#fa8072
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded         term=standout ctermfg=220 ctermbg=238 guifg=#ffd700 guibg=#4d4d4d
hi FoldColumn     term=standout ctermfg=180 ctermbg=238 guifg=#d2b48c guibg=#4d4d4d
hi DiffAdd        term=bold ctermfg=16 ctermbg=40 guifg=#000000 guibg=#33cc33
hi DiffChange     term=bold ctermfg=16 ctermbg=44 guifg=#000000 guibg=#33cccc
hi DiffDelete     term=bold ctermfg=231 ctermbg=160 gui=bold guifg=#ffffff guibg=#cc3333
hi DiffText       term=reverse cterm=bold ctermfg=231 ctermbg=20 gui=bold guifg=#ffffff guibg=#3333cc
hi SignColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi Pmenu          ctermfg=0 ctermbg=13 guibg=Magenta
hi PmenuSel       ctermfg=242 ctermbg=0 guibg=DarkGrey
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=15 guibg=White
hi TabLine        term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=242 guibg=Grey40
hi CursorLine     term=underline cterm=underline guibg=Grey40
hi ColorColumn    term=reverse ctermbg=1 guibg=DarkRed
hi Cursor         ctermfg=66 ctermbg=222 guifg=#708090 guibg=#f0e68c
hi MatchParen     term=reverse ctermbg=6 guibg=DarkCyan
hi Normal         ctermfg=251 ctermbg=0 guifg=#cccccc guibg=#000000
hi Comment        ctermfg=117 guifg=#87ceeb
hi Constant       ctermfg=217 guifg=#ffa0a0
hi Identifier     ctermfg=120 guifg=#98fb98
hi Statement      ctermfg=222 guifg=#f0e68c
hi PreProc        ctermfg=167 guifg=#cd5c5c
hi Type           ctermfg=143 guifg=#bdb76b
hi Special        ctermfg=223 guifg=#ffdead
hi Ignore         ctermfg=240 guifg=#666666
hi Todo           ctermfg=196 ctermbg=226 guifg=#ff4500 guibg=#eeee00
