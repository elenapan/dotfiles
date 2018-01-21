" Lucid is a 256-color (only) colorscheme based on Lucius

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucid"

highlight Normal         ctermfg=253  ctermbg=234
highlight Comment        ctermfg=245               cterm=NONE
highlight Constant       ctermfg=116               cterm=NONE
highlight String         ctermfg=150               cterm=NONE
highlight Character      ctermfg=150               cterm=NONE
highlight Number         ctermfg=116               cterm=NONE
highlight Boolean        ctermfg=116               cterm=NONE
highlight Float          ctermfg=116               cterm=NONE
highlight Identifier     ctermfg=216               cterm=NONE
highlight Function       ctermfg=216               cterm=NONE
highlight Statement      ctermfg=110               cterm=NONE
highlight Conditional    ctermfg=110               cterm=NONE
highlight Exception      ctermfg=110               cterm=NONE
highlight Repeat         ctermfg=110               cterm=NONE
highlight Label          ctermfg=110               cterm=NONE
highlight Operator       ctermfg=110               cterm=NONE
highlight Keyword        ctermfg=110               cterm=NONE
highlight PreProc        ctermfg=223               cterm=NONE
highlight Include        ctermfg=223               cterm=NONE
highlight Define         ctermfg=223               cterm=NONE
highlight Macro          ctermfg=223               cterm=NONE
highlight PreCondit      ctermfg=223               cterm=NONE
highlight Type           ctermfg=115               cterm=NONE
highlight StorageClass   ctermfg=115               cterm=NONE
highlight Structure      ctermfg=115               cterm=NONE
highlight Typedef        ctermfg=115               cterm=NONE
highlight Special        ctermfg=181               cterm=NONE
highlight SpecialChar    ctermfg=181               cterm=NONE
highlight Tag            ctermfg=181               cterm=NONE
highlight Delimiter      ctermfg=181               cterm=NONE
highlight SpecialComment ctermfg=181               cterm=NONE
highlight Debug          ctermfg=181  ctermbg=NONE cterm=NONE
highlight Underlined     ctermfg=fg                cterm=underline
highlight Ignore         ctermfg=bg
highlight Error          ctermfg=167  ctermbg=52   cterm=NONE
highlight Todo           ctermfg=229  ctermbg=NONE cterm=underline
highlight SpellBad                    ctermbg=9    cterm=undercurl
highlight SpellCap                    ctermbg=12   cterm=undercurl
highlight SpellRare                   ctermbg=13   cterm=undercurl
highlight SpellLocal                  ctermbg=14   cterm=undercurl
highlight Cursor         ctermfg=bg   ctermbg=153
highlight CursorIM       ctermfg=bg   ctermbg=116
highlight CursorColumn   ctermfg=NONE ctermbg=233  cterm=NONE
highlight CursorLine     ctermfg=NONE ctermbg=233  cterm=NONE
highlight ColorColumn                 ctermbg=233
highlight Directory      ctermfg=151               cterm=NONE
highlight ErrorMsg       ctermfg=196  ctermbg=NONE cterm=NONE
highlight VertSplit      ctermfg=242  ctermbg=233  cterm=NONE
highlight SignColumn     ctermfg=145  ctermbg=233  cterm=NONE
highlight LineNr         ctermfg=238  ctermbg=233
highlight CursorLineNr   ctermfg=239  ctermbg=233
highlight MatchParen     ctermfg=77   ctermbg=NONE cterm=NONE
highlight MoreMsg        ctermfg=29                cterm=NONE
highlight ModeMsg        ctermfg=117  ctermbg=NONE cterm=NONE
highlight NonText        ctermfg=239  ctermbg=233  cterm=NONE
highlight Question       ctermfg=fg                cterm=NONE
highlight SpecialKey     ctermfg=239
highlight Title          ctermfg=74                cterm=NONE
highlight WarningMsg     ctermfg=173               cterm=NONE
highlight WildMenu       ctermfg=16   ctermbg=186  cterm=bold
highlight DiffAdd        ctermfg=108  ctermbg=22   cterm=NONE
highlight DiffChange     ctermfg=fg   ctermbg=52   cterm=NONE
highlight DiffDelete     ctermfg=59   ctermbg=58   cterm=NONE
highlight DiffText       ctermfg=203  ctermbg=52   cterm=bold
highlight Folded         ctermfg=117  ctermbg=238  cterm=NONE
highlight FoldColumn     ctermfg=117  ctermbg=238  cterm=NONE
highlight IncSearch      ctermfg=87                cterm=reverse
highlight Search                      ctermbg=81   cterm=NONE
highlight Pmenu          ctermfg=253  ctermbg=233  cterm=NONE
highlight PmenuSel       ctermfg=186  ctermbg=237  cterm=NONE
highlight PMenuSbar                   ctermbg=59   cterm=NONE
highlight PMenuThumb                  ctermbg=102  cterm=NONE
highlight StatusLine     ctermfg=254  ctermbg=237  cterm=bold
highlight StatusLineNC   ctermfg=244  ctermbg=237  cterm=NONE
highlight TabLine        ctermfg=244  ctermbg=236  cterm=NONE
highlight TabLineFill    ctermfg=187  ctermbg=236  cterm=NONE
highlight TabLineSel     ctermfg=254  ctermbg=236  cterm=bold
highlight Visual         ctermfg=NONE ctermbg=24
highlight VisualNOS      ctermfg=fg                cterm=underline
