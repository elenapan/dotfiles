" Cabin colorscheme
"
" Maintainer:	Zak Johnson <zak@hellocabin.com>
" Last Change:	2012-01-22
" URL: https://github.com/cabin/cabin-colorscheme

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cabin"


" General VIM chrome.

hi Normal NONE guifg=#8a8a8a ctermfg=245 guibg=#1c1c1c
hi Cursor NONE guifg=#000000 ctermfg=0 guibg=#5fff87 ctermbg=84
hi MatchParen NONE gui=bold cterm=bold guifg=#5fff87 ctermfg=84
hi StatusLineNC NONE guifg=#303030 ctermfg=236 guibg=#000000 ctermbg=0
hi VertSplit NONE guifg=#000000 ctermfg=0

function! s:StatusLine(focus)
  if exists("g:colors_name") && g:colors_name == "cabin"
    if a:focus
      hi StatusLine NONE guifg=#d0d0d0 ctermfg=252 guibg=#000000 ctermbg=0
    else
      " Use reverse so Vim doesn't add markers to the active status line.
      hi StatusLine gui=reverse cterm=reverse guibg=#303030 ctermbg=236 guifg=#000000 ctermfg=0
    endif
  endif
endfunction
call s:StatusLine(1)

" When another window has focus, no status line is current.
augroup cabin_colorscheme
    au!
    au FocusLost * call s:StatusLine(0)
    au FocusGained * call s:StatusLine(1)
augroup end

hi CursorColumn NONE guibg=#080808 ctermbg=232
hi CursorLine NONE guibg=#080808 ctermbg=232
hi ColorColumn NONE guibg=#080808 ctermbg=232
hi LineNr NONE guifg=#303030 ctermfg=236 guibg=#080808 ctermbg=232
hi SignColumn NONE guifg=#303030 ctermfg=236 guibg=#080808 ctermbg=232
hi FoldColumn NONE guibg=#080808 ctermbg=232
hi Folded NONE guifg=#af8787 ctermfg=138

hi Pmenu NONE guifg=#262626 ctermfg=235 guibg=#6c6c6c ctermbg=242
hi PmenuSel NONE guifg=#000000 ctermfg=0 guibg=#005faf ctermbg=25
hi WildMenu NONE gui=bold cterm=bold guifg=#000000 ctermfg=0 guibg=#005faf ctermbg=25

hi Search NONE guifg=#000000 ctermfg=0 guibg=#afff5f ctermbg=155
hi IncSearch NONE guifg=#000000 ctermfg=0 guibg=#afff5f ctermbg=155
hi Visual NONE guifg=#121212 ctermfg=233 guibg=#8a8a8a ctermbg=245

hi NonText NONE guifg=#005f87 ctermfg=24
hi SpecialKey NONE guifg=#005f87 ctermfg=24

" TODO: refine
hi DiffAdd NONE guibg=#262626 ctermbg=235
hi DiffDelete NONE guibg=#000000 ctermbg=0 guifg=#444444 ctermfg=238
hi DiffChange NONE guibg=#1c1c1c ctermbg=234
hi DiffText NONE guibg=#303030 ctermbg=236

" Unchanged groups (from :help highlight-groups).
" Conceal	placeholder characters substituted for concealed text (see 'conceallevel')
" Directory	directory names (and other special names in listings)
" ErrorMsg	error messages on the command line
" ModeMsg	'showmode' message (e.g., "-- INSERT --")
" MoreMsg	|more-prompt|
" Question	|hit-enter| prompt and yes/no questions
" Title		titles for output from ":set all", ":autocmd" etc.
" WarningMsg	warning messages


" Syntax highlighting (from :help group-name).

hi Comment NONE gui=italic guifg=#585858 ctermfg=240
" TODO: Constant isn't in the 256-color palette.
hi Constant NONE guifg=#8b002e ctermfg=88
hi Identifier NONE guifg=#875faf ctermfg=97
hi Statement NONE gui=bold cterm=bold guifg=#8787af ctermfg=103
hi Type NONE guifg=#5f5f87 ctermfg=60
hi Operator NONE guifg=#6c6c6c ctermfg=242
hi PreProc NONE guifg=#5f5faf ctermfg=61
"hi Special NONE guifg=#5f5f87 ctermfg=60  " TODO: Consider this instead
hi Special NONE guifg=#5f8787 ctermfg=66

hi Underlined NONE  " TODO
hi Ignore guifg=#000000 ctermfg=0
hi Error NONE guifg=#b2b2b2 ctermfg=249 guibg=#af0000 ctermbg=124
hi Todo NONE gui=bold cterm=bold guifg=#000000 ctermfg=0 guibg=#8787af ctermbg=103
