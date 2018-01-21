" Vim color file - Spink
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "Spink"
let g:unite_cursor_line_highlight = 'UniteLineHi'

" Alternative support for Vim plugins {
hi MyTagListFileName          guifg=#BD9700    guibg=NONE        guisp=NONE         gui=underline
hi IndentGuidesOdd            guifg=NONE       guibg=#515e61     guisp=NONE         gui=NONE
hi IndentGuidesEven           guifg=NONE       guibg=#777777     guisp=NONE         gui=NONE
hi EasyMotionTarget           guifg=#BD9700    guibg=NONE        guisp=NONE         gui=bold
hi EasyMotionShade            guifg=#777777    guibg=NONE        guisp=NONE         gui=bold
hi EasyMotionTarget2First     guifg=#BD9700    guibg=NONE        guisp=NONE         gui=bold
hi EasyMotionTarget2Second    guifg=#BD9700    guibg=NONE        guisp=NONE         gui=bold
hi CtrlPMatch                 guifg=#8a3824    guibg=NONE        guisp=#F9F9F9      gui=bold
hi UniteLineHi                guifg=NONE       guibg=#492224     guisp=NONE         gui=NONE
hi SyntasticError             guifg=#F9F9FF    guibg=#912C00     guisp=NONE         gui=NONE
hi SyntasticErrorSign         guifg=#ceb67f    guibg=#492224     guisp=NONE         gui=NONE
hi TabLine                    guifg=#8a3824    guibg=NONE        guisp=NONE         gui=underline
hi TabLineSel                 guifg=#9A7B00    guibg=#492224     guisp=NONE         gui=underline
hi TabLineFill                guifg=#3D3D3D    guibg=NONE        guisp=NONE         gui=underline


