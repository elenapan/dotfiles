" LAEDERON: a Vim colorscheme largely inspired by Bad Wolf from Steve Losh
" (http://stevelosh.com/projects/badwolf/)
"
" Name {{{
"
" Whereas Ubaryd was warm colors on a dark background, Laederon is the 
" opposite: cold colors on a white background. This theme's name also 
" comes from Steven Erikson's Malazan world where Laederon is a land of 
" pine woods, lakes and snow. So, lot's of grey, green and all sorts of 
" blue/azure colours.
"
" }}}
"
" Credits {{{
"
" Maintainer:	Gianluca Fiore <forod.g@gmail.com>
" Inspiration:	https://github.com/sjl/badwolf/
" Last Change:	October 2014
" License:		Do Whatever You Want With This As Long As You Credit Where It's Due®
"
" }}}

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=light

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
		syntax reset
endif

let g:colors_name="laederon"

if !exists("g:laederon_html_link_underline") " {{{
    let g:laederon_html_link_underline = 1
endif " }}}

if !exists("g:laederon_css_props_highlight") " {{{
    let g:laederon_css_props_highlight = 0
endif " }}}

" }}}
" Palette {{{

let s:lac = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:lac.plain = ['f8f6f2', 15]

" Pure and simple.
let s:lac.snow = ['ffffff', 15]
let s:lac.coal = ['000000', 16]

" Some recycled colours from Ubaryd...
let s:lac.winterterrain		= ['908571', 252]
let s:lac.wetcoldterrain	= ['8c7f77', 245]
let s:lac.gravel			= ['777470', 240]
let s:lac.coldair			= ['405173', 241]
let s:lac.deepgravel		= ['44403a', 238]
let s:lac.deepergravel		= ['35322d', 236]
let s:lac.darkgravel		= ['2e2d2a', 235]
let s:lac.blackgravel		= ['201f1d', 233]
let s:lac.blackestgravel	= ['1a1a18', 232]

" Dark, bleak, palid, wintery colours of nature
let s:lac.lichen = ['515744', 101]
let s:lac.darkbark = ['402924', 52]
let s:lac.deeplake = ['003b7f', 20]
let s:lac.wintrygray = ['354d4f', 59]
" Actually, a purple kind of a raspberry
let s:lac.raspberry = ['ab3e5b', 161]
let s:lac.oakleaf = ['233e09', 22]
let s:lac.crystallake = ['1693a5', 62]
let s:lac.tundrariver = ['325a73', 24]
let s:lac.trunk = ['594512', 94]

" Sky-inspired colours. Did I tell you I love astronomy?
let s:lac.coldsky = ['081c8c', 18]
let s:lac.darkestnight = ['2f3a78', 19]

" Imagine a dark green paint diluted in too much water
let s:lac.dilutedpaint = ['90a680', 64]

" Basically, a dark gray
let s:lac.stainonsnow = ['403131', 88]

" }}}
" Highlighting Function {{{

function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:lac, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:lac, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:lac, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction

" }}}
" Configuration Options {{{

if exists('g:laederon_darkgutter') && g:laederon_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------

" General/UI {{{

call s:HL('Normal', 'blackestgravel', 'plain')

call s:HL('Folded', 'coldair', 'bg', 'none')

