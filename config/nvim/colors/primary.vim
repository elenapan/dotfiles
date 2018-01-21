"Copyright 2015 Google Inc. All Rights Reserved.

"Licensed under the Apache License, Version 2.0 (the "License");
"you may not use this file except in compliance with the License.
"You may obtain a copy of the License at

"    http://www.apache.org/licenses/LICENSE-2.0

"Unless required by applicable law or agreed to in writing, software
"distributed under the License is distributed on an "AS IS" BASIS,
"WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"See the License for the specific language governing permissions and
"limitations under the License.


"Name:         Primary
"Description:  A Vim color scheme based on Google's colors
"Author:       Lisie Michel
"Created:      2015 March 20
"Modified:     2015 April 21
"GitHub:       https://github.com/google/vim-colorscheme-primary

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'primary'
let s:disable_italic = get(g:,'colorscheme_primary_disable_italic', 0)

if (has('gui_running'))  "Graphical Vim
  "Set color palette with RGB colors
  let s:RED    = '#DB4437'
  let s:GREEN  = '#0F9D58'
  let s:YELLOW = '#F4B400'
  let s:BLUE   = '#4285F4'
  let s:BLACK  = '#000000'
  let s:DGREY  = '#656565'
  let s:LGREY  = '#EEEEEE'
  let s:WHITE  = '#FFFFFF'

  "Set gui mode and italics
  let s:M = 'gui'
  let s:I = s:disable_italic ? 'none' : 'italic'

else                     "Console Vim
  if &t_Co == 256
    "Set color palette with 256 colors
    let s:RED    = '124'
    let s:GREEN  = '28'
    let s:YELLOW = '178'
    let s:BLUE   = '69'
    let s:BLACK  = '16'
    let s:DGREY  = '241'
    let s:LGREY  = '255'
    let s:WHITE  = '231'
  else
    "Set color palette with color names
    let s:RED    = 'red'
    let s:GREEN  = 'green'
    let s:YELLOW = 'yellow'
    let s:BLUE   = 'blue'
    let s:BLACK  = 'black'
    let s:DGREY  = 'grey'
    let s:LGREY  = 'grey'
    let s:WHITE  = 'white'
  endif

  "Set terminal mode and italics (if supported)
  let s:M = 'cterm'
  let s:I = 'none'
  if !s:disable_italic
    let s:terms = ['rxvt', 'gnome-terminal']
    for s:term in s:terms
      if $TERM_PROGRAM =~ s:term
        let s:I = 'italic'
      endif
    endfor
  endif

endif

"Reverse greyscale for light vs dark modes
if &background == 'dark'
  let s:GREY0  = s:WHITE
  let s:GREY1  = s:LGREY
  let s:GREY2  = s:DGREY
  let s:BG     = s:BLACK
else  "light
  let s:GREY0  = s:BLACK
  let s:GREY1  = s:DGREY
  let s:GREY2  = s:LGREY
  let s:BG     = s:WHITE
endif


" Colors for Syntax Highlighting.
exe 'hi String       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'='.s:I
exe 'hi Character    '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'='.s:I
exe 'hi Conditional  '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi Label        '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi Repeat       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi Statement    '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi Keyword      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi Exception    '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'

exe 'hi Normal       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:BLUE .' '.s:M.'=none'
exe 'hi Identifier   '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:BLUE .' '.s:M.'=bold'
exe 'hi Function     '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:BLUE .' '.s:M.'=bold'

exe 'hi Comment      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=none'
exe 'hi Typedef      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'='.s:I
exe 'hi PreProc      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'
exe 'hi Include      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'
exe 'hi Define       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'
exe 'hi Macro        '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'
exe 'hi Precondit    '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'
exe 'hi SpecialComment '.s:M.'bg='.s:BG.' '.s:M.'fg='.s:GREEN.' '.s:M.'=bold'

exe 'hi Special      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi Delimiter    '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi Debug        '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi SpecialChar  '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=bold'
exe 'hi Title        '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=bold'

exe 'hi Constant     '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
exe 'hi Boolean      '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
exe 'hi Number       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
exe 'hi Float        '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
exe 'hi Operator     '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=bold'
exe 'hi Tag          '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=bold'
exe 'hi Ignore       '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
exe 'hi Underlined   '.s:M.'bg='.s:BG  .' '.s:M.'fg='.s:GREY1 .' '.s:M.'=underline'

exe 'hi MatchParen   '.s:M.'bg='.s:RED .' '.s:M.'fg='.s:BG   .' '.s:M.'=none'
exe 'hi Error        '.s:M.'bg='.s:RED .' '.s:M.'fg='.s:BG   .' '.s:M.'=none'

