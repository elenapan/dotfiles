if exists("g:moria_style")
    let s:moria_style = g:moria_style
else
    let s:moria_style = &background
endif

if exists("g:moria_monochrome")
    let s:moria_monochrome = g:moria_monochrome
else
    let s:moria_monochrome = 0
endif

if exists("g:moria_fontface")
    let s:moria_fontface = g:moria_fontface
else
    let s:moria_fontface = "plain"
endif

execute "command! -nargs=1 Colo let g:moria_style = \"<args>\" | colo moria"

if s:moria_style == "black" || s:moria_style == "dark"
    set background=dark
elseif s:moria_style == "light" || s:moria_style == "white"
    set background=light
else
    let s:moria_style = &background 
endif

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "moria"

if &background == "dark"
    if s:moria_style == "dark"
        hi Normal ctermbg=0 ctermfg=7 guibg=#202020 guifg=#d0d0d0 gui=none

        hi ColorColumn ctermbg=8 ctermfg=15 guibg=#494949 gui=none
        hi CursorColumn ctermbg=8 ctermfg=15 guibg=#404040 gui=none
        hi CursorLine ctermbg=8 ctermfg=15 guibg=#404040 gui=none
    elseif s:moria_style == "black"
        hi Normal ctermbg=0 ctermfg=7 guibg=#000000 guifg=#d0d0d0 gui=none

        hi ColorColumn ctermbg=8 ctermfg=15 guibg=#444444 gui=none
        hi CursorColumn ctermbg=8 ctermfg=15 guibg=#3a3a3a gui=none
        hi CursorLine ctermbg=8 ctermfg=15 guibg=#3a3a3a gui=none
    endif
    if s:moria_monochrome == 1
        hi FoldColumn ctermbg=bg guibg=bg guifg=#a0a0a0 gui=none
        hi LineNr guifg=#a0a0a0 gui=none
        hi MoreMsg guibg=bg guifg=#b6b6b6 gui=bold
        hi NonText ctermfg=8 guibg=bg guifg=#a0a0a0 gui=bold
        hi Pmenu guibg=#909090 guifg=#000000 gui=none
        hi PmenuSbar guibg=#707070 guifg=fg gui=none
        hi PmenuThumb guibg=#d0d0d0 guifg=bg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#a0a0a0 gui=none
        hi StatusLine ctermbg=7 ctermfg=0 guibg=#4c4c4c guifg=fg gui=bold
        hi StatusLineNC ctermbg=8 ctermfg=0 guibg=#404040 guifg=fg gui=none
        hi TabLine guibg=#6e6e6e guifg=fg gui=underline
        hi TabLineFill guibg=#6e6e6e guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#404040 guifg=fg gui=none
        if s:moria_fontface == "mixed"
            hi Folded guibg=#4e4e4e guifg=#c0c0c0 gui=bold
        else
            hi Folded guibg=#4e4e4e guifg=#c0c0c0 gui=none
        endif            
    else
        hi FoldColumn ctermbg=bg guibg=bg guifg=#8fa5d1 gui=none
        hi LineNr guifg=#8fa5d1 gui=none
        hi MoreMsg guibg=bg guifg=#97abd5 gui=bold
        hi NonText ctermfg=8 guibg=bg guifg=#8fa5d1 gui=bold
        hi Pmenu guibg=#6381be guifg=#000000 gui=none
        hi PmenuSbar guibg=#41609e guifg=fg gui=none
        hi PmenuThumb guibg=#bdcae3 guifg=bg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#8fa5d1 gui=none
        hi StatusLine ctermbg=7 ctermfg=0 guibg=#334b7d guifg=fg gui=bold
        hi StatusLineNC ctermbg=8 ctermfg=0 guibg=#25365a guifg=fg gui=none
        hi TabLine guibg=#41609e guifg=fg gui=underline
        hi TabLineFill guibg=#41609e guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#25365a guifg=fg gui=none
        if s:moria_fontface == "mixed"
            hi Folded guibg=#4e4e4e guifg=#bdcae3 gui=bold
        else
            hi Folded guibg=#4e4e4e guifg=#bdcae3 gui=none
        endif            
    endif
    hi Cursor guibg=#ffa500 guifg=bg gui=none
    hi DiffAdd guibg=#008b00 guifg=fg gui=none
    hi DiffChange guibg=#00008b guifg=fg gui=none
    hi DiffDelete guibg=#8b0000 guifg=fg gui=none
    hi DiffText guibg=#0000cd guifg=fg gui=bold
    hi Directory guibg=bg guifg=#1e90ff gui=none
    hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
    hi IncSearch guibg=#e0cd78 guifg=#000000 gui=none
    hi ModeMsg guibg=bg guifg=fg gui=bold
    hi PmenuSel guibg=#e0e000 guifg=#000000 gui=none
    hi Question guibg=bg guifg=#e8b87e gui=bold
    hi Search guibg=#90e090 guifg=#000000 gui=none
    hi SpecialKey guibg=bg guifg=#e8b87e gui=none
    if has("spell")
        hi SpellBad guisp=#ee2c2c gui=undercurl
        hi SpellCap guisp=#2c2cee gui=undercurl
        hi SpellLocal guisp=#2ceeee gui=undercurl
        hi SpellRare guisp=#ee2cee gui=undercurl
    endif
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title ctermbg=0 ctermfg=15 guifg=fg gui=bold
    if version >= 700
        hi Visual ctermbg=7 ctermfg=0 guibg=#606060 gui=none
    else
        hi Visual ctermbg=7 ctermfg=0 guibg=#606060 guifg=fg gui=none
    endif
    hi VisualNOS ctermbg=8 ctermfg=0 guibg=bg guifg=#a0a0a0 gui=bold,underline
    hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold
    hi WildMenu guibg=#e0e000 guifg=#000000 gui=bold

    hi Comment guibg=bg guifg=#d0d0a0 gui=none
    hi Constant guibg=bg guifg=#87df71 gui=none
    hi Error guibg=bg guifg=#ee2c2c gui=none
    hi Identifier guibg=bg guifg=#7ee0ce gui=none
    hi Ignore guibg=bg guifg=bg gui=none
    hi lCursor guibg=#00e700 guifg=#000000 gui=none
    hi MatchParen guibg=#008b8b gui=none
    hi PreProc guibg=bg guifg=#d7a0d7 gui=none
    hi Special guibg=bg guifg=#e8b87e gui=none
    hi Todo guibg=#e0e000 guifg=#000000 gui=none
    hi Underlined ctermbg=0 ctermfg=15 guibg=bg guifg=#00a0ff gui=underline    

    if s:moria_fontface == "mixed"
        hi Statement guibg=bg guifg=#7ec0ee gui=bold
        hi Type guibg=bg guifg=#f09479 gui=bold
    else
        hi Statement guibg=bg guifg=#7ec0ee gui=none
        hi Type guibg=bg guifg=#f09479 gui=none
    endif

    hi htmlBold ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold
    hi htmlBoldItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=italic
    hi htmlUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline
    hi htmlUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline,italic
