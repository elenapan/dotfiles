" Vim color file
" URL:        https://github.com/uu59/vim-herokudoc-theme
" License:    MIT
"
" This scheme was created by CSApproxSnapshot
" on 金, 14 12月 2012

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#434e56
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=66 ctermfg=247 gui=NONE guibg=#434e56 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#adc6ee
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=191 ctermfg=16 gui=reverse guibg=#010101 guifg=#d8fa3c
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=233 gui=NONE guibg=#fbde2d guifg=#101010
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=66 ctermfg=153 gui=NONE guibg=#434e56 guifg=#adc6ee
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi RubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=191 ctermfg=16 gui=NONE guibg=#d8fa3c guifg=#010101
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#adc6ee guifg=#010101
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=235 ctermfg=191 gui=bold guibg=#292929 guifg=#d8fa3c
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=16 ctermfg=191 gui=bold guibg=#000000 guifg=#d8fa3c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c8c8ff guifg=#010101
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#292929 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=fg gui=bold guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=249 gui=NONE guibg=bg guifg=#aeaeae
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=bold ctermbg=66 ctermfg=153 gui=bold guibg=#434e56 guifg=#adc6ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#434e56
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=102 ctermfg=247 gui=NONE guibg=#434e56 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#adc6ee
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=227 ctermfg=16 gui=reverse guibg=#010101 guifg=#d8fa3c
    CSAHi Search term=reverse cterm=NONE ctermbg=227 ctermfg=233 gui=NONE guibg=#fbde2d guifg=#101010
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=102 ctermfg=195 gui=NONE guibg=#434e56 guifg=#adc6ee
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi RubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=227 ctermfg=16 gui=NONE guibg=#d8fa3c guifg=#010101
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#adc6ee guifg=#010101
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=59 ctermfg=227 gui=bold guibg=#292929 guifg=#d8fa3c
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=16 ctermfg=227 gui=bold guibg=#000000 guifg=#d8fa3c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c8c8ff guifg=#010101
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#292929 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=fg gui=bold guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#aeaeae
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=bold ctermbg=102 ctermfg=195 gui=bold guibg=#434e56 guifg=#adc6ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#434e56
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=247 gui=NONE guibg=#434e56 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#adc6ee
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=191 ctermfg=16 gui=reverse guibg=#010101 guifg=#d8fa3c
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=233 gui=NONE guibg=#fbde2d guifg=#101010
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#434e56 guifg=#adc6ee
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi RubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=191 ctermfg=16 gui=NONE guibg=#d8fa3c guifg=#010101
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#adc6ee guifg=#010101
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=235 ctermfg=191 gui=bold guibg=#292929 guifg=#d8fa3c
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=16 ctermfg=191 gui=bold guibg=#000000 guifg=#d8fa3c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c8c8ff guifg=#010101
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#292929 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi MatchParen term=reverse cterm=bold ctermbg=30 ctermfg=fg gui=bold guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#aeaeae
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=bold ctermbg=59 ctermfg=153 gui=bold guibg=#434e56 guifg=#adc6ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#434e56
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=21 ctermfg=84 gui=NONE guibg=#434e56 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#adc6ee
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=60 ctermfg=16 gui=reverse guibg=#010101 guifg=#d8fa3c
    CSAHi Search term=reverse cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=#fbde2d guifg=#101010
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=21 ctermfg=59 gui=NONE guibg=#434e56 guifg=#adc6ee
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi RubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=16 gui=NONE guibg=#d8fa3c guifg=#010101
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#adc6ee guifg=#010101
    CSAHi TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fbde2d
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#adc6ee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=80 ctermfg=60 gui=bold guibg=#292929 guifg=#d8fa3c
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=16 ctermfg=60 gui=bold guibg=#000000 guifg=#d8fa3c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#434e56 guifg=#f8f8f8
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=#d8fa3c
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#c8c8ff guifg=#010101
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#292929 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=#f8f8f8 guifg=#434e56
    CSAHi MatchParen term=reverse cterm=bold ctermbg=21 ctermfg=fg gui=bold guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#aeaeae
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#d8fa3c
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=bold ctermbg=21 ctermfg=59 gui=bold guibg=#434e56 guifg=#adc6ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=19 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
endif

if 1
    delcommand CSAHi
endif
