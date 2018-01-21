" Vim color file
" Converted from Textmate theme Brogrammer using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Brogrammer"

hi Cursor ctermfg=234 ctermbg=231 cterm=NONE guifg=#1a1a1a guibg=#ecf0f1 gui=NONE
hi Visual ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi LineNr ctermfg=244 ctermbg=236 cterm=NONE guifg=#838586 guibg=#2f2f2f gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#575858 guibg=#575858 gui=NONE
hi MatchParen ctermfg=167 ctermbg=NONE cterm=underline guifg=#e74c3c guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#ecf0f1 guibg=#575858 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#ecf0f1 guibg=#575858 gui=NONE
hi Pmenu ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
hi Search term=reverse cterm=bold ctermfg=15 ctermbg=196 gui=bold guifg=#f7f3ff guibg=#e14d42
hi IncSearch term=reverse cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#6c71c4
hi Directory ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Folded ctermfg=241 ctermbg=234 cterm=NONE guifg=#606060 guibg=#1a1a1a gui=NONE

hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#ecf0f1 guibg=#1a1a1a gui=NONE
hi Boolean ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Character ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Comment ctermfg=241 ctermbg=NONE cterm=NONE guifg=#606060 guibg=NONE gui=italic
hi Conditional ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi Constant ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Define ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#ecf0f1 guibg=#44800a gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#880505 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#ecf0f1 guibg=#1d3251 gui=NONE
hi DiffText ctermfg=231 ctermbg=40 cterm=bold guifg=#ecf0f1 guibg=#00df00 gui=bold
hi ErrorMsg ctermfg=15 ctermbg=167 cterm=NONE guifg=#ffffff guibg=#e74c3c gui=NONE
hi WarningMsg ctermfg=15 ctermbg=167 cterm=NONE guifg=#ffffff guibg=#e74c3c gui=NONE
hi Float ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Function ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi Identifier ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi Keyword ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi Label ctermfg=220 ctermbg=NONE cterm=NONE guifg=#f1c40f guibg=NONE gui=NONE
hi NonText ctermfg=22 ctermbg=234 cterm=NONE guifg=#30312a guibg=#1a1a1a gui=NONE
hi Number ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi Operator ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi PreProc ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi Special ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi SpecialKey ctermfg=22 ctermbg=236 cterm=NONE guifg=#f1530f guibg=#1a1a1a gui=NONE
hi Statement ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi StorageClass ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi String ctermfg=220 ctermbg=NONE cterm=NONE guifg=#f1c40f guibg=NONE gui=NONE
hi Structure ctermfg=68 ctermbg=NONE cterm=bold guifg=#3498db guibg=NONE gui=bold
hi Tag ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#ecf0f1 guibg=NONE gui=bold
hi Todo ctermfg=241 ctermbg=NONE cterm=inverse,bold guifg=#606060 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi SpellBad term=reverse ctermfg=167 ctermbg=224 gui=undercurl guisp=Red
hi rubyClass ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi rubyFunction ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi rubyConstant ctermfg=68 ctermbg=NONE cterm=bold guifg=#3498db guibg=NONE gui=bold
hi rubyStringDelimiter ctermfg=220 ctermbg=NONE cterm=NONE guifg=#f1c40f guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi rubyInclude ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi rubyGlobalVariable ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi rubyEscape ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi rubyControl ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi rubyClassVariable ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi rubyOperator ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi rubyException ctermfg=167 ctermbg=NONE cterm=bold guifg=#e74c3c guibg=NONE gui=bold
hi rubyPseudoVariable ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=68 ctermbg=NONE cterm=bold guifg=#3498db guibg=NONE gui=bold
hi rubyRailsARAssociationMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=241 ctermbg=NONE cterm=NONE guifg=#606060 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi htmlTag ctermfg=167 ctermbg=NONE cterm=NONE guifg=#e74c3c guibg=NONE gui=NONE
hi htmlEndTag ctermfg=167 ctermbg=NONE cterm=NONE guifg=#e74c3c guibg=NONE gui=NONE
hi htmlTagName ctermfg=167 ctermbg=NONE cterm=NONE guifg=#e74c3c guibg=NONE gui=NONE
hi htmlArg ctermfg=167 ctermbg=NONE cterm=NONE guifg=#e74c3c guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi yamlAlias ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=220 ctermbg=NONE cterm=NONE guifg=#f1c40f guibg=NONE gui=NONE
hi cssURL ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e67e22 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3498db guibg=NONE gui=NONE
hi cssColor ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi cssClassName ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi cssValueLength ctermfg=62 ctermbg=NONE cterm=NONE guifg=#6c71c4 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=41 ctermbg=NONE cterm=NONE guifg=#2ecc71 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" GitGutter Customizations
hi SignColumn ctermfg=244 ctermbg=236 guifg=#838586 guibg=#2f2f2f
hi GitGutterChangeDefault ctermfg=244 ctermbg=236 guifg=#bbbb00 guibg=#2f2f2f
hi GitGutterAddDefault ctermfg=2 ctermbg=236 guifg=#009900 guibg=#2f2f2f
hi GitGutterDeleteDefault ctermfg=1 ctermbg=236 guifg=#ff2222 guibg=#2f2f2f
