" ----------------------------------------------------
" Name:       abra - vim color scheme
" Maintainer: Aydar Khabibullin <aydar.kh@gmail.com>
" URL:        https://github.com/abra/vim-abra
" Version:    0.2
" Created:    01/30/2011 12:35:30 AM
" Modified:   08/20/2015 13:23:00 AM
" ----------------------------------------------------

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name="abra"

let s:Colors = [
  \'#a082bd','#c4c8cc','#79b541',
  \'#d5a400','#ec7600','#FF850a',
  \'#d5cb7d','#d39745','#4e5a5f',
  \'#678cb1','#5899c0','#5ab9be',
  \'#1A252A','#24333a','#e1c70d',
  \'#FFFFFF','#3c5975','#374043']

" Syntax
execute "hi Normal  guifg="     . s:Colors[1]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Comment guifg="     . s:Colors[8]  . " guibg=" . s:Colors[12] . " gui=italic"
execute "hi Conditional guifg=" . s:Colors[2]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Constant guifg="    . s:Colors[1]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Error guifg="       . s:Colors[7]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Identifier guifg="  . s:Colors[9]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Ignore guifg="      . s:Colors[1]
execute "hi Operator guifg="    . s:Colors[6]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi PreProc guifg="     . s:Colors[0]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Repeat guifg="      . s:Colors[2]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Special guifg="     . s:Colors[2]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Statement guifg="   . s:Colors[2]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Number guifg="      . s:Colors[3]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Boolean guifg="     . s:Colors[11] . " guibg=" . s:Colors[12] . " gui=none"
execute "hi String guifg="      . s:Colors[5]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Character guifg="   . s:Colors[5]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Title guifg="       . s:Colors[1]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Todo guifg="        . s:Colors[12] . " guibg=" . s:Colors[0]  . " gui=none guisp=NONE"
execute "hi Type guifg="        . s:Colors[9]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Underline guifg="   . s:Colors[10] . " guibg=" . s:Colors[12] . " gui=none"

" Groups
execute "hi Cursor guifg="      . s:Colors[12] . " guibg=" . s:Colors[5]  . " gui=none"
execute "hi CursorIM guifg="    . s:Colors[7]  . " guibg=" . s:Colors[5]  . " gui=none"
execute "hi CursorLine guifg=NONE guibg=" . s:Colors[13]
execute "hi CursorColumn guifg=". s:Colors[1]  . " guibg=" . s:Colors[13] . " gui=none"
execute "hi Directory guifg="   . s:Colors[10] . " guibg=" . s:Colors[12] . " gui=none"
execute "hi ErrorMsg guifg="    . s:Colors[13] . " guibg=" . s:Colors[7]  . " gui=none"
execute "hi FoldColumn guifg="  . s:Colors[13] . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Folded guifg="      . s:Colors[12] . " guibg=" . s:Colors[0] . " gui=none"
execute "hi IncSearch guifg="   . s:Colors[1]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi LineNr guifg="      . s:Colors[8]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi MatchParen guifg="  . s:Colors[12] . " guibg=" . s:Colors[11] . " gui=none"
execute "hi ModeMsg guifg="     . s:Colors[5]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi MoreMsg guifg="     . s:Colors[5]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi NonText guifg="     . s:Colors[17]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Pmenu guifg="       . s:Colors[1]  . " guibg=" . s:Colors[8]  . " gui=none"
execute "hi PmenuSel guifg="    . s:Colors[13] . " guibg=" . s:Colors[9]  . " gui=none"
execute "hi Question guifg="    . s:Colors[0]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi Search guifg="      . s:Colors[0]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi SpecialKey guifg="  . s:Colors[10] . " guibg=" . s:Colors[12] . " gui=none"
execute "hi StatusLine guifg="  . s:Colors[15] . " guibg=" . s:Colors[16] . " gui=none"
execute "hi StatusLineNC guifg=". s:Colors[15] . " guibg=" . s:Colors[8]  . " gui=none"
execute "hi TabLine guifg="     . s:Colors[8]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi TabLineFill guifg=" . s:Colors[12] . " guibg=" . s:Colors[13] . " gui=none"
execute "hi TabLineSel guifg="  . s:Colors[1]  . " guibg=" . s:Colors[13] . " gui=none"
execute "hi Tooltip guifg="     . s:Colors[9]  . " guibg=" . s:Colors[8]  . " gui=none"
execute "hi VertSplit guifg="   . s:Colors[0]  . " guibg=" . s:Colors[13] . " gui=none"
execute "hi Visual  guifg="     . s:Colors[1]  . " guibg=" . s:Colors[0]  . " gui=none"
hi VisualNOS gui=none guibg=black
execute "hi WarningMsg  guifg=" . s:Colors[5]  . " guibg=" . s:Colors[12] . " gui=none"
execute "hi WildMenu  guifg="   . s:Colors[14] . " guibg=" . s:Colors[5]  . " gui=none"

