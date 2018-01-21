" ############################################################################
" Name:       Phoenix color scheme
" Maintainer: Danu Widatama <widatama@gmail.com>
" License:    MIT
" ############################################################################




set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'phoenix'

if exists("g:phoenix_acc")
  let s:accent = g:phoenix_acc
else
  let s:accent = ""
endif

if exists("g:phoenix_bg")
  let s:background = g:phoenix_bg
else
  let s:background = ""
endif


" ============================================================================
" Colors
" ----------------------------------------------------------------------------

" Background                  #191919
" Background (Eighties)       #2D2D2D
" Foreground                  #CCCCCC
" Invisibles                  #6A6A6A
" Comments                    #555555
" CursorLine                  #292929
" Selection                   #515151
" Variables                   #787878
" Operator                    #AAAAAA
" Function                    #EFEFEF
" Class                       #DDDDDD


" Blue Prime                  #40BDFF
" Blue Secondary              #5697B8
" Blue Tertiary               #64B2DB


" Red Prime                   #FF3D23
" Red Secondary               #C04B43
" Red Tertiary                #C5282F


" Yellow Prime                #DEDD5A
" Yellow Secondary            #91812B
" Yellow Tertiary             #C3BA4D


" Green Prime                 #87BF19
" Green Secondary             #9FB785
" Green Tertiary              #65910F


" Orange Prime                #C88623
" Orange Secondary            #B58913
" Orange Tertiary             #FBBE1C


" Purple Prime                #B294BB
" Purple Secondary            #A582A3
" Purple Tertiary             #D1AFDD






" ============================================================================
" Text Markup
" ----------------------------------------------------------------------------

hi Normal                     guifg=#CCCCCC guibg=#191919 gui=NONE      ctermfg=250
hi NonText                    guifg=#6A6A6A guibg=NONE    gui=NONE      ctermfg=008
hi Comment                    guifg=#555555 guibg=NONE    gui=NONE      ctermfg=243
hi Constant                   guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Directory                  guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Identifier                 guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi PreProc                    guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi Special                    guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Statement                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi Title                      guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi Type                       guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi SpecialKey                 guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Conditional                guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Operator                   guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=246
hi Exception                  guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Label                      guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Repeat                     guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Keyword                    guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi String                     guifg=#5697B8 guibg=NONE    gui=NONE      ctermfg=039
hi Character                  guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Boolean                    guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Number                     guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Function                   guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Underlined                 guifg=#CCCCCC guibg=NONE    gui=underline ctermfg=250

if s:background == "eighties"
  hi Normal                   guibg=#2D2D2D                             ctermbg=000
endif

if s:accent == "red"
  hi Constant                 guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
  hi Directory                guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
  hi Type                     guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi SpecialKey               guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
  hi Conditional              guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi Exception                guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi Label                    guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi Repeat                   guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi Keyword                  guifg=#C5282F guibg=NONE    gui=NONE      ctermfg=001
  hi String                   guifg=#C04B43 guibg=NONE    gui=NONE      ctermfg=001
  hi Character                guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
  hi Boolean                  guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
  hi Number                   guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=001
endif

if s:accent == "green"
  hi Constant                 guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
  hi Directory                guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
  hi Type                     guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi SpecialKey               guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
  hi Conditional              guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi Exception                guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi Label                    guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi Repeat                   guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi Keyword                  guifg=#65910F guibg=NONE    gui=NONE      ctermfg=002
  hi String                   guifg=#9FB785 guibg=NONE    gui=NONE      ctermfg=002
  hi Character                guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
  hi Boolean                  guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
  hi Number                   guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
endif

if s:accent == "yellow"
  hi Constant                 guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
  hi Directory                guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
  hi Type                     guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi SpecialKey               guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
  hi Conditional              guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi Exception                guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi Label                    guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi Repeat                   guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi Keyword                  guifg=#C3BA4D guibg=NONE    gui=NONE      ctermfg=226
  hi String                   guifg=#91812B guibg=NONE    gui=NONE      ctermfg=226
  hi Character                guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
  hi Boolean                  guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
  hi Number                   guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
endif

if s:accent == "orange"
  hi Constant                 guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
  hi Directory                guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
  hi Type                     guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi SpecialKey               guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
  hi Conditional              guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi Exception                guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi Label                    guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi Repeat                   guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi Keyword                  guifg=#FBBE1C guibg=NONE    gui=NONE      ctermfg=208
  hi String                   guifg=#B58913 guibg=NONE    gui=NONE      ctermfg=208
  hi Character                guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
  hi Boolean                  guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
  hi Number                   guifg=#C88623 guibg=NONE    gui=NONE      ctermfg=208
endif

