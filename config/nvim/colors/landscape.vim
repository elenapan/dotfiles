set background=dark
highlight clear

let g:colors_name = 'landscape'
if exists('syntax_on')
  syntax reset
endif

highlight Normal gui=none guifg=#dddddd guibg=grey0
highlight Comment term=none ctermfg=243 ctermbg=none gui=none guifg=#767676
highlight Constant term=none ctermfg=111 gui=none guifg=#87afff
highlight String term=none ctermfg=215 ctermbg=none gui=none guifg=#ffaf5f
highlight Character term=none ctermfg=214 ctermbg=none gui=none guifg=#ffaf00
highlight Number term=none ctermfg=81 ctermbg=none gui=none guifg=#5fdfff
highlight Boolean term=none ctermfg=227 ctermbg=none gui=none guifg=#ffff5f
highlight Float term=none ctermfg=85 ctermbg=none gui=none guifg=#5fffaf

highlight Identifier term=none cterm=none ctermfg=117 ctermbg=none gui=none guifg=#87dfff
highlight Function term=none ctermfg=123 ctermbg=none gui=none guifg=#5fffff

highlight Statement term=none ctermfg=76 ctermbg=none gui=none guifg=#5fdf00
highlight Conditional term=none ctermfg=166 ctermbg=none gui=none guifg=#ef7f00
highlight default link Repeat Statement
highlight default link Label Statement
highlight Operator term=none ctermfg=220 ctermbg=none gui=none guifg=#ffdf00
highlight default link Keyword Statement
highlight default link Exception Statement

highlight PreProc term=none ctermfg=39 gui=none guifg=#00afff
highlight Include term=none ctermfg=38 gui=none guifg=#00afdf
highlight Define term=none ctermfg=37 gui=none guifg=#00afaf
highlight Macro term=none ctermfg=36 gui=none guifg=#00af87
highlight PreCondit term=none ctermfg=35 gui=none guifg=#00af5f

highlight Type term=none ctermfg=207 ctermbg=none gui=none guifg=#ff9fff
highlight StorageClass term=none ctermfg=201 ctermbg=none gui=none guifg=#ff7fff
highlight Structure term=none ctermfg=200 ctermbg=none gui=none guifg=#ff7fdf
highlight Typedef term=none ctermfg=199 ctermbg=none gui=none guifg=#ff7faf

highlight Special term=none ctermfg=178 gui=none guifg=orange
highlight SpecialChar term=none ctermfg=208 gui=none guifg=orange
highlight Tag term=none ctermfg=180 gui=none guifg=orange
highlight Delimiter term=none ctermfg=181 gui=none guifg=orange
highlight SpecialComment term=none ctermfg=182 gui=none guifg=violet
highlight Debug term=none ctermfg=183 gui=none guifg=violet

highlight TabLine ctermfg=253 ctermbg=241 guifg=#dadada guibg=#606060
highlight TabLineFill ctermfg=253 ctermbg=241 guifg=#dadada guibg=#606060
highlight TabLineSel cterm=bold ctermfg=253 guifg=#dadada
highlight Visual term=none ctermbg=240 guibg=#585858
highlight default link VisualNOS Visual
highlight Underlined term=underline ctermfg=45 gui=underline guifg=#00dfff
highlight Error term=none ctermfg=15 ctermbg=124 gui=none guifg=#ffffff guibg=#af0000
highlight WarningMsg term=none ctermfg=7 ctermbg=0 gui=none guifg=#c0c0c0 guibg=#000000
highlight WildMenu guibg=#ffaf00 ctermbg=214
highlight Todo cterm=reverse ctermfg=185 ctermbg=16 gui=reverse guifg=#dfdf5f guibg=#000000
highlight DiffAdd term=none cterm=none ctermfg=none ctermbg=22 guifg=fg guibg=#005f00
highlight DiffChange term=none cterm=none ctermfg=none ctermbg=52 guifg=fg guibg=#5f0000
highlight DiffDelete term=none cterm=none ctermfg=none ctermbg=88 guifg=fg guibg=#870000
highlight DiffText term=none cterm=none ctermfg=none ctermbg=160 guifg=fg guibg=#df0000
highlight DiffFile term=none cterm=none ctermfg=47 ctermbg=none guifg=#00ff5f guibg=bg
highlight DiffNewFile term=none cterm=none ctermfg=199 ctermbg=none guifg=#ff00af guibg=bg
highlight default link DiffRemoved DiffDelete
highlight DiffLine term=none cterm=none ctermfg=129 ctermbg=none guifg=#af00ff guibg=bg
highlight default link DiffAdded DiffAdd
highlight default link ErrorMsg Error
highlight default link FullSpace Error
highlight Ignore ctermbg=none gui=none guifg=bg
highlight ModeMsg ctermfg=none guifg=bg guibg=bg

