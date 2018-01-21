" Vim color file
"
" Sweater - Simple & neat, light color scheme for Vim.
"
" File:         sweater.vim
" URL:          github.com/nice/sweater
" Maintainer:   Jayaram R Pai (nice)
" Version:      0.9
" Last Change:  October 5th, 2014
" License:      GPLv3
"
" Copyright (C)  2014 Jayaram R Pai
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

highlight clear Normal
set background=light
highlight clear

if exists("syntax on")
  syntax reset
endif

let colors_name = "sweater"

" general highlights
highlight Normal       ctermfg=236 guifg=#36322c ctermbg=255 guibg=#F8F1E9
highlight Cursor       ctermfg=255 guifg=#F8F1E9 ctermbg=236 guibg=#36322c
highlight MatchParen   ctermbg=102 guibg=#819382 ctermfg=231 guifg=#FFFFFF
highlight Search       ctermbg=238 guibg=#663934 ctermfg=231 guifg=#FFFFFF
highlight Visual       ctermbg=23  guibg=#215870 ctermfg=231 guifg=#FFFFFF
highlight ColorColumn  ctermbg=254 guibg=#E5E5E5
highlight LineNr       ctermbg=251 guibg=#D4C5B9 ctermfg=59  guifg=#646258
highlight StatusLine   ctermfg=251 guifg=#D4C5B9 ctermbg=59  guibg=#646258
highlight StatusLineNC ctermfg=251 guifg=#D4C5B9 ctermbg=255 guibg=#F8F1E9
highlight VertSplit    ctermfg=231 guifg=#FFFFFF ctermbg=243 guibg=#767370 gui=none
highlight Folded       ctermbg=59  guibg=#646258 ctermfg=231 guifg=#FFFFFF gui=none
highlight CursorLine   ctermbg=254 guibg=#E5E5E5 cterm=none
highlight CursorColumn ctermbg=254 guibg=#E5E5E5 cterm=none
highlight Pmenu        ctermfg=255 guifg=#F8F1E9 ctermbg=23  guibg=#215870 gui=none
highlight PmenuSel     ctermfg=236 guifg=#36322c ctermbg=188 guibg=#D6D6D6 gui=none
highlight Title        ctermfg=236 guifg=#36322c gui=none
highlight SpecialKey   ctermfg=61  guifg=#6470a3 gui=none

" syntax highlights
highlight Comment      ctermfg=181 guifg=#DBA69D gui=italic
highlight Constant     ctermfg=124 guifg=#ba1925
highlight Special      ctermfg=125 guifg=#b72231
highlight Identifier   ctermfg=197 guifg=#f92672
highlight Function     ctermfg=197 guifg=#f92672
highlight Statement    ctermfg=61  guifg=#6470a3 gui=none
highlight Operator     ctermfg=61  guifg=#6470a3
highlight PreProc      ctermfg=61  guifg=#6470a3 gui=none
highlight Type         ctermfg=102 guifg=#7A908D gui=none
highlight String       ctermfg=238 guifg=#3f5238 gui=none
highlight Number       ctermfg=238 guifg=#3b3f58 gui=none

" language syntax highlights
highlight link cStatement Statement
highlight link cSpecial Special
