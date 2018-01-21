set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "frood"

hi SpecialKey        guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi NonText           guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi Directory         guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi ErrorMsg          guifg=Black       guibg=Red         ctermfg=Black       ctermbg=Red         gui=NONE      cterm=NONE
hi IncSearch         guifg=Black       guibg=LightBlue   ctermfg=Black       ctermbg=LightBlue   gui=NONE      cterm=NONE
hi Search            guifg=Black       guibg=Yellow      ctermfg=Black       ctermbg=Yellow      gui=NONE      cterm=NONE
hi MoreMsg           guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi ModeMsg           guifg=White       guibg=Black       ctermfg=White       ctermbg=Black       gui=NONE      cterm=NONE
hi LineNr            guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi Question          guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi StatusLine        guifg=White       guibg=DarkGray    ctermfg=White       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi StatusLineNC      guifg=Black       guibg=DarkGray    ctermfg=Black       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi VertSplit         guifg=Black       guibg=DarkGray    ctermfg=Black       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi Title        NONE
hi Visual            guifg=Black       guibg=LightBlue   ctermfg=Black       ctermbg=LightBlue   gui=NONE      cterm=NONE
hi VisualNos         guifg=Black       guibg=LightGreen  ctermfg=Black       ctermbg=LightGreen  gui=NONE      cterm=NONE
hi WarningMsg        guifg=Red         guibg=Black       ctermfg=Red         ctermbg=Black       gui=NONE      cterm=NONE
hi WildMenu          guifg=Black       guibg=Gray        ctermfg=Black       ctermbg=Gray        gui=NONE      cterm=NONE
hi Folded            guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi FoldColumn        guifg=Black       guibg=DarkGray    ctermfg=Black       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi DiffAdd           guifg=Black       guibg=LightGreen  ctermfg=Black       ctermbg=LightGreen  gui=NONE      cterm=NONE
hi DiffChange        guifg=Black       guibg=LightYellow ctermfg=Black       ctermbg=LightYellow gui=NONE      cterm=NONE
hi DiffDelete        guifg=Black       guibg=LightRed    ctermfg=Black       ctermbg=LightRed    gui=NONE      cterm=NONE
hi DiffText          guifg=Black       guibg=LightCyan   ctermfg=Black       ctermbg=LightCyan   gui=NONE      cterm=NONE
hi SignColumn        guifg=Black       guibg=DarkGray    ctermfg=Black       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi Conceal           guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi SpellBad     NONE                                                                             gui=underline cterm=underline
hi SpellCap     NONE
hi SpellRare    NONE
hi SpellLocal   NONE
hi Pmenu             guifg=White       guibg=DarkGray    ctermfg=White       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi PmenuSel          guifg=Black       guibg=Gray        ctermfg=Black       ctermbg=Gray        gui=NONE      cterm=NONE
hi PmenuSbar                           guibg=Gray                            ctermbg=Gray        gui=NONE      cterm=NONE
hi PmenuThumb                          guibg=White                           ctermbg=White       gui=NONE      cterm=NONE
hi TabLine           guifg=White       guibg=DarkGray    ctermfg=White       ctermbg=DarkGray    gui=NONE      cterm=NONE
hi TabLineSel        guifg=Black       guibg=Gray        ctermfg=Black       ctermbg=Gray        gui=NONE      cterm=NONE
hi TabLineFill                         guibg=DarkGray                        ctermbg=DarkGray    gui=NONE      cterm=NONE
hi CursorColumn NONE                                                                             gui=reverse   cterm=reverse
hi CursorLine   NONE                                                                             gui=reverse   cterm=reverse
hi ColorColumn  NONE                                                                             gui=reverse   cterm=reverse
hi MatchParen        guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi Normal            guifg=White       guibg=Black       ctermfg=White       ctermbg=Black       gui=NONE      cterm=NONE
hi Comment           guifg=DarkGray    guibg=Black       ctermfg=DarkGray    ctermbg=Black       gui=NONE      cterm=NONE
hi Constant          guifg=Magenta     guibg=Black       ctermfg=Magenta     ctermbg=Black       gui=NONE      cterm=NONE
hi Special           guifg=Magenta     guibg=Black       ctermfg=Magenta     ctermbg=Black       gui=NONE      cterm=NONE
hi Identifier        guifg=LightGreen  guibg=Black       ctermfg=LightGreen  ctermbg=Black       gui=NONE      cterm=NONE
hi Statement         guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi PreProc           guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=NONE      cterm=NONE
hi Type              guifg=LightYellow guibg=Black       ctermfg=LightYellow ctermbg=Black       gui=NONE      cterm=NONE
hi Underlined        guifg=LightBlue   guibg=Black       ctermfg=LightBlue   ctermbg=Black       gui=underline cterm=underline
hi Ignore            guifg=Black       guibg=Black       ctermfg=Black       ctermbg=Black       gui=NONE      cterm=NONE
hi Error             guifg=Black       guibg=Red         ctermfg=Black       ctermbg=Red         gui=NONE      cterm=NONE
hi Todo              guifg=Red         guibg=Black       ctermfg=Red         ctermbg=Black       gui=NONE      cterm=NONE