exe 'hi Type         '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:YELLOW.' '.s:M.'=bold'
exe 'hi StorageClass '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:YELLOW.' '.s:M.'=bold'
exe 'hi Structure    '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:YELLOW.' '.s:M.'=bold'
exe 'hi Todo         '.s:M.'bg='.s:YELLOW.' '.s:M.'fg='.s:BG .' '.s:M.'=none'
exe 'hi WildMenu     '.s:M.'bg='.s:YELLOW.' '.s:M.'fg='.s:BG .' '.s:M.'=none'

exe 'hi DiffAdd      '.s:M.'bg='.s:BLUE .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi DiffChange   '.s:M.'bg='.s:GREEN.' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi DiffDelete   '.s:M.'bg='.s:RED  .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi DiffText     '.s:M.'bg='.s:GREY1.' '.s:M.'fg='.'NONE'.'  '.s:M.'=none'


" Colors for the User Interface.
exe 'hi Cursor       '.s:M.'bg='.s:GREY1.' '.s:M.'fg='.s:BG   .' '.s:M.'=bold'
exe 'hi Search       '.s:M.'bg='.s:YELLOW.' '.s:M.'fg='.s:BG  .' '.s:M.'=none'
exe 'hi IncSearch    '.s:M.'bg='.s:YELLOW.' '.s:M.'fg='.s:BG  .' '.s:M.'=none'
exe 'hi ColorColumn  '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.'NONE' .' '.s:M.'=none'
exe 'hi SignColumn   '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:YELLOW.' '.s:M.'=none'

exe 'hi WarningMsg   '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi ErrorMsg     '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:RED  .' '.s:M.'=bold'
exe 'hi ModeMsg      '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:BLUE .' '.s:M.'=bold'
exe 'hi MoreMsg      '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:BLUE .' '.s:M.'=bold'
exe 'hi Question     '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:BLUE .' '.s:M.'=bold'
exe 'hi Directory    '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:GREEN.' '.s:M.'=none'
exe 'hi SpecialKey   '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi Titled       '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi NonText      '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:GREY1.' '.s:M.'=bold'
exe 'hi CursorLineNr '.s:M.'bg='.s:BG   .' '.s:M.'fg='.s:GREY1.' '.s:M.'=bold'

exe 'hi PmenuSel     '.s:M.'bg='.s:BLUE .' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi PmenuSBar    '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
exe 'hi PmenuThumb   '.s:M.'bg='.s:GREY0.' '.s:M.'fg='.s:BG   .' '.s:M.'=none'

if (has('gui_running') || &t_Co == 256)
  exe 'hi Visual       '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.'NONE' .' '.s:M.'=none'
  exe 'hi Pmenu        '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY0.' '.s:M.'=none'
  exe 'hi Linenr       '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
  exe 'hi VertSplit    '.s:M.'bg='.s:GREY1.' '.s:M.'fg='.s:GREY2.' '.s:M.'=none'
  exe 'hi StatusLine   '.s:M.'bg='.s:GREY1.' '.s:M.'fg='.s:GREY2.' '.s:M.'=bold'
  exe 'hi StatusLineNC '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
  exe 'hi Folded       '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
  exe 'hi FoldColumn   '.s:M.'bg='.s:GREY2.' '.s:M.'fg='.s:GREY1.' '.s:M.'=none'
else
  "Eight-color console Vim only supports one shade of grey, so when the FG and
  "BG should both be shades of grey, console Vim must do it differently.
  if &background =='dark'
    let s:GREYX = s:BLACK
    let s:GREYY = s:GREY1
  else
    let s:GREYX = s:GREY1
    let s:GREYY = s:BLACK
  endif
  exe 'hi Visual       '.s:M.'bg='.s:GREYY.' '.s:M.'fg='.'NONE' .' '.s:M.'=none'
  exe 'hi Pmenu        '.s:M.'bg='.s:GREYY.' '.s:M.'fg='.s:GREYX.' '.s:M.'=none'
  exe 'hi Linenr       '.s:M.'bg='.s:GREYX.' '.s:M.'fg='.s:GREYY.' '.s:M.'=none'
  exe 'hi VertSplit    '.s:M.'bg='.s:GREYX.' '.s:M.'fg='.s:GREYY.' '.s:M.'=none'
  exe 'hi StatusLine   '.s:M.'bg='.s:GREYY.' '.s:M.'fg='.s:GREYX.' '.s:M.'=bold'
  exe 'hi StatusLineNC '.s:M.'bg='.s:GREYX.' '.s:M.'fg='.s:GREYY.' '.s:M.'=none'
  exe 'hi Folded       '.s:M.'bg='.s:GREYX.' '.s:M.'fg='.s:GREYY.' '.s:M.'=none'
  exe 'hi FoldColumn   '.s:M.'bg='.s:GREYX.' '.s:M.'fg='.s:GREYY.' '.s:M.'=none'
endif
