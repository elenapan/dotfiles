" bluedrake.vim
"
" Designer: Michael Malick
" Version:  0.08


hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bluedrake"
" let g:bluedrake_256 = 1

if has("gui_running") 
    let s:base00 = "002d49"
    let s:base01 = "003951" 
    let s:base10 = "2f5468"
    let s:base11 = "b4c3cf"
    let s:base20 = "577284"
    let s:base21 = "8ea2b0"
    let s:base30 = "dae6f0"
    let s:base31 = "edf8ff"

    if &background=="dark"
        let s:baseback0  = s:base00
        let s:baseback1  = s:base01
        let s:basecolor0 = s:base10
        let s:basecolor1 = s:base11
        let s:basecolor2 = s:base20
        let s:basecolor3 = s:base21
        let s:basefore0  = s:base30
        let s:basefore1  = s:base31
    endif

    if &background=="light"
        let s:baseback0  = s:base31
        let s:baseback1  = s:base30
        let s:basecolor0 = s:base11
        let s:basecolor1 = s:base10
        let s:basecolor2 = s:base21
        let s:basecolor3 = s:base20
        let s:basefore0  = s:base00
        let s:basefore1  = s:base01
    endif

    " Multi-color palette (hue)
    let s:blue    = "0094d4"
    let s:red     = "d75a69"
    let s:orange  = "b67800"
    let s:yellow  = "768f00"
    let s:green   = "009e3c"
    let s:cyan    = "00a39a"
    let s:purple  = "976ce2"
    let s:magenta = "d74bb9"

    function! <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg 
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr 
        endif
    endfunction
endif


if !has("gui_running")
    if !exists("g:bluedrake_256")
        let s:base00  = "0"
        let s:base01  = "8"
        let s:base10  = "11"
        let s:base11  = "12"
        let s:base20  = "9"
        let s:base21  = "14"
        let s:base30  = "7"
        let s:base31  = "15"
        let s:blue    = "4"
        let s:red     = "1"
        let s:orange  = "10"
        let s:yellow  = "3"
        let s:green   = "2"
        let s:cyan    = "6"
        let s:purple  = "13"
        let s:magenta = "5"
    endif

    if exists("g:bluedrake_256")
        let s:base00  = "235"
        let s:base01  = "236"
        let s:base10  = "24"
        let s:base11  = "110"
        let s:base20  = "242"
        let s:base21  = "247"
        let s:base30  = "253"
        let s:base31  = "254"
        let s:blue    = "32"
        let s:red     = "167"
        let s:orange  = "136"
        let s:yellow  = "100"
        let s:green   = "28"
        let s:cyan    = "37"
        let s:purple  = "99"
        let s:magenta = "170"
    endif

    if &background=="dark"
        let s:baseback0  = s:base00
        let s:baseback1  = s:base01
        let s:basecolor0 = s:base10
        let s:basecolor1 = s:base11
        let s:basecolor2 = s:base20
        let s:basecolor3 = s:base21
        let s:basefore0  = s:base30
        let s:basefore1  = s:base31
    endif

    if &background=="light"
        let s:baseback0  = s:base31
        let s:baseback1  = s:base30
        let s:basecolor0 = s:base11
        let s:basecolor1 = s:base10
        let s:basecolor2 = s:base21
        let s:basecolor3 = s:base20
        let s:basefore0  = s:base00
        let s:basefore1  = s:base01
    endif

    function! <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group .  " ctermfg=" . a:fg
        endif
        if a:bg != ""
            exec "hi " . a:group . " ctermbg=" . a:bg
        endif
        if a:attr != ""
            exec "hi " . a:group . " cterm=" . a:attr
        endif
    endfunction
endif