call s:HL('VertSplit', 'wetcoldterrain', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')

call s:HL('MatchParen', 'crystallake', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    'crystallake',  'deepgravel')
call s:HL('VisualNOS', 'crystallake',  'deepgravel')

call s:HL('Search',    'coal', 'raspberry', 'bold')
call s:HL('IncSearch', 'coal', 'darkbark',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'snow', 'deepgravel',     'bold')
call s:HL('StatusLineNC', 'wetcoldterrain', 'deepgravel', 'bold')

call s:HL('Directory', 'tundrariver', '', 'bold')

call s:HL('Title', 'crystallake')

call s:HL('ErrorMsg',   'wintrygray',       '', 'bold')
call s:HL('MoreMsg',    'raspberry',   '',   'bold')
call s:HL('ModeMsg',    'tundrariver', '',   'bold')
call s:HL('Question',   'tundrariver', '',   'bold')
call s:HL('WarningMsg', 'coldsky',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call s:HL('LineNr',     'coldair', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'coldair', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'coal', 'darkbark', 'bold')
call s:HL('vCursor', 'coal', 'darkbark', 'bold')
call s:HL('iCursor', 'coal', 'darkbark', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'tundrariver')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gravel')
call s:HL('Todo',           'wintrygray', 'snow', 'bold')
call s:HL('SpecialComment', 'crystallake', 'bg', 'bold')

call s:HL('String', 'tundrariver')

" Control flow stuff is wintrygray.
call s:HL('Statement',   'wintrygray', '', 'bold')
call s:HL('Keyword',     'wintrygray', '', 'bold')
call s:HL('Conditional', 'wintrygray', '', 'bold')
call s:HL('Operator',    'wintrygray', '', 'none')
call s:HL('Label',       'wintrygray', '', 'none')
call s:HL('Repeat',      'wintrygray', '', 'none')

" Functions and variable declarations are trunk
call s:HL('Identifier', 'trunk', '', 'none')
call s:HL('Function',   'trunk', '', 'none')

" Preprocessor stuff is crystallake, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'crystallake', '', 'none')
call s:HL('Macro',     'crystallake', '', 'none')
call s:HL('Define',    'crystallake', '', 'none')
call s:HL('PreCondit', 'crystallake', '', 'bold')

" Constants of all kinds are colored together.
call s:HL('Constant',  'dilutedpaint', '', 'bold')
call s:HL('Character', 'dilutedpaint', '', 'bold')
call s:HL('Boolean',   'dilutedpaint', '', 'bold')

call s:HL('Number', 'dilutedpaint', '', 'bold')
call s:HL('Float',  'dilutedpaint', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'coldsky', '', 'bold')

call s:HL('Type', 'darkestnight', '', 'none')
call s:HL('StorageClass', 'wintrygray', '', 'none')
call s:HL('Structure', 'wintrygray', '', 'none')
call s:HL('Typedef', 'wintrygray', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'crystallake', '', 'bold')

" Misc
call s:HL('Error',  'snow',   'raspberry', 'bold')
call s:HL('Debug',  'snow',   'blackgravel', 'bold')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'darkbark', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'winterterrain')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'crystallake', 'coal')
call s:HL('DiffAdd',    'wintrygray',     'deepergravel')
call s:HL('DiffChange', 'trunk',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'raspberry', 'bg', 'undercurl,bold', 'raspberry')
    call s:HL('SpellBad', '', '', '', 'raspberry')
    call s:HL('SpellLocal', '', '', '', 'raspberry')
    call s:HL('SpellRare', '', '', '', 'raspberry')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'snow', 'wintrygray', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'trunk', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'coal', 'darkbark', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'coal', 'darkbark', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'coal', 'darkbark', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'coal', 'darkbark', 'bold')

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'darkbark',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'darkbark', 'blackgravel')
call s:HL('ShowMarksHLu', 'darkbark', 'blackgravel')
call s:HL('ShowMarksHLo', 'darkbark', 'blackgravel')
call s:HL('ShowMarksHLm', 'darkbark', 'blackgravel')

" }}}
" Filetype-specific {{{

" C {{{

call s:HL('cType', 'raspberry', 'bg')
call s:HL('cStructure', 'trunk', 'bg')
call s:HL('cConstant', 'darkestnight', 'bg')
call s:HL('cStatement', 'tundrariver', 'bg')
call s:HL('cConditional', 'darkbark', 'bg', 'bold')
call s:HL('cRepeat', 'lichen', 'bg', 'bold')

" }}}
" Clojure {{{

