
" Author: Sandeep Singh
" Date  : Feb 17, 2013
" Copyright 2013 Sandeep Singh (sandeepsinghmails@gmail.com)
"
" This file is part of Dev_Delight
" Dev_Delight is free software: you can redistribute it
" and/or modify it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" Dev_Delight is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with Dev_Delight. If not, see <http://www.gnu.org/licenses/>.

" This Script achieves a Simple and Elegant Display with Minimal Changes 
" over the Default vim color settings

" To Install, simply copy this script to your:
" .vim/colors directory

hi clear Normal
set bg&

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "Dev_Delight"

hi Comment  	guibg=#fefbed  guifg=#330088  gui=none    ctermbg=8	  ctermfg=7
hi Normal 		guibg=cornsilk 
hi LineNr 		guifg=#937E62  guibg=#FFEFD5
hi Special		gui=bold   
hi String   	guifg=#FF1493
hi Macro    	guifg=#9400D3
hi Number   	guifg=#FF1493   gui=bold 
hi Boolean  	guifg=#FF1493   gui=bold 
hi Character 	guifg=#FF1493   gui=bold 
hi Constant 	guifg=#FF1493   gui=bold 


