" Maintainer: Felipe Contreras <felipe.contreras@gmail.com>
"
" References:
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" :runtime syntax/hitest.vim
" https://github.com/gerw/vim-HiLinkTrace

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "felipec"

if exists("b:current_syntax")
  if b:current_syntax == "diff"
    syn match diffFileId "^diff.*"
    syn match diffFile "^index .*"
    syn match diffOldFile "^--- .*"
    syn match diffNewFile "^+++ .*"
  elseif b:current_syntax == "vim"
    syn match vimHiGuiRgb contained "#\x\{3\}\>"
  endif
endif

" General colors
hi Normal guifg=#eee ctermfg=7 guibg=#111 ctermbg=233 gui=none
hi Cursor guifg=NONE guibg=#bde ctermbg=153 gui=none
hi MatchParen guibg=#56a ctermbg=61

" UI colors
hi ErrorMsg guifg=#000 ctermfg=0 guibg=#fc8 ctermbg=222 gui=bold
hi Folded guifg=#88f ctermfg=105 guibg=#333 ctermbg=236 gui=bold
hi FoldColumn guifg=#88f ctermfg=105 guibg=#333 ctermbg=236 gui=bold
hi NonText guifg=#888 ctermfg=102 guibg=#333 ctermbg=236 gui=none
hi Search guifg=#60a ctermfg=55 guibg=#dbe ctermbg=183 gui=underline
hi SpellBad guisp=#b55
hi SpellCap guisp=#55b
hi SpellRare guisp=#b5b
hi SpellLocal guisp=#5bb
hi LineNr guifg=#bb8 ctermfg=144
hi CursorLineNr guifg=#ee8 ctermfg=228 gui=bold
hi CursorLine guibg=#444 ctermbg=238
hi CursorColumn guibg=#444 ctermbg=238
hi Visual guibg=#333 ctermbg=236
hi Pmenu guifg=#213 ctermfg=235 guibg=#dbe ctermbg=183
hi PmenuSel guifg=#dbe ctermfg=183 guibg=#213 ctermbg=235
hi SignColumn guifg=#8ff guibg=#333

" Syntax highlighting
hi Comment guifg=#999 ctermfg=246 gui=italic

"" Constants
hi Constant guifg=#f88 ctermfg=210 gui=none
hi String guifg=#6e6 ctermfg=83 gui=italic
hi Boolean guifg=#f88 ctermfg=210 gui=bold

hi Identifier guifg=#f8f ctermfg=213 gui=none
hi Function guifg=#8f8 ctermfg=120 gui=bold

hi Statement guifg=#8cf ctermfg=117 gui=none
hi PreProc guifg=#c8f ctermfg=177 gui=none
hi Type guifg=#ef8 ctermfg=228 gui=none
hi Special guifg=#fd8 ctermfg=222 gui=none

hi Todo guifg=#444 ctermfg=238 guibg=#999 ctermbg=246 gui=bold
hi Error guifg=#000 ctermfg=0 guibg=#fc8 ctermbg=222 gui=bold

hi Underlined guifg=#8af ctermfg=111 gui=underline

hi DiffAdd guibg=#354 ctermbg=238 gui=none
hi DiffDelete guifg=#433 ctermfg=237 guibg=#433 ctermbg=237 gui=none
hi DiffChange guibg=#345 ctermbg=238 gui=none
hi DiffText guibg=#345 ctermbg=238 gui=none

hi diffAdded guifg=#5f5 ctermfg=83 gui=none
hi diffRemoved guifg=#f55 ctermfg=203 gui=none
hi diffFileId guifg=#60a ctermfg=55 guibg=#dbe ctermbg=183 gui=none
hi diffFile guifg=#999 ctermfg=246 gui=none
hi diffOldFile guifg=#9f9 ctermfg=120 gui=none
hi diffNewFile guifg=#f99 ctermfg=210 gui=none

hi Keyword guifg=#8ff ctermfg=123
