" ----------------------------------------------------------------------------
" Vim tropikos color scheme
" Maintainer:   Hugo Pires
" Last Change:  2012 May
" License:      Beer Ware
" ----------------------------------------------------------------------------

let g:colors_name = "tropikos" 

highlight clear Normal
set background=dark
set linespace=2

if exists("syntax_on")
  syntax reset
endif

hi Normal               cterm=none ctermbg=none     ctermfg=145     gui=none        guibg=#202020   guifg=#AFAFAF
hi LineNr               cterm=none ctermbg=none     ctermfg=59      gui=none        guibg=#202020   guifg=#5F5F5F
hi StatusLine           cterm=none ctermbg=59       ctermfg=15      gui=none        guibg=#5F5F5F   guifg=#FFFFFF
hi StatusLineNC         cterm=none ctermbg=59       ctermfg=15      gui=none        guibg=#5F5F5F   guifg=#FFFFFF
hi Search               cterm=none ctermbg=59       ctermfg=145     gui=none        guibg=#5F5F5F   guifg=#AFAFAF
hi IncSearch            cterm=none ctermbg=113      ctermfg=59      gui=none        guibg=#87DF5F   guifg=#5F5F5F
hi ColumnMargin         cterm=none ctermbg=0                        gui=none        guibg=#000000
hi Error                cterm=none ctermbg=1        ctermfg=145     gui=none                        guifg=#AFAFAF
hi ErrorMsg             cterm=none ctermbg=1        ctermfg=145     gui=none                        guifg=#AFAFAF
hi Folded               cterm=none ctermbg=59       ctermfg=155     gui=none        guibg=#5F5F5F   guifg=#AFFF5F
hi FoldColumn           cterm=none ctermbg=59       ctermfg=155     gui=none        guibg=#5F5F5F   guifg=#AFFF5F
hi NonText              cterm=bold ctermbg=none     ctermfg=59      gui=bold        guibg=#303030   guifg=#5F5F5F
hi ModeMsg              cterm=bold ctermbg=none     ctermfg=10      gui=none
hi Pmenu                cterm=none ctermbg=59       ctermfg=145     gui=none        guibg=#5F5F5F   guifg=#AFAFAF
hi PmenuSel             cterm=none ctermbg=145      ctermfg=59      gui=none        guibg=#AFAFAF   guifg=#5F5F5F
hi PmenuSbar            cterm=none ctermbg=145      ctermfg=59      gui=none        guibg=#AFAFAF   guifg=#5F5F5F
hi SpellBad             cterm=none ctermbg=1        ctermfg=145     gui=none                        guifg=#AFAFAF
hi SpellCap             cterm=none ctermbg=4        ctermfg=145     gui=none                        guifg=#AFAFAF
hi SpellRare            cterm=none ctermbg=4        ctermfg=145     gui=none                        guifg=#AFAFAF
hi SpellLocal           cterm=none ctermbg=4        ctermfg=145     gui=none                        guifg=#AFAFAF
hi Visual               cterm=none ctermbg=145      ctermfg=59      gui=none        guibg=#AFAFAF   guifg=#5F5F5F
hi Directory            cterm=none ctermbg=none     ctermfg=99      gui=none        guibg=#202020   guifg=#87AFFF
hi SpecialKey           cterm=none ctermbg=none     ctermfg=59      gui=none                        guifg=#5F5F5F
hi DiffAdd              cterm=bold ctermbg=2        ctermfg=15
hi DiffChange           cterm=bold ctermbg=4        ctermfg=15
hi DiffDelete           cterm=bold ctermbg=1        ctermfg=15
hi DiffText             cterm=bold ctermbg=3        ctermfg=8
hi MatchParen           cterm=none ctermbg=59       ctermfg=145     gui=none        guibg=#5F5F5F   guifg=#AFAFAF
hi CursorLine           cterm=none ctermbg=238      ctermfg=none    gui=none        guibg=#424242
hi Title                cterm=none ctermbg=none     ctermfg=139     gui=none                        guifg=#AF87AF

" ----------------------------------------------------------------------------
" Syntax Highlighting
" ----------------------------------------------------------------------------
hi Keyword              cterm=none ctermbg=none ctermfg=167         gui=none        guifg=#DF5F5F
hi Comment              cterm=none ctermbg=none ctermfg=59          gui=none        guifg=#5F5F5F
hi Delimiter            cterm=none ctermbg=none ctermfg=145         gui=none        guifg=#AFAFAF
hi Identifier           cterm=none ctermbg=none ctermfg=139         gui=none        guifg=#AF87AF
hi Structure            cterm=none ctermbg=none ctermfg=139         gui=none        guifg=#AF87AF
hi Ignore               cterm=none ctermbg=none ctermfg=59          gui=none        guifg=bg
hi Constant             cterm=none ctermbg=none ctermfg=139         gui=none        guifg=#AF87AF
hi PreProc              cterm=none ctermbg=none ctermfg=167         gui=none        guifg=#DF5F5F
hi Type                 cterm=none ctermbg=none ctermfg=139         gui=none        guifg=#AF87AF
hi Statement            cterm=none ctermbg=none ctermfg=167         gui=none        guifg=#DF5F5F
hi Special              cterm=none ctermbg=none ctermfg=6           gui=none        guifg=#d7d7d7
hi String               cterm=none ctermbg=none ctermfg=107         gui=italic      guifg=#87AF5F
hi Number               cterm=none ctermbg=none ctermfg=107         gui=none        guifg=#87AF5F
hi Underlined           cterm=underline         ctermfg=139         gui=underline   guifg=#AF87AF
hi Symbol               cterm=none ctermbg=none ctermfg=180         gui=none        guifg=#DFAF87
hi Method               cterm=none ctermbg=none ctermfg=180         gui=none        guifg=#DFAF87
hi Interpolation        cterm=none ctermbg=none ctermfg=180         gui=none        guifg=#DFAF87
hi StorageClass         cterm=none ctermbg=none ctermfg=180         gui=none        guifg=#DFAF87

" Python
hi link pythonFunction              Method

" HTML
hi link htmlTag                     Method
hi link htmlEndTag                  Method
hi link htmlArg                     Method
hi link htmlLink                    Identifier

" Javascript
hi link javaScriptFunction          Keyword
hi link javaScriptNumber            Number
hi link javascriptMember            Method
hi link javascriptBraces            Normal
hi link javascriptNull              Method

" CSS
hi link cssBraces                   Normal

" Erlang
hi link erlangAtom                  Keyword
hi link erlangBitType               Keyword

" Ruby
hi link rubyBeginend                Keyword
hi link rubyClass                   Keyword
hi link rubyModule                  Keyword
hi link rubyKeyword                 Keyword
hi link rubyOperator                Method
hi link rubyIdentifier              Keyword
hi link rubyClassVariable           Symbol
hi link rubyInstanceVariable        Constant
hi link rubyGlobalVariable          Constant
hi link rubyClassVariable           Method
hi link rubyConstant                Constant
hi link rubySymbol                  Symbol
hi link rubyFunction                Constant
hi link rubyControl                 Keyword
hi link rubyConditional             Keyword
hi link rubyInterpolation           Interpolation
hi link rubyInterpolationDelimiter  Interpolation
hi link rubyRailsMethod             Method
