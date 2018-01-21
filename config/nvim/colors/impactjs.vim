" Vim color file

" Maintainer: Chris Deluca <bronzehedwick@gmail.com>
"
" Note: Based off the colors used in the code snippets over
" at http://impactjs.com. It uses Molokai as a base.

" **********************************************************************

runtime colors/molokai.vim

let g:colors_name = "impactjs"


hi Normal           guibg=#2C3033     guifg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Comment          guifg=#999999     guibg=NONE        gui=NONE      ctermfg=gray        ctermbg=NONE        cterm=NONE
hi String           guifg=#AAEE22     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           guifg=#FFAA44     guibg=NONE        gui=NONE      ctermfg=brown       ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#FF0077     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Conditional      guifg=#FF0077     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi StatusLine       guifg=#666666     guibg=#666666     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#FF0077     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Function         guifg=#FF0077     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Special          guifg=#55DDFF     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#55DDFF     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=#55DDFF     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
