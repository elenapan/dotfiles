"|
"| File    : ~/.vim/colors/kalahari.vim
"| Source  : https://github.com/fabi1cazenave/kalahari.vim
"| Licence : WTFPL
"|
"| This is a modified 'desert' theme with 256/88-color support.
"|

set background=dark
" no guarantees for version 5.8 and below <<<
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

" >>>
" source this file on save to apply all changes immediately <<<
if has("autocmd")
  autocmd! bufwritepost kalahari.vim colorscheme kalahari
endif ">>>
let g:colors_name="kalahari"

" 256-color mode, adapted from 'desert256' <<<
if has("gui_running") || &t_Co == 256
  hi Normal       ctermfg=255  ctermbg=234
  hi NonText      ctermfg=152  ctermbg=235  cterm=bold

  " highlight groups <<<
  hi Cursor       ctermfg=66   ctermbg=222
 "hi CursorColumn              ctermbg=242
  hi CursorLine                ctermbg=236  cterm=none
  hi ColorColumn               ctermbg=235  cterm=none
 "hi DiffAdd                   ctermbg=4
 "hi DiffChange                ctermbg=5
 "hi DiffDelete   ctermfg=12   ctermbg=6
 "hi DiffText                  ctermbg=9    cterm=bold
 "hi Directory    ctermfg=159
 "hi ErrorMsg     ctermfg=15   ctermbg=1
  hi FoldColumn   ctermfg=243  ctermbg=237
  hi Folded       ctermfg=243  ctermbg=237
  hi IncSearch    ctermfg=62   ctermbg=222  cterm=reverse
  hi Search       ctermfg=223  ctermbg=61
  hi LineNr       ctermfg=244
 "hi MatchParen                ctermbg=6
  hi ModeMsg      ctermfg=178               cterm=bold
  hi MoreMsg      ctermfg=29
  hi Pmenu        ctermfg=4    ctermbg=232
  hi PmenuSel     ctermfg=252  ctermbg=235  cterm=bold
  hi PmenuSbar                 ctermbg=234
  hi PmenuThumb                ctermbg=237
  hi Question     ctermfg=48                cterm=bold
  hi SignColumn   ctermfg=118  ctermbg=235
  hi SpecialKey   ctermfg=111
  hi SpellBad     ctermfg=250  ctermbg=235  cterm=underline
 "hi SpellBad                  ctermbg=9
 "hi SpellCap                  ctermbg=12
 "hi SpellLocal                ctermbg=14
 "hi SpellRare                 ctermbg=13
  hi StatusLine   ctermfg=145  ctermbg=16   cterm=reverse,bold
  hi StatusLineNC ctermfg=0    ctermbg=240  cterm=none
  hi TabLine      ctermfg=250  ctermbg=237  cterm=underline
  hi TabLineFill               ctermbg=237  cterm=none
 "hi TabLineSel   ctermfg=167  ctermbg=238
 "hi TabLineSel                             cterm=bold
  hi Title        ctermfg=167               cterm=bold
  hi VertSplit    ctermfg=238  ctermbg=240  cterm=none
  hi Visual       ctermfg=254  ctermbg=68
  hi VisualNOS                              cterm=bold,underline
  hi WarningMsg   ctermfg=209
 "hi WildMenu     ctermfg=0    ctermbg=11
  ">>>

  " syntax highlighting groups <<<
  hi Comment      ctermfg=247
  hi Constant     ctermfg=217
 "hi Error        ctermfg=15   ctermbg=9
  hi Identifier   ctermfg=120
  hi Ignore       ctermfg=240
  hi PreProc      ctermfg=167
  hi Special      ctermfg=223
  hi Statement    ctermfg=39                cterm=bold
  hi StorageClass ctermfg=117
  hi Todo         ctermfg=255  ctermbg=167
  hi Type         ctermfg=178
 "hi Underlined   ctermfg=81                cterm=underline
  ">>>

