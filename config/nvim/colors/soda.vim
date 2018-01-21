" Vim color file
" Converted from Textmate theme Espresso Soda using Coloration v0.3.2 (http://github.com/sickill/coloration)
" Edited a bit from @DAddYE's hands
" Repo: https://github.com/DAddYE/soda.vim

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "soda"

hi Cursor ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#615649 gui=NONE
hi Visual ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#c2e8ff gui=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=250 ctermbg=NONE cterm=NONE guifg=#aaaaaa guibg=NONE gui=NONE
hi VertSplit ctermfg=255 ctermbg=254 cterm=NONE guifg=#cecece guibg=#cecece gui=NONE
hi MatchParen ctermfg=161 ctermbg=NONE cterm=bold guifg=#61862f guibg=NONE gui=bold
hi StatusLine ctermfg=0 ctermbg=249 cterm=bold guifg=#000000 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE guifg=#000000 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#c2e8ff gui=NONE
hi IncSearch ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#c4daed gui=NONE
hi Search ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#c4daed gui=NONE
hi Directory ctermfg=61 ctermbg=NONE cterm=NONE guifg=#606aa1 guibg=NONE gui=NONE
hi Folded ctermfg=248 ctermbg=15 cterm=NONE guifg=#adadad guibg=#ffffff gui=NONE

hi Normal ctermfg=240 ctermbg=255 cterm=NONE guifg=#555555 guibg=#ffffff gui=NONE
hi Boolean ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Character ctermfg=130 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi Comment ctermfg=248 ctermbg=NONE cterm=NONE guifg=#adadad guibg=NONE gui=NONE
hi Conditional ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi Constant ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Define ctermfg=161 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Function ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi Identifier ctermfg=235 ctermbg=NONE cterm=NONE guifg=#222222 guibg=NONE gui=italic
hi Keyword ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi Label ctermfg=161 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi NonText ctermfg=254 ctermbg=255 cterm=NONE guifg=#e0e0e0 guibg=#ffffff gui=NONE
hi Number ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi Operator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#626fc9 guibg=NONE gui=NONE
hi PreProc ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e6e6e6 guibg=NONE gui=NONE
hi Statement ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi StorageClass ctermfg=235 ctermbg=NONE cterm=NONE guifg=#222222 guibg=NONE gui=italic
hi String ctermfg=161 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi Tag ctermfg=25 ctermbg=NONE cterm=NONE guifg=#2f6f9f guibg=#f4faff gui=NONE
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=248 ctermbg=NONE cterm=inverse,bold guifg=#adadad guibg=NONE gui=inverse,bold
hi Type ctermfg=53 ctermbg=NONE cterm=NONE guifg=#3a1d72 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyFunction ctermfg=235 ctermbg=NONE cterm=NONE guifg=#222222 guibg=NONE gui=italic
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=64 ctermbg=NONE cterm=bold guifg=#61862f guibg=NONE gui=bold
hi rubyConstant ctermfg=53 ctermbg=NONE cterm=NONE guifg=#3a1d72 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=130 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi rubyBlockParameter ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi rubyInclude ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=71 ctermbg=NONE cterm=NONE guifg=#699d36 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=71 ctermbg=NONE cterm=NONE guifg=#699d36 guibg=NONE gui=NONE
hi rubyEscape ctermfg=NONE ctermbg=229 cterm=bold guifg=NONE guibg=#fcedbd gui=bold
hi rubyControl ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi rubyOperator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#626fc9 guibg=NONE gui=NONE
hi rubyException ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi rubyRailsUserClass ctermfg=53 ctermbg=NONE cterm=NONE guifg=#3a1d72 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi erubyComment ctermfg=248 ctermbg=NONE cterm=NONE guifg=#adadad guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi htmlTag ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi htmlEndTag ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi htmlTagName ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi htmlArg ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=235 ctermbg=NONE cterm=NONE guifg=#222222 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=25 ctermbg=NONE cterm=NONE guifg=#2f6f9f guibg=#f4faff gui=NONE
hi yamlAnchor ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi yamlAlias ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=130 ctermbg=NONE cterm=NONE guifg=#bc670f guibg=#fffdf7 gui=NONE
hi cssURL ctermfg=68 ctermbg=NONE cterm=NONE guifg=#4c8fc7 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=64 ctermbg=NONE cterm=NONE guifg=#61862f guibg=NONE gui=NONE
hi cssColor ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssPseudoClassId ctermfg=74 ctermbg=NONE cterm=NONE guifg=#4f9fcf guibg=NONE gui=NONE
hi cssClassName ctermfg=74 ctermbg=NONE cterm=NONE guifg=#4f9fcf guibg=NONE gui=NONE
hi cssValueLength ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssCommonAttr ctermfg=97 ctermbg=NONE cterm=NONE guifg=#7653c1 guibg=#f3f2ff gui=NONE
hi cssBraces ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
