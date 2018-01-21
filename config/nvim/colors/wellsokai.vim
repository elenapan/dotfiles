" @author Wells Johnston <w@wellsjohnston.com>

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "wellsokai"

" highlight, visual
" yellow
hi Visual ctermfg=black ctermbg=228 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi String ctermfg=228 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi IncSearch ctermbg=228 ctermfg=black cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
hi Search ctermbg=228 ctermfg=black guifg=NONE guibg=NONE

" keywords, operators
" pinkish color
hi MatchParen ctermfg=204 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline
hi Conditional ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Define ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=231 ctermbg=204 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=204 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Keyword ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Operator ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreProc ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Statement ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Tag ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyClass ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyInclude ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyControl ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyOperator ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyException ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi yamlKey ctermfg=204 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Todo ctermfg=204 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold

" light purple
" directory
hi Directory ctermfg=153 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

" dark purple
" numbers, booleans, static class
hi Boolean ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Float ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Number ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Structure ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi StorageClass ctermfg=105 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi cssColor ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssValueLength ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=105 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

" light green color
hi Type ctermfg=120 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Function ctermfg=120 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssClassName ctermfg=120 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi htmlH2 ctermfg=120 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=120 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi CursorLineNr ctermfg=120 ctermbg=237 cterm=NONE guifg=#3a3a3a guibg=NONE gui=NONE

" grey
" comments, folded
hi Folded ctermfg=245 ctermbg=235 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
hi Comment ctermfg=245 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE

" light pink
hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE

" cursor
hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE

" other
hi TabLineFill term=bold cterm=bold ctermbg=0
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE

" bright blue
" variables
hi Identifier ctermfg=123 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi htmlH3 ctermfg=123 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi htmlH4 ctermfg=123 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi htmlH5 ctermfg=123 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi htmlH6 ctermfg=123 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=123 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=123 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssFunctionName ctermfg=123 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=123 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE

" orange
hi cssURL ctermfg=214 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic

hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi NonText ctermfg=238 ctermbg=NONE cterm=NONE guifg=#49483e guibg=NONE gui=NONE
hi SpecialKey ctermfg=236 ctermbg=None cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE

" html
hi htmlH1 ctermfg=198 ctermbg=NONE cterm=NONE guifg=#67930f guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" javascript
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" yaml, css
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