elseif &background == "light"
    if s:moria_style == "light"
        hi Normal ctermbg=15 ctermfg=0 guibg=#f0f0f0 guifg=#000000 gui=none

        hi ColorColumn ctermbg=7 ctermfg=0 guibg=#d3d3d3 gui=none
        hi CursorColumn ctermbg=7 ctermfg=0 guibg=#d8d8d8 gui=none
        hi CursorLine ctermbg=7 ctermfg=0 guibg=#d8d8d8 gui=none
    elseif s:moria_style == "white"
        hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#000000 gui=none

        hi ColorColumn ctermbg=7 ctermfg=0 guibg=#d7d7d7 gui=none
        hi CursorColumn ctermbg=7 ctermfg=0 guibg=#dfdfdf gui=none
        hi CursorLine ctermbg=7 ctermfg=0 guibg=#dfdfdf gui=none
    endif
    if s:moria_monochrome == 1
        hi FoldColumn ctermbg=bg guibg=bg guifg=#7a7a7a gui=none
        hi Folded guibg=#cfcfcf guifg=#404040 gui=bold
        hi LineNr guifg=#7a7a7a gui=none
        hi MoreMsg guibg=bg guifg=#505050 gui=bold
        hi NonText ctermfg=8 guibg=bg guifg=#7a7a7a gui=bold
        hi Pmenu guibg=#9a9a9a guifg=#000000 gui=none
        hi PmenuSbar guibg=#808080 guifg=fg gui=none
        hi PmenuThumb guibg=#c0c0c0 guifg=fg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#7a7a7a gui=none
        hi StatusLine ctermbg=0 ctermfg=15 guibg=#a0a0a0 guifg=fg gui=bold
        hi StatusLineNC ctermbg=7 ctermfg=0 guibg=#b0b0b0 guifg=fg gui=none
        hi TabLine guibg=#cdcdcd guifg=fg gui=underline
        hi TabLineFill guibg=#cdcdcd guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#b0b0b0 guifg=fg gui=none
    else
        hi FoldColumn ctermbg=bg guibg=bg guifg=#375288 gui=none
        hi Folded guibg=#cfcfcf guifg=#25365a gui=bold
        hi LineNr guifg=#375288 gui=none
        hi MoreMsg guibg=bg guifg=#2f4471 gui=bold
        hi NonText ctermfg=8 guibg=bg guifg=#375288 gui=bold
        hi Pmenu guibg=#708bc5 guifg=#000000 gui=none
        hi PmenuSbar guibg=#4a6db5 guifg=fg gui=none
        hi PmenuThumb guibg=#a6b7db guifg=fg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#375288 gui=none
        hi StatusLine ctermbg=0 ctermfg=15 guibg=#8fa5d1 guifg=fg gui=bold
        hi StatusLineNC ctermbg=7 ctermfg=0 guibg=#a6b7db guifg=fg gui=none
        hi TabLine guibg=#b8c6e2 guifg=fg gui=underline
        hi TabLineFill guibg=#b8c6e2 guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#a6b7db guifg=fg gui=none
    endif
    hi Cursor guibg=#883400 guifg=bg gui=none
    hi DiffAdd guibg=#008b00 guifg=#ffffff gui=none
    hi DiffChange guibg=#00008b guifg=#ffffff gui=none
    hi DiffDelete guibg=#8b0000 guifg=#ffffff gui=none
    hi DiffText guibg=#0000cd guifg=#ffffff gui=bold
    hi Directory guibg=bg guifg=#0000f0 gui=none
    hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
    hi IncSearch guibg=#ffcd78 gui=none
    hi ModeMsg ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold
    hi PmenuSel guibg=#ffff00 guifg=#000000 gui=none
    hi Question guibg=bg guifg=#813f11 gui=bold
    hi Search guibg=#a0f0a0 gui=none
    hi SpecialKey guibg=bg guifg=#912f11 gui=none
    if has("spell")
        hi SpellBad guisp=#ee2c2c gui=undercurl
        hi SpellCap guisp=#2c2cee gui=undercurl
        hi SpellLocal guisp=#008b8b gui=undercurl
        hi SpellRare guisp=#ee2cee gui=undercurl
    endif
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title guifg=fg gui=bold
    if version >= 700
        hi Visual ctermbg=7 ctermfg=0 guibg=#c4c4c4 gui=none
    else
        hi Visual ctermbg=7 ctermfg=0 guibg=#c4c4c4 guifg=fg gui=none
    endif    
    hi VisualNOS ctermbg=8 ctermfg=0 guibg=bg guifg=#a0a0a0 gui=bold,underline
    hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold
    hi WildMenu guibg=#ffff00 guifg=fg gui=bold

    hi Comment guibg=bg guifg=#786000 gui=none
    hi Constant guibg=bg guifg=#077807 gui=none
    hi Error guibg=bg guifg=#ee2c2c gui=none
    hi Identifier guibg=bg guifg=#007080 gui=none
    hi Ignore guibg=bg guifg=bg gui=none
    hi lCursor guibg=#008000 guifg=#ffffff gui=none
    hi MatchParen guibg=#00ffff gui=none
    hi PreProc guibg=bg guifg=#800090 gui=none
    hi Special guibg=bg guifg=#912f11 gui=none
    hi Statement guibg=bg guifg=#1f3f81 gui=bold
    hi Todo guibg=#ffff00 guifg=fg gui=none
    hi Type guibg=bg guifg=#912f11 gui=bold
    hi Underlined ctermbg=15 ctermfg=0 guibg=bg guifg=#0000cd gui=underline

    hi htmlBold ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold
    hi htmlBoldItalic ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlItalic ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=italic
    hi htmlUnderline ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=underline
    hi htmlUnderlineItalic ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=underline,italic
endif

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline
