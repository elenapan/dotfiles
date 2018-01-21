" This color scheme was derived from:
"
" Blueshift color scheme
" by Jan Zwiener, mail: jan@zwiener.org
" Based upon the pyte color scheme by Henning Hasemann
"
" 2010/11/16: Version 1.0
"

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "visualstudio"

" Taglist colors
hi MyTagListFileName    guifg=black   guibg=#c0d0e0
hi MyTagListTagName     guifg=black   guibg=#ffbc29

if version >= 700
  hi CursorLine     guibg=#f6f6f6
  hi CursorColumn   guibg=#f6f6f6
  hi MatchParen     guifg=black     guibg=#bfbfbf

  hi TabLine        guifg=black     guibg=#b0b8c0
  hi TabLineFill    guifg=#9098a0
  hi TabLineSel     guifg=black     guibg=#f0f0f0 gui=bold

  hi Pmenu          guifg=white     guibg=#808080
  hi PmenuSel       guifg=black     guibg=#ffbc29
endif

hi Title        guifg=#202020   gui=none
hi Underlined   guifg=#202020   gui=underline

hi Normal       guifg=black     guibg=#f2f2f2
hi ModeMsg      guifg=black     guibg=#f2f2f2
hi Cursor       guifg=#f0f0f0   guibg=#101010
hi LineNr       guifg=#2b91af   guibg=#f2f2f2 gui=none
hi Visual       guifg=white     guibg=#5381bc
hi WildMenu     guifg=black     guibg=#ffbc29
hi IncSearch    guibg=black     guifg=#ffbc29
hi Question     guifg=black     guibg=#ffbc29

hi StatusLine   guifg=white     guibg=black   gui=bold
hi StatusLineNC guifg=white     guibg=#8090a0 gui=bold
hi VertSplit    guifg=#a0b0c0   guibg=#a0b0c0 gui=none

hi NonText      guifg=#bebebe   guibg=#f2f2f2
hi Comment      guifg=#008000   gui=none
hi Folded       guifg=#708090   guibg=#c0d0e0
hi Folded       guifg=#708090   guibg=#c0d0e0
hi FoldColumn   guifg=#708090   guibg=#c0d0e0

hi Constant     guifg=#6f008a   gui=none
hi Number       guifg=black
hi Float        guifg=black
hi Boolean      guifg=#0070af   gui=none
hi String       guifg=#a31515   gui=none

hi Statement    guifg=blue      gui=none
hi StorageClass guifg=#0070af   gui=none
hi Type         guifg=#0070af   gui=none
hi Typedef      guifg=blue      gui=none
hi Structure    guifg=blue      gui=none
hi Identifier   guifg=#0070af   gui=none
hi Function     guifg=#0070af   gui=none
hi Repeat       guifg=blue      gui=none
hi Conditional  guifg=blue      gui=none
hi Operator     guifg=blue      gui=none

hi PreProc      guifg=#2222ff   gui=none
hi Define       guifg=#2222ff   gui=none
hi Include      guifg=#2222ff   gui=none

hi Error        guifg=red       guibg=#f2f2f2   gui=bold,underline
hi Todo         guifg=blue      guibg=yellow    gui=none
hi Search       guifg=black     guibg=yellow    gui=none
hi SpecialKey	guifg=#1060a0   guibg=#f2f2f2
hi Special      guifg=#666600   guibg=#f2f2f2

" Diff
hi DiffChange   guifg=NONE      guibg=#e0e0e0   gui=bold
hi DiffText     guifg=NONE      guibg=#f0c8c8   gui=bold
hi DiffAdd      guifg=NONE      guibg=#c0e0d0   gui=bold
hi DiffDelete   guifg=NONE      guibg=#f0e0b0   gui=bold

set guifont=Consolas\ for\ Powerline\ FixedD\ 11

