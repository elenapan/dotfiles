" Color scheme based on Molokai by Tomas Restrepo and badwolf by Steve Losh.
"
" Author: Niels Madan
" URL: github.com/nielsmadan/harlequin

hi clear

set background=dark

if exists("syntax_on")
    syntax reset
endif

if !has("gui_running") && &t_Co != 256
    finish
endif

let colors_name = "harlequin"

let s:text = ['#F8F8F2', 15]
let s:text_bg = ['#1C1B1A', 234]

let s:white = ['#FFFFFF', 15]
let s:black = ['#000000', 0]
let s:greys = [['#BEBEBE', 250], ['#808080', 244], ['#696969', 242], ['#545454', 240], ['#343434', 236], ['#080808', 232]]

let s:cerise = ['#FF0033', 197]

let s:lime = ['#AEEE00', 154]

let s:gold = ['#FFB829', 214]

let s:brick = ['#CB4154', 167]

let s:lilac = ['#AE81FF', 141]

let s:frost = ['#2C89C7', 68] 

let s:sunny = ['#FFFC7F', 228]

let s:mordant = ['#AE0C00', 124]

let s:auburn = ['#7C0A02', 88]
let s:moss = ['#004225', 22]

" pass empty string for defaults: guifg - fg, guibg - bg, gui - none, guisp - fg
function! s:Highlight(group_name, guifg, guibg, gui, guisp)
    if !empty(a:guifg)
        let guifg = a:guifg
    else
        let guifg = ['fg', 'fg']
    endif
    if !empty(a:guibg)
        let guibg = a:guibg
    else
        let guibg = ['bg', 'bg']
    endif
    if !empty(a:gui)
        let gui = a:gui
    else
        let gui = 'none'
    endif
    if !empty(a:guisp)
        let guisp = a:guisp
    else
        let guisp = ['fg', 'fg']
    endif

    if has("gui_running")
        exe 'hi ' . a:group_name . ' guifg=' . guifg[0] . ' guibg=' . guibg[0] . ' gui=' . gui . ' guisp=' . guisp[0]
    else
        exe 'hi ' . a:group_name . ' ctermfg=' . guifg[1] . ' ctermbg=' . guibg[1] . ' cterm=' . gui
    endif
endfunction

" Function without defaults.
function! s:HighlightX(group_name, guifg, guibg, gui, guisp)
    if empty(a:guifg) && empty(a:guibg) && empty(a:gui) && !has("gui_running")
        return
    endif

    let hi_str = 'hi ' . a:group_name

    if !empty(a:guifg)
        if has("gui_running")
            let hi_str = hi_str . ' guifg=' . a:guifg[0]
        else
            let hi_str = hi_str . ' ctermfg=' . a:guifg[1]
        endif
    endif

    if !empty(a:guibg)
        if has("gui_running")
            let hi_str = hi_str . ' guibg=' . a:guibg[0]
        else
            let hi_str = hi_str . ' ctermbg=' . a:guibg[1]
        endif
    endif

    if !empty(a:gui)
        if has("gui_running")
            let hi_str = hi_str . ' gui=' . a:gui
        else
            let hi_str = hi_str . ' cterm=' . a:gui
        endif
    endif

    if !empty(a:guisp) && has("gui_running")
        let hi_str = hi_str . ' guisp=' . a:guisp[0]
    endif

    exe hi_str
endfunction

call s:Highlight('Normal', s:text, s:text_bg, '', '')

call s:Highlight('Statement',   s:cerise, '', 'bold', '')
call s:Highlight('Keyword',     s:cerise, '', 'bold', '')
call s:Highlight('Conditional', s:cerise, '', 'bold', '')
call s:Highlight('Operator',    s:cerise, '', '', '')
call s:Highlight('Label',       s:cerise, '', '', '')
call s:Highlight('Repeat',      s:cerise, '', 'bold', '')

