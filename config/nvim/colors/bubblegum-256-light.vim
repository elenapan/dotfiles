" Bubblegum 256 Light
"  Author: baskerville <nihilhill@gmail.com>
"     URL: github.com/baskerville/bubblegum
" Created: 2011
" Version: 0.3

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="bubblegum-256-light"


" Main
hi Normal ctermfg=241 ctermbg=231 cterm=none guifg=#626262 guibg=#FFFFFF gui=none
hi Comment ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none

" Constant
hi Constant ctermfg=130 ctermbg=231 cterm=none guifg=#AF5F00 guibg=#FFFFFF gui=none
hi String ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none
hi Character ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none
hi Number ctermfg=131 ctermbg=231 cterm=none guifg=#AF5F5F guibg=#FFFFFF gui=none
hi Boolean ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none
hi Float ctermfg=131 ctermbg=231 cterm=none guifg=#AF5F5F guibg=#FFFFFF gui=none

" Variable Name
hi Identifier ctermfg=133 ctermbg=231 cterm=none guifg=#AF5FAF guibg=#FFFFFF gui=none
hi Function ctermfg=133 ctermbg=231 cterm=none guifg=#AF5FAF guibg=#FFFFFF gui=none

" Statement
hi Statement ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Conditional ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Repeat ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Label ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Operator ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Keyword ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none
hi Exception ctermfg=32 ctermbg=231 cterm=none guifg=#0087D7 guibg=#FFFFFF gui=none

" Preprocessor
hi PreProc ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none
hi Include ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none
hi Define ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none
hi Macro ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none
hi PreCondit ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none

" Type
hi Type ctermfg=61 ctermbg=231 cterm=none guifg=#5F5FAF guibg=#FFFFFF gui=none
hi StorageClass ctermfg=61 ctermbg=231 cterm=none guifg=#5F5FAF guibg=#FFFFFF gui=none
hi Structure ctermfg=61 ctermbg=231 cterm=none guifg=#5F5FAF guibg=#FFFFFF gui=none
hi Typedef ctermfg=61 ctermbg=231 cterm=none guifg=#5F5FAF guibg=#FFFFFF gui=none

" Special
hi Special ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi SpecialChar ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi Tag ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi Delimiter ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi SpecialComment ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi Debug ctermfg=167 ctermbg=231 cterm=none guifg=#D75F5F guibg=#FFFFFF gui=none
hi Underlined ctermfg=241 ctermbg=231 cterm=underline guifg=#626262 guibg=#FFFFFF gui=underline
hi Ignore ctermfg=231 ctermbg=231 cterm=none guifg=#FFFFFF guibg=#FFFFFF gui=none
hi Error ctermfg=231 ctermbg=160 cterm=none guifg=#FFFFFF guibg=#D70000 gui=none
hi Todo ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none

" Window
hi StatusLine ctermfg=241 ctermbg=254 cterm=none guifg=#626262 guibg=#E4E4E4 gui=none
hi StatusLineNC ctermfg=246 ctermbg=254 cterm=none guifg=#949494 guibg=#E4E4E4 gui=none
hi TabLine ctermfg=241 ctermbg=254 cterm=none guifg=#626262 guibg=#E4E4E4 gui=none
hi TabLineSel ctermfg=238 ctermbg=188 cterm=none guifg=#444444 guibg=#D7D7D7 gui=none
hi TabLineFill ctermbg=254 cterm=none guibg=#E4E4E4 gui=none
hi VertSplit ctermfg=254 ctermbg=254 cterm=none guifg=#E4E4E4 guibg=#E4E4E4 gui=none

" Menu
hi Pmenu ctermfg=241 ctermbg=254 cterm=none guifg=#626262 guibg=#E4E4E4 gui=none
hi PmenuSel ctermfg=235 ctermbg=145 cterm=none guifg=#262626 guibg=#AFAFAF gui=none
hi PmenuSbar ctermbg=250 cterm=none guibg=#BCBCBC gui=none
hi PmenuThumb ctermbg=102 cterm=none guibg=#878787 gui=none
hi WildMenu ctermfg=231 ctermbg=98 cterm=none guifg=#FFFFFF guibg=#875FD7 gui=none

" Selection
hi Visual ctermfg=231 ctermbg=24 cterm=none guifg=#FFFFFF guibg=#005F87 gui=none
hi VisualNOS ctermfg=231 ctermbg=23 cterm=none guifg=#FFFFFF guibg=#005F5F gui=none

" Message
hi ErrorMsg ctermfg=197 ctermbg=231 cterm=none guifg=#FF005F guibg=#FFFFFF gui=none
hi WarningMsg ctermfg=134 ctermbg=231 cterm=none guifg=#AF5FD7 guibg=#FFFFFF gui=none
hi MoreMsg ctermfg=35 ctermbg=231 cterm=none guifg=#00AF5F guibg=#FFFFFF gui=none
hi ModeMsg ctermfg=130 ctermbg=231 cterm=bold guifg=#AF5F00 guibg=#FFFFFF gui=bold
hi Question ctermfg=38 ctermbg=231 cterm=none guifg=#00AFD7 guibg=#FFFFFF gui=none

