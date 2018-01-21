" Vim color file
" Scriptname:   vimbrant
" Author:       Thayer Williams <thayer.cinderwick.ca>
" Description:  A vibrant light-on-dark colorscheme with support
" for GUI, 256-color and 16-color terminals and optional transparency
"
" Based on the molokai theme by Tomas Restrepo, which in turn 
" is based on the monokai theme for textmate by Wimer Hazenberg
" and its darker variant by Hamish Stuart Macpherson.  A big 
" thanks to these individuals for making what are some of the 
" best color schemes ever.

" For optimal 16-color experience, add the following to ~/.bashrc:
"
" # linux console colors -------------------------------------
" if [ "$TERM" = "linux" ]; then
"     echo -en "\e]P0000000" #black
"     echo -en "\e]P8505354" #darkgrey
"     echo -en "\e]P1f92672" #darkred
"     echo -en "\e]P9ff5995" #red
"     echo -en "\e]P282b414" #darkgreen
"     echo -en "\e]PAb6e354" #green
"     echo -en "\e]P3fd971f" #brown
"     echo -en "\e]PBfeed6c" #yellow
"     echo -en "\e]P456c2d6" #darkblue
"     echo -en "\e]PC8cedff" #blue
"     echo -en "\e]P58c54fe" #darkmagenta
"     echo -en "\e]PD9e6ffe" #magenta
"     echo -en "\e]P6465457" #darkcyan
"     echo -en "\e]PE899ca1" #cyan
"     echo -en "\e]P7ccccc6" #lightgrey
"     echo -en "\e]PFf8f8f2" #white
"     clear # back to default input colours
" fi
" ------------------------------------------------------------

" set to true for transparent background in <=256 color modes
let transparency="true"

hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vimbrant"

if exists("g:vimbrant")
    let s:vimbrant_original = g:vimbrant_original
else
    let s:vimbrant_original = 0
endif

