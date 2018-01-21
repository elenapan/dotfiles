" Vim Color File
" Name:       pencil.vim
" Version:    0.6
" Maintainer: github.com/reedes github.com/mattly
" License:    The MIT License (MIT)

" Original iA Writer colors, to use as a guide
" White           #F1F1F1
" OffWhiteIPad    #F5F2EC
" OffWhiteDemo    #F9F8F4
" Cursor          #20BBFC
" Selection       #B6D6FD
" SelectionNOS    #D4D4D4
" StatusBar       #EDEDED
" StatusBarBorder #D9D9D9   used for search too
" Text            #424242
" Blue            #B5D6FD
" Green           #30C798
" Blue2           #1DAEE4
" gray            #999999
" Red             #E32791
" UnfocusedText   #B8B8B8
" MenuSelected    #2C81FB
" MenuUnSelected  #545454
" MenuText        #F1F1F1
" LightKeyBg      #4B4B4B
" DarkKeyBg       #262626
" NearBlack       #181818
" SyntaxButton    #363738
" SearchHighlight #F3E430  yellow

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='pencil'

if ! exists("g:pencil_higher_contrast_ui")
  let g:pencil_higher_contrast_ui = 0
endif

if ! exists("g:pencil_neutral_code_bg")
  let g:pencil_neutral_code_bg = 0
endif

if ! exists("g:pencil_neutral_headings")
  let g:pencil_neutral_headings = 0
endif

" not all terminals support italics properly.  If yours does, opt-in.
if ! exists("g:pencil_terminal_italics")
  let g:pencil_terminal_italics = 0
endif

if ! exists("g:pencil_spell_undercurl")
  let g:pencil_spell_undercurl = 1
endif

if ! exists("g:pencil_gutter_color")
  let g:pencil_gutter_color = 0
endif

" Colors
let s:black           = { "gui": "#212121", "cterm": "0"   }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }
let s:light_black     = { "gui": "#424242", "cterm": "8"   }
let s:lighter_black   = { "gui": "#545454", "cterm": "240" }

if g:pencil_higher_contrast_ui == 0
  " darker shadow and whiter grays
  let s:subtle_black  = { "gui": "#262626", "cterm": "235" }
  let s:light_gray    = { "gui": "#D9D9D9", "cterm": "253" }
  let s:lighter_gray  = { "gui": "#E5E6E6", "cterm": "254" }
else
  " lighter shadows and darker grays
  let s:subtle_black  = { "gui": "#303030", "cterm": "236" }
  let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249" }
  let s:lighter_gray  = { "gui": "#C6C6C6", "cterm": "251" }
endif

let s:pink            = { "gui": "#fb007a", "cterm": "9"   }
let s:dark_red        = { "gui": "#C30771", "cterm": "1"   }
let s:light_red       = { "gui": "#E32791", "cterm": "1"   }
let s:orange          = { "gui": "#D75F5F", "cterm": "167" }

let s:darker_blue     = { "gui": "#005F87", "cterm": "18"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "4"   }
let s:blue            = { "gui": "#20BBFC", "cterm": "12"  }
let s:light_blue      = { "gui": "#b6d6fd", "cterm": "153" }
let s:dark_cyan       = { "gui": "#20A5BA", "cterm": "6"   }
let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "14"  }

let s:dark_green      = { "gui": "#10A778", "cterm": "2"   }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"  }

let s:dark_purple     = { "gui": "#523C79", "cterm": "5"   }
let s:light_purple    = { "gui": "#6855DE", "cterm": "13"  }

let s:yellow          = { "gui": "#F3E430", "cterm": "11"  }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"   }

if &background == "dark"
  let s:bg              = s:black
  let s:bg_subtle       = s:light_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:light_gray
  let s:purple          = s:light_purple
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:visual          = s:lighter_black
else
  let s:bg              = s:white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lighter_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:lighter_black
  let s:purple          = s:dark_purple
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:visual          = s:light_blue
endif

if g:pencil_neutral_headings == 1
  let s:head_a         = s:norm
  let s:head_b         = s:norm
  let s:head_c         = s:norm
else
  let s:head_a         = s:dark_blue
  let s:head_b         = s:blue
  let s:head_c         = s:dark_cyan
endif

if g:pencil_neutral_code_bg == 1
  let s:code_bg        = s:bg
else
  let s:code_bg        = s:bg_very_subtle
endif

if g:pencil_spell_undercurl == 1
  let s:sp_un      = 'undercurl'
else
  let s:sp_un      = 'underline'
endif

" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  " Not all terminals support italics properly. If yours does, opt-in.
  if g:pencil_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" common groups ================================================================
" (see `:h w18`)

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:blue, "fg": s:norm })
call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})

