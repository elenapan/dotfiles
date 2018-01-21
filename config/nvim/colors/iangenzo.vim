" This is a fork of the shobogenzo colorscheme but made to work with 256 color
" terminals.  I really like inverted comments and errors show up in blood red.
" Enjoy!
"
" on Fri, 13 Dec 2013

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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#ffffaf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffd75f
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#5fd7ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#d787af
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=117 gui=underline guibg=bg guifg=#5fd7ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=210 ctermfg=231 gui=NONE guibg=#ff5555 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#ffff55 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=237 ctermfg=210 gui=NONE guibg=#3a3a3a guifg=#ff7f5f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#afafd7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0087d7
    CSAHi NonText term=NONE cterm=NONE ctermbg=233 ctermfg=230 gui=NONE guibg=#111111 guifg=#ffffd7
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#00ff5f
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=216 ctermfg=232 gui=reverse guibg=#080808 guifg=#ffaf5f
    CSAHi Search term=NONE cterm=NONE ctermbg=216 ctermfg=232 gui=NONE guibg=#ffaf5f guifg=#080808
    CSAHi MoreMsg term=reverse cterm=NONE ctermbg=138 ctermfg=229 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=138 gui=bold guibg=bg guifg=#875f5f
    CSAHi LineNr term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#afafd7 guifg=#000000
    CSAHi StartifyFile term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySlash term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=208 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi TaglistTagName term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#005fd7
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=34 ctermfg=fg gui=NONE guibg=#008000 guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=208 gui=undercurl guibg=bg guifg=fg guisp=#ff5f00
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=34 gui=undercurl guibg=bg guifg=fg guisp=#00af00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=138 ctermfg=fg gui=NONE guibg=#875f5f guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=103 ctermfg=231 gui=NONE guibg=#5f5f87 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi Function term=bold cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8787
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=214 gui=bold guibg=bg guifg=#ffaf00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=138 ctermfg=229 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=157 ctermfg=138 gui=NONE guibg=#8fffaf guifg=#875f5f
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=229 ctermfg=16 gui=reverse guibg=#000000 guifg=#ffffaf
    CSAHi Title term=bold cterm=bold ctermbg=232 ctermfg=136 gui=bold guibg=#080808 guifg=#af5f00
    CSAHi Visual term=NONE cterm=reverse ctermbg=241 ctermfg=116 gui=reverse guibg=#5fd7d7 guifg=#5f5f5f
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=138 ctermfg=231 gui=NONE guibg=#805f50 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=232 ctermfg=214 gui=NONE guibg=#080808 guifg=#ffaf00
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySpecial term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=208 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=208 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=38 ctermfg=fg gui=NONE guibg=#0087d7 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=237 ctermfg=195 gui=NONE guibg=#393939 guifg=#d7ffff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#9fffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffd7d7
    CSAHi Identifier term=bold cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8787
    CSAHi StartifyPath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=103 ctermfg=230 gui=NONE guibg=#5f5f87 guifg=#ffffd7
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=103 ctermfg=250 gui=NONE guibg=#5f5f87 guifg=#bbbbbb
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=229 gui=NONE guibg=#00af00 guifg=#ffffaf
    CSAHi DiffChange term=bold cterm=NONE ctermbg=38 ctermfg=229 gui=NONE guibg=#0087d7 guifg=#ffffaf
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=229 gui=bold guibg=#af0000 guifg=#ffffaf
    CSAHi DiffText term=reverse cterm=bold ctermbg=34 ctermfg=229 gui=bold guibg=#00af00 guifg=#ffffaf
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=103 gui=NONE guibg=#0b0b0b guifg=#5f5f87
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=138 gui=undercurl guibg=bg guifg=fg guisp=#875f5f
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#ffffaf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#ffd75f
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#5fd7ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=#d787af
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=123 gui=underline guibg=bg guifg=#5fd7ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=#ff5555 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#ffff55 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=237 ctermfg=216 gui=NONE guibg=#3a3a3a guifg=#ff7f5f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#afafd7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0087d7
    CSAHi NonText term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#111111 guifg=#ffffd7
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#00ff5f
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=222 ctermfg=232 gui=reverse guibg=#080808 guifg=#ffaf5f
    CSAHi Search term=NONE cterm=NONE ctermbg=222 ctermfg=232 gui=NONE guibg=#ffaf5f guifg=#080808
    CSAHi MoreMsg term=reverse cterm=NONE ctermbg=138 ctermfg=230 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=138 gui=bold guibg=bg guifg=#875f5f
    CSAHi LineNr term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#afafd7 guifg=#000000
    CSAHi StartifyFile term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySlash term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=208 ctermfg=255 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi TaglistTagName term=NONE cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#005fd7
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=34 ctermfg=fg gui=NONE guibg=#008000 guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=208 gui=undercurl guibg=bg guifg=fg guisp=#ff5f00
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=40 gui=undercurl guibg=bg guifg=fg guisp=#00af00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=138 ctermfg=fg gui=NONE guibg=#875f5f guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=103 ctermfg=255 gui=NONE guibg=#5f5f87 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi Function term=bold cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8787
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=#ffaf00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=138 ctermfg=230 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=158 ctermfg=138 gui=NONE guibg=#8fffaf guifg=#875f5f
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=230 ctermfg=16 gui=reverse guibg=#000000 guifg=#ffffaf
    CSAHi Title term=bold cterm=bold ctermbg=232 ctermfg=172 gui=bold guibg=#080808 guifg=#af5f00
    CSAHi Visual term=NONE cterm=reverse ctermbg=241 ctermfg=123 gui=reverse guibg=#5fd7d7 guifg=#5f5f5f
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=138 ctermfg=255 gui=NONE guibg=#805f50 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=232 ctermfg=220 gui=NONE guibg=#080808 guifg=#ffaf00
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySpecial term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=208 ctermfg=255 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=208 ctermfg=255 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=39 ctermfg=fg gui=NONE guibg=#0087d7 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=237 ctermfg=231 gui=NONE guibg=#393939 guifg=#d7ffff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#9fffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffd7d7
    CSAHi Identifier term=bold cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8787
    CSAHi StartifyPath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=103 ctermfg=231 gui=NONE guibg=#5f5f87 guifg=#ffffd7
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=103 ctermfg=250 gui=NONE guibg=#5f5f87 guifg=#bbbbbb
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=40 ctermfg=230 gui=NONE guibg=#00af00 guifg=#ffffaf
    CSAHi DiffChange term=bold cterm=NONE ctermbg=39 ctermfg=230 gui=NONE guibg=#0087d7 guifg=#ffffaf
    CSAHi DiffDelete term=bold cterm=bold ctermbg=160 ctermfg=230 gui=bold guibg=#af0000 guifg=#ffffaf
    CSAHi DiffText term=reverse cterm=bold ctermbg=40 ctermfg=230 gui=bold guibg=#00af00 guifg=#ffffaf
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=103 gui=NONE guibg=#0b0b0b guifg=#5f5f87
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=138 gui=undercurl guibg=bg guifg=fg guisp=#875f5f
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#ffffaf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ffd75f
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#5fd7ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=175 gui=NONE guibg=bg guifg=#d787af
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=81 gui=underline guibg=bg guifg=#5fd7ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#ff5555 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=227 ctermfg=16 gui=NONE guibg=#ffff55 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=237 ctermfg=209 gui=NONE guibg=#3a3a3a guifg=#ff7f5f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#afafd7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0087d7
    CSAHi NonText term=NONE cterm=NONE ctermbg=233 ctermfg=230 gui=NONE guibg=#111111 guifg=#ffffd7
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#00ff5f
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=215 ctermfg=232 gui=reverse guibg=#080808 guifg=#ffaf5f
    CSAHi Search term=NONE cterm=NONE ctermbg=215 ctermfg=232 gui=NONE guibg=#ffaf5f guifg=#080808
    CSAHi MoreMsg term=reverse cterm=NONE ctermbg=95 ctermfg=229 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=95 gui=bold guibg=bg guifg=#875f5f
    CSAHi LineNr term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#afafd7 guifg=#000000
    CSAHi StartifyFile term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySlash term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=202 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi TaglistTagName term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#005fd7
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#008000 guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=202 gui=undercurl guibg=bg guifg=fg guisp=#ff5f00
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=34 gui=undercurl guibg=bg guifg=fg guisp=#00af00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#875f5f guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#5f5f87 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi Function term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff8787
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=214 gui=bold guibg=bg guifg=#ffaf00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=95 ctermfg=229 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=121 ctermfg=95 gui=NONE guibg=#8fffaf guifg=#875f5f
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=229 ctermfg=16 gui=reverse guibg=#000000 guifg=#ffffaf
    CSAHi Title term=bold cterm=bold ctermbg=232 ctermfg=130 gui=bold guibg=#080808 guifg=#af5f00
    CSAHi Visual term=NONE cterm=reverse ctermbg=59 ctermfg=80 gui=reverse guibg=#5fd7d7 guifg=#5f5f5f
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=95 ctermfg=231 gui=NONE guibg=#805f50 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=232 ctermfg=214 gui=NONE guibg=#080808 guifg=#ffaf00
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySpecial term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=242 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=202 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=202 ctermfg=231 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#0087d7 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=237 ctermfg=195 gui=NONE guibg=#393939 guifg=#d7ffff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#9fffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffd7d7
    CSAHi Identifier term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff8787
    CSAHi StartifyPath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=60 ctermfg=230 gui=NONE guibg=#5f5f87 guifg=#ffffd7
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=60 ctermfg=250 gui=NONE guibg=#5f5f87 guifg=#bbbbbb
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=229 gui=NONE guibg=#00af00 guifg=#ffffaf
    CSAHi DiffChange term=bold cterm=NONE ctermbg=32 ctermfg=229 gui=NONE guibg=#0087d7 guifg=#ffffaf
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=229 gui=bold guibg=#af0000 guifg=#ffffaf
    CSAHi DiffText term=reverse cterm=bold ctermbg=34 ctermfg=229 gui=bold guibg=#00af00 guifg=#ffffaf
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=60 gui=NONE guibg=#0b0b0b guifg=#5f5f87
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=95 gui=undercurl guibg=bg guifg=fg guisp=#875f5f
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=78 gui=NONE guibg=#000000 guifg=#ffffaf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffd75f
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#5fd7ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#d787af
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=43 gui=underline guibg=bg guifg=#5fd7ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=#ff5555 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#ffff55 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=80 ctermfg=69 gui=NONE guibg=#3a3a3a guifg=#ff7f5f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#afafd7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0087d7
    CSAHi NonText term=NONE cterm=NONE ctermbg=16 ctermfg=78 gui=NONE guibg=#111111 guifg=#ffffd7
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#00ff5f
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=73 ctermfg=16 gui=reverse guibg=#080808 guifg=#ffaf5f
    CSAHi Search term=NONE cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=#ffaf5f guifg=#080808
    CSAHi MoreMsg term=reverse cterm=NONE ctermbg=37 ctermfg=78 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#875f5f
    CSAHi LineNr term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#afafd7 guifg=#000000
    CSAHi StartifyFile term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySlash term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=68 ctermfg=79 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi TaglistTagName term=NONE cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#005fd7
    CSAHi ExtraWhitespace term=NONE cterm=NONE ctermbg=20 ctermfg=fg gui=NONE guibg=#008000 guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=#ff5f00
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=24 gui=undercurl guibg=bg guifg=fg guisp=#00af00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#875f5f guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#5f5f87 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=82 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi Function term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff8787
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#ffaf00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=37 ctermfg=78 gui=NONE guibg=#875f5f guifg=#ffffaf
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=46 ctermfg=37 gui=NONE guibg=#8fffaf guifg=#875f5f
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=78 ctermfg=16 gui=reverse guibg=#000000 guifg=#ffffaf
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=52 gui=bold guibg=#080808 guifg=#af5f00
    CSAHi Visual term=NONE cterm=reverse ctermbg=81 ctermfg=42 gui=reverse guibg=#5fd7d7 guifg=#5f5f5f
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#805f50 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=72 gui=NONE guibg=#080808 guifg=#ffaf00
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StartifySpecial term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=82 ctermfg=fg gui=NONE guibg=#6c6c6c guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=68 ctermfg=79 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=68 ctermfg=79 gui=NONE guibg=#ff5f00 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#0087d7 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=80 ctermfg=63 gui=NONE guibg=#393939 guifg=#d7ffff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#9fffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#ffd7d7
    CSAHi Identifier term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff8787
    CSAHi StartifyPath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=37 ctermfg=78 gui=NONE guibg=#5f5f87 guifg=#ffffd7
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=37 ctermfg=85 gui=NONE guibg=#5f5f87 guifg=#bbbbbb
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=24 ctermfg=78 gui=NONE guibg=#00af00 guifg=#ffffaf
    CSAHi DiffChange term=bold cterm=NONE ctermbg=22 ctermfg=78 gui=NONE guibg=#0087d7 guifg=#ffffaf
    CSAHi DiffDelete term=bold cterm=bold ctermbg=48 ctermfg=78 gui=bold guibg=#af0000 guifg=#ffffaf
    CSAHi DiffText term=reverse cterm=bold ctermbg=24 ctermfg=78 gui=bold guibg=#00af00 guifg=#ffffaf
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#0b0b0b guifg=#5f5f87
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#875f5f
endif

if 1
    delcommand CSAHi
endif