" Mark
hi Folded ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi FoldColumn ctermfg=29 ctermbg=254 cterm=none guifg=#00875F guibg=#E4E4E4 gui=none
hi SignColumn ctermfg=130 ctermbg=254 cterm=none guifg=#AF5F00 guibg=#E4E4E4 gui=none
hi ColorColumn ctermbg=254 cterm=none guibg=#E4E4E4 gui=none
hi LineNr ctermfg=246 ctermbg=254 cterm=none guifg=#949494 guibg=#E4E4E4 gui=none
hi MatchParen ctermfg=231 ctermbg=166 cterm=none guifg=#FFFFFF guibg=#D75F00 gui=none

" Cursor
hi CursorColumn ctermbg=254 cterm=none guibg=#E4E4E4 gui=none
hi CursorLine ctermbg=254 cterm=none guibg=#E4E4E4 gui=none
hi CursorLineNr ctermfg=241 ctermbg=254 cterm=none guifg=#626262 guibg=#E4E4E4 gui=none

" Search
hi Search ctermfg=231 ctermbg=136 cterm=none guifg=#FFFFFF guibg=#AF8700 gui=none
hi IncSearch ctermfg=231 ctermbg=204 cterm=none guifg=#FFFFFF guibg=#FF5F87 gui=none

" Diff Mode
hi DiffAdd ctermfg=255 ctermbg=70 cterm=none guifg=#EEEEEE guibg=#5FAF00 gui=none
hi DiffChange ctermfg=255 ctermbg=88 cterm=none guifg=#EEEEEE guibg=#870000 gui=none
hi DiffText ctermfg=255 ctermbg=162 cterm=bold guifg=#EEEEEE guibg=#D70087 gui=bold
hi DiffDelete ctermfg=255 ctermbg=241 cterm=none guifg=#EEEEEE guibg=#626262 gui=none

" Spell
hi SpellBad ctermfg=197 ctermbg=231 cterm=underline guifg=#FF005F guibg=#FFFFFF gui=underline
hi SpellCap ctermfg=167 ctermbg=231 cterm=underline guifg=#D75F5F guibg=#FFFFFF gui=underline
hi SpellRare ctermfg=95 ctermbg=231 cterm=underline guifg=#875F5F guibg=#FFFFFF gui=underline
hi SpellLocal ctermfg=94 ctermbg=231 cterm=underline guifg=#875F00 guibg=#FFFFFF gui=underline

" Misc
hi SpecialKey ctermfg=74 ctermbg=231 cterm=none guifg=#5FAFD7 guibg=#FFFFFF gui=none
hi NonText ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi Directory ctermfg=104 ctermbg=231 cterm=none guifg=#8787D7 guibg=#FFFFFF gui=none
hi Title ctermfg=30 cterm=none guifg=#008787 gui=none
hi Conceal ctermfg=103 ctermbg=231 cterm=none guifg=#8787AF guibg=#FFFFFF gui=none
hi Noise ctermfg=243 ctermbg=231 cterm=none guifg=#767676 guibg=#FFFFFF gui=none
hi helpHyperTextJump ctermfg=31 ctermbg=231 cterm=none guifg=#0087AF guibg=#FFFFFF gui=none
hi perlSharpBang ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi rubySharpBang ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi jsFuncCall ctermfg=30 ctermbg=231 cterm=none guifg=#008787 guibg=#FFFFFF gui=none

" Html
hi javaScriptNumber ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none
hi htmlTag ctermfg=26 ctermbg=231 cterm=none guifg=#005FD7 guibg=#FFFFFF gui=none
hi htmlEndTag ctermfg=26 ctermbg=231 cterm=none guifg=#005FD7 guibg=#FFFFFF gui=none
hi htmlTagName ctermfg=169 ctermbg=231 cterm=none guifg=#D75FAF guibg=#FFFFFF gui=none
hi htmlString ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none

" Vim
hi vimFold ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi vimCommentTitle ctermfg=241 ctermbg=231 cterm=none guifg=#626262 guibg=#FFFFFF gui=none

" Diff File
hi diffFile ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi diffLine ctermfg=241 ctermbg=231 cterm=none guifg=#626262 guibg=#FFFFFF gui=none
hi diffAdded ctermfg=28 ctermbg=231 cterm=none guifg=#008700 guibg=#FFFFFF gui=none
hi diffRemoved ctermfg=169 ctermbg=231 cterm=none guifg=#D75FAF guibg=#FFFFFF gui=none
hi diffChanged ctermfg=136 ctermbg=231 cterm=none guifg=#AF8700 guibg=#FFFFFF gui=none
hi diffSubname ctermfg=239 ctermbg=231 cterm=none guifg=#4E4E4E guibg=#FFFFFF gui=none
hi diffOldLine ctermfg=69 ctermbg=231 cterm=none guifg=#5F87FF guibg=#FFFFFF gui=none

" Mail
hi mailSubject ctermfg=30 ctermbg=231 cterm=none guifg=#008787 guibg=#FFFFFF gui=none
hi mailSignature ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none

" Markdown
hi markdownCode ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi markdownCodeBlock ctermfg=246 ctermbg=231 cterm=none guifg=#949494 guibg=#FFFFFF gui=none
hi markdownItalic ctermfg=239 ctermbg=231 cterm=none guifg=#4E4E4E guibg=#FFFFFF gui=none