call s:h("Constant",      {"fg": s:cyan})
hi! link String           Constant
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:green})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Operator         Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("PreProc",       {"fg": s:red})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:purple})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:pink})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm                      , "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg                                                                  })
call s:h("Error",         {"fg": s:actual_white, "bg": s:red , "gui": "bold"     , "cterm": "bold"     })
call s:h("Todo",          {"fg": s:actual_white, "bg": s:pink, "gui": "bold"     , "cterm": "bold"     })

" ui chrome ====================================================================
" ordered according to `:help hitest.vim`

call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:bg_subtle})
call s:h("Directory",     {"fg": s:dark_blue})
call s:h("ErrorMsg",      {"fg": s:pink})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:bg_subtle})
call s:h("MoreMsg",       {"fg": s:medium_gray, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:blue, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:red})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})

if has("gui_running")
  call s:h("SpellBad",    {"gui": s:sp_un, "sp": s:red})
  call s:h("SpellCap",    {"gui": s:sp_un, "sp": s:light_green})
  call s:h("SpellRare",   {"gui": s:sp_un, "sp": s:pink})
  call s:h("SpellLocal",  {"gui": s:sp_un, "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": s:sp_un, "fg": s:red})
  call s:h("SpellCap",    {"cterm": s:sp_un, "fg": s:light_green})
  call s:h("SpellRare",   {"cterm": s:sp_un, "fg": s:pink})
  call s:h("SpellLocal",  {"cterm": s:sp_un, "fg": s:dark_green})
endif
call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:blue})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:blue, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

" remainder of syntax highlighting
call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

" hi helpHyperTextJump guifg=#5FAFD7 ctermfg=74

" HTML syntax
hi! link htmlTag          Special
hi! link htmlEndTag       htmlTag

hi! link htmlTagName      KeyWord
" html5 tags show up as htmlTagN
hi! link htmlTagN         Keyword

" HTML content
call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:blue  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE

" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownH3",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("markdownH4",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("markdownH5",                  {"fg": s:head_a})
call s:h("markdownH6",                  {"fg": s:head_a})
call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
call s:h("markdownHeadingRule",         {"fg": s:norm})
call s:h("markdownId",                  {"fg": s:medium_gray})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
call s:h("markdownLinkDelimiter",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextDelimiter",   {"fg": s:medium_gray})
call s:h("markdownListMarker",          {"fg": s:norm})
call s:h("markdownOrderedListMarker",   {"fg": s:norm})
call s:h("markdownRule",                {"fg": s:norm})
call s:h("markdownUrl",                 {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:medium_gray})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:medium_gray})
call s:h("markdownCode",                {"fg": s:norm, "bg": s:code_bg})
call s:h("markdownCodeDelimiter",       {"fg": s:norm, "bg": s:code_bg})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:medium_gray})
call s:h("mkdID",                       {"fg": s:medium_gray})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:medium_gray})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm, "bg": s:code_bg})
call s:h("mkdIndentCode",               {"fg": s:norm, "bg": s:code_bg})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:medium_gray})
call s:h("markdownLinkUrl",             {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:medium_gray})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm, "bg": s:code_bg})
call s:h("markdownInlineCode",          {"fg": s:norm, "bg": s:code_bg})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:medium_gray})
call s:h("mmdFootnoteMarker",           {"fg": s:norm})
call s:h("mmdTableAlign",               {"fg": s:norm})
call s:h("mmdTableDelimiter",           {"fg": s:norm})
call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
call s:h("mmdTableHeader",              {"fg": s:norm})
call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
call s:h("mmdTableCaption",             {"fg": s:norm})

" Textile content
" https://github.com/timcharper/textile.vim/blob/master/syntax/textile.vim
"call s:h("txtBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
"call s:h("txtEmphasis",            {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})

" XML content
hi! link xmlTag                     htmlTag
hi! link xmlEndTag                  xmlTag
hi! link xmlTagName                 htmlTagName

" Signify, git-gutter
if g:pencil_gutter_color == 1
  hi link SignifySignAdd              DiffAdd
  hi link SignifySignDelete           DiffDelete
  hi link SignifySignChange           DiffChange
  hi link GitGutterAdd                DiffAdd
  hi link GitGutterDelete             DiffDelete
  hi link GitGutterChange             DiffChange
  hi link GitGutterChangeDelete       DiffChange
else
  hi link SignifySignAdd              LineNr
  hi link SignifySignDelete           LineNr
  hi link SignifySignChange           LineNr
  hi link GitGutterAdd                LineNr
  hi link GitGutterDelete             LineNr
  hi link GitGutterChange             LineNr
  hi link GitGutterChangeDelete       LineNr
endif