" Vim highlighting
call <SID>X("Normal", s:blue, s:baseback0, "")
call <SID>X("Cursor", s:baseback1, s:basecolor3, "")
call <SID>X("CursorLineNr", s:basecolor1, s:baseback1, "none")
call <SID>X("LineNr", s:basecolor2, s:baseback1, "")
call <SID>X("NonText", s:basecolor3, "", "none")
call <SID>X("SpecialKey", s:basecolor3, "", "")
call <SID>X("Search", s:baseback1, s:orange, "")
call <SID>X("IncSearch", s:magenta, s:baseback1, "")
call <SID>X("TabLine", s:baseback1, s:basecolor1, "none")
call <SID>X("TabLineSel", s:basecolor1, s:baseback0, "")
call <SID>X("TabLineFill", s:basecolor1, s:blue, "reverse")
call <SID>X("StatusLine", s:basecolor1, s:baseback0, "reverse")
call <SID>X("StatusLineNC", s:basecolor2, s:baseback0, "reverse")
call <SID>X("VertSplit", s:basecolor2, s:basecolor2, "none")
call <SID>X("Visual", s:baseback1, s:basecolor1, "")
call <SID>X("Directory", s:cyan, "", "")  
call <SID>X("ModeMsg", s:green, "", "")
call <SID>X("MoreMsg", s:green, "", "")
call <SID>X("Question", s:green, "", "")
call <SID>X("WarningMsg", s:red, "", "")
call <SID>X("ErrorMsg", s:basefore0, s:red, "")
call <SID>X("Error", s:basefore0, s:red, "")
call <SID>X("MatchParen", s:baseback1, s:magenta, "")
call <SID>X("FoldColumn", s:basecolor0, s:baseback0, "")
call <SID>X("vimCommand", s:magenta, "", "none")
call <SID>X("DiffText", s:green, s:baseback1, "none")
call <SID>X("DiffChange", s:orange, s:baseback1, "none")
call <SID>X("DiffAdd", s:cyan, s:baseback1, "none")
call <SID>X("DiffDelete", s:red, s:baseback1, "none")
call <SID>X("WildMenu", s:basecolor1, s:baseback1, "none")
if version >= 700
    call <SID>X("CursorLine", "", s:baseback1, "none")
    call <SID>X("CursorColumn", "", s:basecolor0, "none")
    call <SID>X("Folded", s:basecolor3, s:baseback0, "")
    " call <SID>X("Folded", s:basecolor2, s:baseback0, "")
    call <SID>X("PMenu", s:baseback1, s:basecolor1, "none")
    call <SID>X("PMenuSel", s:basefore0, s:basecolor0, "")
    call <SID>X("PMenuThumb", s:basecolor2, s:basecolor0, "")
    call <SID>X("SignColumn", s:basecolor0, s:baseback0, "")
endif
if version >= 703
    call <SID>X("ColorColumn", "", s:baseback1, "none")
    call <SID>X("Conceal", s:blue, s:baseback0, "")
endif


" Standard highlighting
call <SID>X("Todo", s:purple, s:baseback0, "none")
call <SID>X("Title", s:red, "", "none")
call <SID>X("Identifier", s:magenta, "", "none")
call <SID>X("Statement", s:yellow, "", "none")
call <SID>X("Conditional", s:blue, "", "none")
call <SID>X("Repeat", s:magenta, "", "none")
call <SID>X("Structure", s:purple, "", "none")
call <SID>X("Function", s:cyan, "", "none")
call <SID>X("Constant", s:red, "", "none")
call <SID>X("Special", s:cyan, "", "none")
call <SID>X("PreProc", s:purple, "", "none")
call <SID>X("Operator", s:cyan, "", "none")
call <SID>X("Type", s:orange, "", "none")
call <SID>X("Define", s:purple, "", "none")
call <SID>X("Include", s:red, "", "none")
call <SID>X("Underlined", s:purple, s:baseback0, "underline")


" Terminal and GUI differences (no italics in mac terminal)
if has("gui_running")
    call <SID>X("String", s:green, "", "italic")
    call <SID>X("Comment", s:basecolor2, "", "italic")
else
    call <SID>X("String", s:green, "", "")
    call <SID>X("Comment", s:basecolor2, "", "")
    call <SID>X("SpellBad", s:red, s:baseback0, "")
endif



" Pandoc
call <SID>X("pandocYAMLHeader", s:orange, "", "")
call <SID>X("pandocAtxHeader", s:orange, "", "")
call <SID>X("pandocSetexHeader", s:orange, "", "")
call <SID>X("pandocAtxStart", s:orange, "", "")

call <SID>X("pandocListItemBullet", s:basecolor3, "", "")
call <SID>X("pandocUListItemBullet", s:basecolor3, "", "")
call <SID>X("pandocListItemBulletId", s:basecolor3, "", "")

call <SID>X("pandocPCite", s:purple, "", "")
call <SID>X("pandocICite", s:purple, "", "")
call <SID>X("pandocCiteAnchor", s:purple, "", "")
call <SID>X("pandocCiteKey", s:purple, "", "")
call <SID>X("pandocCiteLocator", s:cyan, "", "")

call <SID>X("pandocDelimitedCodeBlockLanguage", s:basecolor3, "", "")
call <SID>X("pandocDelimitedCodeBlockStart", s:basecolor3, "", "")
call <SID>X("pandocDelimitedCodeBlockEnd", s:basecolor3, "", "")

call <SID>X("pandocReferenceLabel", s:purple, "", "") " wrapped citations
call <SID>X("pandocReferenceURL", s:red, "", "")