" Default syntax {
hi Boolean                    guifg=#A1A6A8    guibg=NONE        guisp=NONE         gui=NONE
hi Character                  guifg=#A1A6A8    guibg=NONE        guisp=NONE         gui=NONE
hi ColorColumn                guifg=NONE       guibg=#222222     guisp=#5E6C70      gui=NONE
hi Comment                    guifg=#515e61    guibg=NONE        guisp=NONE         gui=italic
hi Conditional                guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=bold
hi Constant                   guifg=#8f1d1d    guibg=NONE        guisp=NONE         gui=NONE
hi Cursor                     guifg=NONE       guibg=#750000     guisp=#F9F9F9      gui=NONE
hi iCursor                    guifg=#BD9800    guibg=#750000     guisp=NONE         gui=NONE
hi Underlined                 guifg=#BD9800    guibg=#750000     guisp=NONE         gui=NONE
hi cursorim                   guifg=#BD9700    guibg=#750000     guisp=#536991      gui=NONE
hi CursorColumn               guifg=NONE       guibg=#222E30     guisp=#222E30      gui=NONE
hi CursorLine                 guifg=NONE       guibg=#222E30     guisp=#222E30      gui=NONE
hi CursorLineNR               guifg=#8A905D    guibg=#3C3836     guisp=#222E30      gui=NONE
hi Debug                      guifg=#BD9800    guibg=NONE        guisp=NONE         gui=NONE
hi Define                     guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi Delimiter                  guifg=#fffedc    guibg=NONE        guisp=NONE         gui=NONE
hi DiffAdd                    guifg=NONE       guibg=#193224     guisp=#193224      gui=NONE
hi DiffChange                 guifg=NONE       guibg=#492224     guisp=#492224      gui=NONE
hi DiffDelete                 guifg=NONE       guibg=#192224     guisp=#192224      gui=NONE
hi DiffText                   guifg=NONE       guibg=#492224     guisp=#492224      gui=NONE
hi Directory                  guifg=#536991    guibg=NONE        guisp=NONE         gui=bold
hi Error                      guifg=NONE        guibg=NONE       guisp=NONE         gui=NONE
hi ErrorMsg                   guifg=#A1A6A8    guibg=#643c3c     guisp=NONE         gui=NONE
hi Exception                  guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=bold
hi Float                      guifg=#A1A6A8    guibg=NONE        guisp=NONE         gui=NONE
hi Folded                     guibg=#2D3239    guifg=#747474     guisp=NONE         gui=bold
hi FoldColumn                 guifg=#66595f    guibg=#1a1a1a     guisp=#A1A6A8      gui=NONE
hi Function                   guifg=#8A3824    guibg=NONE        guisp=NONE         gui=none
hi Identifier                 guifg=#fffedc    guibg=NONE        guisp=NONE         gui=NONE
hi IncSearch                  guifg=#400000    guibg=#515e61     guisp=#BD9800      gui=bold
hi Search                     guifg=NONE       guibg=#710000     guisp=#F9F9FF      gui=NONE
hi Include                    guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi Keyword                    guifg=#727152    guibg=NONE        guisp=NONE         gui=bold
hi Label                      guifg=#BD9800    guibg=NONE        guisp=NONE         gui=bold
hi LineNr                     guifg=#3C3836    guibg=NONE        guisp=NONE         gui=NONE
hi Macro                      guifg=#BD9800    guibg=NONE        guisp=NONE         gui=NONE
hi MatchParen                 guifg=NONE       guibg=#3F3F3F     guisp=NONE         gui=bold,italic
hi ModeMsg                    guifg=#fffedc    guibg=#192224     guisp=#192224      gui=bold
hi MoreMsg                    guifg=#BD9800    guibg=NONE        guisp=NONE         gui=bold
hi NonText                    guifg=#5E6C70    guibg=NONE        guisp=NONE         gui=italic
hi Normal                     guifg=#CEB67F    guibg=#141414     guisp=#0e1314      gui=NONE
hi Number                     guifg=#8f0000    guibg=NONE        guisp=NONE         gui=NONE
hi Operator                   guifg=#BD9800    guibg=NONE        guisp=NONE         gui=NONE
hi PMenu                      guifg=#5a5a5a    guibg=#141414     guisp=#1a1a1a      gui=underline
hi PMenuSbar                  guifg=NONE       guibg=#848688     guisp=#848688      gui=underline
hi PMenuSel                   guifg=NONE       guibg=#750000     guisp=#BD9800      gui=bold,underline
hi PMenuThumb                 guifg=NONE       guibg=#a4a6a8     guisp=#a4a6a8      gui=underline
hi PreCondit                  guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi PreProc                    guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi Repeat                     guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=bold
hi SignColumn                 guifg=#BD9800    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi Special                    guifg=#Fff5bF    guibg=NONE        guisp=NONE         gui=NONE
hi SpecialChar                guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi SpecialComment             guifg=#BD9800    guibg=NONE        guisp=NONE         gui=NONE
hi SpecialKey                 guifg=#5E6C70    guibg=NONE        guisp=NONE         gui=italic
hi SpellBad                   guifg=#F9F9FF    guibg=#192224     guisp=#192224      gui=underline
hi SpellCap                   guifg=#F9F9FF    guibg=#192224     guisp=#192224      gui=underline
hi SpellLocal                 guifg=#F9F9FF    guibg=#192224     guisp=#192224      gui=underline
hi SpellRare                  guifg=#F9F9FF    guibg=#192224     guisp=#192224      gui=underline
hi Statement                  guifg=#8a3824    guibg=NONE        guisp=NONE         gui=bold
hi StatusLine                 guifg=#9a7824    guibg=NONE        guisp=#750000      gui=NONE
hi StatusLineNC               guifg=#4A4A4A    guibg=NONE        guisp=#5E6C70      gui=NONE
hi Bufferline                 guifg=#4A4A4A    guibg=#F9F9F9     guisp=#5E6C70      gui=NONE
hi StorageClass               guifg=#A1A6A8    guibg=NONE        guisp=NONE         gui=italic
hi String                     guifg=#617689    guibg=NONE        guisp=NONE         gui=italic
hi Structure                  guifg=#A1A6A8    guibg=NONE        guisp=NONE         gui=italic
hi Tag                        guifg=#ceb67f    guibg=NONE        guisp=NONE         gui=NONE
hi Title                      guifg=#F9F9FF    guibg=#192224     guisp=#192224      gui=bold
hi Todo                       guifg=#BD9800    guibg=#492224     guisp=#BD9800      gui=NONE
hi Type                       guifg=#8A905D    guibg=NONE        guisp=NONE         gui=bold
hi Typedef                    guifg=#536991    guibg=NONE        guisp=NONE         gui=italic
hi Underlined                 guifg=NONE       guibg=#492224     guisp=NONE         gui=NONE
hi VertSplit                  guifg=#21201F    guibg=#21201F     guisp=NONE         gui=bold
hi Split                      guifg=#3D3D3D    guibg=NONE        guisp=NONE         gui=bold
hi Visual                     guifg=NONE       guibg=#492224     guisp=#F9F9FF      gui=NONE
hi VisualNOS                  guifg=#192224    guibg=#750000     guisp=#F9F9FF      gui=underline
hi WarningMsg                 guifg=#A1A6A8    guibg=#912C00     guisp=#912C00      gui=NONE
hi WildMenu                   guifg=#BD9800    guibg=NONE        guisp=NONE         gui=NONE

" HTML syntax {
hi HtmlHiLink                 guifg=NONE        guibg=#492224     guisp=NONE         gui=underline
hi htmlLinkText               guifg=NONE        guibg=#492224     guisp=NONE         gui=underline
hi htmlTag                    guifg=#245361     guibg=NONE        guisp=#750000      gui=bold
hi htmlEndTag                 guifg=#245361     guibg=NONE        guisp=NONE         gui=NONE 
hi htmlTagName                guifg=#599cab     guibg=NONE        guisp=NONE         gui=NONE 
hi htmlTagN                   guifg=#ceb67f     guibg=NONE        guisp=NONE         gui=NONE 
hi htmlString                 guifg=#FFF5BF     guibg=NONE        guisp=NONE         gui=NONE 
hi htmlArg                    guifg=#599cab     guibg=NONE        guisp=NONE         gui=NONE 
hi htmlSpecialChar            guifg=#ceb67f     guibg=NONE        guisp=NONE         gui=NONE 

