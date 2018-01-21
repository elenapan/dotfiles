" Vim colorscheme
" Author:  Gary Willoughby 
" Version: 1.3
" Date:    24th September 2012

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "EditPlus"

" GUI
hi Blank                           guibg=white   guifg=white   gui=none
hi Normal                          guibg=white   guifg=black   gui=none
hi Cursor                          guibg=#555555               gui=none
hi CursorLine                      guibg=#E8E8E8               gui=none
hi CursorLineNr                    guibg=#696969 guifg=white   gui=none
hi Directory                       guibg=bg      guifg=blue    gui=none
hi FoldColumn                      guibg=#696969 guifg=white   gui=none
hi Folded                          guibg=#E8E8E8 guifg=#808080 gui=none
hi LineNr                          guibg=#696969 guifg=white   gui=none
hi VertSplit                       guibg=#D4D0C8 guifg=white   gui=none
hi ErrorMsg                        guibg=bg      guifg=red     gui=none
hi MatchParen                      guibg=#A6CAF0 guifg=black   gui=none
hi StatusLine                      guibg=#D4D0C8 guifg=black   gui=none
hi StatusLineNC                    guibg=#D4D0C8 guifg=black   gui=italic
hi Title                           guibg=bg      guifg=black   gui=none
hi Visual                          guibg=#316AC5 guifg=white   gui=none
hi WarningMsg                      guibg=bg      guifg=red     gui=none
hi! link SignColumn                CursorLine

" Popup menus
hi Pmenu                           guibg=#E5E1CB guifg=#756D5B gui=none
hi PmenuSbar                       guibg=#B99F86 guifg=fg      gui=none
hi PmenuSel                        guibg=#316AC5 guifg=white   gui=none
hi PmenuThumb                      guibg=#756D5B guifg=bg      gui=none
hi WildMenu                        guibg=#94DE9E guifg=#2A2A2A gui=none

" Diff
hi DiffChange                      guibg=bg                    gui=none
hi DiffAdd                         guibg=#8AC38A guifg=white   gui=none
hi DiffDelete                      guibg=#b27272 guifg=white   gui=none
hi DiffText                        guibg=#008FFF guifg=white   gui=none 
 
" Search
hi Search                          guibg=#316AC5 guifg=white  gui=none
hi IncSearch                       guibg=#316AC5 guifg=white  gui=none

" Spelling
if has("spell")
    hi SpellBad                    guibg=bg      guifg=red    gui=undercurl
    hi SpellCap                    guibg=bg      guifg=red    gui=undercurl
    hi SpellLocal                  guibg=bg      guifg=red    gui=undercurl
    hi SpellRare                   guibg=bg      guifg=red    gui=undercurl
endif

" Syntax
hi Comment                         guibg=bg      guifg=#008000 gui=italic
hi ToDo                            guibg=bg      guifg=#008000 gui=italic
hi Constant                        guibg=bg      guifg=#008000 gui=none
hi Statement                       guibg=bg      guifg=blue    gui=none
hi StatementU                      guibg=bg      guifg=blue    gui=none
hi Keyword                         guibg=bg      guifg=blue    gui=none
hi Underlined                      guibg=bg      guifg=fg      gui=underline
hi Error                           guibg=red     guifg=white   gui=none
hi String                          guibg=bg      guifg=#FF00FF gui=none
hi Character                       guibg=bg      guifg=#FF00FF gui=none
hi Number                          guibg=bg      guifg=#FF00FF gui=none
hi Boolean                         guibg=bg      guifg=blue    gui=none
hi Float                           guibg=bg      guifg=#FF00FF gui=none
hi Identifier                      guibg=bg      guifg=#800000 gui=none
hi Function                        guibg=bg      guifg=blue    gui=none
hi Operator                        guibg=bg      guifg=#800000 gui=none
hi Preproc                         guibg=bg      guifg=blue    gui=none
hi Type                            guibg=bg      guifg=red     gui=none
hi Special                         guibg=bg      guifg=fg      gui=none
hi StorageClass                    guibg=bg      guifg=blue    gui=none
hi Question                        guibg=bg      guifg=#2E8B57 gui=none

" Whitespace
hi SpecialKey                      guibg=bg      guifg=#CCCCCC gui=none
hi NonText                         guibg=bg      guifg=#CCCCCC gui=none

" HTML
hi htmlnone                        guibg=bg      guifg=fg      gui=none
hi htmlItalic                      guibg=bg      guifg=fg      gui=italic
hi htmlUnderline                   guibg=bg      guifg=fg      gui=underline
hi htmlnoneItalic                  guibg=bg      guifg=fg      gui=none,italic
hi htmlnoneUnderline               guibg=bg      guifg=fg      gui=none,underline
hi htmlnoneUnderlineItalic         guibg=bg      guifg=fg      gui=none,underline,italic
hi htmlUnderlineItalic             guibg=bg      guifg=fg      gui=underline,italic
hi! link HTMLString                String
hi! link HTMLTag                   Keyword
hi! link HTMLEndTag                Keyword