call s:HL('clojureSpecial',  'wintrygray', '', '')
call s:HL('clojureDefn',     'wintrygray', '', '')
call s:HL('clojureDefMacro', 'wintrygray', '', '')
call s:HL('clojureDefine',   'wintrygray', '', '')
call s:HL('clojureMacro',    'wintrygray', '', '')
call s:HL('clojureCond',     'wintrygray', '', '')

call s:HL('clojureKeyword', 'trunk', '', 'none')

call s:HL('clojureFunc',   'coldsky', '', 'none')
call s:HL('clojureRepeat', 'coldsky', '', 'none')

call s:HL('clojureParen0', 'wetcoldterrain', '', 'none')

call s:HL('clojureAnonArg', 'tundrariver', '', 'bold')

" }}}
" CSS {{{

if g:laederon_css_props_highlight
    call s:HL('cssColorProp', 'tundrariver', '', 'none')
    call s:HL('cssBoxProp', 'tundrariver', '', 'none')
    call s:HL('cssTextProp', 'tundrariver', '', 'none')
    call s:HL('cssRenderProp', 'tundrariver', '', 'none')
    call s:HL('cssGeneratedContentProp', 'tundrariver', '', 'none')
else
    call s:HL('cssColorProp', 'fg', '', 'none')
    call s:HL('cssBoxProp', 'fg', '', 'none')
    call s:HL('cssTextProp', 'fg', '', 'none')
    call s:HL('cssRenderProp', 'fg', '', 'none')
    call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call s:HL('cssValueLength', 'dilutedpaint', '', 'bold')
call s:HL('cssColor', 'dilutedpaint', '', 'bold')
call s:HL('cssBraces', 'wetcoldterrain', '', 'none')
call s:HL('cssIdentifier', 'trunk', '', 'bold')
call s:HL('cssClassName', 'trunk', '', 'none')
call s:HL('cssImportant', 'raspberry', '', 'bold')

" }}}
" Crontab {{{

call s:HL('crontabMin', 'lichen', '')
call s:HL('crontabHr', 'crystallake', '')
call s:HL('crontabDay', 'dilutedpaint', '')
call s:HL('crontabMnth', 'coldsky', '')
call s:HL('crontabMnth12', 'coldsky', '')
call s:HL('crontabDow', 'oakleaf', '')
call s:HL('crontabDow7', 'oakleaf', '')
call s:HL('crontabCmd', 'tundrariver', '')

" }}}
" Diff {{{

call s:HL('gitDiff', 'wetcoldterrain', '',)

call s:HL('diffRemoved', 'coldsky', '',)
call s:HL('diffAdded', 'crystallake', '',)
call s:HL('diffFile', 'coal', 'wintrygray', 'bold')
call s:HL('diffNewFile', 'coal', 'wintrygray', 'bold')

call s:HL('diffLine', 'coal', 'trunk', 'bold')
call s:HL('diffSubname', 'trunk', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'tundrariver', '',)
call s:HL('djangoTagBlock', 'trunk', '')
call s:HL('djangoVarBlock', 'trunk', '')

" }}}
" Fstab {{{

call s:HL('fsOptionsGeneral', 'stainonsnow', '')
call s:HL('fsOptionsKeywords', 'stainonsnow', '')
call s:HL('fsTypeKeyword', 'wintrygray', '')
call s:HL('fsMountPoint', 'crystallake', '')

" }}}
" Go {{{

call s:HL('goType', 'oakleaf', '')
call s:HL('goDeclaration', 'tundrariver', '')
call s:HL('goStatement', 'raspberry', '')
call s:HL('goDirective', 'darkbark', '')

" }}}
" Haskell {{{

