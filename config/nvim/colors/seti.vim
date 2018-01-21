" Vim color file
" Converted from Textmate theme Seti using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "seti"

hi Cursor                       ctermfg=16    ctermbg=222   cterm=NONE          guifg=#151718   guibg=#ffe792   gui=NONE
hi Visual                       ctermfg=NONE  ctermbg=74    cterm=NONE          guifg=NONE      guibg=#4fa5c7   gui=NONE
hi CursorLine                   ctermfg=NONE  ctermbg=235   cterm=NONE          guifg=NONE      guibg=#282a2b   gui=NONE
hi CursorColumn                 ctermfg=NONE  ctermbg=235   cterm=NONE          guifg=NONE      guibg=#282a2b   gui=NONE
hi ColorColumn                  ctermfg=NONE  ctermbg=235   cterm=NONE          guifg=NONE      guibg=#282a2b   gui=NONE
hi LineNr                       ctermfg=243   ctermbg=235   cterm=NONE          guifg=#757777   guibg=#282a2b   gui=NONE
hi VertSplit                    ctermfg=239   ctermbg=239   cterm=NONE          guifg=#4c4f4f   guibg=#4c4f4f   gui=NONE
hi MatchParen                   ctermfg=149   ctermbg=NONE  cterm=underline     guifg=#9fca56   guibg=NONE      gui=underline
hi StatusLine                   ctermfg=188   ctermbg=239   cterm=bold          guifg=#d4d7d6   guibg=#4c4f4f   gui=bold
hi StatusLineNC                 ctermfg=188   ctermbg=239   cterm=NONE          guifg=#d4d7d6   guibg=#4c4f4f   gui=NONE
hi Pmenu                        ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi PmenuSel                     ctermfg=NONE  ctermbg=74    cterm=NONE          guifg=NONE      guibg=#4fa5c7   gui=NONE
hi IncSearch                    ctermfg=16    ctermbg=74    cterm=NONE          guifg=#151718   guibg=#55b5db   gui=NONE
hi Search                       ctermfg=NONE  ctermbg=NONE  cterm=underline     guifg=NONE      guibg=NONE      gui=underline
hi Directory                    ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Folded                       ctermfg=59    ctermbg=16    cterm=NONE          guifg=#41535b   guibg=#151718   gui=NONE

hi Normal                       ctermfg=188   ctermbg=16    cterm=NONE          guifg=#d4d7d6   guibg=#151718   gui=NONE
hi Boolean                      ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Character                    ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Comment                      ctermfg=59    ctermbg=NONE  cterm=NONE          guifg=#41535b   guibg=NONE      gui=NONE
hi Conditional                  ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi Constant                     ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Define                       ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi DiffAdd                      ctermfg=188   ctermbg=64    cterm=bold          guifg=#d4d7d6   guibg=#43800a   gui=bold
hi DiffDelete                   ctermfg=88    ctermbg=NONE  cterm=NONE          guifg=#870505   guibg=NONE      gui=NONE
hi DiffChange                   ctermfg=188   ctermbg=23    cterm=NONE          guifg=#d4d7d6   guibg=#1a3150   gui=NONE
hi DiffText                     ctermfg=188   ctermbg=24    cterm=bold          guifg=#d4d7d6   guibg=#204a87   gui=bold
hi ErrorMsg                     ctermfg=231   ctermbg=NONE  cterm=NONE          guifg=#f8f8f8   guibg=NONE      gui=NONE
hi WarningMsg                   ctermfg=231   ctermbg=NONE  cterm=NONE          guifg=#f8f8f8   guibg=NONE      gui=NONE
hi Float                        ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Function                     ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi Identifier                   ctermfg=185   ctermbg=NONE  cterm=NONE          guifg=#e6cd69   guibg=NONE      gui=NONE
hi Keyword                      ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi Label                        ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi NonText                      ctermfg=188   ctermbg=0     cterm=NONE          guifg=#d4d7d6   guibg=#151718   gui=NONE
hi Number                       ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi Operator                     ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi PreProc                      ctermfg=197   ctermbg=NONE  cterm=NONE          guifg=#ff026a   guibg=NONE      gui=NONE
hi Special                      ctermfg=188   ctermbg=NONE  cterm=NONE          guifg=#d4d7d6   guibg=NONE      gui=NONE
hi SpecialKey                   ctermfg=16    ctermbg=235   cterm=NONE          guifg=#2b2e28   guibg=#282a2b   gui=NONE
hi Statement                    ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi StorageClass                 ctermfg=185   ctermbg=NONE  cterm=NONE          guifg=#e6cd69   guibg=NONE      gui=NONE
hi String                       ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi Tag                          ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi Title                        ctermfg=188   ctermbg=NONE  cterm=bold          guifg=#d4d7d6   guibg=NONE      gui=bold
hi Todo                         ctermfg=59    ctermbg=NONE  cterm=inverse,bold  guifg=#41535b   guibg=NONE      gui=inverse,bold
hi Type                         ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi Underlined                   ctermfg=NONE  ctermbg=NONE  cterm=underline     guifg=NONE      guibg=NONE      gui=underline

