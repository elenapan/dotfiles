" Vim color file
" Converted from Textmate theme PlasticCodeWrap using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "flatland"

hi Cursor ctermfg=16 ctermbg=59 cterm=NONE guifg=#26292c guibg=#646769 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#515559 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3b3e40 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3b3e40 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3b3e40 gui=NONE
hi LineNr ctermfg=102 ctermbg=59 cterm=NONE guifg=#8f9192 guibg=#3b3e40 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#636567 guibg=#636567 gui=NONE
hi MatchParen ctermfg=209 ctermbg=NONE cterm=underline guifg=#fa9a4b guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f8 guibg=#636567 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f8 guibg=#636567 gui=NONE
hi Pmenu ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3c3f42 gui=NONE
hi IncSearch ctermfg=16 ctermbg=231 cterm=NONE guifg=#26292c guibg=#f6f6f6 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Folded ctermfg=102 ctermbg=16 cterm=NONE guifg=#798188 guibg=#26292c gui=NONE

hi Normal ctermfg=231 ctermbg=16 cterm=NONE guifg=#f8f8f8 guibg=#26292c gui=NONE
hi Boolean ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Character ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Comment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#798188 guibg=NONE gui=NONE
hi Conditional ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Constant ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Define ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f8 guibg=#46830e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0809 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f8 guibg=#233a5a gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f8 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#aa2915 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#aa2915 gui=NONE
hi Float ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Function ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi Keyword ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Label ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi NonText ctermfg=102 ctermbg=59 cterm=NONE guifg=#7a8288 guibg=#313336 gui=NONE
hi Number ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Operator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi PreProc ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey ctermfg=102 ctermbg=59 cterm=NONE guifg=#7a8288 guibg=#3b3e40 gui=NONE
hi Statement ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi String ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi Tag ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=102 ctermbg=NONE cterm=inverse,bold guifg=#798188 guibg=NONE gui=inverse,bold
hi Type ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyFunction ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi rubyConstant ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInclude ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRegexp ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyEscape ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi rubyControl ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyOperator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyException ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#798188 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi htmlTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlTagName ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlArg ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=221 ctermbg=NONE cterm=NONE guifg=#f1e94b guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi yamlAnchor ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlAlias ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi cssColor ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi cssClassName ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi cssValueLength ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
