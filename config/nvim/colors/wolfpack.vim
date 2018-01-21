" Vim color file
"
" Author: Erik Carlson <carlsonerikw@gmail.com>
" https://github.com/carlson-erik
"
" Note: Based on Bliss (http://colorsublime.com/theme/Bliss) 
"       by  Saad Quadri. I modified several parts of the 
"       theme. More changes including (hopefully) a light
"       background version to come in the future.
"

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "wolfpack"

hi Cursor ctermfg=235 ctermbg=145 cterm=NONE guifg=#222222 guibg=#aeafad gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373b41 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#323332 gui=NONE
hi CursorLineNr ctermfg=135 ctermbg=NONE cterm=none guifg=#ae81ff guibg=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#323332 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#323332 gui=NONE
hi LineNr ctermfg=243 ctermbg=236 cterm=NONE guifg=#747574 guibg=#323332 gui=NONE
hi VertSplit ctermfg=239 ctermbg=239 cterm=NONE guifg=#515252 guibg=#515252 gui=NONE
hi MatchParen ctermfg=86 ctermbg=NONE cterm=underline guifg=#64fbc8 guibg=NONE gui=underline
hi StatusLine ctermfg=251 ctermbg=239 cterm=bold guifg=#c5c8c6 guibg=#515252 gui=bold
hi StatusLineNC ctermfg=251 ctermbg=239 cterm=NONE guifg=#c5c8c6 guibg=#515252 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373b41 gui=NONE
hi IncSearch ctermfg=235 ctermbg=116 cterm=NONE guifg=#222222 guibg=#99e1df gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi Folded ctermfg=60 ctermbg=235 cterm=NONE guifg=#4f6d82 guibg=#222222 gui=NONE

hi TabLine ctermfg=252 ctermbg=236 cterm=none guifg=#f8f8f2 guibg=#3e3d32 gui=none
hi TabLineSel ctermfg=252 ctermbg=235 cterm=underline guifg=#f8f8f2 guibg=#293739 gui=underline
hi TabLineFill ctermfg=252 ctermbg=236 cterm=none guifg=#f8f8f2 guibg=#3e3d32 gui=none

hi Normal ctermfg=252 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#222222 gui=NONE
hi Boolean ctermfg=135 ctermbg=NONE cterm=none guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi Comment ctermfg=60 ctermbg=NONE cterm=NONE guifg=#4f6d82 guibg=NONE gui=NONE
hi Conditional ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi DiffAdd ctermfg=251 ctermbg=64 cterm=bold guifg=#c5c8c6 guibg=#45820c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8a0707 guibg=NONE gui=NONE
hi DiffChange ctermfg=251 ctermbg=23 cterm=NONE guifg=#c5c8c6 guibg=#213655 gui=NONE
hi DiffText ctermfg=251 ctermbg=24 cterm=bold guifg=#c5c8c6 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=252 ctermbg=167 cterm=NONE guifg=#ced2cf guibg=#df5f5f gui=NONE
hi WarningMsg ctermfg=252 ctermbg=167 cterm=NONE guifg=#ced2cf guibg=#df5f5f gui=NONE
hi Float ctermfg=135 ctermbg=NONE cterm=none guifg=#ae81ff guibg=NONE gui=NONE
hi Function ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi Identifier ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi Keyword ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi Label ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=235 cterm=NONE guifg=#4b4e55 guibg=#2a2a2a gui=NONE
hi Number ctermfg=135 ctermbg=NONE cterm=none guifg=#ae81ff guibg=NONE gui=NONE
hi Operator ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8dd9d9 guibg=NONE gui=NONE
hi PreProc ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi Special ctermfg=251 ctermbg=NONE cterm=NONE guifg=#c5c8c6 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=236 cterm=NONE guifg=#4b4e55 guibg=#323332 gui=NONE
hi Statement ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi StorageClass ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi String ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi Tag ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi Title ctermfg=251 ctermbg=NONE cterm=bold guifg=#c5c8c6 guibg=NONE gui=bold
hi Todo ctermfg=60 ctermbg=NONE cterm=inverse,bold guifg=#4f6d82 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi rubyFunction ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi rubyConstant ctermfg=219 ctermbg=NONE cterm=NONE guifg=#efabec guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyInclude ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyEscape ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi rubyControl ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyOperator ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8dd9d9 guibg=NONE gui=NONE
hi rubyException ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=219 ctermbg=NONE cterm=NONE guifg=#efabec guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi erubyComment ctermfg=60 ctermbg=NONE cterm=NONE guifg=#4f6d82 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi htmlTag ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi htmlTagName ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi htmlArg ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=86 ctermbg=NONE cterm=NONE guifg=#64fbc8 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi yamlAlias ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=116 ctermbg=NONE cterm=NONE guifg=#99e1df guibg=NONE gui=NONE
hi cssURL ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi cssFunctionName ctermfg=74 ctermbg=NONE cterm=NONE guifg=#3bb1df guibg=NONE gui=NONE
hi cssColor ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8dd9d9 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi cssClassName ctermfg=158 ctermbg=NONE cterm=NONE guifg=#abfdd8 guibg=NONE gui=NONE
hi cssValueLength ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=110 ctermbg=NONE cterm=NONE guifg=#98a6dd guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

