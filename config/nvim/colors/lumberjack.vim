" \
" /     ^     ^     ^     ^     ^     ^     ^
" \    /_\   /_\   /_\   /_\   /_\   /_\   /_\
" /     |     |     |     |     |     |     |
" \
" /  _             __           _           _  __
" \ | |  _  _ _  _|  | ___ __  |_| __  ___ | |/ /
" / | |_| || | \/ | _ | __|   \ _ / _\/  _||   |
" \ |___|____|____|___|___|_|\_\ |____\____|_|\_\
" /                            | |
" \                            | |
" /                            | |  /|
" \                            | | /||
" /                            |_|/ ||
" \                           |___  ||
" /                            |_|\ ||
" \                                \||
" /                                 \|
"
" Copyright (c) 2015 Davy Duperron
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" Reset syntax highlighting
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

" Go with 256 colors term if not in GUI
if !has('gui_running')
  set t_Co=256
end

" Thou shalt always carry your axe around with you
let g:colors_name='lumberjack'

" Rendering
let s:none='NONE'
function! s:r(group, style)
  execute 'hi' a:group
    \'gui='     (has_key(a:style, 'gui')   ? a:style.gui      : s:none)
    \'guifg='   (has_key(a:style, 'fg')    ? a:style.fg.gui   : s:none)
    \'guibg='   (has_key(a:style, 'bg')    ? a:style.bg.gui   : s:none)
    \'cterm='   (has_key(a:style, 'cterm') ? a:style.cterm    : s:none)
    \'ctermfg=' (has_key(a:style, 'fg')    ? a:style.fg.cterm : s:none)
    \'ctermbg=' (has_key(a:style, 'bg')    ? a:style.bg.cterm : s:none)
endfunction

" Lumberjack colors
let s:grey1  = { 'gui': '#1a1a1a', 'cterm': '0'  }
let s:grey2  = { 'gui': '#212121', 'cterm': '8'  }
let s:grey3  = { 'gui': '#2e2e2e', 'cterm': '6'  }
let s:grey4  = { 'gui': '#303030', 'cterm': '13' }
let s:grey5  = { 'gui': '#757475', 'cterm': '14' }
let s:grey6  = { 'gui': '#858585', 'cterm': '12' }
let s:red    = { 'gui': '#bd2a2a', 'cterm': '1'  }
let s:brown1 = { 'gui': '#b56124', 'cterm': '5'  }
let s:brown2 = { 'gui': '#947463', 'cterm': '3'  }
let s:brown3 = { 'gui': '#c76440', 'cterm': '9'  }
let s:green1 = { 'gui': '#5d875d', 'cterm': '2'  }
let s:green2 = { 'gui': '#9acd32', 'cterm': '10' }
let s:blue   = { 'gui': '#9bcbeb', 'cterm': '4'  }
let s:yellow = { 'gui': '#f0e95d', 'cterm': '11' }
let s:white1 = { 'gui': '#fffefc', 'cterm': '7'  }
let s:white2 = { 'gui': '#ffffff', 'cterm': '15' }

" Generate the highlight groups
call s:r('Boolean',        { 'fg': s:green2 })
call s:r('Character',      { 'fg': s:blue   })
call s:r('Comment',        { 'fg': s:grey4  })
call s:r('Constant',       { 'fg': s:yellow })
call s:r('Conditional',    { 'fg': s:red    })
call s:r('Cursor',         { 'bg': s:blue,   'fg': s:grey1  })
call s:r('CursorLine',     { 'bg': s:grey2  })
call s:r('CursorLineNR',   { 'fg': s:yellow })
call s:r('ColorColumn',    { 'bg': s:grey2,  'fg': s:white2 })
call s:r('Delimiter',      { 'fg': s:blue   })
call s:r('Directory',      { 'fg': s:brown3 })
call s:r('Error',          { 'fg': s:red })
call s:r('Exception',      { 'fg': s:yellow })
call s:r('Folded',         { 'bg': s:grey2,  'fg': s:yellow })
call s:r('Function',       { 'fg': s:blue   })
call s:r('Identifier',     { 'fg': s:brown1 })
call s:r('IncSearch',      { 'bg': s:blue,   'fg': s:grey1  })
call s:r('Keyword',        { 'fg': s:red    })
call s:r('Label',          { 'fg': s:blue   })
call s:r('LineNr',         { 'fg': s:grey3  })
call s:r('MatchParen',     { 'fg': s:red    })
call s:r('Normal',         { 'bg': s:grey1,  'fg': s:grey6  })
call s:r('NonText',        { 'fg': s:grey4  })
call s:r('Number',         { 'fg': s:green1 })
call s:r('Operator',       { 'fg': s:green2 })
call s:r('PreProc',        { 'fg': s:brown3 })
call s:r('Repeat',         { 'fg': s:brown2 })
call s:r('Search',         { 'bg': s:blue,   'fg': s:grey1  })
call s:r('SignColumn',     { 'fg': s:yellow })
call s:r('Statement',      { 'fg': s:red    })
call s:r('Special',        { 'fg': s:grey5  })
call s:r('SpecialComment', { 'fg': s:grey5  })
call s:r('SpecialChar',    { 'fg': s:grey6  })
call s:r('SpecialKey',     { 'fg': s:green2 })
call s:r('StatusLine',     { 'bg': s:grey2,  'fg': s:grey6  })
call s:r('StatusLineNC',   { 'bg': s:grey2,  'fg': s:grey6  })
call s:r('StorageClass',   { 'fg': s:yellow })
call s:r('String',         { 'fg': s:yellow })
call s:r('Tag',            { 'fg': s:white1 })
call s:r('Title',          { 'fg': s:green1 })
call s:r('Todo',           { 'fg': s:white1 })
call s:r('Type',           { 'fg': s:blue   })
call s:r('Underlined',     { 'bg': s:green1, 'fg': s:grey1  })
call s:r('VertSplit',      { 'bg': s:grey2,  'fg': s:grey2  })
call s:r('Visual',         { 'bg': s:grey2,  'fg': s:green1 })

