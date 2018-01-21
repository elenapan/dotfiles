" -----------------------------------------------------------------------------
" File: colorsbox.vim
" Description: Material color scheme using gruvbox as a skel
" Author: mkarmona <mkarmona@gmail.com>
" Source: https://github.com/mkarmona/colorsbox
" Last Modified: 22 Oct 2015
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='colorsbox-faff'

if !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:colorsbox_bold')
  let g:colorsbox_bold=1
endif
if !exists('g:colorsbox_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:colorsbox_italic=1
  else
    let g:colorsbox_italic=0
  endif
endif
if !exists('g:colorsbox_undercurl')
  let g:colorsbox_undercurl=1
endif
if !exists('g:colorsbox_underline')
  let g:colorsbox_underline=1
endif
if !exists('g:colorsbox_inverse')
  let g:colorsbox_inverse=1
endif

if !exists('g:colorsbox_guisp_fallback') || index(['fg', 'bg'], g:colorsbox_guisp_fallback) == -1
  let g:colorsbox_guisp_fallback='NONE'
endif

if !exists('g:colorsbox_improved_strings')
  let g:colorsbox_improved_strings=0
endif

if !exists('g:colorsbox_improved_warnings')
  let g:colorsbox_improved_warnings=0
endif

if !exists('g:colorsbox_termcolors')
  let g:colorsbox_termcolors=256
endif

if !exists('g:colorsbox_invert_indent_guides')
  let g:colorsbox_invert_indent_guides=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#cdcdc1', 234]     " 29-32-33
let s:gb.dark0       = ['#cdcdc1', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#cdcdc1', 236]     " 50-48-47
let s:gb.dark1       = ['#b3b3a8', 237]     " 60-56-54
let s:gb.dark2       = ['#999990', 239]     " 80-73-69
let s:gb.dark3       = ['#808078', 241]     " 102-92-84
let s:gb.dark4       = ['#666660', 243]     " 124-111-100
let s:gb.dark4_256   = ['#666660', 243]     " 124-111-100

let s:gb.gray_245    = ['#4d4d48', 245]     " 146-131-116 dark

let s:gb.light0_hard = ['#000000', 230]     " 249-245-215 dark
let s:gb.light0      = ['#000000', 229]     " 253-244-193
let s:gb.light0_soft = ['#000000', 228]     " 242-229-188
let s:gb.light1      = ['#1a1a18', 223]     " 235-219-178
let s:gb.light2      = ['#4d4d48', 250]     " 213-196-161
let s:gb.light3      = ['#666660', 248]     " 189-174-147
let s:gb.light4      = ['#808078', 246]     " 168-153-132
let s:gb.light4_256  = ['#808078', 246]     " 168-153-132

let s:gb.bright_red     = ['#bb0000', 167]     " 251-73-52
let s:gb.bright_green   = ['#006400', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#b57614', 214]     " 250-189-47
let s:gb.bright_blue    = ['#1002cd', 109]     " 131-165-152
let s:gb.bright_purple  = ['#9010b0', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#483d8d', 108]     " 142-192-124
let s:gb.bright_orange  = ['#de935f', 208]     " 254-128-25


" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:colorsbox_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:colorsbox_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:colorsbox_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:colorsbox_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:colorsbox_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

if !exists('g:colorsbox_contrast_dark')
  let g:colorsbox_contrast_dark = 'medium'
endif

" determine relative colors
let s:bg0  = s:gb.dark0
if g:colorsbox_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
elseif g:colorsbox_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
endif

let s:bg1  = s:gb.dark1
let s:bg2  = s:gb.dark2
let s:bg3  = s:gb.dark3
let s:bg4  = s:gb.dark4

let s:gray = s:gb.gray_245

let s:fg0 = s:gb.light0
let s:fg1 = s:gb.light1
let s:fg2 = s:gb.light2
let s:fg3 = s:gb.light3
let s:fg4 = s:gb.light4

let s:fg4_256 = s:gb.light4_256

let s:red    = s:gb.bright_red
let s:green  = s:gb.bright_green
let s:yellow = s:gb.bright_yellow
let s:blue   = s:gb.bright_blue
let s:purple = s:gb.bright_purple
let s:aqua   = s:gb.bright_aqua
let s:orange = s:gb.bright_orange

" reset to 16 colors fallback
if g:colorsbox_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}

" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:colorsbox_hls_cursor')
  let s:hls_cursor = get(s:gb, g:colorsbox_hls_cursor)
endif

"let s:number_column = s:bg4
let s:number_column = s:gray
let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:colorsbox_sign_column')
    let s:sign_column = get(s:gb, g:colorsbox_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:colorsbox_color_column')
  let s:color_column = get(s:gb, g:colorsbox_color_column)
endif

let s:vert_split = s:bg2
if exists('g:colorsbox_vert_split')
  let s:vert_split = get(s:gb, g:colorsbox_vert_split)
endif

let s:invert_signs = ''
if exists('g:colorsbox_invert_signs')
  if g:colorsbox_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:colorsbox_invert_selection')
  if g:colorsbox_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:colorsbox_invert_tabline')
  if g:colorsbox_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:colorsbox_italicize_comments')
  if g:colorsbox_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:colorsbox_italicize_strings')
  if g:colorsbox_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:colorsbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:colorsbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" colorsbox Hi Groups: {{{

" memoize common hi groups
call s:HL('colorsboxFg0', s:fg0)
call s:HL('colorsboxFg1', s:fg1)
call s:HL('colorsboxFg2', s:fg2)
call s:HL('colorsboxFg3', s:fg3)
call s:HL('colorsboxFg4', s:fg4)
call s:HL('colorsboxGray', s:gray)
call s:HL('colorsboxBg0', s:bg0)
call s:HL('colorsboxBg1', s:bg1)
call s:HL('colorsboxBg2', s:bg2)
call s:HL('colorsboxBg3', s:bg3)

call s:HL('colorsboxRed', s:red)
call s:HL('colorsboxRedBold', s:red, s:none, s:bold)
call s:HL('colorsboxGreen', s:green)
call s:HL('colorsboxGreenBold', s:green, s:none, s:bold)
call s:HL('colorsboxYellow', s:yellow)
call s:HL('colorsboxYellowBold', s:yellow, s:none, s:bold)
call s:HL('colorsboxBlue', s:blue)
call s:HL('colorsboxBlueBold', s:blue, s:none, s:bold)
call s:HL('colorsboxPurple', s:purple)
call s:HL('colorsboxPurpleBold', s:purple, s:none, s:bold)
call s:HL('colorsboxAqua', s:aqua)
call s:HL('colorsboxAquaBold', s:aqua, s:none, s:bold)
call s:HL('colorsboxOrange', s:orange)
call s:HL('colorsboxOrangeBold', s:orange, s:none, s:bold)

call s:HL('colorsboxRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('colorsboxGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('colorsboxYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('colorsboxBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('colorsboxPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('colorsboxAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg0, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/colorsbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:vim_bg, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:vim_bg, s:bg4, s:bold . s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  "call s:HL('CursorLineNr', s:yellow, s:bg1)
  call s:HL('CursorLineNr', s:fg0, s:bg1)
endif

hi! link NonText colorsboxBg2
hi! link SpecialKey colorsboxBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:bg0, s:yellow)
call s:HL('IncSearch', s:bg0, s:hls_cursor)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg4, s:bg0, s:bold . s:inverse)
call s:HL('StatusLineNC', s:bg2, s:fg4, s:bold . s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:fg4, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory colorsboxGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title colorsboxGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:vim_bg, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg colorsboxYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg colorsboxYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question colorsboxOrangeBold
" Warning messages
hi! link WarningMsg colorsboxRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:colorsbox_improved_strings == 0
  hi! link Special colorsboxOrange
else
  call s:HL('Special', s:bg1, s:orange, s:italic)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement colorsboxRed
" if, then, else, endif, swicth, etc.
hi! link Conditional colorsboxRed
" for, do, while, etc.
hi! link Repeat colorsboxRed
" case, default, etc.
hi! link Label colorsboxRed
" try, catch, throw
hi! link Exception colorsboxRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword colorsboxRed

" Variable name
hi! link Identifier colorsboxBlue
" Function name
hi! link Function colorsboxGreenBold

" Generic preprocessor
hi! link PreProc colorsboxAqua
" Preprocessor #include
hi! link Include colorsboxAqua
" Preprocessor #define
hi! link Define colorsboxAqua
" Same as Define
hi! link Macro colorsboxAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit colorsboxAqua

" Generic constant
hi! link Constant colorsboxPurple
" Character constant: 'c', '/n'
hi! link Character colorsboxPurple
" String constant: "this is a string"
if g:colorsbox_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:bg1, s:fg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean colorsboxPurple
" Number constant: 234, 0xff
hi! link Number colorsboxPurple
" Floating point constant: 2.3e10
hi! link Float colorsboxPurple

" Generic type
hi! link Type colorsboxYellow
" static, register, volatile, etc
hi! link StorageClass colorsboxOrange
" struct, union, enum, etc.
hi! link Structure colorsboxAqua
" typedef
hi! link Typedef colorsboxYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:colorsbox_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link SneakPluginTarget Search
hi! link SneakStreakTarget Search
call s:HL('SneakStreakMask', s:yellow, s:yellow)
hi! link SneakStreakStatusLine Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:colorsbox_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd colorsboxGreenSign
hi! link GitGutterChange colorsboxAquaSign
hi! link GitGutterDelete colorsboxRedSign
hi! link GitGutterChangeDelete colorsboxAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile colorsboxGreen
hi! link gitcommitDiscardedFile colorsboxRed

" }}}
" Signify: {{{

hi! link SignifySignAdd colorsboxGreenSign
hi! link SignifySignChange colorsboxAquaSign
hi! link SignifySignDelete colorsboxRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign colorsboxRedSign
hi! link SyntasticWarningSign colorsboxYellowSign

" }}}
" Signature: {{{

hi! link SignatureMarkerText colorsboxPurpleSign
hi! link SignatureMarkText colorsboxBlueSign

let g:SignatureMarkerTextHL='"SignatureMarkerText"'
let g:SignatureMarkTextHL='"SignatureMarkText"'

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl colorsboxBlueSign
hi! link ShowMarksHLu colorsboxBlueSign
hi! link ShowMarksHLo colorsboxBlueSign
hi! link ShowMarksHLm colorsboxBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch colorsboxYellow
hi! link CtrlPNoEntries colorsboxRed
hi! link CtrlPPrtBase colorsboxBg2
hi! link CtrlPPrtCursor colorsboxBlue
hi! link CtrlPLinePre colorsboxBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket colorsboxFg3
hi! link StartifyFile colorsboxFg0
hi! link StartifyNumber colorsboxBlue
hi! link StartifyPath colorsboxGray
hi! link StartifySlash colorsboxGray
hi! link StartifySection colorsboxYellow
hi! link StartifySpecial colorsboxBg2
hi! link StartifyHeader colorsboxOrange
hi! link StartifyFooter colorsboxBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded colorsboxGreen
hi! link diffRemoved colorsboxRed
hi! link diffChanged colorsboxAqua

hi! link diffFile colorsboxOrange
hi! link diffNewFile colorsboxYellow

hi! link diffLine colorsboxBlue

" }}}
" Html: {{{

hi! link htmlTag colorsboxBlue
hi! link htmlEndTag colorsboxBlue

hi! link htmlTagName colorsboxAquaBold
hi! link htmlArg colorsboxAqua

hi! link htmlScriptTag colorsboxPurple
hi! link htmlTagN colorsboxFg1
hi! link htmlSpecialTagName colorsboxAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar colorsboxOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag colorsboxBlue
hi! link xmlEndTag colorsboxBlue
hi! link xmlTagName colorsboxBlue
hi! link xmlEqual colorsboxBlue
hi! link docbkKeyword colorsboxAquaBold

hi! link xmlDocTypeDecl colorsboxGray
hi! link xmlDocTypeKeyword colorsboxPurple
hi! link xmlCdataStart colorsboxGray
hi! link xmlCdataCdata colorsboxPurple
hi! link dtdFunction colorsboxGray
hi! link dtdTagName colorsboxPurple

hi! link xmlAttrib colorsboxAqua
hi! link xmlProcessingDelim colorsboxGray
hi! link dtdParamEntityPunct colorsboxGray
hi! link dtdParamEntityDPunct colorsboxGray
hi! link xmlAttribPunct colorsboxGray

hi! link xmlEntity colorsboxOrange
hi! link xmlEntityPunct colorsboxOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation colorsboxOrange
hi! link vimBracket colorsboxOrange
hi! link vimMapModKey colorsboxOrange
hi! link vimFuncSID colorsboxFg3
hi! link vimSetSep colorsboxFg3
hi! link vimSep colorsboxFg3
hi! link vimContinue colorsboxFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword colorsboxBlue
hi! link clojureCond colorsboxOrange
hi! link clojureSpecial colorsboxOrange
hi! link clojureDefine colorsboxOrange

hi! link clojureFunc colorsboxYellow
hi! link clojureRepeat colorsboxYellow
hi! link clojureCharacter colorsboxAqua
hi! link clojureStringEscape colorsboxAqua
hi! link clojureException colorsboxRed

hi! link clojureRegexp colorsboxAqua
hi! link clojureRegexpEscape colorsboxAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen colorsboxFg3
hi! link clojureAnonArg colorsboxYellow
hi! link clojureVariable colorsboxBlue
hi! link clojureMacro colorsboxOrange

hi! link clojureMeta colorsboxYellow
hi! link clojureDeref colorsboxYellow
hi! link clojureQuote colorsboxYellow
hi! link clojureUnquote colorsboxYellow

" }}}
" C: {{{

hi! link cOperator colorsboxPurple
hi! link cStructure colorsboxOrange

" }}}
" Python: {{{

hi! link pythonBuiltin colorsboxOrange
hi! link pythonBuiltinObj colorsboxOrange
hi! link pythonBuiltinFunc colorsboxOrange
hi! link pythonFunction colorsboxAqua
hi! link pythonDecorator colorsboxRed
hi! link pythonInclude colorsboxBlue
hi! link pythonImport colorsboxBlue
hi! link pythonRun colorsboxBlue
hi! link pythonCoding colorsboxBlue
hi! link pythonOperator colorsboxRed
hi! link pythonExceptions colorsboxPurple
hi! link pythonBoolean colorsboxPurple
hi! link pythonDot colorsboxFg3

" }}}
" CSS: {{{

hi! link cssBraces colorsboxBlue
hi! link cssFunctionName colorsboxYellow
hi! link cssIdentifier colorsboxOrange
hi! link cssClassName colorsboxGreen
hi! link cssColor colorsboxBlue
hi! link cssSelectorOp colorsboxBlue
hi! link cssSelectorOp2 colorsboxBlue
hi! link cssImportant colorsboxGreen
hi! link cssVendor colorsboxFg1

hi! link cssTextProp colorsboxAqua
hi! link cssAnimationProp colorsboxAqua
hi! link cssUIProp colorsboxYellow
hi! link cssTransformProp colorsboxAqua
hi! link cssTransitionProp colorsboxAqua
hi! link cssPrintProp colorsboxAqua
hi! link cssPositioningProp colorsboxYellow
hi! link cssBoxProp colorsboxAqua
hi! link cssFontDescriptorProp colorsboxAqua
hi! link cssFlexibleBoxProp colorsboxAqua
hi! link cssBorderOutlineProp colorsboxAqua
hi! link cssBackgroundProp colorsboxAqua
hi! link cssMarginProp colorsboxAqua
hi! link cssListProp colorsboxAqua
hi! link cssTableProp colorsboxAqua
hi! link cssFontProp colorsboxAqua
hi! link cssPaddingProp colorsboxAqua
hi! link cssDimensionProp colorsboxAqua
hi! link cssRenderProp colorsboxAqua
hi! link cssColorProp colorsboxAqua
hi! link cssGeneratedContentProp colorsboxAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces colorsboxFg1
hi! link javaScriptFunction colorsboxAqua
hi! link javaScriptIdentifier colorsboxRed
hi! link javaScriptMember colorsboxBlue
hi! link javaScriptNumber colorsboxPurple
hi! link javaScriptNull colorsboxPurple
hi! link javaScriptParens colorsboxFg3

" }}}
" YAJS: {{{

hi! link javascriptImport colorsboxAqua
hi! link javascriptExport colorsboxAqua
hi! link javascriptClassKeyword colorsboxAqua
hi! link javascriptClassExtends colorsboxAqua
hi! link javascriptDefault colorsboxAqua

hi! link javascriptClassName colorsboxYellow
hi! link javascriptClassSuperName colorsboxYellow
hi! link javascriptGlobal colorsboxYellow

hi! link javascriptEndColons colorsboxFg1
hi! link javascriptFuncArg colorsboxFg1
hi! link javascriptGlobalMethod colorsboxFg1
hi! link javascriptNodeGlobal colorsboxFg1

" hi! link javascriptVariable colorsboxOrange
hi! link javascriptVariable colorsboxRed
" hi! link javascriptIdentifier colorsboxOrange
" hi! link javascriptClassSuper colorsboxOrange
hi! link javascriptIdentifier colorsboxOrange
hi! link javascriptClassSuper colorsboxOrange

" hi! link javascriptFuncKeyword colorsboxOrange
" hi! link javascriptAsyncFunc colorsboxOrange
hi! link javascriptFuncKeyword colorsboxAqua
hi! link javascriptAsyncFunc colorsboxAqua
hi! link javascriptClassStatic colorsboxOrange

hi! link javascriptOperator colorsboxRed
hi! link javascriptForOperator colorsboxRed
hi! link javascriptYield colorsboxRed
hi! link javascriptExceptions colorsboxRed
hi! link javascriptMessage colorsboxRed

hi! link javascriptTemplateSB colorsboxAqua
hi! link javascriptTemplateSubstitution colorsboxFg1

" hi! link javascriptLabel colorsboxBlue
" hi! link javascriptObjectLabel colorsboxBlue
" hi! link javascriptPropertyName colorsboxBlue
hi! link javascriptLabel colorsboxFg1
hi! link javascriptObjectLabel colorsboxFg1
hi! link javascriptPropertyName colorsboxFg1

hi! link javascriptLogicSymbols colorsboxFg1
hi! link javascriptArrowFunc colorsboxFg1

hi! link javascriptDocParamName colorsboxFg4
hi! link javascriptDocTags colorsboxFg4
hi! link javascriptDocNotation colorsboxFg4
hi! link javascriptDocParamType colorsboxFg4
hi! link javascriptDocNamedParamType colorsboxFg4

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp colorsboxFg3
hi! link coffeeSpecialOp colorsboxFg3
hi! link coffeeCurly colorsboxOrange
hi! link coffeeParen colorsboxFg3
hi! link coffeeBracket colorsboxOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter colorsboxGreen
hi! link rubyInterpolationDelimiter colorsboxAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier colorsboxRed
hi! link objcDirective colorsboxBlue

" }}}
" Go: {{{

hi! link goDirective colorsboxAqua
hi! link goConstants colorsboxPurple
hi! link goDeclaration colorsboxRed
hi! link goDeclType colorsboxBlue
hi! link goBuiltins colorsboxOrange

" }}}
" Lua: {{{

hi! link luaIn colorsboxRed
hi! link luaFunction colorsboxAqua
hi! link luaTable colorsboxOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp colorsboxFg3
hi! link moonExtendedOp colorsboxFg3
hi! link moonFunction colorsboxFg3
hi! link moonObject colorsboxYellow

" }}}
" Java: {{{

hi! link javaAnnotation colorsboxBlue
hi! link javaDocTags colorsboxAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen colorsboxFg3
hi! link javaParen1 colorsboxFg3
hi! link javaParen2 colorsboxFg3
hi! link javaParen3 colorsboxFg3
hi! link javaParen4 colorsboxFg3
hi! link javaParen5 colorsboxFg3
hi! link javaOperator colorsboxOrange

hi! link javaVarArg colorsboxGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter colorsboxGreen
hi! link elixirInterpolationDelimiter colorsboxAqua

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition colorsboxFg1
hi! link scalaCaseFollowing colorsboxFg1
hi! link scalaCapitalWord colorsboxFg1
hi! link scalaTypeExtension colorsboxFg1

hi! link scalaKeyword colorsboxRed
hi! link scalaKeywordModifier colorsboxRed

hi! link scalaSpecial colorsboxAqua
hi! link scalaOperator colorsboxFg1

hi! link scalaTypeDeclaration colorsboxYellow
hi! link scalaTypeTypePostDeclaration colorsboxYellow

hi! link scalaInstanceDeclaration colorsboxFg1
hi! link scalaInterpolation colorsboxAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 colorsboxGreenBold
hi! link markdownH2 colorsboxGreenBold
hi! link markdownH3 colorsboxYellowBold
hi! link markdownH4 colorsboxYellowBold
hi! link markdownH5 colorsboxYellow
hi! link markdownH6 colorsboxYellow

hi! link markdownCode colorsboxAqua
hi! link markdownCodeBlock colorsboxAqua
hi! link markdownCodeDelimiter colorsboxAqua

hi! link markdownBlockquote colorsboxGray
hi! link markdownListMarker colorsboxGray
hi! link markdownOrderedListMarker colorsboxGray
hi! link markdownRule colorsboxGray
hi! link markdownHeadingRule colorsboxGray

hi! link markdownUrlDelimiter colorsboxFg3
hi! link markdownLinkDelimiter colorsboxFg3
hi! link markdownLinkTextDelimiter colorsboxFg3

hi! link markdownHeadingDelimiter colorsboxOrange
hi! link markdownUrl colorsboxPurple
hi! link markdownUrlTitleDelimiter colorsboxGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType colorsboxYellow
" hi! link haskellOperators colorsboxOrange
" hi! link haskellConditional colorsboxAqua
" hi! link haskellLet colorsboxOrange
"
hi! link haskellType colorsboxFg1
hi! link haskellIdentifier colorsboxFg1
hi! link haskellSeparator colorsboxFg1
hi! link haskellDelimiter colorsboxFg4
hi! link haskellOperators colorsboxBlue
"
hi! link haskellBacktick colorsboxOrange
hi! link haskellStatement colorsboxOrange
hi! link haskellConditional colorsboxOrange

hi! link haskellLet colorsboxAqua
hi! link haskellDefault colorsboxAqua
hi! link haskellWhere colorsboxAqua
hi! link haskellBottom colorsboxAqua
hi! link haskellBlockKeywords colorsboxAqua
hi! link haskellImportKeywords colorsboxAqua
hi! link haskellDeclKeyword colorsboxAqua
hi! link haskellDeriving colorsboxAqua
hi! link haskellAssocType colorsboxAqua

hi! link haskellNumber colorsboxPurple
hi! link haskellPragma colorsboxPurple

hi! link haskellString colorsboxGreen
hi! link haskellChar colorsboxGreen

" }}}
" Json: {{{

hi! link jsonKeyword colorsboxGreen
hi! link jsonQuote colorsboxGreen
hi! link jsonBraces colorsboxFg1
hi! link jsonString colorsboxFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! ColorsboxHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! ColorsboxHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