call s:Highlight('Type',            s:brick, '', '', '')
call s:Highlight('StorageClass',    s:cerise, '', '', '')
call s:Highlight('Structure',       s:cerise, '', '', '')
call s:Highlight('TypeDef',         s:cerise, '', 'bold', '')

call s:Highlight('Exception',       s:lime, '', 'bold', '')
call s:Highlight('Include',         s:lime, '', 'bold', '')

call s:Highlight('PreProc',         s:lime, '', '', '')
call s:Highlight('Macro',           s:lime, '', '', '')
call s:Highlight('Define',          s:lime, '', '', '')
call s:Highlight('Delimiter',       s:lime, '', '', '')
call s:Highlight('Ignore',          s:lime, '', '', '')
call s:Highlight('PreCondit',       s:lime, '', 'bold', '')
call s:Highlight('Debug',           s:lime, '', 'bold', '')

call s:Highlight('Function',        s:gold, '', '', '')
call s:Highlight('Identifier',      s:gold, '', '', '')

call s:Highlight('Comment',         s:frost, '', '', '')
call s:Highlight('CommentEmail',    s:frost, '', 'underline', '')
call s:Highlight('CommentUrl',      s:frost, '', 'underline', '')
call s:Highlight('SpecialComment',  s:frost, '', 'bold', '')
call s:Highlight('Todo',            s:frost, '', 'bold', '')

call s:Highlight('String',          s:sunny, '', '', '') 
call s:Highlight('SpecialKey',      s:lilac, '', 'bold', '')
call s:Highlight('Special',         s:lilac, '', 'bold', '')
call s:Highlight('SpecialChar',     s:lilac, '', 'bold', '')

call s:Highlight('Boolean',         s:lilac, '', 'bold', '')
call s:Highlight('Character',       s:lilac, '', 'bold', '')
call s:Highlight('Number',          s:lilac, '', 'bold', '')
call s:Highlight('Constant',        s:lilac, '', 'bold', '')
call s:Highlight('Float',           s:lilac, '', 'bold', '')

call s:Highlight('FoldColumn',      s:greys[1], s:black, '', '')
call s:Highlight('Folded',          s:greys[1], s:black, '', '')

call s:Highlight('MatchParen',      s:black, s:gold, 'bold', '')

call s:Highlight('LineNr',          s:greys[2], '', '', '')
call s:Highlight('NonText',         s:greys[2], '', '', '')
call s:HighlightX('CursorColumn',   '', s:greys[5], '', '')
call s:HighlightX('CursorLine',     '', s:greys[5], '', '')
call s:Highlight('SignColumn',      '', s:greys[5], '', '')
call s:HighlightX('ColorColumn',    '', s:greys[5], '', '')

call s:Highlight('Error',           s:mordant, s:greys[5], 'bold', '')
call s:Highlight('ErrorMsg',        s:mordant, '', 'bold', '')
call s:Highlight('WarningMsg',      s:mordant, '', '', '')

call s:Highlight('Cursor',          s:greys[5], s:white, '', '')
call s:Highlight('vCursor',         s:greys[5], s:white, '', '')
call s:Highlight('iCursor',         s:greys[5], s:white, '', '')

call s:Highlight('StatusLine',      s:white, s:black, 'bold', '')
call s:Highlight('StatusLineNC',    s:greys[1], s:greys[5], 'bold', '')
call s:Highlight('VertSplit',       s:greys[1], s:greys[5], 'bold', '')

call s:Highlight('ModeMsg',         s:sunny, '', 'bold', '')

if has("spell")
    call s:HighlightX('SpellBad',    '', '', 'undercurl', s:mordant)
    call s:HighlightX('SpellCap',    '', '', 'undercurl', s:auburn)
    call s:HighlightX('SpellLocal',  '', '', 'undercurl', s:auburn)
    call s:HighlightX('SpellRare',   '', '', 'undercurl', s:white)
endif