hi rubyClass                    ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi rubyFunction                 ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi rubySymbol                   ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi rubyConstant                 ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi rubyStringDelimiter          ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi rubyBlockParameter           ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi rubyInstanceVariable         ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=italic
hi rubyInclude                  ctermfg=197   ctermbg=NONE  cterm=NONE          guifg=#ff026a   guibg=NONE      gui=NONE
hi rubyGlobalVariable           ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi rubyRegexp                   ctermfg=215   ctermbg=NONE  cterm=NONE          guifg=#ffb454   guibg=NONE      gui=NONE
hi rubyRegexpDelimiter          ctermfg=215   ctermbg=NONE  cterm=NONE          guifg=#ffb454   guibg=NONE      gui=NONE
hi rubyEscape                   ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi rubyControl                  ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi rubyClassVariable            ctermfg=185   ctermbg=NONE  cterm=NONE          guifg=#e6cd69   guibg=NONE      gui=NONE
hi rubyOperator                 ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi rubyException                ctermfg=197   ctermbg=NONE  cterm=NONE          guifg=#ff026a   guibg=NONE      gui=NONE
hi rubyPseudoVariable           ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=italic
hi rubyRailsUserClass           ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi rubyRailsARAssociationMethod ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi rubyRailsARMethod            ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi rubyRailsRenderMethod        ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi rubyRailsMethod              ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE

hi erubyDelimiter               ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi erubyComment                 ctermfg=59    ctermbg=NONE  cterm=NONE          guifg=#41535b   guibg=NONE      gui=NONE
hi erubyRailsMethod             ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE

hi htmlTag                      ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi htmlEndTag                   ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi htmlTagName                  ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi htmlArg                      ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
hi htmlSpecialChar              ctermfg=79    ctermbg=NONE  cterm=NONE          guifg=#5eebb8   guibg=NONE      gui=NONE

hi javaScriptFunction           ctermfg=185   ctermbg=NONE  cterm=NONE          guifg=#e6cd69   guibg=NONE      gui=NONE
hi javaScriptRailsFunction      ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi javaScriptBraces             ctermfg=102   ctermbg=NONE  cterm=NONE          guifg=#858d8a   guibg=NONE      gui=NONE

hi yamlKey                      ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi yamlAnchor                   ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi yamlAlias                    ctermfg=149   ctermbg=NONE  cterm=NONE          guifg=#9fca56   guibg=NONE      gui=NONE
hi yamlDocumentHeader           ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE

hi cssURL                       ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi cssFunctionName              ctermfg=140   ctermbg=NONE  cterm=NONE          guifg=#a074c4   guibg=NONE      gui=NONE
hi cssColor                     ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi cssPseudoClassId             ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi cssClassName                 ctermfg=74    ctermbg=NONE  cterm=NONE          guifg=#55b5db   guibg=NONE      gui=NONE
hi cssValueLength               ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi cssCommonAttr                ctermfg=167   ctermbg=NONE  cterm=NONE          guifg=#cd3f45   guibg=NONE      gui=NONE
hi cssBraces                    ctermfg=NONE  ctermbg=NONE  cterm=NONE          guifg=NONE      guibg=NONE      gui=NONE
