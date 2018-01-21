" Theme: behelit
" Version: 0.3
" Maintainer: oblique <psyberbits@gmail.com>
" 
" Copyright (c) 2014, oblique
" All rights reserved.
" 
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
" 
" * Redistributions of source code must retain the above copyright notice, this
"   list of conditions and the following disclaimer.
" 
" * Redistributions in binary form must reproduce the above copyright notice,
"   this list of conditions and the following disclaimer in the documentation
"   and/or other materials provided with the distribution.
" 
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
" SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
" OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
" OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

highlight clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="behelit"

highlight Normal          guifg=#5fff5f    guibg=#101010    gui=NONE
highlight SpecialKey      guifg=#5f87d7    guibg=NONE       gui=NONE
highlight NonText         guifg=#444444    guibg=#101010    gui=NONE
highlight Directory       guifg=#af87ff    guibg=NONE       gui=NONE
highlight IncSearch       guifg=#101010    guibg=#ff875f    gui=NONE
highlight LineNr          guifg=#5f87af    guibg=#101010    gui=NONE
highlight StatusLine      guifg=#5f5faf    guibg=#1c1c1c    gui=NONE
highlight StatusLineNC    guifg=#585858    guibg=#1c1c1c    gui=NONE
highlight VertSplit       guifg=#1c1c1c    guibg=#1c1c1c    gui=NONE
highlight Visual          guifg=NONE       guibg=#1c1c1c    gui=NONE
highlight VisualNOS       guifg=NONE       guibg=#1c1c1c    gui=underline
highlight WildMenu        guifg=#d7005f    guibg=#1c1c1c    gui=bold
highlight Folded          guifg=#af87ff    guibg=#1c1c1c    gui=NONE
highlight FoldColumn      guifg=#af87ff    guibg=#1c1c1c    gui=NONE
highlight DiffAdd         guifg=#101010    guibg=#5f87d7    gui=NONE
highlight DiffChange      guifg=#101010    guibg=#af87ff    gui=NONE
highlight DiffDelete      guifg=#101010    guibg=#d7005f    gui=NONE
highlight DiffText        guifg=#101010    guibg=#af57ff    gui=NONE
highlight SignColumn      guifg=#d7005f    guibg=#101010    gui=NONE
highlight Conceal         guifg=#ff5f5f    guibg=NONE       gui=NONE
highlight SpellBad        guifg=#d7005f    guibg=NONE       gui=undercurl    guisp=#d7005f
highlight SpellCap        guifg=#af87ff    guibg=NONE       gui=undercurl    guisp=#af87ff
highlight SpellRare       guifg=#00ff87    guibg=NONE       gui=undercurl    guisp=#00ff87
highlight SpellLocal      guifg=#ff5f5f    guibg=NONE       gui=undercurl    guisp=#ff5f5f
highlight Pmenu           guifg=#585858    guibg=#1c1c1c    gui=NONE
highlight PmenuSel        guifg=#101010    guibg=#ff5f5f    gui=NONE
highlight PmenuSbar       guifg=#101010    guibg=#1c1c1c    gui=NONE
highlight PmenuThumb      guifg=#101010    guibg=#af87ff    gui=NONE
highlight TabLine         guifg=#585858    guibg=#1c1c1c    gui=NONE
highlight TablineSel      guifg=#d7005f    guibg=#1c1c1c    gui=bold
highlight TablineFill     guifg=#585858    guibg=#1c1c1c    gui=NONE
highlight CursorColumn    guifg=NONE       guibg=#1c1c1c    gui=NONE
highlight CursorLine      guifg=NONE       guibg=#1c1c1c    gui=NONE
highlight ColorColumn     guifg=NONE       guibg=#1c1c1c    gui=NONE
highlight Cursor          guifg=#101010    guibg=#5fff5f    gui=NONE
highlight CursorIM        guifg=#101010    guibg=#5fff5f    gui=NONE
highlight Special         guifg=#ff5f5f    guibg=NONE       gui=NONE
highlight Identifier      guifg=#5f87d7    guibg=NONE       gui=NONE
highlight PreProc         guifg=#87ff5f    guibg=NONE       gui=bold
highlight Number          guifg=#af87ff    guibg=NONE       gui=NONE
highlight Function        guifg=#af87ff    guibg=NONE       gui=NONE
highlight ErrorMsg        guifg=#d7005f    guibg=NONE       gui=bold
highlight Search          guifg=#101010    guibg=#ffff57    gui=NONE
highlight MoreMsg         guifg=#5f87d7    guibg=NONE       gui=NONE
highlight ModeMsg         guifg=#5f87d7    guibg=NONE       gui=NONE
highlight CursorLineNr    guifg=#ff5f5f    guibg=#1c1c1c    gui=NONE
highlight Question        guifg=#5f87d7    guibg=NONE       gui=bold
highlight WarningMsg      guifg=#ff5f5f    guibg=NONE       gui=bold
highlight Statement       guifg=#d7005f    guibg=NONE       gui=NONE
highlight Type            guifg=#5f87d7    guibg=NONE       gui=NONE
highlight Error           guifg=#d7005f    guibg=NONE       gui=bold
highlight Todo            guifg=#af87ff    guibg=NONE       gui=bold
highlight Title           guifg=#af87ff    guibg=NONE       gui=NONE
highlight MatchParen      guifg=#101010    guibg=#ff875f    gui=NONE
highlight Comment         guifg=#585858    guibg=NONE       gui=NONE
highlight Constant        guifg=#af87ff    guibg=NONE       gui=NONE
highlight String          guifg=#ffff87    guibg=NONE       gui=NONE
highlight Character       guifg=#ffff87    guibg=NONE       gui=NONE
highlight Underlined      guifg=NONE       guibg=NONE       gui=underline
highlight diffRemoved     guifg=#d7005f    guibg=NONE       gui=NONE
highlight diffAdded       guifg=#5f87ff    guibg=NONE       gui=NONE
highlight diffFile        guifg=#af87ff    guibg=NONE       gui=NONE