" PHP/ Mysql syntax {
hi PHPprivate                 guifg=#978A55    guibg=NONE        guisp=NONE         gui=underline,bold
hi PHPfunction                guifg=#978A55    guibg=NONE        guisp=NONE         gui=underline,bold
hi PHPtest                    guifg=#978A55    guibg=NONE        guisp=NONE         gui=underline,bold
hi PHPClass                   guifg=#978A55    guibg=NONE        guisp=NONE         gui=underline,bold
hi PHPConstant                guifg=#978A55    guibg=NONE        guisp=NONE         gui=underline,bold
hi mysqlKeyword               guifg=#889CAC    guibg=NONE        guisp=NONE         gui=NONE
hi mysqlOperator              guifg=#889CAC    guibg=NONE        guisp=NONE         gui=NONE
hi phpFunctions               guifg=#6C1C00    guibg=NONE        guisp=NONE         gui=bold

" Python syntax {
hi pythonFunction             guifg=#8A905D    guibg=NONE        guisp=NONE         gui=underline
hi pythonString               guifg=#617689    guibg=NONE        guisp=NONE         gui=italic
hi pythonStatement            guifg=#973824    guibg=NONE        guisp=NONE         gui=bold
hi pythonInclude              guifg=#727152    guibg=NONE        guisp=NONE         gui=none
hi pythonImport               guifg=#727152    guibg=NONE        guisp=NONE         gui=none
hi pythonOperator             guifg=#BD9800    guibg=NONE        guisp=NONE         gui=none
hi pythonRepeat               guifg=#A88800    guibg=NONE        guisp=NONE         gui=none
hi pythonConditional          guifg=#AA8800    guibg=NONE        guisp=NONE         gui=none

" Javascript syntax {
hi jsSpecial                  guifg=#fff5bf    guibg=NONE        guisp=NONE         gui=NONE 
hi javascriptSpecial          guifg=#fff5bf    guibg=NONE        guisp=NONE         gui=NONE
hi jsString                   guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi javascriptString           guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi jsStringS                  guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi javascriptStringS          guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi jsStringD                  guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi javascriptStringD          guifg=#868F4E    guibg=NONE        guisp=NONE         gui=italic
hi jsFunction                 guifg=#648A1C    guibg=NONE        guisp=NONE         gui=underline,bold
hi javascriptFunction         guifg=#648A1C    guibg=NONE        guisp=NONE         gui=underline,bold
hi jsConditional              guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi javascriptConditional      guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi jsFuncName                 guifg=#648A1C    guibg=NONE        guisp=NONE         gui=underline
hi javascriptFuncName         guifg=#648A1C    guibg=NONE        guisp=NONE         gui=underline
hi javascriptIdentifier       guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi jsNumber                   guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi javascriptNumber           guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi jsFloat                    guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
hi javascriptFloat            guifg=#C6D93C    guibg=NONE        guisp=NONE         gui=none
if (&ft=='javascript' || &ft=='js')
    hi level12 guifg=#EEFD86
    hi level13 guifg=#EEFD86
    hi level14 guifg=#EEFD86
    hi level15 guifg=#EEFD86
    hi level16 guifg=#EEFD86
endif



" CSS syntax {
hi cssTagName            guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssAttrComma          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssAttr               guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssClassName          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssIdentifier         guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssBraces             guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssNoise              guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssMediaQuery         guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssMedia              guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssTextProp           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssFontProp           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssUIProp             guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssPageProp           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssTransformProp      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssDimensionProp      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssBackgroundPro      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssTransitionPro      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssListProp           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssBorderProp         guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssTableProp          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssColorProp          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssAnimationProp      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssPositioningPr      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssBoxProp            guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssMediaProp          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssFlexibleBoxPr      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssFunctionNam        guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssURL                guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssColor              guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssClassName          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssImportant          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssStringQQ           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssValueLength        guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssValueTime          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssCommonAttr         guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssUnitDecorator      guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssValueNumber        guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi cssPseudoClass        guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi sassProperty          guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE
hi sassComment           guifg=#599cab    guibg=NONE        guisp=#1a1a1a      gui=NONE

if (&ft=='css')
    hi level12 guifg=#CEA65B  guibg=NONE  guisp=#1a1a1a  gui=NONE
    hi level13 guifg=#CEA65B  guibg=NONE  guisp=#1a1a1a  gui=NONE
    hi level14 guifg=#CEA65B  guibg=NONE  guisp=#1a1a1a  gui=NONE
    hi level15 guifg=#CEA65B  guibg=NONE  guisp=#1a1a1a  gui=NONE
    hi level16 guifg=#CEA65B  guibg=NONE  guisp=#1a1a1a  gui=NONE
endif
