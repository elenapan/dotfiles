" SpaceGray.vim -- Vim colorscheme.
" Maintainer: Akshay Hegde (github.com/ajh17)
" Version: 1.4
" A colorscheme loosely modeled after the spacegray theme for Xcode.
" This colorscheme is 256color and up only.

" Setup {{{1
hi clear

if exists('syntax_on')
  syntax reset
endif

set background=dark
let colors_name = 'spacegray'

" Colorscheme definitions {{{1
hi Normal          ctermbg=233  ctermfg=250    guibg=#111314  guifg=#B3B8C4  cterm=NONE      gui=NONE
hi Conceal         ctermbg=NONE ctermfg=250    guibg=NONE     guifg=#B3B8C4  cterm=NONE      gui=NONE

hi Comment         ctermbg=NONE ctermfg=59     guibg=NONE     guifg=#515F6A  cterm=NONE      gui=NONE
hi NonText         ctermbg=NONE ctermfg=8      guibg=NONE     guifg=#3E4853  cterm=NONE      gui=NONE
hi Title           ctermbg=NONE ctermfg=231    guibg=NONE     guifg=#FFFFFF  cterm=NONE      gui=NONE

hi Constant        ctermbg=NONE ctermfg=130    guibg=NONE     guifg=#C5735E  cterm=NONE      gui=NONE
hi Function        ctermbg=NONE ctermfg=9      guibg=NONE     guifg=#CC6666  cterm=NONE      gui=NONE
hi Identifier      ctermbg=NONE ctermfg=179    guibg=NONE     guifg=#E5C078  cterm=NONE      gui=NONE
hi PreProc         ctermbg=NONE ctermfg=109    guibg=NONE     guifg=#85A7A5  cterm=NONE      gui=NONE
hi Special         ctermbg=NONE ctermfg=103    guibg=NONE     guifg=#7D8FA3  cterm=NONE      gui=NONE
hi SpecialKey      ctermbg=NONE ctermfg=59     guibg=NONE     guifg=#4C5966  cterm=NONE      gui=NONE
hi Statement       ctermbg=NONE ctermfg=13     guibg=NONE     guifg=#A57A9E  cterm=NONE      gui=NONE
hi String          ctermbg=NONE ctermfg=107    guibg=NONE     guifg=#95B47B  cterm=NONE      gui=NONE
hi Type            ctermbg=NONE ctermfg=179    guibg=NONE     guifg=#E5C078  cterm=NONE      gui=NONE

hi Cursor          ctermbg=NONE ctermfg=NONE   guibg=#6C6C6C  guifg=NONE     cterm=NONE      gui=NONE
hi CursorColumn    ctermbg=0    ctermfg=NONE   guibg=#303030  guifg=NONE     cterm=NONE      gui=NONE
hi CursorLine      ctermbg=0    ctermfg=NONE   guibg=#303030  guifg=NONE     cterm=NONE      gui=NONE
hi ColorColumn     ctermbg=235  ctermfg=NONE   guibg=#303537  guifg=NONE     cterm=NONE      gui=NONE
hi SignColumn      ctermbg=233  ctermfg=250    guibg=#141617  guifg=#B3B8C4  cterm=NONE      gui=NONE

hi Todo            ctermbg=NONE ctermfg=NONE   guibg=NONE     guifg=NONE     cterm=reverse   gui=reverse
hi Error           ctermbg=52   ctermfg=12     guibg=NONE     guifg=#AF5F5F  cterm=underline gui=reverse
hi ErrorMsg        ctermbg=NONE ctermfg=9      guibg=NONE     guifg=#C5735E  cterm=NONE      gui=NONE
hi Question        ctermbg=NONE ctermfg=214    guibg=NONE     guifg=#FFAF00  cterm=NONE      gui=NONE
hi ModeMsg         ctermbg=NONE ctermfg=249    guibg=NONE     guifg=#808080  cterm=NONE      gui=NONE
hi MoreMsg         ctermbg=NONE ctermfg=249    guibg=NONE     guifg=#808080  cterm=NONE      gui=NONE
hi WarningMsg      ctermbg=NONE ctermfg=12     guibg=NONE     guifg=#7D8FA3  cterm=NONE      gui=NONE

hi DiffAdd         ctermbg=65   ctermfg=232    guibg=#5F875F  guifg=#080808  cterm=NONE      gui=NONE
hi DiffChange      ctermbg=237  ctermfg=NONE   guibg=#3A3A3A  guifg=NONE     cterm=NONE      gui=NONE
hi DiffDelete      ctermbg=234  ctermfg=9      guibg=NONE     guifg=#CC6666  cterm=NONE      gui=NONE
hi DiffText        ctermbg=60   ctermfg=251    guibg=#5F5F87   guifg=#D0D0D0 cterm=NONE      gui=NONE

hi helpLeadBlank   ctermbg=NONE ctermfg=NONE   guibg=NONE     guifg=NONE     cterm=NONE      gui=NONE
hi helpNormal      ctermbg=NONE ctermfg=NONE   guibg=NONE     guifg=NONE     cterm=NONE      gui=NONE