if has('gui_running')
    " gui colorscheme

    hi Boolean         guifg=#AE81FF
    hi Character       guifg=#E6DB74
    hi Number          guifg=#AE81FF
    hi String          guifg=#E6DB74
    hi Conditional     guifg=#F92672               gui=bold
    hi Constant        guifg=#AE81FF               gui=bold
    hi Cursor          guifg=#000000 guibg=#F8F8F0
    hi Debug           guifg=#BCA3A3               gui=bold
    hi Define          guifg=#66D9EF
    hi Delimiter       guifg=#8F8F8F
    hi DiffAdd                       guibg=#13354A
    hi DiffChange      guifg=#89807D guibg=#4C4745
    hi DiffDelete      guifg=#960050 guibg=#1E0010
    hi DiffText                      guibg=#4C4745 gui=italic,bold

    hi Directory       guifg=#A6E22E               gui=bold
    hi Error           guifg=#960050 guibg=#1E0010
    hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
    hi Exception       guifg=#A6E22E               gui=bold
    hi Float           guifg=#AE81FF
    hi FoldColumn      guifg=#465457 guibg=#000000
    hi Folded          guifg=#465457 guibg=#000000
    hi Function        guifg=#A6E22E
    hi Identifier      guifg=#FD971F
    hi Ignore          guifg=#808080 guibg=bg
    hi IncSearch       guifg=#C4BE89 guibg=#000000

    hi Keyword         guifg=#F92672               gui=bold
    hi Label           guifg=#E6DB74               gui=none
    hi Macro           guifg=#C4BE89               gui=italic
    hi SpecialKey      guifg=#66D9EF               gui=italic

    hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
    hi ModeMsg         guifg=#E6DB74
    hi MoreMsg         guifg=#E6DB74
    hi Operator        guifg=#F92672

    " complete menu
    hi Pmenu           guifg=#66D9EF guibg=#000000
    hi PmenuSel                      guibg=#808080
    hi PmenuSbar                     guibg=#080808
    hi PmenuThumb      guifg=#66D9EF

    hi PreCondit       guifg=#A6E22E               gui=bold
    hi PreProc         guifg=#A6E22E
    hi Question        guifg=#66D9EF
    hi Repeat          guifg=#F92672               gui=bold
    hi Search          guifg=#FFFFFF guibg=#455354
    " marks column
    hi SignColumn      guifg=#A6E22E guibg=#232526
    hi SpecialChar     guifg=#F92672               gui=bold
    hi SpecialComment  guifg=#465457               gui=bold
    hi Special         guifg=#66D9EF guibg=bg      gui=italic
    hi SpecialKey      guifg=#888A85               gui=italic
    if has("spell")
        hi SpellBad    guisp=#FF0000 gui=undercurl
        hi SpellCap    guisp=#7070F0 gui=undercurl
        hi SpellLocal  guisp=#70F0F0 gui=undercurl
        hi SpellRare   guisp=#FFFFFF gui=undercurl
    endif
    hi Statement       guifg=#F92672               gui=bold
    hi StatusLine      guifg=#455354 guibg=fg
    hi StatusLineNC    guifg=#808080 guibg=#080808
    hi StorageClass    guifg=#FD971F               gui=italic
    hi Structure       guifg=#66D9EF
    hi Tag             guifg=#F92672               gui=italic
    hi Title           guifg=#ef5939
    hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

    hi Typedef         guifg=#66D9EF
    hi Type            guifg=#66D9EF               gui=none
    hi Underlined      guifg=#808080               gui=underline

    hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
    hi VisualNOS                     guibg=#403D3D
    hi Visual                        guibg=#403D3D
    hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
    hi WildMenu        guifg=#66D9EF guibg=#000000

    " Outlines
    hi OL1             guifg=#A6E22E
    hi OL2             guifg=#F92672
    hi OL3             guifg=#FD971F
    hi OL4             guifg=#66D9EF
    hi OL5             guifg=#AE81FF
    hi OL6             guifg=#E6DB74
    hi OL7             guifg=#BCA3A3
    hi OL8             guifg=#F92672
    hi OL9             guifg=#465457

    " Outline tags
    hi outlTags        guifg=#A6E22E               gui=bold

    " Body text
    hi BT1             guifg=#808080
    hi BT2             guifg=#808080
    hi BT3             guifg=#808080
    hi BT4             guifg=#808080
    hi BT5             guifg=#808080
    hi BT6             guifg=#808080
    hi BT7             guifg=#808080
    hi BT8             guifg=#808080
    hi BT9             guifg=#808080

    " Pre-formatted text
    hi PT1             guifg=#AE81FF
    hi PT2             guifg=#AE81FF
    hi PT3             guifg=#AE81FF
    hi PT4             guifg=#AE81FF
    hi PT5             guifg=#AE81FF
    hi PT6             guifg=#AE81FF
    hi PT7             guifg=#AE81FF
    hi PT8             guifg=#AE81FF
    hi PT9             guifg=#AE81FF

    " Tables
    hi TA1             guifg=#465457
    hi TA2             guifg=#465457
    hi TA3             guifg=#465457
    hi TA4             guifg=#465457
    hi TA5             guifg=#465457
    hi TA6             guifg=#465457
    hi TA7             guifg=#465457
    hi TA8             guifg=#465457
    hi TA9             guifg=#465457

    " 'user text'
    hi UT1             guifg=#808080
    hi UT2             guifg=#808080
    hi UT3             guifg=#808080
    hi UT4             guifg=#808080
    hi UT5             guifg=#808080
    hi UT6             guifg=#808080
    hi UT7             guifg=#808080
    hi UT8             guifg=#808080
    hi UT9             guifg=#808080

    " non-wrapping 'user text'
    hi UB1             guifg=#BCBCBC
    hi UB2             guifg=#BCBCBC
    hi UB3             guifg=#BCBCBC
    hi UB4             guifg=#BCBCBC
    hi UB5             guifg=#BCBCBC
    hi UB6             guifg=#BCBCBC
    hi UB7             guifg=#BCBCBC
    hi UB8             guifg=#BCBCBC
    hi UB9             guifg=#BCBCBC

    " brown variant
    if s:vimbrant_original == 1
        hi Normal          guifg=#F8F8F2 guibg=#272822
        hi Comment         guifg=#75715E
        hi CursorLine                    guibg=#3E3D32
        hi CursorColumn                  guibg=#3E3D32
        hi LineNr          guifg=#BCBCBC guibg=#3B3A32
        hi NonText         guifg=#BCBCBC guibg=#3B3A32
    else
        hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
        hi Comment         guifg=#465457
        hi CursorLine                    guibg=#293739
        hi CursorColumn                  guibg=#293739
        hi LineNr          guifg=#BCBCBC guibg=#232526
        hi NonText         guifg=#BCBCBC guibg=#232526
    end

