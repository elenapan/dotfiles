""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" MOONSHINE """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" VIM COLOR SCHEME
"
" Maintainer:   Karolis Koncevicius (karolis@koncevicius.lt)

" Inspirations: Apprentice, Twilight, Gruvbox


hi clear

if exists('syntax_on')
  syntax reset
endif

set background=dark

let g:colors_name = 'moonshine'

if &t_Co >= 256

  hi Normal           ctermbg=233  ctermfg=179  cterm=NONE
  set background=dark

  hi Special          ctermbg=NONE ctermfg=65   cterm=NONE
  hi Comment          ctermbg=NONE ctermfg=238  cterm=NONE
  hi Statement        ctermbg=NONE ctermfg=172  cterm=NONE
  hi Identifier       ctermbg=NONE ctermfg=65   cterm=NONE
  hi Type             ctermbg=NONE ctermfg=94   cterm=NONE
  hi Function         ctermbg=NONE ctermfg=94   cterm=NONE
  hi PreProc          ctermbg=NONE ctermfg=95   cterm=NONE

  hi Constant         ctermbg=NONE ctermfg=166  cterm=NONE
  hi Boolean          ctermbg=NONE ctermfg=124  cterm=NONE
  hi String           ctermbg=NONE ctermfg=100  cterm=NONE
  hi Title            ctermbg=NONE ctermfg=109  cterm=NONE

  hi LineNr           ctermbg=NONE ctermfg=241  cterm=NONE
  hi CursorLineNr     ctermbg=NONE ctermfg=214  cterm=NONE
  hi MatchParen       ctermbg=NONE ctermfg=111  cterm=NONE
  hi Conceal          ctermbg=NONE ctermfg=245  cterm=NONE
  hi SpecialKey       ctermbg=NONE ctermfg=240  cterm=NONE
  hi ColorColumn      ctermbg=236  ctermfg=NONE cterm=NONE
  hi SignColumn       ctermbg=233  ctermfg=242  cterm=NONE
  hi Folded           ctermbg=NONE ctermfg=88   cterm=NONE
  hi FoldColumn       ctermbg=NONE ctermfg=88   cterm=NONE

  hi Directory        ctermbg=NONE ctermfg=143  cterm=NONE
  hi Underlined       ctermbg=NONE ctermfg=NONE cterm=UNDERLINE

  hi Visual           ctermbg=233  ctermfg=110  cterm=REVERSE
  hi VisualNOS        ctermbg=NONE ctermfg=NONE cterm=UNDERLINE
  hi IncSearch        ctermbg=106  ctermfg=235  cterm=NONE
  hi Search           ctermbg=106  ctermfg=235  cterm=NONE

  hi StatusLine       ctermbg=236  ctermfg=255  cterm=BOLD
  hi StatusLineNC     ctermbg=236  ctermfg=233  cterm=NONE
  hi VertSplit        ctermbg=236  ctermfg=233  cterm=NONE
  hi ModeMsg          ctermbg=NONE ctermfg=111  cterm=NONE
  hi WildMenu         ctermbg=236  ctermfg=111  cterm=UNDERLINE

  hi DiffAdd          ctermbg=64   ctermfg=235  cterm=NONE
  hi DiffDelete       ctermbg=160  ctermfg=235  cterm=NONE
  hi DiffChange       ctermbg=60   ctermfg=235  cterm=NONE
  hi DiffText         ctermbg=214  ctermfg=235  cterm=NONE

  hi Pmenu            ctermbg=238  ctermfg=222  cterm=NONE
  hi PmenuSel         ctermbg=137  ctermfg=238  cterm=NONE
  hi PmenuSbar        ctermbg=137  ctermfg=NONE cterm=NONE
  hi PmenuThumb       ctermbg=136  ctermfg=NONE cterm=NONE

  hi SpellBad         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL
  hi SpellCap         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL
  hi SpellLocal       ctermbg=NONE ctermfg=NONE cterm=UNDERCURL
  hi SpellRare        ctermbg=NONE ctermfg=NONE cterm=UNDERCURL

  hi ErrorMsg         ctermbg=124  ctermfg=235  cterm=NONE
  hi WarningMsg       ctermbg=NONE ctermfg=124  cterm=NONE
  hi MoreMsg          ctermbg=NONE ctermfg=111  cterm=NONE
  hi Question         ctermbg=NONE ctermfg=111  cterm=NONE

  hi TabLine          ctermbg=236  ctermfg=241  cterm=NONE
  hi TabLineSel       ctermbg=236  ctermfg=111  cterm=NONE
  hi TabLineFill      ctermbg=236  ctermfg=230  cterm=NONE

  hi Error            ctermbg=NONE ctermfg=124  cterm=REVERSE
  hi Ignore           ctermbg=NONE ctermfg=NONE cterm=NONE
  hi Todo             ctermbg=230  ctermfg=232  cterm=NONE

  hi NonText          ctermbg=NONE ctermfg=240  cterm=NONE

  hi Cursor           ctermbg=231  ctermfg=NONE cterm=NONE
  hi CursorColumn     ctermbg=236  ctermfg=NONE cterm=NONE
  hi CursorLine       ctermbg=236  ctermfg=NONE cterm=NONE

  hi helpleadblank    ctermbg=NONE ctermfg=NONE cterm=NONE
  hi helpnormal       ctermbg=NONE ctermfg=NONE cterm=NONE

endif

hi link Number             Constant
hi link Character          Constant

hi link Conditional        Statement
hi link Debug              Special
hi link Define             PreProc
hi link Delimiter          Special
hi link Exception          Statement
hi link Float              Number
hi link HelpCommand        Statement
hi link HelpExample        Statement
hi link Include            PreProc
hi link Keyword            Statement
hi link Label              Statement
hi link Macro              PreProc
hi link Operator           Statement
hi link PreCondit          PreProc
hi link Repeat             Statement
hi link SpecialChar        Special
hi link SpecialComment     Special
hi link StorageClass       Type
hi link Structure          Type
hi link Tag                Special
hi link Typedef            Type

hi link htmlEndTag         htmlTagName
hi link htmlLink           Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName
hi link xmlTag             Statement
hi link xmlTagName         Statement
hi link xmlEndTag          Statement

hi link markdownItalic     Preproc

hi link diffBDiffer        WarningMsg
hi link diffCommon         WarningMsg
hi link diffDiffer         WarningMsg
hi link diffIdentical      WarningMsg
hi link diffIsA            WarningMsg
hi link diffNoEOL          WarningMsg
hi link diffOnly           WarningMsg
hi link diffRemoved        WarningMsg
hi link diffAdded          String