if &t_Co > 255
  highlight Normal          ctermfg=83      ctermbg=233     cterm=NONE
  highlight SpecialKey      ctermfg=68      ctermbg=NONE    cterm=NONE
  highlight NonText         ctermfg=237     ctermbg=233     cterm=NONE
  highlight Directory       ctermfg=141     ctermbg=NONE    cterm=NONE
  highlight IncSearch       ctermfg=0       ctermbg=209     cterm=NONE
  highlight LineNr          ctermfg=67      ctermbg=233     cterm=NONE
  highlight StatusLine      ctermfg=61      ctermbg=234     cterm=NONE
  highlight StatusLineNC    ctermfg=240     ctermbg=234     cterm=NONE
  highlight VertSplit       ctermfg=234     ctermbg=234     cterm=NONE
  highlight Visual          ctermfg=NONE    ctermbg=234     cterm=NONE
  highlight VisualNOS       ctermfg=NONE    ctermbg=234     cterm=underline
  highlight WildMenu        ctermfg=161     ctermbg=234     cterm=bold
  highlight Folded          ctermfg=141     ctermbg=234     cterm=NONE
  highlight FoldColumn      ctermfg=141     ctermbg=234     cterm=NONE
  highlight DiffAdd         ctermfg=0       ctermbg=68      cterm=NONE
  highlight DiffChange      ctermfg=0       ctermbg=141     cterm=NONE
  highlight DiffDelete      ctermfg=0       ctermbg=161     cterm=NONE
  highlight DiffText        ctermfg=0       ctermbg=135     cterm=NONE
  highlight SignColumn      ctermfg=161     ctermbg=233     cterm=NONE
  highlight Conceal         ctermfg=203     ctermbg=NONE    cterm=NONE
  highlight SpellBad        ctermfg=161     ctermbg=NONE    cterm=underline
  highlight SpellCap        ctermfg=141     ctermbg=NONE    cterm=underline
  highlight SpellRare       ctermfg=48      ctermbg=NONE    cterm=underline
  highlight SpellLocal      ctermfg=203     ctermbg=NONE    cterm=underline
  highlight Pmenu           ctermfg=240     ctermbg=234     cterm=NONE
  highlight PmenuSel        ctermfg=0       ctermbg=203     cterm=NONE
  highlight PmenuSbar       ctermfg=0       ctermbg=234     cterm=NONE
  highlight PmenuThumb      ctermfg=0       ctermbg=141     cterm=NONE
  highlight TabLine         ctermfg=240     ctermbg=234     cterm=NONE
  highlight TablineSel      ctermfg=161     ctermbg=234     cterm=bold
  highlight TablineFill     ctermfg=240     ctermbg=234     cterm=NONE
  highlight CursorColumn    ctermfg=NONE    ctermbg=234     cterm=NONE
  highlight CursorLine      ctermfg=NONE    ctermbg=234     cterm=NONE
  highlight ColorColumn     ctermfg=NONE    ctermbg=234     cterm=NONE
  highlight Cursor          ctermfg=0       ctermbg=83      cterm=NONE
  highlight CursorIM        ctermfg=0       ctermbg=83      cterm=NONE
  highlight Comment         ctermfg=240     ctermbg=NONE    cterm=NONE
  highlight Constant        ctermfg=141     ctermbg=NONE    cterm=NONE
  highlight Special         ctermfg=203     ctermbg=NONE    cterm=NONE
  highlight Identifier      ctermfg=68      ctermbg=NONE    cterm=NONE
  highlight PreProc         ctermfg=119     ctermbg=NONE    cterm=bold
  highlight String          ctermfg=228     ctermbg=NONE    cterm=NONE
  highlight Character       ctermfg=228     ctermbg=NONE    cterm=NONE
  highlight Number          ctermfg=141     ctermbg=NONE    cterm=NONE
  highlight Function        ctermfg=141     ctermbg=NONE    cterm=bold
  highlight ErrorMsg        ctermfg=161     ctermbg=NONE    cterm=bold
  highlight Search          ctermfg=0       ctermbg=227     cterm=NONE
  highlight MoreMsg         ctermfg=68      ctermbg=NONE    cterm=NONE
  highlight ModeMsg         ctermfg=68      ctermbg=NONE    cterm=NONE
  highlight CursorLineNr    ctermfg=203     ctermbg=234     cterm=NONE
  highlight Question        ctermfg=68      ctermbg=NONE    cterm=bold
  highlight WarningMsg      ctermfg=203     ctermbg=NONE    cterm=bold
  highlight Statement       ctermfg=161     ctermbg=NONE    cterm=bold
  highlight Type            ctermfg=68      ctermbg=NONE    cterm=NONE
  highlight Error           ctermfg=161     ctermbg=NONE    cterm=bold
  highlight Todo            ctermfg=141     ctermbg=NONE    cterm=bold
  highlight Title           ctermfg=141     ctermbg=NONE    cterm=NONE
  highlight MatchParen      ctermfg=0       ctermbg=209     cterm=NONE
  highlight Underlined      ctermfg=NONE    ctermbg=NONE    cterm=underline
  highlight diffRemoved     ctermfg=161     ctermbg=NONE    cterm=NONE
  highlight diffAdded       ctermfg=69      ctermbg=NONE    cterm=NONE
  highlight diffFile        ctermfg=141     ctermbg=NONE    cterm=NONE
end
