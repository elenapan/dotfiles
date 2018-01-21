" Vim color file
" URL:        https://github.com/uu59/vim-herokudoc-theme
" License:    MIT

" this is for gvim only colorscheme
" but 


hi clear
set bg=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "herokudoc-gvim"

hi Normal    guibg=#434e56 guifg=#f8f8f8 gui=NONE

" vim gui
hi Pmenu        guibg=#434e56 guifg=#f8f8f8 gui=NONE
hi PmenuSel     guibg=#d8fa3c guifg=#010101 gui=NONE
hi PmenuSbar    guibg=#434e56 guifg=#f8f8f8 gui=NONE
hi PmenuThumb   guibg=#adc6ee guifg=#010101 gui=NONE
hi LineNr       guibg=#434e56 guifg=#adc6ee gui=NONE
hi CursorLineNr guibg=#292929 guifg=#d8fa3c
hi CursorLine   guibg=#292929
hi StatusLine   guibg=#000000 guifg=#d8fa3c gui=bold
hi StatusLineNC guibg=#404040 guifg=#f8f8f8 gui=NONE
hi VertSplit    guibg=#434e56 guifg=#f8f8f8 gui=NONE
hi SpecialKey   guibg=#434e56 guifg=#a0a0a0
hi Directory    guifg=#d8fa3c
hi Folded       guibg=#434e56 guifg=#adc6ee gui=bold
hi IncSearch    guibg=#010101 guifg=#d8fa3c
hi MatchParen   gui=bold
hi NonText      guifg=#adc6ee
hi Question     guifg=#d8fa3c gui=NONE
hi WarningMsg   guifg=#d8fa3c gui=NONE
hi MoreMsg      guifg=#d8fa3c gui=NONE
hi Search       guibg=#fbde2d guifg=#101010 gui=NONE

" language highlighting

" @ruby block variables, ENV
" @js "var"
hi Identifier guifg=#d8fa3c gui=NONE

" constant
hi Type guifg=#d8fa3c gui=NONE

" @ruby require, load
hi Include guifg=#f8f8f8 gui=bold

hi Comment   guifg=#aeaeae

" @ruby symbol
hi Constant  guifg=#d8fa3c

hi String    guifg=#adc6ee

" @ruby proc lamnda callcc super etc
" @js null self private
hi Keyword   guifg=#fbde2d gui=NONE

" @ruby module class def etc
" @js unknown
"hi Define    guifg=#fbde2d gui=NONE
hi Define guifg=#f8f8f8 gui=bold

" case when end do..end attr_reader
hi Statement guifg=#f8f8f8 gui=bold

" method
hi Function  guifg=#fbde2d gui=NONE

" %W!..!, /regex/
hi Delimiter guifg=#adc6ee gui=NONE

hi Visual guibg=#c8c8ff guifg=#010101 gui=NONE
"hi Visual    guibg=#434e56 guifg=#f8f8f8 gui=NONE

" @ruby shebang
" @diff method name?
" "^M"
hi PreProc guifg=#d8fa3c gui=bold

" @markdown head element
hi Title guifg=#d8fa3c

" ruby specific
hi RubySymbol guifg=#d8fa3c
