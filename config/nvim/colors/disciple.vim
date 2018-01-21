" 'disciple.vim' -- Vim color scheme.
" Maintainer:   Romain Lafourcade (romainlafourcade@gmail.com)

hi clear

if exists('syntax_on')
  syntax reset

endif

let colors_name = 'disciple'

if &t_Co >= 256 || has('gui_running')
  hi Normal           ctermbg=253  ctermfg=238  guibg=#dadada guifg=#444444 cterm=NONE           gui=NONE

  set background=light

  hi Comment          ctermbg=NONE ctermfg=248  guibg=NONE    guifg=#a8a8a8 cterm=NONE           gui=NONE
  hi Constant         ctermbg=NONE ctermfg=32   guibg=NONE    guifg=#0087d7 cterm=NONE           gui=NONE
  hi Error            ctermbg=73   ctermfg=238  guibg=#5fafaf guifg=#444444 cterm=NONE           gui=NONE
  hi Identifier       ctermbg=NONE ctermfg=101  guibg=NONE    guifg=#87875f cterm=NONE           gui=NONE
  hi Ignore           ctermbg=NONE ctermfg=253  guibg=NONE    guifg=#dadada cterm=NONE           gui=NONE
  hi PreProc          ctermbg=NONE ctermfg=138  guibg=NONE    guifg=#af8787 cterm=NONE           gui=NONE
  hi Special          ctermbg=NONE ctermfg=139  guibg=NONE    guifg=#af87af cterm=NONE           gui=NONE
  hi Statement        ctermbg=NONE ctermfg=95   guibg=NONE    guifg=#875f5f cterm=NONE           gui=NONE
  hi String           ctermbg=NONE ctermfg=96   guibg=NONE    guifg=#875f87 cterm=NONE           gui=NONE
  hi Todo             ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=reverse        gui=reverse
  hi Type             ctermbg=NONE ctermfg=101  guibg=NONE    guifg=#87875f cterm=NONE           gui=NONE
  hi Underlined       ctermbg=NONE ctermfg=138  guibg=NONE    guifg=#af8787 cterm=underline      gui=underline

  hi LineNr           ctermbg=254  ctermfg=248  guibg=#e4e4e4 guifg=#a8a8a8 cterm=NONE           gui=NONE
  hi NonText          ctermbg=NONE ctermfg=248  guibg=NONE    guifg=#a8a8a8 cterm=NONE           gui=NONE

  hi Pmenu            ctermbg=250  ctermfg=238  guibg=#bcbcbc guifg=#444444 cterm=NONE           gui=NONE
  hi PmenuSbar        ctermbg=248  ctermfg=NONE guibg=#a8a8a8 guifg=NONE    cterm=NONE           gui=NONE
  hi PmenuSel         ctermbg=138  ctermfg=253  guibg=#af8787 guifg=#dadada cterm=NONE           gui=NONE
  hi PmenuThumb       ctermbg=138  ctermfg=138  guibg=#af8787 guifg=#af8787 cterm=NONE           gui=NONE

  hi ErrorMsg         ctermbg=73   ctermfg=238  guibg=#5fafaf guifg=#444444 cterm=NONE           gui=NONE
  hi ModeMsg          ctermbg=96   ctermfg=253  guibg=#875f87 guifg=#dadada cterm=NONE           gui=NONE
  hi MoreMsg          ctermbg=NONE ctermfg=138  guibg=NONE    guifg=#af8787 cterm=NONE           gui=NONE
  hi Question         ctermbg=NONE ctermfg=96   guibg=NONE    guifg=#875f87 cterm=NONE           gui=NONE
  hi WarningMsg       ctermbg=NONE ctermfg=73   guibg=NONE    guifg=#5fafaf cterm=NONE           gui=NONE

  hi TabLine          ctermbg=254  ctermfg=248  guibg=#e4e4e4 guifg=#a8a8a8 cterm=NONE           gui=NONE
  hi TabLineFill      ctermbg=254  ctermfg=254  guibg=#e4e4e4 guifg=#e4e4e4 cterm=NONE           gui=reverse
  hi TabLineSel       ctermbg=252  ctermfg=131  guibg=#d0d0d0 guifg=#af5f5f cterm=NONE           gui=NONE

  hi Cursor           ctermbg=246  ctermfg=NONE guibg=#949494 guifg=NONE    cterm=NONE           gui=NONE
  hi CursorLine       ctermbg=252  ctermfg=NONE guibg=#d0d0d0 guifg=NONE    cterm=NONE           gui=NONE
  hi CursorLineNr     ctermbg=252  ctermfg=131  guibg=#d0d0d0 guifg=#af5f5f cterm=NONE           gui=NONE

  hi helpLeadBlank    ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE           gui=NONE
  hi helpNormal       ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE           gui=NONE

  hi StatusLine       ctermbg=103  ctermfg=238  guibg=#8787af guifg=#dadada cterm=NONE           gui=NONE
  hi StatusLineNC     ctermbg=246  ctermfg=238  guibg=#949494 guifg=#dadada cterm=NONE           gui=italic

  hi Visual           ctermbg=95   ctermfg=253  guibg=#875f5f guifg=#dadada cterm=NONE           gui=NONE
  hi VisualNOS        ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=bold,underline gui=bold,underline

  hi FoldColumn       ctermbg=248  ctermfg=238  guibg=#a8a8a8 guifg=#444444 cterm=NONE           gui=NONE
  hi Folded           ctermbg=248  ctermfg=238  guibg=#a8a8a8 guifg=#444444 cterm=NONE           gui=NONE

  hi VertSplit        ctermbg=246  ctermfg=246  guibg=#949494 guifg=#949494 cterm=NONE           gui=NONE
  hi WildMenu         ctermbg=95   ctermfg=253  guibg=#875f5f guifg=#dadada cterm=bold           gui=bold

  hi Function         ctermbg=NONE ctermfg=17   guibg=NONE    guifg=#00005f cterm=NONE           gui=NONE
  hi SpecialKey       ctermbg=NONE ctermfg=248  guibg=NONE    guifg=#a8a8a8 cterm=NONE           gui=NONE
  hi Title            ctermbg=NONE ctermfg=16   guibg=NONE    guifg=#000000 cterm=bold           gui=NONE

  hi DiffAdd          ctermbg=96   ctermfg=253  guibg=#875f87 guifg=#dadada cterm=NONE           gui=NONE
  hi DiffChange       ctermbg=156  ctermfg=253  guibg=#afaf87 guifg=#dadada cterm=NONE           gui=NONE
  hi DiffDelete       ctermbg=73   ctermfg=253  guibg=#5fafaf guifg=#dadada cterm=NONE           gui=NONE
  hi DiffText         ctermbg=101  ctermfg=253  guibg=#87875f guifg=#dadada cterm=NONE           gui=NONE

  hi IncSearch        ctermbg=73   ctermfg=253  guibg=#5fafaf guifg=#dadada cterm=NONE           gui=NONE
  hi Search           ctermbg=96   ctermfg=253  guibg=#875f87 guifg=#dadada cterm=NONE           gui=NONE

  hi Directory        ctermbg=NONE ctermfg=131  guibg=NONE    guifg=#af5f5f cterm=NONE           gui=NONE
  hi MatchParen       ctermbg=NONE ctermfg=229  guibg=NONE    guifg=#ffffaf cterm=bold           gui=NONE

  hi SpellBad         ctermbg=NONE ctermfg=73   guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#5fafaf
  hi SpellCap         ctermbg=NONE ctermfg=131  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#af5f5f
  hi SpellLocal       ctermbg=NONE ctermfg=139  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#af87af
  hi SpellRare        ctermbg=NONE ctermfg=208  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#ff8700

  hi ColorColumn      ctermbg=73   ctermfg=NONE guibg=#5fafaf guifg=NONE    cterm=NONE           gui=NONE
  hi SignColumn       ctermbg=250  ctermfg=253  guibg=#bcbcbc guifg=#dadada cterm=NONE           gui=NONE

