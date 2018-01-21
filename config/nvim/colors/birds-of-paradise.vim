" Vim color file
" Converted from Textmate theme Birds of Paradise using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "birds-of-paradise"

hi Cursor ctermfg=52 ctermbg=253 cterm=NONE guifg=#372725 guibg=#DBF5F3 gui=NONE
hi Visual ctermfg=NONE ctermbg=125 cterm=NONE guifg=NONE guibg=#a40042 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#493a35 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#493a35 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#493a35 gui=NONE
hi LineNr ctermfg=102 ctermbg=59 cterm=NONE guifg=#8f8475 guibg=#493a35 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#6a5d53 guibg=#6a5d53 gui=NONE
hi MatchParen ctermfg=203 ctermbg=NONE cterm=underline guifg=#ef5d32 guibg=NONE gui=underline
hi StatusLine ctermfg=188 ctermbg=59 cterm=bold guifg=#e6e1c4 guibg=#6a5d53 gui=bold
hi StatusLineNC ctermfg=188 ctermbg=59 cterm=NONE guifg=#e6e1c4 guibg=#6a5d53 gui=NONE
hi Pmenu ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=125 cterm=NONE guifg=NONE guibg=#a40042 gui=NONE
hi IncSearch ctermfg=52 ctermbg=185 cterm=NONE guifg=#372725 guibg=#d9d762 gui=NONE
hi Search    ctermfg=52 ctermbg=185 cterm=NONE guifg=#372725 guibg=#d9d762 gui=NONE
hi Directory ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=52 cterm=NONE guifg=#6b4e32 guibg=#372725 gui=NONE

hi Normal ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1c4 guibg=#372725 gui=NONE
hi Boolean ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Character ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#6b4e32 guibg=NONE gui=italic
hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi Constant ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Define ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi DiffAdd ctermfg=188 ctermbg=64 cterm=bold guifg=#e6e1c4 guibg=#49830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8e0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=188 ctermbg=23 cterm=NONE guifg=#e6e1c4 guibg=#2c3956 gui=NONE
hi DiffText ctermfg=188 ctermbg=24 cterm=bold guifg=#e6e1c4 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Function ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi Identifier ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi Label ctermfg=185 ctermbg=NONE cterm=NONE guifg=#d9d762 guibg=NONE gui=italic
hi NonText ctermfg=58 ctermbg=NONE cterm=NONE guifg=#42302d guibg=#40302d gui=NONE
hi Number ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi Operator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi PreProc ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi Special ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1c4 guibg=NONE gui=NONE
hi SpecialKey ctermfg=58 ctermbg=59 cterm=NONE guifg=#42302d guibg=#493a35 gui=NONE
hi Statement ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi StorageClass ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi String ctermfg=185 ctermbg=NONE cterm=NONE guifg=#d9d762 guibg=NONE gui=italic
hi Tag ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi Title ctermfg=188 ctermbg=NONE cterm=bold guifg=#e6e1c4 guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold guifg=#6b4e32 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi rubyFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi rubyConstant ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1c4 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=185 ctermbg=NONE cterm=NONE guifg=#d9d762 guibg=NONE gui=italic
hi rubyBlockParameter ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi rubyInclude ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi rubyRegexp ctermfg=98 ctermbg=NONE cterm=NONE guifg=#8856d2 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=98 ctermbg=NONE cterm=NONE guifg=#8856d2 guibg=NONE gui=NONE
hi rubyEscape ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi rubyControl ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi rubyOperator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi rubyException ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1c4 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#6b4e32 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi htmlTag ctermfg=109 ctermbg=NONE cterm=NONE guifg=#86b4bb guibg=NONE gui=NONE
hi htmlEndTag ctermfg=109 ctermbg=NONE cterm=NONE guifg=#86b4bb guibg=NONE gui=NONE
hi htmlTagName ctermfg=109 ctermbg=NONE cterm=NONE guifg=#86b4bb guibg=NONE gui=NONE
hi htmlArg ctermfg=109 ctermbg=NONE cterm=NONE guifg=#86b4bb guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ef5d32 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi yamlAlias ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=185 ctermbg=NONE cterm=NONE guifg=#d9d762 guibg=NONE gui=italic
hi cssURL ctermfg=109 ctermbg=NONE cterm=NONE guifg=#7daf9c guibg=NONE gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi cssColor ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi cssClassName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efac32 guibg=NONE gui=NONE
hi cssValueLength ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6c99bb guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
