
" Vim color file
" Converted from Textmate theme Emacs Strict using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "base"

hi Cursor ctermfg=16 ctermbg=231 cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#001bb3 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#151515 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#151515 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#151515 gui=NONE
hi LineNr ctermfg=242 ctermbg=233 cterm=NONE guifg=#6a6a6a guibg=#151515 gui=NONE
hi VertSplit ctermfg=237 ctermbg=237 cterm=NONE guifg=#3d3d3d guibg=#3d3d3d gui=NONE
hi MatchParen ctermfg=NONE ctermbg=60 cterm=NONE guifg=#00ffff guibg=NONE gui=underline
hi StatusLine ctermfg=237 ctermbg=250 cterm=bold guifg=#d3d3d3 guibg=#3d3d3d gui=bold
hi StatusLineNC ctermfg=252 ctermbg=237 cterm=NONE guifg=#d3d3d3 guibg=#3d3d3d gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=19 cterm=NONE guifg=NONE guibg=#001bb3 gui=NONE
hi IncSearch ctermfg=16 ctermbg=211 cterm=NONE guifg=#000000 guibg=#ff9e7b gui=NONE
hi Search ctermfg=NONE ctermbg=66 cterm=NONE guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Folded ctermfg=208 ctermbg=16 cterm=NONE guifg=#ff7d27 guibg=#000000 gui=NONE

hi Normal ctermfg=252 ctermbg=16 cterm=NONE guifg=#d3d3d3 guibg=#000000 gui=NONE
hi Boolean ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Comment ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff7d27 guibg=NONE gui=NONE
hi Conditional ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi DiffAdd ctermfg=252 ctermbg=64 cterm=bold guifg=#d3d3d3 guibg=#3e7b05 gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#830000 guibg=NONE gui=NONE
hi DiffChange ctermfg=252 ctermbg=17 cterm=NONE guifg=#d3d3d3 guibg=#102544 gui=NONE
hi DiffText ctermfg=252 ctermbg=24 cterm=bold guifg=#d3d3d3 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Function ctermfg=117 ctermbg=NONE cterm=NONE guifg=#81cef9 guibg=NONE gui=NONE
hi Identifier ctermfg=120 ctermbg=NONE cterm=NONE guifg=#94fe9a guibg=NONE gui=NONE
hi Keyword ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi Label ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi NonText ctermfg=196 ctermbg=232 cterm=NONE guifg=#ff0000 guibg=#0b0b0b gui=NONE
hi Number ctermfg=122 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Operator ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi PreProc ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi Special ctermfg=252 ctermbg=NONE cterm=NONE guifg=#d3d3d3 guibg=NONE gui=NONE
hi SpecialKey ctermfg=196 ctermbg=233 cterm=NONE guifg=#ff0000 guibg=#151515 gui=NONE
hi Statement ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi StorageClass ctermfg=120 ctermbg=NONE cterm=NONE guifg=#94fe9a guibg=NONE gui=NONE
hi String ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi Tag ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccff4 guibg=NONE gui=NONE
hi Title ctermfg=252 ctermbg=NONE cterm=bold guifg=#d3d3d3 guibg=NONE gui=bold
hi Todo ctermfg=208 ctermbg=NONE cterm=inverse,bold guifg=#ff7d27 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyFunction ctermfg=117 ctermbg=NONE cterm=NONE guifg=#81cef9 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyConstant ctermfg=120 ctermbg=NONE cterm=NONE guifg=#94fe9a guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyInclude ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi rubyEscape ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyControl ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyException ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=87 ctermbg=NONE cterm=NONE guifg=#00ffff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=120 ctermbg=NONE cterm=NONE guifg=#94fe9a guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff7d27 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=120 ctermbg=NONE cterm=NONE guifg=#94fe9a guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9ccff4 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ff9e7b guibg=NONE gui=NONE
hi cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssColor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=186 ctermbg=NONE cterm=NONE guifg=#ebdb8d guibg=NONE gui=NONE
hi cssClassName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#ebdb8d guibg=NONE gui=NONE
hi cssValueLength ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi link jsTypes Number
hi jsContext ctermfg=195
hi SneakPluginTarget ctermfg=88 guifg=232
hi SneakStreakMask guifg=#737373 ctermfg=243 guibg=Black ctermbg=16 gui=NONE cterm=NONE term=NONE
hi SneakStreakTarget ctermfg=88 guifg=232
hi link SneakStreakStatusLine StatusLineNC
hi link netrwMarkFile string
hi signcolumn ctermbg=234