call s:HL('hsVarSym', 'crystallake', '')
call s:HL('hsConSym', 'crystallake', '')
call s:HL('hsStatement', 'raspberry', '')
call s:HL('hsConditional', 'tundrariver', '')
call s:HL('hsTypedef', 'tundrariver', '')
call s:HL('hsStructure', 'tundrariver', '')
call s:HL('hsType', 'deeplake', '')
call s:HL('hsMaybe', 'deeplake', '')
call s:HL('hsBoolean', 'deeplake', '')
call s:HL('hsExitCode', 'deeplake', '')
call s:HL('hsOrdering', 'deeplake', '')
call s:HL('hsDebug', 'deeplake', '')

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'darkestnight', 'bg', 'none')
call s:HL('htmlEndTag', 'darkestnight', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'stainonsnow', '', 'bold')
call s:HL('htmlSpecialTagName', 'stainonsnow', '', 'bold')
call s:HL('htmlSpecialChar',    'crystallake',   '', 'none')

" Attributes
call s:HL('htmlArg', 'stainonsnow', '', 'none')

" Stuff inside an <a> tag

if g:laederon_html_link_underline
    call s:HL('htmlLink', 'wetcoldterrain', '', 'underline')
else
    call s:HL('htmlLink', 'wetcoldterrain', '', 'none')
endif

" }}}
" Java {{{

call s:HL('javaClassDecl', 'wintrygray', '', 'bold')
call s:HL('javaScopeDecl', 'wintrygray', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'wetcoldterrain', '', 'none')
call s:HL('javaDocParam', 'raspberry', '', '')

" }}}
" Javascript {{{

call s:HL('javascriptStatement', 'raspberry', '', '')
call s:HL('javaScriptStringD', 'deepgravel', '')
call s:HL('javaScriptStringS', 'deepgravel', '')
call s:HL('javaScriptBoolean', 'oakleaf', '')
call s:HL('javaScriptNull', 'darkbark', '')
call s:HL('javaScriptFunction', 'coldsky', '')
call s:HL('javaScriptIdentifier', 'tundrariver', '')
call s:HL('javaScriptBranch', 'coldsky', '')
call s:HL('javaScriptConditional', 'raspberry', '', 'bold')

" }}}
" Json {{{

call s:HL('jsonString', 'stainonsnow', '', '')
call s:HL('jsonNumber', 'wetcoldterrain', '', '')
call s:HL('jsonBoolean', 'oakleaf', '', '')
call s:HL('jsonNull', 'wintrygray', '', 'bold')

" }}}
" LaTex {{{

call s:HL('textStatement', 'wintrygray', '', 'none')
call s:HL('texMathZoneX', 'stainonsnow', '', 'none')
call s:HL('texMathZoneA', 'stainonsnow', '', 'none')
call s:HL('texMathZoneB', 'stainonsnow', '', 'none')
call s:HL('texMathZoneC', 'stainonsnow', '', 'none')
call s:HL('texMathZoneD', 'stainonsnow', '', 'none')
call s:HL('texMathZoneE', 'stainonsnow', '', 'none')
call s:HL('texMathZoneV', 'stainonsnow', '', 'none')
call s:HL('texMathZoneX', 'stainonsnow', '', 'none')
call s:HL('texMath', 'stainonsnow', '', 'none')
call s:HL('texMathMatcher', 'stainonsnow', '', 'none')
call s:HL('texRefLabel', 'wetcoldterrain', '', 'none')
call s:HL('texRefZone', 'crystallake', '', 'none')
call s:HL('texComment', 'raspberry', '', 'none')
call s:HL('texDelimiter', 'stainonsnow', '', 'none')
call s:HL('texZone', 'gravel', '', 'none')

augroup laederon_tex 
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'crystallake', '', 'none')

" }}}
" Lua {{{

call s:HL('luaFunc', 'stainonsnow', '')
call s:HL('luaStatement', 'raspberry', '')
call s:HL('luaConstant', 'darkbark', '', 'bold')

" }}}
" Mail {{{

call s:HL('mailSubject', 'trunk', '', 'bold')
call s:HL('mailHeader', 'wetcoldterrain', '', '')
call s:HL('mailHeaderKey', 'wetcoldterrain', '', '')
call s:HL('mailHeaderEmail', 'stainonsnow', '', '')
call s:HL('mailURL', 'dilutedpaint', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')

call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'tundrariver', '', 'none')
call s:HL('mailQuoted3', 'stainonsnow', '', 'none')
call s:HL('mailQuoted4', 'darkestnight', '', 'none')
call s:HL('mailQuoted5', 'dilutedpaint', '', 'none')
call s:HL('mailQuoted6', 'darkgravel', '', 'none')

