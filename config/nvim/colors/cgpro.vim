
 color scheme
"
" Reset colors to default state
set background=dark "or light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "cgpro"

hi Visual guifg=#c8c1ae guibg=#90701d


hi Normal guifg=#b5b5b5 guibg=#262626
hi Boolean         guifg=#c94242
hi Character       guifg=#02d902 gui=italic
hi Comment         guifg=#30b6b6 gui=italic
hi Conditional     guifg=#ffff7f
hi Constant        guifg=#c94242 gui=bold
hi Cursor          guifg=#ffffff guibg=#8faf9f gui=bold
hi Debug           guifg=#c94242 gui=bold
hi ErrorMsg        guifg=#80d4aa guibg=#2f2f2f gui=bold
hi Exception       guifg=#c94242
"hi Float           guifg=#b5b5b5
hi Number          guifg=#b5b5b5
hi Function        guifg=#c94242 gui=italic
hi LineNr          guifg=#b5b5b5 guibg=#261515
hi Operator        guifg=#ffff7f
hi PreCondit       guifg=#ffff7f
hi Question        guifg=#ffffff gui=bold
hi Repeat          guifg=#ffff7f
hi SpecialComment  guifg=#00ff00 gui=bold
hi Special         guifg=#00ff00
hi Statement       guifg=#ffff7f gui=bold
hi StatusLine      guifg=#313633 guibg=#ccdc90
hi StatusLineNC    guifg=#2e3330 guibg=#88b090
hi String          guifg=#09b509
hi Structure       guifg=#c94242
hi Tag             guifg=#30b6b6 gui=bold
hi Title           guifg=#efefef gui=bold
hi Todo            guifg=#30b6b6 guibg=bg gui=bold
hi Typedef         guifg=#dfe4cf gui=bold
hi Type            guifg=#c94242 gui=none

" figure out how to make these work
hi Builtin         guifg=#ccdc90
hi BuiltinObj      guifg=#ccdc90
"hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none

" menu stuff
hi Pmenu           guibg=darkslategray guifg=wheat
hi PMenuSel        guibg=lightslategray guifg=gold gui=bold
hi PmenuSbar       guibg=blue guifg=green
hi PMenuThumb      guibg=orange guifg=yellow

