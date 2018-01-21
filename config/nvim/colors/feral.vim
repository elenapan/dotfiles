" Maintainer:  Jed Verity (jed@dataverse.me) for feral, Henrique C. Alves (hcarvalhoalves@gmail.com) for mustang
" Version:      1.0
" Last Change:  May 15, 2015

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "feral"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#2d2d2d ctermbg=236
  hi CursorColumn guibg=#2d2d2d ctermbg=236
  hi MatchParen   guifg=#ffffff guibg=#666666 gui=bold ctermfg=255 ctermbg=242 cterm=bold
  hi Pmenu        guifg=#ffffff guibg=#444444 ctermfg=255 ctermbg=238
  hi PmenuSel     guifg=#000000 guibg=#b1d631 ctermfg=0 ctermbg=148
endif

" General colors
hi Cursor       guifg=#000000 guibg=darkcyan gui=none
hi CursorLineNr guifg=#ff8700 ctermfg=208
hi Normal       guifg=#e2e2e5 guibg=#202020 gui=none ctermfg=253 ctermbg=234
hi NonText      guifg=#808080 guibg=#303030 gui=none ctermfg=244 ctermbg=235
hi LineNr       guifg=#808080 guibg=#202020 gui=none ctermfg=244 ctermbg=234
hi StatusLine   guifg=#d3d3d5 guibg=#444444 gui=italic ctermfg=253 ctermbg=238 cterm=italic
hi StatusLineNC guifg=#939395 guibg=#444444 gui=none ctermfg=246 ctermbg=238
hi VertSplit    guifg=#444444 guibg=#444444 gui=none ctermfg=238 ctermbg=238
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none ctermbg=4 ctermfg=248
hi Title        guifg=#f6f3e8 guibg=NONE  gui=bold ctermfg=208 cterm=bold
hi Visual       guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=27
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none ctermfg=244 ctermbg=235
hi Conceal      guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=4

" Syntax highlighting
hi Operator     guifg=#bcbcbc ctermfg=250
hi Comment      guifg=#808080 gui=italic ctermfg=244
hi Todo         guifg=#8f8f8f gui=none guibg=#ff8700 ctermfg=232 ctermbg=208
hi Boolean      guifg=#8787af gui=none ctermfg=103
hi String       guifg=#87af5f gui=italic ctermfg=107
hi Identifier   guifg=#87af5f gui=none ctermfg=107
hi Function     guifg=#ffffff gui=bold ctermfg=255
hi Type         guifg=#8787af gui=none ctermfg=103
hi Statement    guifg=#8787af gui=none ctermfg=103
hi Keyword      guifg=#ff8700 gui=none ctermfg=208
hi Label        guifg=#8787af ctermbg=NONE ctermfg=103 cterm=NONE
hi Repeat       guifg=#8787af ctermfg=103
hi Constant     guifg=#ff8700 gui=none  ctermfg=208
hi Number       guifg=#ff8700 gui=none ctermfg=208
hi Special      guifg=#ff8700 gui=none ctermfg=208
hi PreProc      guifg=#faf4c6 gui=none ctermfg=230

" My additions
hi Ignore       guifg=red            gui=none

hi Directory    ctermfg=darkcyan
hi ErrorMsg     cterm=bold           ctermfg=7         ctermbg=1
hi IncSearch    guifg=#b0ffff        guibg=#2050d0
hi Search       guifg=gray80         guibg=#445599    gui=none
hi WarningMsg   guifg=salmon         gui=none
hi WildMenu     guifg=gray           guibg=gray17    gui=none
hi DiffAdd      guifg=black          guibg=wheat1
hi DiffChange   guifg=black          guibg=skyblue1
hi DiffText     guifg=black          guibg=hotpink1    gui=none
hi DiffDelete   guibg=gray45         guifg=black    gui=none

" Code-specific colors
hi jsFuncCall             guifg=#87afff ctermfg=111
hi jsObjectKey            guifg=#87afaf ctermfg=109
hi jsFunctionKey          guifg=#afd7ff ctermfg=153
hi jsModules              guifg=#8787af ctermfg=103
hi jsModuleWords          guifg=#8787af ctermfg=103
hi jsDecorator            guifg=#5f5f87 ctermfg=60
hi jsDecoratorFunction    guifg=#5f5f87 ctermfg=60

hi pythonOperator guifg=#7e8aa2 gui=none ctermfg=103

hi javaOperator guifg=#7e8aa2 gui=none ctermfg=103


hi phpIdentifier    ctermfg=255
hi phpFunctions     ctermfg=103
hi phpParent        ctermfg=255
hi phpSpecial       ctermfg=103
hi phpOperator      ctermfg=160
hi phpInclude       ctermfg=103
hi phpMethodsVar    ctermfg=255
hi phpMemberSelector ctermfg=160
hi phpBoolean       ctermfg=103
hi phpClasses       ctermfg=208

" NERDTree colors
 hi NERDTreeFile     guifg=#cdd2db ctermfg=250
 hi NERDTreeDir      guifg=#a5aebe ctermfg=111
 hi NERDTreeUp       guifg=#5b646d ctermfg=62

 hi def link NERDTreeOpenable String
 hi def link NERDTreeCloseable NERDTreeOpenable
 hi def link NERDTreeCWD String
 hi def link NERDTreePart String