">>>
" 88-color mode, adapted from 'desert256' <<<
elseif &t_Co == 88
  hi Normal       ctermfg=87   ctermbg=16
  hi NonText      ctermfg=59   ctermbg=80   cterm=bold

  " highlight groups <<<
  hi Cursor       ctermfg=12   ctermbg=77
  hi CursorLine                ctermbg=81   cterm=none
  hi ColorColumn               ctermbg=81   cterm=none
  hi FoldColumn   ctermfg=57   ctermbg=80
 "hi Folded       ctermfg=72   ctermbg=80
  hi Folded       ctermfg=53   ctermbg=80
  hi IncSearch    ctermfg=37   ctermbg=77   cterm=reverse
 "hi LineNr       ctermfg=11
  hi LineNr       ctermfg=83
  hi ModeMsg      ctermfg=52                cterm=bold
  hi MoreMsg      ctermfg=21
  hi Question     ctermfg=29
  hi Search       ctermfg=74   ctermbg=52
  hi SpecialKey   ctermfg=40
  hi StatusLine   ctermfg=58   ctermbg=16   cterm=reverse,bold
  hi StatusLineNC ctermfg=0    ctermbg=82   cterm=none
  hi TabLine      ctermfg=15   ctermbg=82   cterm=underline
  hi TabLineFill               ctermbg=84   cterm=none
  hi Title        ctermfg=53
  hi VertSplit    ctermfg=80   ctermbg=82   cterm=none
  hi Visual       ctermfg=36   ctermbg=77   cterm=reverse
  hi WarningMsg   ctermfg=69
  ">>>

  " syntax highlighting groups <<<
  hi Comment      ctermfg=43
  hi Constant     ctermfg=69
  hi Identifier   ctermfg=45
  hi Ignore       ctermfg=81
 "hi Preproc      ctermfg=53
  hi Preproc      ctermfg=65
 "hi Preproc      ctermfg=64
 "hi Preproc      ctermfg=1
  hi Special      ctermfg=74
 "hi Statement    ctermfg=77                cterm=bold
  hi Statement    ctermfg=52                cterm=bold
 "hi StorageClass ctermfg=117
  hi Todo         ctermfg=68   ctermbg=76
  hi Type         ctermfg=57                cterm=bold
  ">>>

">>>
" default color terminal definitions <<<
else
  hi Comment      ctermfg=darkcyan
  hi Constant     ctermfg=brown
  hi DiffAdd                         ctermbg=4
  hi DiffChange                      ctermbg=5
  hi DiffDelete   ctermfg=4          ctermbg=6      cterm=bold
  hi DiffText                        ctermbg=1      cterm=bold
  hi Directory    ctermfg=darkcyan
  hi Error        ctermfg=7          ctermbg=1      cterm=bold
  hi Errormsg     ctermfg=7          ctermbg=1      cterm=bold
  hi FoldColumn   ctermfg=darkgrey   ctermbg=none
  hi Folded       ctermfg=darkgrey   ctermbg=none
  hi Identifier   ctermfg=6
  hi Ignore       ctermfg=7                         cterm=bold
  hi Ignore       ctermfg=darkgrey
  hi IncSearch    ctermfg=yellow     ctermbg=green  cterm=none
 "hi LineNr       ctermfg=3
  hi LineNr       ctermfg=grey
  hi ModeMsg      ctermfg=brown                     cterm=none
  hi MoreMsg      ctermfg=darkgreen
  hi NonText      ctermfg=darkblue                  cterm=bold
  hi Preproc      ctermfg=5
  hi Question     ctermfg=green
  hi Search       ctermfg=grey       ctermbg=blue   cterm=none
  hi Special      ctermfg=5
  hi SpecialKey   ctermfg=darkgreen
  hi Statement    ctermfg=3
  hi StatusLine                                     cterm=bold,reverse
  hi StatusLineNC                                   cterm=reverse
  hi StorageClass ctermfg=darkcyan
  hi Title        ctermfg=5
  hi Type         ctermfg=2
  hi Underlined   ctermfg=5                         cterm=underline
  hi VertSplit                                      cterm=reverse
  hi Visual                                         cterm=reverse
  hi VisualNOS                                      cterm=bold,underline
  hi WarningMsg   ctermfg=1
  hi WildMenu     ctermfg=0          ctermbg=3
endif
">>>

" vim: set fdm=marker fmr=<<<,>>> fdl=0:
