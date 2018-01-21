" Vim color file
" Name:       evolution.vim
" Author:     Peter Lewis <pete@muddygoat.org>
" Version:    0.2
" Notes:      Originally based on herald by Fabio Cevasco <h3rald@h3rald.com>


hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "evolution"

set background=dark

" Set some syntax-related variables
let ruby_operators = 1

" -> Text; Miscellaneous
hi Normal         guibg=#1F1F1F guifg=#D0D0D0 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=252

hi SpecialKey     guibg=#1F1F1F guifg=#E783E9 gui=none term=bold cterm=NONE ctermbg=NONE ctermfg=176
hi VertSplit      guibg=#121212 guifg=#121212 gui=none term=reverse cterm=NONE ctermbg=233 ctermfg=233 "alt: guibg=#4d5074 guifg=#4d5074
hi SignColumn     guibg=#1F1F1F guifg=#BF81FA gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=141
hi NonText        guibg=#1F1F1F guifg=#FC6984 gui=none term=bold cterm=NONE ctermbg=NONE ctermfg=204
hi Directory      guibg=#1F1F1F guifg=#FFEE68 gui=none term=bold cterm=bold ctermbg=NONE ctermfg=227
hi Title          guibg=#1F1F1F guifg=#6DF584 gui=bold term=bold cterm=bold ctermbg=NONE ctermfg=84
hi BadWhitespace  guibg=#0ADA7D guifg=fg      gui=NONE term=NONE cterm=NONE ctermbg=59 ctermfg=fg

" -> Cursor
hi Cursor         guibg=#FFEE68 guifg=#1F1F1F gui=none term=NONE cterm=reverse ctermbg=8 ctermfg=15
hi CursorIM       guibg=#FFEE68 guifg=#1F1F1F gui=none term=NONE cterm=reverse ctermbg=195 ctermfg=16
hi CursorColumn   guibg=#444444 guifg=fg      gui=none term=reverse cterm=reverse ctermbg=238 ctermfg=fg
hi CursorLine     guibg=#444444 guifg=fg      gui=none term=underline cterm=underline ctermbg=238 ctermfg=fg


" -> Folding
hi FoldColumn     guibg=#001336 guifg=#003DAD gui=none term=NONE cterm=NONE ctermbg=17 ctermfg=25
hi Folded         guibg=#585858 guifg=#c5dcdc gui=bold term=NONE cterm=bold ctermbg=240 ctermfg=188

" -> Line info
"hi LineNr         guibg=#121212 guifg=#1F1F1F gui=none term=underline cterm=NONE ctermbg=233 ctermfg=236
hi LineNr         guibg=#121212 guifg=#3F3F3F gui=none term=underline cterm=NONE ctermbg=233 ctermfg=236
hi StatusLine     guibg=#121212 guifg=fg      gui=bold term=reverse,bold cterm=reverse,bold ctermbg=60 ctermfg=252
hi StatusLineNC   guibg=#25365a guifg=#696567 gui=none term=reverse cterm=reverse ctermbg=60 ctermfg=53  "alt: guibg=#4d5074 guifg=#5F005F
hi ColorColumn    guibg=#121212 guifg=fg      gui=none term=reverse cterm=NONE ctermbg=233 ctermfg=fg "alt: guibg=#5F005F guifg=#d0d0d0


" -> Messages
hi ErrorMsg       guibg=#A32024 guifg=#D0D0D0 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=252
hi Question       guibg=#1F1F1F guifg=#FFA500 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=214
hi WarningMsg     guibg=#FFA500 guifg=#000000 gui=none term=bold cterm=bold ctermbg=214 ctermfg=16
hi MoreMsg        guibg=#1F1F1F guifg=#FFA500 gui=none term=bold cterm=NONE ctermbg=NONE ctermfg=214
hi ModeMsg        guibg=#1F1F1F guifg=#FFA500 gui=none term=bold cterm=NONE ctermbg=NONE ctermfg=214

" -> Search 
hi Search         guibg=#696567 guifg=#FFEE68 gui=none term=reverse cterm=NONE ctermbg=59 ctermfg=227
hi IncSearch      guibg=#696567 guifg=#FFEE68 gui=none term=reverse cterm=NONE ctermbg=59 ctermfg=227

" -> Diff
hi DiffAdd        guibg=#006124 guifg=#ED9000 gui=none term=bold cterm=NONE ctermbg=22 ctermfg=208
hi DiffChange     guibg=#0B294A guifg=#A36000 gui=none term=bold cterm=NONE ctermbg=17 ctermfg=130
hi DiffDelete     guibg=#081F38 guifg=#ED9000 gui=none term=bold cterm=NONE ctermbg=17 ctermfg=208
hi DiffText       guibg=#12457D guifg=#ED9000 gui=underline term=reverse cterm=underline ctermbg=24 ctermfg=208

" -> Menu
hi Pmenu          guibg=#140100 guifg=#660300 gui=none term=NONE cterm=NONE ctermbg=6 ctermfg=52
hi PmenuSel       guibg=#F17A00 guifg=#4C0200 gui=none term=NONE cterm=NONE ctermbg=4 ctermfg=6
hi PmenuSbar      guibg=#430300 guifg=fg      gui=none term=NONE cterm=NONE ctermbg=66 ctermfg=fg
hi PmenuThumb     guibg=#720300 guifg=fg      gui=none term=NONE cterm=NONE ctermbg=52 ctermfg=fg
hi WildMenu       guibg=#ffff00 guifg=#000000 gui=NONE term=NONE cterm=NONE ctermbg=226 ctermfg=16

" -> Tabs
hi TabLine        guibg=#141414 guifg=#1F1F1F gui=none term=underline cterm=underline ctermbg=233 ctermfg=16
hi TabLineFill    guibg=#000000 guifg=fg      gui=none term=reverse cterm=reverse ctermbg=NONE ctermfg=fg
hi TabLineSel     guibg=#1F1F1F guifg=#D0D0D0 gui=bold term=bold cterm=bold ctermbg=NONE ctermfg=252
"
" -> Visual Mode
hi Visual         guibg=#000000 guifg=#FFB539 gui=none term=reverse cterm=NONE ctermbg=67 ctermfg=16
hi VisualNOS      guibg=#000000 guifg=#696567 gui=none term=bold,underline cterm=NONE ctermbg=NONE ctermfg=59

" -> Code
hi Comment        guibg=#1F1F1F guifg=#696567 gui=italic term=italic cterm=italic ctermbg=NONE ctermfg=59 "alt: guifg=#5f5f5f
hi Constant       guibg=#1F1F1F guifg=#6DF584 gui=none term=underline cterm=NONE ctermbg=NONE ctermfg=83
hi String         guibg=#1F1F1F guifg=#FFB539 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=48
hi Error          guibg=#1F1F1F guifg=#FC4234 gui=none term=reverse cterm=NONE ctermbg=NONE ctermfg=203 "alt: guifg=#0fc416
hi Identifier     guibg=#1F1F1F guifg=#70BDF1 gui=none term=underline cterm=NONE ctermbg=NONE ctermfg=75
hi Function       guibg=#1F1F1F guifg=#90CBF1 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=117
hi Ignore         guibg=#1F1F1F guifg=#1F1F1F gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=16
hi MatchParen     guibg=#226600 guifg=#FFA500 gui=none term=reverse cterm=bold ctermbg=129 ctermfg=16
hi PreProc        guibg=#1F1F1F guifg=#BF81FA gui=none term=underline cterm=NONE ctermbg=NONE ctermfg=141

hi Special        guibg=#1F1F1F guifg=#FFEE68 gui=none term=bold cterm=bold ctermbg=NONE ctermfg=227
hi Todo           guibg=#1F1F1F guifg=#FC4234 gui=bold term=bold cterm=bold ctermbg=NONE ctermfg=190 "alt guibg=#0f0f0f guifg=#0fc416
hi Underlined     guibg=#1F1F1F guifg=#FC4234 gui=underline term=underline cterm=underline ctermbg=NONE ctermfg=203
hi Statement      guibg=#1F1F1F guifg=#E783E9 gui=none term=bold cterm=bold ctermbg=NONE ctermfg=176

hi Operator       guibg=#1F1F1F guifg=#FC6984 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=204
hi Delimiter      guibg=#1F1F1F guifg=#FC6984 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=204
hi Type           guibg=#1F1F1F guifg=#FFEE68 gui=none term=underline cterm=NONE ctermbg=NONE ctermfg=46
hi Exception      guibg=#1F1F1F guifg=#FC4234 gui=none term=NONE cterm=NONE ctermbg=NONE ctermfg=203 " alt: guifg=#0fc416


" -> HTML-specific
hi htmlBold                 guibg=#1F1F1F guifg=#D0D0D0 gui=bold term=NONE cterm=bold ctermbg=NONE ctermfg=252
hi htmlBoldItalic           guibg=#1F1F1F guifg=#D0D0D0 gui=bold,italic term=bold,italic cterm=bold,italic ctermbg=NONE ctermfg=252
hi htmlBoldUnderline        guibg=#1F1F1F guifg=#D0D0D0 gui=bold,underline term=bold,underline cterm=bold,underline ctermbg=NONE ctermfg=252
hi htmlBoldUnderlineItalic  guibg=#1F1F1F guifg=#D0D0D0 gui=bold,underline,italic term=bold,underline,italic cterm=bold,underline,italic ctermbg=NONE ctermfg=252
hi htmlItalic               guibg=#1F1F1F guifg=#D0D0D0 gui=italic term=italic cterm=italic ctermbg=NONE ctermfg=252
hi htmlUnderline            guibg=#1F1F1F guifg=#D0D0D0 gui=underline term=underline cterm=underline ctermbg=NONE ctermfg=252
hi htmlUnderlineItalic      guibg=#1F1F1F guifg=#D0D0D0 gui=underline,italic term=italic,underline cterm=italic,underline ctermbg=NONE ctermfg=252


" -> BBCode links
hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline

" -> Ruby links
highlight link rubyClass Keyword
highlight link rubyDefine Keyword
highlight link rubyConstant Type
highlight link rubySymbol Constant
highlight link rubyStringDelimiter rubyString
highlight link rubyInclude Keyword
highlight link rubyAttribute Keyword
highlight link rubyInstanceVariable Normal



" Spellcheck formatting
if has("spell")
  hi SpellBad   guisp=#FC4234 gui=undercurl term=reverse cterm=undercurl ctermbg=NONE ctermfg=203 "alt: guisp=#0fc416
  hi SpellCap   guisp=#70BDF1 gui=undercurl term=reverse cterm=undercurl ctermbg=NONE ctermfg=75
  hi SpellLocal guisp=#FFEE68 gui=undercurl term=underline cterm=undercurl ctermbg=NONE ctermfg=227
  hi SpellRare  guisp=#6DF584 gui=undercurl term=reverse cterm=undercurl ctermbg=NONE ctermfg=84
endif

hi MyTagListFileName guibg=#121212 guifg=#d0d0d0 gui=NONE term=bold cterm=bold ctermbg=53 ctermfg=220