elseif &t_Co > 255

    " 256-color scheme

    hi Boolean         ctermfg=135
    hi Character       ctermfg=186
    hi Number          ctermfg=135
    hi String          ctermfg=186
    hi Conditional     ctermfg=161               cterm=bold
    hi Constant        ctermfg=135               cterm=bold
    hi Cursor          ctermfg=16  ctermbg=253
    hi Debug           ctermfg=225               cterm=bold
    hi Define          ctermfg=81
    hi Delimiter       ctermfg=241

    hi DiffAdd                     ctermbg=24
    hi DiffChange      ctermfg=181 ctermbg=239
    hi DiffDelete      ctermfg=162 ctermbg=53
    hi DiffText                    ctermbg=102   cterm=bold
    
    hi Directory       ctermfg=118               cterm=bold
    hi Error           ctermfg=219 ctermbg=89
    hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
    hi Exception       ctermfg=118               cterm=bold
    hi Float           ctermfg=135
    hi FoldColumn      ctermfg=67  ctermbg=16
    hi Folded          ctermfg=67  ctermbg=16
    hi Function        ctermfg=118
    hi Identifier      ctermfg=208
    hi Ignore          ctermfg=244 ctermbg=232
    hi IncSearch       ctermfg=193 ctermbg=16
    
    hi Keyword         ctermfg=161               cterm=bold
    hi Label           ctermfg=229               cterm=none
    hi Macro           ctermfg=193
    hi SpecialKey      ctermfg=81
    
    " mail-related syntaxes
    "hi mailHeaderEmail links to mailEmail 
    "hi mailURL         links to String 
    "hi mailEmail       links to Special 
    "hi mailSignature   links to PreProc 
    hi mailSubject     ctermfg=186
    hi mailHeaderKey   ctermfg=186
    hi mailHeader      ctermfg=186
    hi mailQuoted1     ctermfg=6
    hi mailQuoted2     ctermfg=14
    hi mailQuoted3     ctermfg=2
    hi mailQuoted4     ctermfg=3
    hi mailQuoted5     ctermfg=1
    hi mailQuoted6     ctermfg=5

    hi MatchParen      ctermfg=16  ctermbg=208   cterm=bold
    hi ModeMsg         ctermfg=229
    hi MoreMsg         ctermfg=229
    hi Operator        ctermfg=161

    " complete menu
    hi Pmenu           ctermfg=81  ctermbg=16
    hi PmenuSel                    ctermbg=244
    hi PmenuSbar                   ctermbg=232
    hi PmenuThumb      ctermfg=81

    hi PreCondit       ctermfg=118               cterm=bold
    hi PreProc         ctermfg=118
    hi Question        ctermfg=81
    hi Repeat          ctermfg=161               cterm=bold
    hi Search          ctermfg=253 ctermbg=162

    " marks column
    hi SignColumn      ctermfg=118 ctermbg=235
    hi SpecialChar     ctermfg=161               cterm=bold
    hi SpecialComment  ctermfg=245               cterm=bold
    hi Special         ctermfg=81 
    hi SpecialKey      ctermfg=245

    hi Statement       ctermfg=161               cterm=bold
    hi StatusLine      ctermfg=238 ctermbg=253
    hi StatusLineNC    ctermfg=244 ctermbg=232
    hi StorageClass    ctermfg=208
    hi Structure       ctermfg=81
    hi Tag             ctermfg=161
    hi Title           ctermfg=166
    hi Todo            ctermfg=231 ctermbg=232   cterm=bold

    hi Typedef         ctermfg=81
    hi Type            ctermfg=81                cterm=none
    hi Underlined      ctermfg=244               cterm=underline

    hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
    hi VisualNOS                   ctermbg=238
    hi Visual          ctermfg=33  ctermbg=17
    hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
    hi WildMenu        ctermfg=81  ctermbg=16
    
    hi Normal          ctermfg=248 ctermbg=0
    hi Comment         ctermfg=240
    hi CursorLine                  ctermbg=234   cterm=none
    hi CursorColumn                ctermbg=234
    hi LineNr          ctermfg=240 ctermbg=235
    hi NonText         ctermfg=250

    if has("spell")
        hi clear SpellBad
        hi SpellBad     ctermfg=197 term=underline,standout  cterm=underline
        hi clear SpellCap
        hi SpellCap     ctermfg=208 term=underline  cterm=underline
        hi clear SpellLocal
        hi SpellLocal   ctermfg=226 term=underline  cterm=underline
        hi clear SpellRare
        hi SpellRare    ctermfg=229 term=underline  cterm=underline
    endif

    if transparency == "true"
        hi Normal          ctermfg=248 ctermbg=NONE
        hi LineNr          ctermfg=240 ctermbg=NONE
    end

    " Outlines
    hi OL1             ctermfg=118
    hi OL2             ctermfg=197
    hi OL3             ctermfg=208
    hi OL4             ctermfg=81
    hi OL5             ctermfg=135
    hi OL6             ctermfg=186
    hi OL7             ctermfg=225
    hi OL8             ctermfg=161
    hi OL9             ctermfg=67

    " Outline tags
    hi outlTags        ctermfg=118               cterm=bold

    " Body text
    hi BT1             ctermfg=244
    hi BT2             ctermfg=244
    hi BT3             ctermfg=244
    hi BT4             ctermfg=244
    hi BT5             ctermfg=244
    hi BT6             ctermfg=244
    hi BT7             ctermfg=244
    hi BT8             ctermfg=244
    hi BT9             ctermfg=244

    " Pre-formatted text
    hi PT1             ctermfg=135
    hi PT2             ctermfg=135
    hi PT3             ctermfg=135
    hi PT4             ctermfg=135
    hi PT5             ctermfg=135
    hi PT6             ctermfg=135
    hi PT7             ctermfg=135
    hi PT8             ctermfg=135
    hi PT9             ctermfg=135

    " Tables
    hi TA1             ctermfg=67
    hi TA2             ctermfg=67
    hi TA3             ctermfg=67
    hi TA4             ctermfg=67
    hi TA5             ctermfg=67
    hi TA6             ctermfg=67
    hi TA7             ctermfg=67
    hi TA8             ctermfg=67
    hi TA9             ctermfg=67

    " 'user text'
    hi UT1             ctermfg=244
    hi UT2             ctermfg=244
    hi UT3             ctermfg=244
    hi UT4             ctermfg=244
    hi UT5             ctermfg=244
    hi UT6             ctermfg=244
    hi UT7             ctermfg=244
    hi UT8             ctermfg=244
    hi UT9             ctermfg=244

    " non-wrapping 'user text'
    hi UB1             ctermfg=240
    hi UB2             ctermfg=240
    hi UB3             ctermfg=240
    hi UB4             ctermfg=240
    hi UB5             ctermfg=240
    hi UB6             ctermfg=240
    hi UB7             ctermfg=240
    hi UB8             ctermfg=240
    hi UB9             ctermfg=240