if s:accent == "purple"
  hi Constant                 guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
  hi Directory                guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
  hi Type                     guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi SpecialKey               guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
  hi Conditional              guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi Exception                guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi Label                    guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi Repeat                   guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi Keyword                  guifg=#D1AFDD guibg=NONE    gui=NONE      ctermfg=013
  hi String                   guifg=#A582A3 guibg=NONE    gui=NONE      ctermfg=013
  hi Character                guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
  hi Boolean                  guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
  hi Number                   guifg=#B294BB guibg=NONE    gui=NONE      ctermfg=013
endif



" ============================================================================
" Highlighting
" ----------------------------------------------------------------------------

hi Cursor                     guifg=#6A6A6A guibg=#EFEFEF gui=NONE      ctermfg=008   ctermbg=255
hi CursorIM                   guifg=#191919 guibg=#CCCCCC gui=NONE      ctermfg=008   ctermbg=255
hi CursorColumn               guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi CursorLine                 guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi Visual                     guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi VisualNOS                  guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi IncSearch                  guifg=#EFEFEF guibg=#64B2DB gui=NONE      ctermfg=255   ctermbg=039
hi MatchParen                 guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Search                     guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi Error                      guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE
hi Todo                       guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226   ctermbg=NONE

if s:accent == "red"
  hi IncSearch                guifg=#EFEFEF guibg=#C5282F gui=NONE      ctermfg=255   ctermbg=001
  hi MatchParen               guifg=#191919 guibg=#FF3D23 gui=NONE      ctermfg=235   ctermbg=001
  hi Search                   guifg=#FFFFFF guibg=#FF3D23 gui=NONE      ctermfg=255   ctermbg=001
endif

if s:accent == "green"
  hi IncSearch                guifg=#191919 guibg=#65910F gui=NONE      ctermfg=255   ctermbg=002
  hi MatchParen               guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
  hi Search                   guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
endif

if s:accent == "yellow"
  hi IncSearch                guifg=#191919 guibg=#C3BA4D gui=NONE      ctermfg=255   ctermbg=226
  hi MatchParen               guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
  hi Search                   guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
endif

if s:accent == "orange"
  hi IncSearch                guifg=#FFFFFF guibg=#FBBE1C gui=NONE      ctermfg=255   ctermbg=208
  hi MatchParen               guifg=#191919 guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
  hi Search                   guifg=#FFFFFF guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
endif

if s:accent == "purple"
  hi IncSearch                guifg=#FFFFFF guibg=#D1AFDD gui=NONE      ctermfg=255   ctermbg=013
  hi MatchParen               guifg=#191919 guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
  hi Search                   guifg=#FFFFFF guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
endif



" ============================================================================
" Messages
" ----------------------------------------------------------------------------

hi Question                   guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039   ctermbg=NONE
hi ErrorMsg                   guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE    cterm=bold
hi MoreMsg                    guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002   ctermbg=NONE
hi WarningMsg                 guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226   ctermbg=NONE




" ============================================================================
" UI
" ----------------------------------------------------------------------------

hi ColorColumn                guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=250   ctermbg=008
hi Pmenu                      guifg=#EFEFEF guibg=#191919 gui=NONE      ctermfg=255   ctermbg=000
hi PmenuSel                   guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi PmenuThumb                 guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi StatusLine                 guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE
hi StatusLineNC               guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE
hi CursorLineNr               guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=255   ctermbg=NONE    cterm=bold
hi TabLine                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi TabLineFill                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi FoldColumn                 guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Folded                     guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi LineNr                     guifg=#6A6A6A guibg=#0F0F0F gui=NONE      ctermfg=245   ctermbg=000
hi SignColumn                 guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255   ctermbg=NONE
hi VertSplit                  guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=246   ctermbg=000
hi WildMenu                   guifg=#CCCCCC guibg=#292929 gui=NONE      ctermfg=250   ctermbg=008
hi OverLength                 guifg=NONE    guibg=#20272F gui=NONE      ctermfg=NONE  ctermbg=018

if s:background == "eighties"
  hi LineNr                   ctermbg=232
endif

if s:accent == "red"
  hi PmenuSel                 guifg=#EFEFEF guibg=#FF3D23 gui=NONE      ctermfg=255   ctermbg=001
  hi PmenuThumb               guifg=#EFEFEF guibg=#FF3D23 gui=NONE      ctermfg=255   ctermbg=001
  hi FoldColumn               guifg=#191919 guibg=#FF3D23 gui=NONE      ctermfg=235   ctermbg=001
  hi Folded                   guifg=#191919 guibg=#FF3D23 gui=NONE      ctermfg=235   ctermbg=001
  hi OverLength               guifg=NONE    guibg=#641900 gui=NONE      ctermfg=NONE  ctermbg=052
endif

if s:accent == "green"
  hi PmenuSel                 guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
  hi PmenuThumb               guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
  hi FoldColumn               guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
  hi Folded                   guifg=#191919 guibg=#87BF19 gui=NONE      ctermfg=235   ctermbg=002
  hi OverLength               guifg=NONE    guibg=#32321E gui=NONE      ctermfg=NONE  ctermbg=022
endif