call s:HighlightX('VisualNOS',      '', s:greys[4], '', '')
call s:HighlightX('Visual',         '', s:greys[4], '', '')
call s:Highlight('Search',          s:black, s:frost, '', '')
call s:Highlight('IncSearch',       s:black, s:sunny, '', '')

call s:Highlight('Pmenu',           s:black, s:gold, '', '')
call s:Highlight('PmenuSel',        s:gold, s:black, 'bold', '')
call s:Highlight('Pmenu',           '', s:greys[5], '', '')
call s:Highlight('Pmenu',           s:frost, '', '', '')

call s:HighlightX('DiffDelete',     s:auburn, s:auburn, '', '')
call s:HighlightX('DiffText',       '', s:greys[3], '', '')
call s:HighlightX('DiffChange',     '', s:greys[4], '', '')
call s:HighlightX('DiffAdd',        '', s:moss, '', '')

call s:HighlightX('Underlined',     '', '', 'underline', '')

call s:Highlight('Directory',       s:lime, '', '', '')
call s:Highlight('Question',        s:lime, '', '', '')
call s:Highlight('MoreMsg',         s:lime, '', '', '')
  
call s:Highlight('WildMenu',        s:black, s:lilac, 'bold', '')

call s:Highlight('Title',           '', '', 'underline', '')

call s:HighlightX('Tag',            '', '', 'bold', '')

"*** PYTHON ***
call s:Highlight('pythonDecorator',     s:cerise, '', '', '')
call s:Highlight('pythonException',     s:lime, '', 'bold', '')
call s:Highlight('pythonExceptions',    s:lime, '', '', '')

"*** RUBY ***
call s:Highlight('rubyModule',            s:lime, '', '', '')
call s:Highlight('rubyModuleNameTag',     s:text, '', '', '')
call s:Highlight('rubyPseudoVariable',    s:text, '', '', '')
call s:Highlight('rubyClass',             s:cerise, '', '', '')
call s:Highlight('rubyClassNameTag',      s:gold, '', '', '')
call s:Highlight('rubyDefine',            s:cerise, '', '', '')
call s:Highlight('rubyConstant',          s:text, '', '', '')
call s:Highlight('rubyStringDelimiter',   s:sunny, '', '', '')
call s:Highlight('rubyInterpolation',     s:lilac, '', '', '')
call s:Highlight('rubyInterpolationDelimiter',     s:lilac, '', '', '')

"*** JAVASCRIPT ***
call s:Highlight('javaScriptNull',        s:lilac, '', 'bold', '')
call s:Highlight('javaScriptNumber',      s:lilac, '', 'bold', '')
call s:Highlight('javaScriptFunction',    s:cerise, '', '', '')
call s:Highlight('javaScriptOperator',    s:cerise, '', 'bold', '')
call s:Highlight('javaScriptBraces',      s:text, '', '', '')
call s:Highlight('javaScriptIdentifier',  s:brick, '', '', '')
call s:Highlight('javaScriptMember',      s:gold, '', '', '')
call s:Highlight('javaScriptType',        s:gold, '', '', '')

"*** CLOJURE ***
call s:Highlight('clojureDefine',         s:cerise, '', '', '')
call s:Highlight('clojureSpecial',        s:cerise, '', '', '')
call s:Highlight('clojureCond',           s:cerise, '', '', '')
call s:Highlight('clojureParen0',         s:text, '', '', '')
call s:Highlight('clojureMacro',          s:lime, '', 'bold', '')
call s:Highlight('clojureDispatch',       s:lilac, '', 'bold', '')
call s:Highlight('clojureError',          s:black, s:mordant, 'bold', '')

"*** SCALA ***
call s:Highlight('scalaClassName',        s:gold, '', '', '')
call s:Highlight('scalaConstructor',      s:text, '', '', '')

"*** VIMSCRIPT ***
call s:Highlight('vimCommentTitle',       s:frost, '', 'bold', '')
call s:Highlight('vimParenSep',           s:text, '', '', '')
call s:Highlight('vimSep',                s:text, '', '', '')
call s:Highlight('vimOper',               s:text, '', '', '')