" }}}
" Mailcap {{{

call s:HL('mailcapTypeField', 'darkestnight', '')
call s:HL('mailcapFlag', 'stainonsnow', '')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'wetcoldterrain', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'wetcoldterrain', '', 'bold')
call s:HL('markdownOrderedListMarker', 'stainonsnow', '', 'bold')
call s:HL('markdownListMarker', 'stainonsnow', '', 'bold')
call s:HL('markdownItalic', 'crystallake', '', '')
call s:HL('markdownBold', 'raspberry', '', 'bold')
call s:HL('markdownH1', 'oakleaf', '', 'bold')
call s:HL('markdownH2', 'raspberry', '', 'bold')
call s:HL('markdownH3', 'raspberry', '', 'none')
call s:HL('markdownH4', 'raspberry', '', 'none')
call s:HL('markdownH5', 'raspberry', '', 'none')
call s:HL('markdownH6', 'raspberry', '', 'none')
call s:HL('markdownIdDeclaration', 'dilutedpaint')
call s:HL('markdownAutomaticLink', 'dilutedpaint', '', 'bold')
call s:HL('markdownUrl', 'dilutedpaint', '', 'bold')
call s:HL('markdownUrlDelimiter', 'wetcoldterrain', '', 'bold')
call s:HL('markdownLinkText', 'raspberry', '', 'underline')
call s:HL('markdownLinkDelimiter', 'wetcoldterrain', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'wetcoldterrain', '', 'bold')
call s:HL('markdownCodeDelimiter', 'darkbark', '', 'bold')
call s:HL('markdownCode', 'darkbark', '', 'none')
call s:HL('markdownCodeBlock', 'darkbark', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'coldsky', '', 'bold')

" }}}
" Neovim {{{

call s:HL('EndOfBuffer', 'darkbark', '')
call s:HL('TermCursor', 'oakleaf', '')
call s:HL('TermCursorNC', 'darkbark', '')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'stainonsnow')
call s:HL('pythonBuiltinObj',  'stainonsnow')
call s:HL('pythonBuiltinFunc', 'stainonsnow')
call s:HL('pythonEscape',      'stainonsnow')
call s:HL('pythonException',   'coldsky', '', 'bold')
call s:HL('pythonExceptions',  'coldsky', '', 'none')
call s:HL('pythonPrecondit',   'coldsky', '', 'none')
call s:HL('pythonInclude',	   'wintrygray', '', 'none')
call s:HL('pythonDecorator',   'wintrygray', '', 'none')
call s:HL('pythonRun',         'gravel', '', 'bold')
call s:HL('pythonCoding',      'gravel', '', 'bold')
call s:HL('pythonString',	   'raspberry', '', 'none')
call s:HL('pythonStatement',   'oakleaf', '', 'bold')
call s:HL('pythonFunction',		'lichen', '', 'none')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'trunk')
call s:HL('hlLevel2', 'lichen')
call s:HL('hlLevel3', 'coldsky')
call s:HL('hlLevel4', 'stainonsnow')
call s:HL('hlLevel5', 'tundrariver')
call s:HL('hlLevel6', 'trunk')
call s:HL('hlLevel7', 'lichen')
call s:HL('hlLevel8', 'coldsky')
call s:HL('hlLevel9', 'stainonsnow')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'wetcoldterrain', '', 'bold')

call s:HL('VimMapMod',    'wintrygray', '', 'none')
call s:HL('VimMapModKey', 'wintrygray', '', 'none')
call s:HL('VimNotation', 'wintrygray', '', 'none')
call s:HL('VimBracket', 'wintrygray', '', 'none')

endif
" }}}