if s:accent == "yellow"
  hi PmenuSel                 guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
  hi PmenuThumb               guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
  hi FoldColumn               guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
  hi Folded                   guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
  hi OverLength               guifg=NONE    guibg=#4B4B19 gui=NONE      ctermfg=NONE  ctermbg=058
endif

if s:accent == "orange"
  hi PmenuSel                 guifg=#FFFFFF guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
  hi PmenuThumb               guifg=#FFFFFF guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
  hi FoldColumn               guifg=#191919 guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
  hi Folded                   guifg=#191919 guibg=#C88623 gui=NONE      ctermfg=235   ctermbg=208
  hi OverLength               guifg=NONE    guibg=#443A16 gui=NONE      ctermfg=NONE  ctermbg=094
endif

if s:accent == "purple"
  hi PmenuSel                 guifg=#191919 guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
  hi PmenuThumb               guifg=#191919 guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
  hi FoldColumn               guifg=#191919 guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
  hi Folded                   guifg=#191919 guibg=#B294BB gui=NONE      ctermfg=235   ctermbg=013
  hi OverLength               guifg=NONE    guibg=#332238 gui=NONE      ctermfg=NONE  ctermbg=054
endif


" ============================================================================
" Diff
" ----------------------------------------------------------------------------

hi DiffAdd                    guifg=#87BF19 guibg=NONE    gui=bold      ctermfg=002
hi DiffChange                 guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226
hi DiffDelete                 guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009
hi DiffText                   guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi GitGutterAddDefault        guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
hi GitGutterChangeDefault     guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
hi GitGutterDeleteDefault     guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=009




" ============================================================================
" Spelling
" ----------------------------------------------------------------------------

hi SpellBad                   guisp=#FF3D23 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=009   cterm=underline
hi SpellCap                   guisp=#87BF19 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=002   cterm=underline
hi SpellLocal                 guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline
hi SpellRare                  guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline




" ============================================================================
" Others
" ----------------------------------------------------------------------------

hi helpSpecial                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi helpHyperTextJump          guifg=#40BDFF guibg=NONE    gui=underline ctermfg=039
hi helpNote                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250

if s:accent == "red"
  hi helpHyperTextJump        guifg=#FF3D23 guibg=NONE    gui=underline ctermfg=001   ctermbg=NONE    cterm=underline
endif

if s:accent == "green"
  hi helpHyperTextJump        guifg=#87BF19 guibg=NONE    gui=underline ctermfg=002   ctermbg=NONE    cterm=underline
endif

if s:accent == "yellow"
  hi helpHyperTextJump        guifg=#DEDD5A guibg=NONE    gui=underline ctermfg=226   ctermbg=NONE    cterm=underline
endif

if s:accent == "orange"
  hi helpHyperTextJump        guifg=#C88623 guibg=NONE    gui=underline ctermfg=208   ctermbg=NONE    cterm=underline
endif

if s:accent == "orange"
  hi helpHyperTextJump        guifg=#B294BB guibg=NONE    gui=underline ctermfg=013   ctermbg=NONE    cterm=underline
endif



" ============================================================================
" Specific Language Syntax
" ----------------------------------------------------------------------------

" Markdown
" ----------------------------------------------------------------------------

hi link                       markdownLinkText            PreProc
hi link                       markdownHeadingDelimiter    Number
hi link                       markdownHeader              Number
hi link                       markdownInlineCode          PreProc
hi link                       markdownFencedCodeBlock     PreProc
hi link                       markdownCodeBlock           PreProc


let g:phoenix_acc = ""
let g:phoenix_bg = ""

function! SetPhoenix(background, accent)
  let g:phoenix_bg = a:background
  let g:phoenix_acc = a:accent
endfunction

command! PhoenixBlue call SetPhoenix("normal", "blue")
            \ | colorscheme phoenix
command! PhoenixRed call SetPhoenix("normal", "red")
            \ | colorscheme phoenix
command! PhoenixGreen call SetPhoenix("normal", "green")
            \ | colorscheme phoenix
command! PhoenixYellow call SetPhoenix("normal", "yellow")
            \ | colorscheme phoenix
command! PhoenixOrange call SetPhoenix("normal", "orange")
            \ | colorscheme phoenix
command! PhoenixPurple call SetPhoenix("normal", "purple")
            \ | colorscheme phoenix

command! PhoenixBlueEighties call SetPhoenix("eighties", "blue")
            \ | colorscheme phoenix
command! PhoenixRedEighties call SetPhoenix("eighties", "red")
            \ | colorscheme phoenix
command! PhoenixGreenEighties call SetPhoenix("eighties", "green")
            \ | colorscheme phoenix
command! PhoenixYellowEighties call SetPhoenix("eighties", "yellow")
            \ | colorscheme phoenix
command! PhoenixOrangeEighties call SetPhoenix("eighties", "orange")
            \ | colorscheme phoenix
command! PhoenixPurpleEighties call SetPhoenix("eighties", "purple")
            \ | colorscheme phoenix
