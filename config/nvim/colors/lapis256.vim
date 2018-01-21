set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
  endif
let g:colors_name="lapis256"

hi Normal          ctermfg=251      ctermbg=237         cterm=none

hi Comment         ctermfg=245      ctermbg=none        cterm=none
hi Conceal         ctermfg=230      ctermbg=237        cterm=none
hi CommentURL      ctermfg=230      ctermbg=237        cterm=underline
hi SpecialComment  ctermfg=246      ctermbg=none        cterm=none

hi Constant        ctermfg=051      ctermbg=none        cterm=bold
hi String          ctermfg=146      ctermbg=none        cterm=none
hi Character       ctermfg=045      ctermbg=none        cterm=none
hi Number          ctermfg=043      ctermbg=none        cterm=none
hi Boolean         ctermfg=045      ctermbg=none        cterm=none
hi Float           ctermfg=043      ctermbg=none        cterm=none
hi Identifier      ctermfg=044      ctermbg=none        cterm=none
hi Function        ctermfg=081      ctermbg=none        cterm=bold
hi Statement       ctermfg=074      ctermbg=none        cterm=bold
hi Conditional     ctermfg=074      ctermbg=none        cterm=bold
hi Repeat          ctermfg=074      ctermbg=none        cterm=bold
hi Label           ctermfg=074      ctermbg=none        cterm=bold
hi Operator        ctermfg=074      ctermbg=none        cterm=bold
hi Keyword         ctermfg=074      ctermbg=none        cterm=bold
hi Exception       ctermfg=210      ctermbg=none        cterm=bold
hi Type            ctermfg=075      ctermbg=none        cterm=none
hi CustomType      ctermfg=116      ctermbg=none        cterm=none
hi CustomIO        ctermfg=211      ctermbg=none        cterm=none
hi StorageClass    ctermfg=075      ctermbg=none        cterm=bold
hi Structure       ctermfg=075      ctermbg=none        cterm=bold
hi Typedef         ctermfg=075      ctermbg=none        cterm=bold
hi PreProc         ctermfg=086      ctermbg=none        cterm=none
hi Include         ctermfg=086      ctermbg=none        cterm=bold
hi Define          ctermfg=080      ctermbg=none        cterm=bold
hi Macro           ctermfg=080      ctermbg=none        cterm=none
hi PreCondit       ctermfg=080      ctermbg=none        cterm=none
hi Special         ctermfg=255      ctermbg=none        cterm=none
hi SpecialChar     ctermfg=255      ctermbg=none        cterm=none
hi Tag             ctermfg=255      ctermbg=none        cterm=none
hi Delimiter       ctermfg=249      ctermbg=none        cterm=none
hi Debug           ctermfg=214      ctermbg=none        cterm=none
hi Todo            ctermfg=119      ctermbg=none        cterm=none

hi Ignore          ctermfg=none     ctermbg=none        cterm=none
hi StatusLine      ctermfg=015      ctermbg=000         cterm=none
hi WildMenu        ctermfg=210      ctermbg=015         cterm=none
hi Cursor          ctermfg=210      ctermbg=000         cterm=none
hi Error           ctermfg=000      ctermbg=210         cterm=none

hi Pmenu           ctermfg=036      ctermbg=000         cterm=none
hi PmenuSel        ctermfg=000      ctermbg=075         cterm=none
hi PmenuSbar       ctermfg=210      ctermbg=000         cterm=none
hi PmenuThumb      ctermfg=210      ctermbg=000         cterm=none
hi LineNr          ctermfg=240      ctermbg=none        cterm=none

hi Visual          ctermfg=000     ctermbg=197
hi Search          ctermfg=000     ctermbg=197

hi BookmarkSign             ctermfg=075         ctermbg=none
hi BookmarkLine             ctermfg=075         ctermbg=none
hi BookmarkAnnotationSign   ctermfg=075         ctermbg=none
hi BookmarkAnnotationLine   ctermfg=075         ctermbg=none
hi SignColumn               ctermfg=210         ctermbg=none
