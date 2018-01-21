" Vim color file
" Converted from Textmate theme Twilight using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "benlight"

hi Cursor ctermfg=NONE ctermbg=248 cterm=NONE guifg=NONE guibg=#a7a7a7 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3c4043 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2b2b2b gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2b2b2b gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2b2b2b gui=NONE
hi LineNr ctermfg=245 ctermbg=235 cterm=NONE guifg=#868686 guibg=#2b2b2b gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#565656 guibg=#565656 gui=NONE
hi MatchParen ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#f8f8f8 guibg=#565656 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#f8f8f8 guibg=#565656 gui=NONE
hi Pmenu ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3c4043 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#343a44 gui=NONE
hi Search ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#343a44 gui=NONE
hi Directory ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=233 cterm=NONE guifg=#5f5a60 guibg=#141414 gui=NONE

hi Normal ctermfg=231 ctermbg=233 cterm=NONE guifg=#f8f8f8 guibg=#141414 gui=NONE
hi Boolean ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Character ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#5f5a60 guibg=NONE gui=italic
hi Conditional ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi Constant ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Define ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Function ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f9ee98 guibg=NONE gui=NONE
hi Keyword ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi Label ctermfg=107 ctermbg=NONE cterm=NONE guifg=#8f9d6a guibg=NONE gui=NONE
hi NonText ctermfg=239 ctermbg=234 cterm=NONE guifg=#4f4f4f guibg=#1f1f1f gui=NONE
hi Number ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi Operator ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi PreProc ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey ctermfg=239 ctermbg=235 cterm=NONE guifg=#4f4f4f guibg=#2b2b2b gui=NONE
hi Statement ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f9ee98 guibg=NONE gui=NONE
hi String ctermfg=107 ctermbg=NONE cterm=NONE guifg=#8f9d6a guibg=NONE gui=NONE
hi Tag ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold guifg=#5f5a60 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi rubyFunction ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi rubyConstant ctermfg=103 ctermbg=NONE cterm=NONE guifg=#9b859d guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=107 ctermbg=NONE cterm=NONE guifg=#8f9d6a guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi rubyInclude ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi rubyControl ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi rubyOperator ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi rubyException ctermfg=179 ctermbg=NONE cterm=NONE guifg=#cda869 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=103 ctermbg=NONE cterm=NONE guifg=#9b859d guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#5f5a60 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi htmlTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#ac885b guibg=NONE gui=NONE
hi htmlEndTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#ac885b guibg=NONE gui=NONE
hi htmlTagName ctermfg=137 ctermbg=NONE cterm=NONE guifg=#ac885b guibg=NONE gui=NONE
hi htmlArg ctermfg=137 ctermbg=NONE cterm=NONE guifg=#ac885b guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f9ee98 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi yamlAnchor ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi yamlAlias ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=107 ctermbg=NONE cterm=NONE guifg=#8f9d6a guibg=NONE gui=NONE
hi cssURL ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7587a6 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi cssColor ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi cssClassName ctermfg=95 ctermbg=NONE cterm=NONE guifg=#9b703f guibg=NONE gui=NONE
hi cssValueLength ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