highlight VertSplit term=none gui=none guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
highlight Folded term=none ctermfg=247 ctermbg=235 guifg=#9e9e9e guibg=#262626
highlight FoldColumn term=none ctermfg=247 ctermbg=235 guifg=#9e9e9e guibg=#262626
highlight SignColumn term=none ctermfg=247 ctermbg=235 guifg=#9e9e9e guibg=#262626
highlight SpecialKey term=underline ctermfg=237 gui=none guifg=darkgray
highlight NonText term=none ctermfg=black gui=none guifg=black
highlight StatusLine term=none gui=none guifg=#1c1c1c guibg=#eeeeee gui=none ctermfg=234 ctermbg=255 cterm=none
highlight StatusLineNC term=none gui=none guifg=#262626 guibg=#585858 gui=none ctermfg=235 ctermbg=240 cterm=none
if version >= 700
  if get(g:, 'landscape_cursorline', 1)
    highlight CursorLine term=none cterm=none ctermbg=235 gui=none guibg=#262626
    highlight CursorLineNr term=underline cterm=bold ctermfg=148 ctermbg=235 gui=bold guifg=#afdf00 guibg=#262626
  else
    highlight clear CursorLine
    highlight CursorLineNr term=NONE ctermbg=NONE guibg=NONE
  endif
  highlight ColorColumn term=none cterm=none ctermbg=239 gui=none guibg=#4e4e4e
  highlight Cursor term=reverse cterm=reverse gui=reverse guifg=NONE guibg=NONE
  highlight CursorColumn term=none cterm=none ctermbg=235 gui=none guibg=#262626
  highlight LineNr term=none ctermfg=58 ctermbg=none guifg=#5f5f00 guibg=bg
  highlight MatchParen ctermfg=none ctermbg=238 guibg=#4e4e4e
  highlight Pmenu ctermfg=233 ctermbg=249 gui=none guifg=#121212 guibg=#b2b2b2
  highlight PmenuSel ctermfg=233 ctermbg=242 gui=none guifg=#121212 guibg=#666666
  highlight PmenuSbar ctermfg=233 ctermbg=244 gui=none guifg=#121212 guibg=#808080
  highlight PmenuThumb ctermfg=233 ctermbg=239 gui=none guifg=#121212 guibg=#4e4e4e
endif
highlight Search cterm=reverse ctermfg=220 ctermbg=234 gui=reverse guifg=#ffdf00 guibg=#1c1c1c
highlight IncSearch cterm=reverse ctermfg=136 ctermbg=236 gui=reverse guifg=#af8700 guibg=#303030

if exists('*getmatches')

  function! s:newmatch() abort
    if !get(g:, 'landscape_highlight_todo', 0) && !get(g:, 'landscape_highlight_full_space', 0)
      return
    endif
    for m in getmatches()
      if m.group ==# 'Todo' || m.group ==# 'FullSpace'
        silent! call matchdelete(m.id)
      endif
    endfor
    if get(g:, 'landscape_highlight_todo', 0)
      call matchadd('Todo', '\c\<todo\>', 10)
    endif
    if get(g:, 'landscape_highlight_full_space', 0)
      call matchadd('FullSpace', "\u3000", 10)
    endif
  endfunction

  augroup landscape-newmatch
    autocmd!
    autocmd VimEnter,BufNew,WinEnter,FileType,BufReadPost * call s:newmatch()
  augroup END

endif

highlight SpellBad term=none cterm=none ctermbg=52 gui=none guibg=#5f0000
highlight default link SpellCap SpellBad
highlight default link SpellLocal SpellBad
highlight default link SpellRare SpellBad

highlight default link vimCmplxRepeat Normal

" for vimshell, vimfiler, unite.vim
highlight default link Command Function
highlight default link GitCommand Constant
highlight default link Arguments Type
highlight default link PdfHtml Function
highlight default link Archive Special
highlight default link Image Type
highlight default link Multimedia SpecialComment
highlight default link System Comment
highlight default link Text Constant
highlight default link Link Constant
highlight default link Exe Statement
highlight default link Prompt PreCondit
highlight default link Icon LineNr
highlight Time ctermfg=141 ctermbg=none gui=none guifg=#af87ff
highlight Date ctermfg=140 ctermbg=none gui=none guifg=#af87df
highlight default link DateToday Special
highlight default link DateWeek Identifier
highlight default link DateOld Comment
highlight default link Path Preproc
highlight default link Marked StorageClass
highlight default link Title Identifier

" Conceal
" CursorIM
" Directory
" ModeMsg
" MoreMsg
" Question