"*** XML ***
call s:Highlight('xmlProcessingDelim',       s:brick, '', '', '')
call s:Highlight('xmlNamespace',             s:gold, '', '', '')
call s:Highlight('xmlTag',                   s:gold, '', '', '')
call s:Highlight('xmlTagName',               s:gold, '', '', '')
call s:Highlight('xmlEndTag',                s:gold, '', '', '')
call s:Highlight('xmlAttrib',                s:brick, '', '', '')
call s:Highlight('xmlAttribPunct',           s:brick, '', '', '')
call s:Highlight('xmlEntity',                s:lilac, '', 'bold', '')
call s:Highlight('xmlEntityPunct',           s:lilac, '', '', '')

"*** HTML ***
call s:Highlight('htmlTagName',              s:gold, '', '', '')
call s:Highlight('htmlTag',                  s:gold, '', '', '')
call s:Highlight('htmlTagN',                 s:gold, '', '', '')
call s:Highlight('htmlEvent',                s:brick, '', '', '')
call s:Highlight('htmlEventDQ',              s:lime, '', '', '')
call s:Highlight('htmlH1',                   '', '', 'bold', '')
call s:Highlight('htmlH2',                   '', '', 'bold', '')
call s:Highlight('htmlH3',                   '', '', 'italic', '')
call s:Highlight('htmlH4',                   '', '', 'italic', '')
call s:Highlight('htmlScriptTag',            s:lime, '', '', '')

"*** HTML/JAVASCRIPT ***
call s:Highlight('javaScript',               s:text, '', '', '')

"*** CSS ***
call s:Highlight('cssSelectorOp',            s:text, '', '', '')
call s:Highlight('cssSelectorOp2',           s:text, '', '', '')
call s:Highlight('cssBraces',                s:text, '', '', '')
call s:Highlight('cssPseudoClass',           s:lime, '', '', '')
call s:Highlight('cssValueNumber',           s:lilac, '', '', '')
call s:Highlight('cssValueLength',           s:lilac, '', '', '')
call s:Highlight('cssColor',                 s:lilac, '', '', '')
call s:Highlight('cssImportant',             s:lime, '', 'bold', '')
call s:Highlight('cssCommonAttr',            s:lilac, '', 'bold', '')
call s:Highlight('cssRenderAttr',            s:lilac, '', 'bold', '')
call s:Highlight('cssBoxAttr',               s:lilac, '', 'bold', '')
call s:Highlight('cssUIAttr',                s:lilac, '', 'bold', '')
call s:Highlight('cssTextAttr',              s:lilac, '', 'bold', '')
call s:Highlight('cssTableAttr',             s:lilac, '', 'bold', '')
call s:Highlight('cssColorAttr',             s:lilac, '', 'bold', '')

"*** minibufexpl ***
call s:Highlight('MBENormal',                 s:greys[1], '', '', '')
call s:Highlight('MBEVisibleNormal',          s:white, '', 'bold', '')
call s:Highlight('MBEVisibleActive',          s:frost, '', 'bold', '')
call s:Highlight('MBEChanged',                s:greys[1], '', 'italic', '')
call s:Highlight('MBEVisibleChanged',         s:white, '', 'bold,italic', '')
call s:Highlight('MBEVisibleChangedActive',   s:frost, '', 'bold,italic', '')

"*** vim-easymotion ***
call s:Highlight('EasyMotionTarget',          s:cerise, '', 'bold', '')
call s:Highlight('EasyMotionShade',           s:greys[2], '', '', '')

"*** CtrlP ***
call s:Highlight('CtrlPNoEntries',            s:mordant, '', '', '')
call s:Highlight('CtrlPPrtBase',              '', '', 'bold', '')

"*** taglist.vim ***
call s:Highlight('TagListTitle',              s:white, '', 'bold', '')
call s:Highlight('TagListFileName',           s:brick, '', '', '')