" CSS
hi cssValueLength                  guibg=bg      guifg=#800080 gui=none
hi cssValueInteger                 guibg=bg      guifg=#800080 gui=none
hi cssValueNumber                  guibg=bg      guifg=#800080 gui=none
hi cssValueAngle                   guibg=bg      guifg=#800080 gui=none
hi cssValueTime                    guibg=bg      guifg=#800080 gui=none
hi cssValueFrequency               guibg=bg      guifg=#800080 gui=none
hi cssFunctionName                 guibg=bg      guifg=red     gui=none
hi cssColor                        guibg=bg      guifg=#800080 gui=none
hi cssImportant                    guibg=bg      guifg=red     gui=none
hi! link cssComment                Comment
hi! link cssTagName                Normal
hi! link cssSelectorOp             Normal
hi! link cssSelectorOp2            Normal
hi! link cssFontProp               Keyword
hi! link cssColorProp              Keyword
hi! link cssTextProp               Keyword
hi! link cssBoxProp                Keyword
hi! link cssRenderProp             Keyword
hi! link cssAuralProp              Keyword
hi! link cssRenderProp             Keyword
hi! link cssGeneratedContentProp   Keyword
hi! link cssPagingProp             Keyword
hi! link cssTableProp              Keyword
hi! link cssUIProp                 Keyword
hi! link cssFontAttr               Type
hi! link cssColorAttr              Type
hi! link cssTextAttr               Type
hi! link cssBoxAttr                Type
hi! link cssRenderAttr             Type
hi! link cssAuralAttr              Type
hi! link cssGeneratedContentAttr   Type
hi! link cssPagingAttr             Type
hi! link cssTableAttr              Type
hi! link cssUIAttr                 Type
hi! link cssCommonAttr             Type
hi! link cssPseudoClassId          Normal
hi! link cssPseudoClassLang        Normal
hi! link cssFunction               Normal
hi! link cssURL                    String
hi! link cssIdentifier             Normal
hi! link cssInclude                Normal
hi! link cssBraces                 Normal
hi! link cssBraceError             Error
hi! link cssError                  Error
hi! link cssUnicodeEscape          String
hi! link cssStringQQ               String
hi! link cssStringQ                String
hi! link cssMedia                  Normal
hi! link cssMediaType              Normal
hi! link cssMediaComma             Normal
hi! link cssFontDescriptor         Normal
hi! link cssFontDescriptorFunction Normal
hi! link cssFontDescriptorProp     Keyword
hi! link cssFontDescriptorAttr     Normal
hi! link cssUnicodeRange           String
hi! link cssClassName              Normal

" Tlist
hi! link MyTagListComment          Comment
hi! link MyTagListFileName         Directory
hi! link MyTagListTitle            Type
hi! link MyTagListTagName          CursorLine
hi! link MyTagListTagScope         Comment

" NERDTree
hi! link NERDTreePart              NonText
hi! link NERDTreePartFile          NonText
hi! link NERDTreeFile              Normal
hi! link NERDTreeExecFile          Normal
hi! link NERDTreeDirSlash          Blank
hi! link NERDTreeClosable          NonText
hi! link NERDTreeBookmarksHeader   Statement
hi! link NERDTreeBookmarksLeader   Blank
hi! link NERDTreeBookmarkName      Normal
hi! link NERDTreeBookmark          Blank
hi! link NERDTreeHelp              Comment
hi! link NERDTreeHelpKey           Comment
hi! link NERDTreeHelpCommand       Identifier
hi! link NERDTreeHelpTitle         Normal
hi! link NERDTreeToggleOn          Type
hi! link NERDTreeToggleOff         Type
hi! link NERDTreeDir               Directory
hi! link NERDTreeUp                Type
hi! link NERDTreeCWD               Comment
hi! link NERDTreeLink              Normal
hi! link NERDTreeOpenable          NonText
hi! link NERDTreeFlag              Blank
hi! link NERDTreeRO                Normal
hi! link NERDTreeCurrentNode       Normal

" CtrlP
hi! link CtrlPNoEntries ErrorMsg
hi! link CtrlPMatch     IncSearch
hi! link CtrlPLinePre   NonText
hi! link CtrlPPrtBase   Comment
hi! link CtrlPPrtText   Function
hi! link CtrlPPrtCursor PmenuSel
hi! link CtrlPTabExtra  Comment
hi! link CtrlPBufName   Function
hi! link CtrlPTagKind   Type
hi! link CtrlPqfLineCol Comment
hi! link CtrlPUndoT     Normal
hi! link CtrlPUndoBr    Normal
hi! link CtrlPUndoNr    Normal
hi! link CtrlPUndoSv    Comment
hi! link CtrlPUndoPo    Comment
hi! link CtrlPBookmark  Identifier
hi! link CtrlPMode1     StatusLine
hi! link CtrlPMode2     StatusLine
hi! link CtrlPStats     Function