elseif &t_Co < 256

    " 16/88-color scheme

    hi Boolean         ctermfg=5  cterm=bold 
    hi Character       ctermfg=3  cterm=bold
    hi Number          ctermfg=5  cterm=bold 
    hi String          ctermfg=3  cterm=bold
    hi Conditional     ctermfg=1
    hi Constant        ctermfg=5  cterm=bold 
    hi Cursor          ctermfg=0  ctermbg=7
    hi Debug           ctermfg=5  cterm=bold 
    hi Define          ctermfg=4
    hi Delimiter       ctermfg=0  cterm=bold

    hi DiffAdd                    ctermbg=4
    hi DiffChange      ctermfg=5  ctermbg=8  cterm=bold 
    hi DiffDelete      ctermfg=1   ctermbg=5
    hi DiffText                    ctermbg=13

    hi Directory       ctermfg=2
    hi Error           ctermfg=1
    hi ErrorMsg        ctermfg=1
    hi Exception       ctermfg=2
    hi Float           ctermfg=5  cterm=bold 
    hi FoldColumn      ctermfg=5  cterm=bold 
    hi Folded          ctermfg=5  cterm=bold 
    hi Function        ctermfg=2  
    hi Identifier      ctermfg=3
    hi Ignore          ctermfg=7
    hi IncSearch       ctermfg=2  cterm=bold 

    hi Keyword         ctermfg=1
    hi Label           ctermfg=3  cterm=bold 
    hi Macro           ctermfg=2  cterm=bold 
    hi SpecialKey      ctermfg=4

    hi mailSubject     ctermfg=3  cterm=bold 
    hi mailHeaderKey   ctermfg=3  cterm=bold 
    hi mailHeader      ctermfg=3  cterm=bold 
    hi mailQuoted1     ctermfg=6
    hi mailQuoted2     ctermfg=6  cterm=bold 
    hi mailQuoted3     ctermfg=2
    hi mailQuoted4     ctermfg=3
    hi mailQuoted5     ctermfg=1
    hi mailQuoted6     ctermfg=5

    hi MatchParen      ctermfg=0  ctermbg=3
    hi ModeMsg         ctermfg=3  cterm=bold  
    hi MoreMsg         ctermfg=3  cterm=bold  
    hi Operator        ctermfg=1

    " complete menu
    hi Pmenu           ctermfg=4
    hi PmenuSel                    ctermbg=7
    hi PmenuSbar                   ctermbg=8
    hi PmenuThumb      ctermfg=4

    hi PreCondit       ctermfg=2
    hi PreProc         ctermfg=2  
    hi Question        ctermfg=4
    hi Repeat          ctermfg=1
    hi Search          ctermfg=7  ctermbg=1     cterm=bold 
    hi shVariable      ctermfg=3

    " marks column
    hi SignColumn      ctermfg=2  ctermbg=8
    hi SpecialChar     ctermfg=1
    hi SpecialComment  ctermfg=7
    hi Special         ctermfg=4  
    hi SpecialKey      ctermfg=7  

    if has("spell")
        hi clear SpellBad
        hi SpellBad     ctermfg=1 term=underline,standout  cterm=underline
        hi clear SpellCap
        hi SpellCap     ctermfg=3 term=underline  cterm=underline
        hi clear SpellLocal
        hi SpellLocal   ctermfg=3 term=underline  cterm=underline,bold
        hi clear SpellRare
        hi SpellRare    ctermfg=7 term=underline  cterm=underline,bold
    endif

    hi Statement       ctermfg=1
    hi StatusLine      ctermfg=7  ctermbg=6     cterm=bold
    hi StatusLineNC    ctermfg=7                cterm=bold
    hi StorageClass    ctermfg=3
    hi Structure       ctermfg=4 
    hi Tag             ctermfg=1  
    hi Title           ctermfg=3
    hi Todo            ctermfg=3  cterm=bold 

    hi Typedef         ctermfg=4
    hi Type            ctermfg=4                 cterm=none
    hi Underlined      ctermfg=7                 cterm=underline

    hi VertSplit       ctermfg=7
    hi VisualNOS                   ctermbg=8
    hi Visual                      ctermbg=8
    hi WarningMsg      ctermfg=3   ctermbg=8     cterm=bold
    hi WildMenu        ctermfg=4   ctermbg=8

    hi Normal          ctermfg=7   ctermbg=0     cterm=bold
    hi Comment         ctermfg=6
    hi CursorLine                                cterm=none
    hi LineNr          ctermfg=7   ctermbg=8
    hi NonText         ctermfg=7

    " Outlines
    hi OL1             ctermfg=1                cterm=bold
    hi OL2             ctermfg=4                cterm=bold
    hi OL3             ctermfg=6                cterm=bold
    hi OL4             ctermfg=7                cterm=bold
    hi OL5             ctermfg=1
    hi OL6             ctermfg=4
    hi OL7             ctermfg=6
    hi OL8             ctermfg=7
    hi OL9             ctermfg=3

    " Outline tags
    hi outlTags        ctermfg=1                cterm=bold

endif
 