else
  " TODO: change these colors too
  hi Normal           ctermbg=NONE        ctermfg=LightGrey   cterm=NONE

  set background=light

  hi Boolean          ctermbg=NONE        ctermfg=DarkYellow  cterm=NONE
  hi Comment          ctermbg=NONE        ctermfg=DarkBlue    cterm=NONE
  hi Constant         ctermbg=NONE        ctermfg=DarkYellow  cterm=NONE
  hi Function         ctermbg=NONE        ctermfg=Yellow      cterm=NONE
  hi Identifier       ctermbg=NONE        ctermfg=Blue        cterm=NONE
  hi PreProc          ctermbg=NONE        ctermfg=DarkCyan    cterm=NONE
  hi Special          ctermbg=NONE        ctermfg=DarkGreen   cterm=NONE
  hi Statement        ctermbg=NONE        ctermfg=DarkCyan    cterm=NONE
  hi String           ctermbg=NONE        ctermfg=DarkGreen   cterm=NONE
  hi Todo             ctermbg=NONE        ctermfg=NONE        cterm=reverse
  hi Type             ctermbg=NONE        ctermfg=DarkMagenta cterm=NONE

  hi Error            ctermbg=Red         ctermfg=White       cterm=NONE
  hi Ignore           ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi Underlined       ctermbg=NONE        ctermfg=Cyan        cterm=underline

  hi LineNr           ctermbg=NONE        ctermfg=DarkBlue    cterm=NONE
  hi NonText          ctermbg=NONE        ctermfg=DarkBlue    cterm=NONE

  hi Pmenu            ctermbg=NONE        ctermfg=White       cterm=NONE
  hi PmenuSbar        ctermbg=White       ctermfg=NONE        cterm=NONE
  hi PmenuSel         ctermbg=Green       ctermfg=Black       cterm=NONE
  hi PmenuThumb       ctermbg=Green       ctermfg=NONE        cterm=NONE

  hi ErrorMsg         ctermbg=NONE        ctermfg=Red         cterm=NONE
  hi ModeMsg          ctermbg=NONE        ctermfg=Green       cterm=NONE
  hi MoreMsg          ctermbg=NONE        ctermfg=Cyan        cterm=NONE
  hi Question         ctermbg=NONE        ctermfg=Green       cterm=NONE
  hi WarningMsg       ctermbg=NONE        ctermfg=Red         cterm=NONE

  hi TabLine          ctermbg=DarkBlue    ctermfg=Black       cterm=NONE
  hi TabLineFill      ctermbg=DarkBlue    ctermfg=DarkBlue    cterm=NONE
  hi TabLineSel       ctermbg=Cyan        ctermfg=Black       cterm=NONE

  hi Cursor           ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi CursorLine       ctermbg=NONE        ctermfg=NONE        cterm=underline
  hi CursorLineNr     ctermbg=NONE        ctermfg=White       cterm=underline

  hi helpLeadBlank    ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi helpNormal       ctermbg=NONE        ctermfg=NONE        cterm=NONE

  hi StatusLine       ctermbg=Cyan        ctermfg=Black       cterm=NONE
  hi StatusLineNC     ctermbg=Blue        ctermfg=Black       cterm=NONE

  hi Visual           ctermbg=White       ctermfg=Black       cterm=NONE
  hi VisualNOS        ctermbg=NONE        ctermfg=NONE        cterm=bold,underline

  hi FoldColumn       ctermbg=DarkRed     ctermfg=White       cterm=NONE
  hi Folded           ctermbg=DarkRed     ctermfg=White       cterm=NONE

  hi VertSplit        ctermbg=DarkCyan    ctermfg=DarkCyan    cterm=NONE
  hi WildMenu         ctermbg=Yellow      ctermfg=Black       cterm=NONE

  hi Function         ctermbg=NONE        ctermfg=Yellow      cterm=NONE
  hi SpecialKey       ctermbg=NONE        ctermfg=DarkMagenta cterm=NONE
  hi Title            ctermbg=NONE        ctermfg=White       cterm=bold

  hi DiffAdd          ctermbg=DarkGreen   ctermfg=Black       cterm=NONE
  hi DiffChange       ctermbg=Blue        ctermfg=Black       cterm=NONE
  hi DiffDelete       ctermbg=DarkRed     ctermfg=Black       cterm=NONE
  hi DiffText         ctermbg=Cyan        ctermfg=Black       cterm=NONE

  hi IncSearch        ctermbg=DarkRed     ctermfg=Black       cterm=NONE
  hi Search           ctermbg=Green       ctermfg=Black       cterm=NONE

  hi Directory        ctermbg=NONE        ctermfg=Cyan        cterm=NONE

  hi SpellBad         ctermbg=NONE        ctermfg=Red         cterm=undercurl
  hi SpellCap         ctermbg=NONE        ctermfg=Cyan        cterm=undercurl
  hi SpellLocal       ctermbg=NONE        ctermfg=Green       cterm=undercurl
  hi SpellRare        ctermbg=NONE        ctermfg=Magenta     cterm=undercurl

  hi ColorColumn      ctermbg=DarkRed     ctermfg=NONE        cterm=NONE
  hi SignColumn       ctermbg=DarkMagenta ctermfg=Black       cterm=NONE

endif

hi link Boolean            Constant
hi link Character          Constant
hi link Conceal            Normal
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
hi link Number             Constant
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
hi link htmlLink           String
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName

hi link diffBDiffer        WarningMsg
hi link diffCommon         WarningMsg
hi link diffDiffer         WarningMsg
hi link diffIdentical      WarningMsg
hi link diffIsA            WarningMsg
hi link diffNoEOL          WarningMsg
hi link diffOnly           WarningMsg