hi LineNr          ctermbg=NONE ctermfg=8      guibg=#111314  guifg=#3E4853  cterm=NONE      gui=NONE
hi CursorLineNr    ctermbg=NONE ctermfg=243    guibg=NONE     guifg=#808080  cterm=NONE      gui=NONE

hi Pmenu           ctermbg=233  ctermfg=137    guibg=#171717  guifg=#E8A973  cterm=none      gui=NONE
hi PmenuSel        ctermbg=234  ctermfg=196    guibg=#252525  guifg=#FF2A1F  cterm=bold      gui=bold
hi PmenuSbar       ctermbg=233  ctermfg=000    guibg=#333233  guifg=#000000  cterm=NONE      gui=none
hi PmenuThumb      ctermbg=235  ctermfg=137    guibg=NONE     guifg=#171717  cterm=none      gui=none

hi WildMenu        ctermbg=110  ctermfg=235    guibg=#8FAFD7  guifg=#141617  cterm=bold      gui=bold

hi StatusLine      ctermbg=235  ctermfg=249    guibg=#303537  guifg=#B3B8C4  cterm=NONE      gui=NONE
hi StatusLineNC    ctermbg=232  ctermfg=239    guibg=#1C1F20  guifg=#7C7F88  cterm=NONE      gui=italic

hi Underlined      ctermbg=NONE ctermfg=66     guibg=NONE     guifg=#5F8787  cterm=NONE      gui=NONE
hi Ignore          ctermbg=NONE ctermfg=250    guibg=NONE     guifg=#BCBCBC  cterm=NONE      gui=NONE

hi Visual          ctermbg=236  ctermfg=NONE   guibg=#404040  guifg=NONE     cterm=NONE      gui=NONE
hi VisualNOS       ctermbg=8    ctermfg=NONE   guibg=NONE     guifg=NONE     cterm=bold      gui=bold

hi FoldColumn      ctermbg=NONE ctermfg=242    guibg=#1C1C1C  guifg=#6C6C6C  cterm=NONE      gui=NONE
hi Folded          ctermbg=NONE ctermfg=242    guibg=#1C1C1C  guifg=#6C6C6C  cterm=NONE      gui=NONE
hi VertSplit       ctermbg=238  ctermfg=238    guibg=#444444  guifg=#444444  cterm=NONE      gui=NONE

hi IncSearch       ctermbg=9    ctermfg=0      guibg=#AF5F5F  guifg=#141617  cterm=NONE      gui=NONE
hi Search          ctermbg=2    ctermfg=232    guibg=#919652  guifg=#141617  cterm=NONE      gui=NONE

hi TabLine         ctermbg=232  ctermfg=249    guibg=#141617  guifg=#B3B8C4  cterm=NONE      gui=NONE
hi TabLineFill     ctermbg=235  ctermfg=239    guibg=#303537  guifg=#303537  cterm=NONE      gui=NONE
hi TabLineSel      ctermbg=145  ctermfg=0      guibg=#7D8FA3  guifg=#111314  cterm=NONE      gui=NONE

hi Directory       ctermbg=NONE ctermfg=24     guibg=NONE     guifg=#5FAFAF  cterm=NONE      gui=NONE
hi MatchParen      ctermbg=NONE ctermfg=11     guibg=NONE     guifg=#E5C078  cterm=bold      gui=bold

hi SpellBad        ctermbg=52   ctermfg=9      guibg=#5F0000  guifg=#CC6666  cterm=NONE      gui=NONE
hi SpellRare       ctermbg=53   ctermfg=13     guibg=#5F005F  guifg=#B294BB  cterm=NONE      gui=NONE
hi SpellCap        ctermbg=17   ctermfg=12     guibg=#00005F  guifg=#81A2BE  cterm=NONE      gui=NONE
hi SpellLocal      ctermbg=24   ctermfg=14     guibg=#005F5F  guifg=#8ABEB7  cterm=NONE      gui=NONE

" Highlight Links {{{1
" Most of the links are mercilessly stolen from romainl's amazing Apprentice
" theme. (https://github.com/romainl/Apprentice)
hi link Boolean             Constant
hi link Character           Constant
hi link Number              Constant

hi link Float               Number

hi link Define              Preproc
hi link Include             Preproc
hi link Macro               Preproc
hi link PreCondit           PreProc

hi link Conditional         Statement
hi link Exception           Statement
hi link HelpCommand         Statement
hi link HelpExample         Statement
hi link Keyword             Statement
hi link Label               Statement
hi link Operator            Statement
hi link Repeat              Statement

hi link StorageClass        Type
hi link Structure           Type
hi link Typedef             Type

hi link Debug               Special
hi link Delimiter           Special
hi link SpecialChar         Special
hi link SpecialComment      Special
hi link Tag                 Special

" HTML
hi link htmlEndTag          htmlTagName
hi link htmlLink            Function
hi link htmlSpecialTagName  htmlTagName
hi link htmlTag             htmlTagName

" Rails
hi link rubyRailsARAssociationMethod  Statement
hi link rubyRailsARValidationMethod   Statement
hi link rubyRailsARMethod             Statement
hi link rubyRailsARCallbackMethod     Statement
hi link rubyRailsARClassMethod        Statement

" Diff
hi link diffAdded           String
hi link diffRemoved         Function
