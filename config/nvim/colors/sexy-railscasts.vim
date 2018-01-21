" Name:     sexy-railscast vim colorscheme
" Modifier: Oguz Bilgic <fisyonet@gmail.com> 
" Url:      https://github.com/oguzbilgic/sexy-railscasts-theme  
" License:  public domain
"
" A GUI Only port of the RailsCasts TextMate theme [1] to Vim.
" Some parts of this theme were borrowed from the well-documented Lucius theme [2].
" Initial file was written by Josh O'Rourke [3] then improved by Oguz Bilgic
" 
" [1] http://railscasts.com/about 
" [2] http://www.vim.org/scripts/script.php?script_id=2536
" [3] https://github.com/jpo/vim-railscasts-theme

" -----------------------------------------------------------------------------------
" Settings
" -----------------------------------------------------------------------------------
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "sexy-railscasts"

" -----------------------------------------------------------------------------------
" Basics
" -----------------------------------------------------------------------------------
hi Normal                    guifg=#E6E1DC guibg=#222222
hi Cursor                    guibg=#FFFFFF
hi CursorLine                guibg=#333435
hi LineNr                    guifg=#383838 guibg=#141414
hi SignColumn                guibg=#222222
hi NonText                   guifg=#383838 guibg=#252525 
hi Search                    guibg=#5A647E
hi VertSplit                 guifg=#383838 guibg=#383838
hi Visual                    guibg=#5A647E
hi Title                     guifg=#FFFFFF

" -----------------------------------------------------------------------------------
" Folds
" -----------------------------------------------------------------------------------
hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE

" -----------------------------------------------------------------------------------
" Misc
" -----------------------------------------------------------------------------------
hi Directory                 guifg=#A5C261 gui=NONE

" -----------------------------------------------------------------------------------
" Popup Menu
" -----------------------------------------------------------------------------------
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
hi PmenuSel                  guifg=#000000 guibg=#A5C261 gui=NONE
hi PMenuSbar                 guibg=#5A647E gui=NONE
hi PMenuThumb                guibg=#AAAAAA gui=NONE

" -----------------------------------------------------------------------------------
" Syntax
" -----------------------------------------------------------------------------------
hi Comment                   guifg=#BC9458 gui=italic
hi Todo                      guifg=#BC9458 guibg=NONE    gui=italic
hi Constant                  guifg=#6D9CBE
hi Define                    guifg=#CC7833
hi Delimiter                 guifg=#519F50
hi Error                     guifg=#FFFFFF guibg=#990000
hi Function                  guifg=#FFC66D gui=NONE
hi Identifier                guifg=#D0D0FF gui=NONE
hi Include                   guifg=#CC7833 gui=NONE
hi Keyword                   guifg=#CC7833
hi Macro                     guifg=#CC7833 gui=NONE
hi Number                    guifg=#A5C261
hi PreCondit                 guifg=#CC7833 gui=NONE
hi PreProc                   guifg=#CC7833 gui=NONE
hi Statement                 guifg=#CC7833 gui=NONE
hi String                    guifg=#A5C261
hi Type                      guifg=#DA4939 gui=NONE

" -----------------------------------------------------------------------------------
" Ruby
" -----------------------------------------------------------------------------------
hi erubyDelimiter            guifg=#DA4939 

" -----------------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------------
hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

" -----------------------------------------------------------------------------------
" Xml
" -----------------------------------------------------------------------------------
hi xmlTag                    guifg=#E8BF6A
hi xmlTagName                guifg=#E8BF6A
hi xmlEndTag                 guifg=#E8BF6A

" -----------------------------------------------------------------------------------
" Html
" -----------------------------------------------------------------------------------
hi htmlArg                   guifg=#FFC66D guibg=#222222
hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

