" Source repo: http://github.com/rking/vim-detailed
"
" So many 256-color schemes merely shift the palette around, displaying only 8
" colors (even though they're a *different* set of 8 colors than default).
"
" This scheme is more detailed than that.
"
" Your eyes will learn to pick up on subtler patterns without requiring as
" much from your conscious mind.  Instead of the goal being merely looking
" cool, the goal is to maximize info bandwidth from the computer to the brain.
" The regexes, for example, are much easier to pick out. The overall feel of a
" given file becomes much more intuitively recognizeable (you'll know you're
" in foo.rb, not bar.rb, without having to read any text). Certain bits will
" "pop" into being the right colors, such as the difference between
" "RUBY_VERISON" and "RUBY_VERSION", or # encoding: utf-8
"
" ## 256 Color Requirement
"
" If you aren't getting 256 colors, you aren't getting detailed.vim.
" Typically, you'll have to make sure your `$TERM` variable is set right. This
" can get un-set by some programs, such as tmux. So you can force it to
" something like:
"
"     export TERM=screen-256color
"     # or:
"     export TERM=xterm-256color
"
" If these are unavailable on the target system, you might have to place a
" terminfo file in `~/.terminfo/`  -or- you can be totally gross and force it
" with `:set &t_Co=256` in vim. But don't be gross. It's uncouth.
"
" ## Download
"
"  If using Pathogen,
"
"      cd ~/.vim/bundle && git clone https://github.com/rking/vim-detailed
"
"  If using no vim plugin manager:
"
"      mkdir -p ~/.vim/colors/ && cd $_ && wget https://raw.github.com/rking/vim-detailed/master/colors/detailed.vim
"
" ## Setup
"
" In your ~/.vimrc (or ~/.vim/plugin/colorscheme.vim if you like to organize):
"
"     colo detailed
"
" This enables it globally. If you want to just do it for a trial, as long as
" you have done one of the steps in the "Download" section, above, you can do:
"
"     vim foo.rb +colo\ detailed
"
" Or, from within vim:
"
"     :colo detailed

let colors_name = 'detailed'

" Prevent any screwy setting from causing errors:
let s:save_cpo = &cpo | set cpo&vim

" Turn on moar syntaks!
let ruby_operators = 1

" If you don't have this, rails.vim will zap the matchers when it resets
" syntax for its own additions:
au Syntax * call s:fatpacked_rainbow_parens()
au Syntax * call s:detailed_syntax_addtions()

au Syntax ruby call s:ruby_syntax_and_highlights()
au Syntax c    call s:c_syntax_and_highlights()
au Syntax diff call s:diff_syntax_and_highlights()
au Syntax vim  call s:vim_syntax_and_highlights()
au Syntax javascript call s:javascript_syntax_and_highlights()
au Syntax go   call s:go_syntax_and_highlights()

" Show detailed syntax stack
nmap <Leader>dets :call <SID>SynStack()<CR>
fun! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

" Color Palette {{{

" Boring ctermfg ⇒ guifg map {{{
let s:cterm_gui_map = {
  \0: '000000',
  \1: 'ff0000',
  \2: '00ff00',
  \3: 'ffff00',
  \4: '0000ff',
  \5: 'ff00ff',
  \6: '00ffff',
  \16: '000000',
  \17: '00005f',
  \18: '000087',
  \19: '0000af',
  \20: '0000d7',
  \21: '0000ff',
  \22: '005f00',
  \23: '005f5f',
  \24: '005f87',
  \25: '005faf',
  \26: '005fd7',
  \27: '005fff',
  \28: '008700',
  \29: '00875f',
  \30: '008787',
  \31: '0087af',
  \32: '0087d7',
  \33: '0087ff',
  \34: '00af00',
  \35: '00af5f',
  \36: '00af87',
  \37: '00afaf',
  \38: '00afd7',
  \39: '00afff',
  \40: '00d700',
  \41: '00d75f',
  \42: '00d787',
  \43: '00d7af',
  \44: '00d7d7',
  \45: '00d7ff',
  \46: '00ff00',
  \47: '00ff5f',
  \48: '00ff87',
  \49: '00ffaf',
  \50: '00ffd7',
  \51: '00ffff',
  \52: '5f0000',
  \53: '5f005f',
  \54: '5f0087',
  \55: '5f00af',
  \56: '5f00d7',
  \57: '5f00ff',
  \58: '5f5f00',
  \59: '5f5f5f',
  \60: '5f5f87',
  \61: '5f5faf',
  \62: '5f5fd7',
  \63: '5f5fff',
  \64: '5f8700',
  \65: '5f875f',
  \66: '5f8787',
  \67: '5f87af',
  \68: '5f87d7',
  \69: '5f87ff',
  \70: '5faf00',
  \71: '5faf5f',
  \72: '5faf87',
  \73: '5fafaf',
  \74: '5fafd7',
  \75: '5fafff',
  \76: '5fd700',
  \77: '5fd75f',
  \78: '5fd787',
  \79: '5fd7af',
  \80: '5fd7d7',
  \81: '5fd7ff',
  \82: '5fff00',
  \83: '5fff5f',
  \84: '5fff87',
  \85: '5fffaf',
  \86: '5fffd7',
  \87: '5fffff',
  \88: '870000',
  \89: '87005f',
  \90: '870087',
  \91: '8700af',
  \92: '8700d7',
  \93: '8700ff',
  \94: '875f00',
  \95: '875f5f',
  \96: '875f87',
  \97: '875faf',
  \98: '875fd7',
  \99: '875fff',
  \100: '878700',
  \101: '87875f',
  \102: '878787',
  \103: '8787af',
  \104: '8787d7',
  \105: '8787ff',
  \106: '87af00',
  \107: '87af5f',
  \108: '87af87',
  \109: '87afaf',
  \110: '87afd7',
  \111: '87afff',
  \112: '87d700',
  \113: '87d75f',
  \114: '87d787',
  \115: '87d7af',
  \116: '87d7d7',
  \117: '87d7ff',
  \118: '87ff00',
  \119: '87ff5f',
  \120: '87ff87',
  \121: '87ffaf',
  \122: '87ffd7',
  \123: '87ffff',
  \124: 'af0000',
  \125: 'af005f',
  \126: 'af0087',
  \127: 'af00af',
  \128: 'af00d7',
  \129: 'af00ff',
  \130: 'af5f00',
  \131: 'af5f5f',
  \132: 'af5f87',
  \133: 'af5faf',
  \134: 'af5fd7',
  \135: 'af5fff',
  \136: 'af8700',
  \137: 'af875f',
  \138: 'af8787',
  \139: 'af87af',
  \140: 'af87d7',
  \141: 'af87ff',
  \142: 'afaf00',
  \143: 'afaf5f',
  \144: 'afaf87',
  \145: 'afafaf',
  \146: 'afafd7',
  \147: 'afafff',
  \148: 'afd700',
  \149: 'afd75f',
  \150: 'afd787',
  \151: 'afd7af',
  \152: 'afd7d7',
  \153: 'afd7ff',
  \154: 'afff00',
  \155: 'afff5f',
  \156: 'afff87',
  \157: 'afffaf',
  \158: 'afffd7',
  \159: 'afffff',
  \160: 'd70000',
  \161: 'd7005f',
  \162: 'd70087',
  \163: 'd700af',
  \164: 'd700d7',
  \165: 'd700ff',
  \166: 'd75f00',
  \167: 'd75f5f',
  \168: 'd75f87',
  \169: 'd75faf',
  \170: 'd75fd7',
  \171: 'd75fff',
  \172: 'd78700',
  \173: 'd7875f',
  \174: 'd78787',
  \175: 'd787af',
  \176: 'd787d7',
  \177: 'd787ff',
  \178: 'd7af00',
  \179: 'd7af5f',
  \180: 'd7af87',
  \181: 'd7afaf',
  \182: 'd7afd7',
  \183: 'd7afff',
  \184: 'd7d700',
  \185: 'd7d75f',
  \186: 'd7d787',
  \187: 'd7d7af',
  \188: 'd7d7d7',
  \189: 'd7d7ff',
  \190: 'd7ff00',
  \191: 'd7ff5f',
  \192: 'd7ff87',
  \193: 'd7ffaf',
  \194: 'd7ffd7',
  \195: 'd7ffff',
  \196: 'ff0000',
  \197: 'ff005f',
  \198: 'ff0087',
  \199: 'ff00af',
  \200: 'ff00d7',
  \201: 'ff00ff',
  \202: 'ff5f00',
  \203: 'ff5f5f',
  \204: 'ff5f87',
  \205: 'ff5faf',
  \206: 'ff5fd7',
  \207: 'ff5fff',
  \208: 'ff8700',
  \209: 'ff875f',
  \210: 'ff8787',
  \211: 'ff87af',
  \212: 'ff87d7',
  \213: 'ff87ff',
  \214: 'ffaf00',
  \215: 'ffaf5f',
  \216: 'ffaf87',
  \217: 'ffafaf',
  \218: 'ffafd7',
  \219: 'ffafff',
  \220: 'ffd700',
  \221: 'ffd75f',
  \222: 'ffd787',
  \223: 'ffd7af',
  \224: 'ffd7d7',
  \225: 'ffd7ff',
  \226: 'ffff00',
  \227: 'ffff5f',
  \228: 'ffff87',
  \229: 'ffffaf',
  \230: 'ffffd7',
  \231: 'ffffff',
  \232: '080808',
  \233: '121212',
  \234: '1c1c1c',
  \235: '262626',
  \236: '303030',
  \237: '3a3a3a',
  \238: '444444',
  \239: '4e4e4e',
  \240: '585858',
  \241: '626262',
  \242: '6c6c6c',
  \243: '767676',
  \244: '808080',
  \245: '8a8a8a',
  \246: '949494',
  \247: '9e9e9e',
  \248: 'a8a8a8',
  \249: 'b2b2b2',
  \250: 'bcbcbc',
  \251: 'c6c6c6',
  \252: 'd0d0d0',
  \253: 'dadada',
  \254: 'e4e4e4',
  \255: 'eeeeee',
  \}
" }}}

let s:c = {
  \'basic8_red (TODO: use this)': 1,
  \'basic8_green': 2,
  \'basic8_yellow': 3,
  \'basic8_blue (TODO: use this)': 4,
  \'basic8_magenta': 5,
  \'basic8_cyan': 6,
  \'basic8_black': 0,
  \'red52': 52,
  \'red88': 88,
  \'red124': 124,
  \'red160': 160,
  \'red161': 161,
  \'red196': 196,
  \'yellow58': 58,
  \'yellow100': 100,
  \'yellow136 (TODO: use this)': 136,
  \'yellow142 (TODO: use this)': 142,
  \'yellow148': 148,
  \'yellow149': 149,
  \'yellow190': 190,
  \'yellow220 (TODO: use this)': 220,
  \'yellow228': 228,
  \'orange208': 208,
  \'orange178': 178,
  \'orange180': 180,
  \'orange222': 222,
  \'light_yellow230': 229,
  \'graygreen (TODO: use this)': 23,
  \'green22': 22,
  \'green23': 23,
  \'green28': 28,
  \'green34': 34,
  \'green37': 37,
  \'green71': 71,
  \'green76': 76,
  \'green84': 84,
  \'green114': 114,
  \'green123': 123,
  \'seafoam': 30,
  \'seafoam2 (TODO: use this)': 35,
  \'teal50': 50,
  \'blue17 (TODO: use this)': 17,
  \'blue19 (TODO: use this)': 19,
  \'blue20 (TODO: use this)': 20,
  \'blue25': 25,
  \'blue27': 27,
  \'blue33': 33,
  \'blue37': 37,
  \'blue75': 75,
  \'blue87': 87,
  \'lavender104': 104,
  \'purple53': 53,
  \'purple89 (TODO: use this)': 89,
  \'purple90': 90,
  \'purple95 (TODO: use this)': 95,
  \'purple99 (TODO: use this)': 79,
  \'purple125': 125,
  \'purple126': 126,
  \'purple127': 127,
  \'purple131': 131,
  \'purple132': 132,
  \'purple139': 139,
  \'purple134': 134,
  \'purple141 (TODO: use this)': 141,
  \'purple161 (TODO: use this)': 161,
  \'purple201': 201,
  \'purple224': 224,
  \'purple225': 225,
  \'gray16': 16,
  \'gray232': 232,
  \'gray233': 233,
  \'gray234': 234,
  \'gray235': 235,
  \'gray236': 236,
  \'gray237': 237,
  \'gray238': 238,
  \'gray239': 239,
  \'gray240': 240,
  \'gray241': 241,
  \'gray242': 242,
  \'gray243': 243,
  \'gray244': 244,
  \'gray245': 245,
  \'gray246': 246,
  \'gray247': 247,
  \'gray248': 248,
  \'gray249': 249,
  \'gray250': 250,
  \'gray251': 251,
  \'gray252': 252,
  \'gray253': 253,
  \'gray254': 254,
  \'gray255': 255,
  \}

" }}}

" :hi funcs {{{
fun! s:color_for(id, fgbg)
  let num = s:c[a:id]
  let gui = s:cterm_gui_map[l:num]
  return 'cterm'.a:fgbg.'='.l:num.' gui'.a:fgbg.'=#'.l:gui
endfun

fun! s:fg(group, fg)
  exe 'hi '.a:group.' '.s:color_for(a:fg,'fg')
endfun

fun! s:bg(group, bg)
  exe 'hi '.a:group.' '.s:color_for(a:bg,'bg')
endfun

fun! s:fgbg(group, fg, bg)
  exe 'hi '.a:group.' '.s:color_for(a:fg,'fg').' '.s:color_for(a:bg,'bg')
endfun

fun! s:bold(group)
  exe 'hi '.a:group.' cterm=bold gui=bold'
endfun

fun! s:bold_fg(group, fg)
  call s:fg(a:group, a:fg)
  call s:bold(a:group)
endfun

fun! s:bold_fgbg(group, fg, bg)
  call s:fgbg(a:group, a:fg, a:bg)
  call s:bold(a:group)
endfun

fun! s:underline_fgbg(group, fg, bg)
  exe 'hi '.a:group.' ctermfg='.s:c[a:fg].' '
    \s:color_for(a:bg,'bg').' cterm=underline,bold gui=underline,bold'
endfun

fun! s:make_obvious(group)
  call s:fgbg(a:group, 'green84', 'red160')
endfun
" }}}

" For now, force darkness. If you're a big fan of white bg's, let me know, and
" we can collaborate on a solution.
set bg=dark
call s:fgbg('Normal', 'gray254', 'gray232')

" Basic/Default-like Palette {{{
hi SpecialKey     term=bold ctermfg=81 guifg=Cyan
hi NonText        term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory      term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse gui=reverse
hi MoreMsg        term=bold ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg        term=bold cterm=bold gui=bold
hi LineNr gui=NONE term=NONE guifg=#005f87 ctermfg=24
hi CursorLineNr   term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question       term=standout ctermfg=121 gui=bold guifg=Green
hi StatusLine     term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse gui=reverse
hi VertSplit      term=reverse cterm=reverse gui=reverse
hi Title          term=bold ctermfg=225 gui=bold guifg=Magenta
hi WarningMsg     term=standout ctermfg=224 guifg=Red
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi FoldColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi SpellBad       term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi TabLine        term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=242 guibg=Grey40
hi Constant       term=underline ctermfg=13 guifg=#ffa0a0
hi Special        term=bold ctermfg=224 guifg=Orange
hi Identifier     term=underline cterm=bold ctermfg=14 guifg=#40ffff
hi Statement      term=bold ctermfg=11 gui=bold guifg=#ffff60
hi PreProc        term=underline ctermfg=81 guifg=#ff80ff
hi Type           term=underline ctermfg=121 gui=bold guifg=#60ff60
hi Underlined     term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore         ctermfg=0 guifg=bg
hi Error          term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo           term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

call s:fg('Comment', 'gray242') " In my books, comments should be quiet.
" }}}

" Generic links {{{
hi link String          detailedString
hi link Character       Constant
hi link Number          detailedInteger
hi link Boolean         detailedBoolean
hi link Float           detailedFloat
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          detailedRepeat
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
"}}}

" s:detailed_colors — the good stuff {{{
fun! s:detailed_colors()
  call s:diff_syntax_and_highlights() " For vimdiff, which uses other filetypes

  call s:underline_fgbg('MatchParen', 'gray255', 'gray243')

  " For :set colorcolumn=80
  call s:fgbg('ColorColumn', 'gray254', 'gray233')

  " For the Syntastic and quickfixsigns plugins:
  call s:bg('SignColumn', 'gray233')

  "* Distinguish between each of TODO/FIXME/XXX
  call s:fgbg('detailedTodo', 'green76', 'gray238')
  call s:fgbg('detailedFixme', 'gray232', 'orange208')
  call s:fgbg('detailedXxx', 'gray235', 'red196')

  call s:fgbg('Error', 'gray235', 'red196')
  call s:underline_fgbg('Search', 'gray254', 'gray235')

  call s:fgbg('Folded', 'blue37', 'gray237')

  " ^P (completion) menu
  call s:fgbg('Pmenu', 'gray232', 'gray246')
  call s:fgbg('PmenuSel', 'gray232', 'green28')
  call s:bg('PmenuSbar', 'gray234')
  call s:bg('PmenuThumb', 'gray232')

  " Visual selections
  call s:bg('Visual', 'green22')
  hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline

  " Tone this one down a bit. The color lowers contrast and is too obtrusive.
  call s:bg('Conceal', 'gray235')

  " https://github.com/bitc/vim-bad-whitespace
  call s:fgbg('BadWhitespace', 'gray238', 'yellow58')

  call s:fg('detailedConstant', 'green34')

  call s:bold_fg('detailedClass', 'purple126')
  call s:fg('detailedModule', 'purple126')
  call s:fg('detailedDefine', 'green23')
  call s:fg('detailedInclude', 'purple53')
  call s:fg('detailedDeclaration', 'yellow100') " Originally for go lang
  call s:fg('detailedDeclType', 'green37') " Originally for go lang

  call s:bold_fg('detailedFunction', 'blue27')

  call s:fg('detailedInstanceVariable', 'blue75')

  call s:fgbg('detailedString', 'purple125', 'gray233')
  call s:fgbg('detailedInterpolatedString', 'purple126', 'gray233')
  call s:bold_fgbg('detailedExecutedString', 'green34', 'purple53')
  call s:fgbg('detailedRawString', 'red160', 'gray233')
  call s:fg('detailedStringDelimiter', 'blue33')
  call s:fg('detailedInterpolationDelimiter', 'gray244')

  call s:fg('detailedRegexpSpecial', 'seafoam')

  call s:fg('detailedRegexpCharClass', 'basic8_green')
  call s:fg('detailedRegexpQuantifier', 'yellow148')
  call s:bold_fg('detailedRegexpEscape', 'purple90')
  call s:fg('detailedRegexpAnchor', 'purple90')
  call s:fg('detailedRegexpDot', 'green34')
  call s:bold_fg('detailedRegexpDelimiter', 'red88')
  call s:fgbg('rubyRegexp', 'red160', 'gray233')
  call s:fg('detailedASCIICode', 'green71')

  call s:fg('detailedPseudoVariable', 'purple125')
  call s:fg('detailedInteger', 'purple134')
  call s:fg('detailedFloat', 'purple132')
  call s:bold_fg('detailedImaginary', 'purple139')

  call s:fg('detailedBlockArgument', 'blue87')
  call s:fg('detailedSymbol', 'lavender104')
  call s:bold_fg('detailedBlockParameter', 'basic8_cyan')
  call s:fg('detailedBlockParameterList', 'blue25')
  call s:bold_fg('detailedPredefinedConstant', 'green22')
  call s:bold_fg('detailedPredefinedVariable', 'blue37')
  call s:fg('detailedBoolean', 'purple131')
  call s:fg('detailedOperator', 'green123')
  call s:fg('detailedAccess', 'yellow100')
  call s:fg('detailedAttribute', 'orange178') " attr_{accessor,reader,writer}
  call s:fg('detailedEval', 'yellow190')

  " Blocks:
  " (basic)
  call s:fg('detailedMethodBlock', 'green114')
  call s:fg('detailedBlock', 'purple225')
  call s:fg('detailedBlockExpression', 'orange180')
  " (conditionals)
  call s:fg('detailedControl', 'orange178')
  call s:bold_fg('Conditional', 'basic8_yellow')
  call s:bold_fg('detailedConditionalModifier', 'yellow148') " 'Yoda if'
  call s:fg('detailedConditionalExpression', 'light_yellow230')
  " (loops)
  call s:bold_fg('detailedRepeat', 'orange178')
  call s:bold_fg('detailedRepeatModifier', 'yellow149') " …while/until
  call s:fg('detailedRepeatExpression', 'orange222')

  call s:fg('detailedSharpBang', 'gray251')
  " hi rubyMultilineComment cleared
  call s:fg('detailedDataDirective', 'purple201')
  call s:fg('detailedData', 'gray245')

  call s:bold_fg('detailedDirective', 'green22')

  "* `fail`/`raise`/`exit` were yellow by default, but here a more warny orange.
  call s:fg('Exception', 'orange208')
  "* class `@@vars` get ugly, cautionary color: they are troublesome.
  call s:fgbg('rubyClassVariable', 'blue75', 'red52')
  "* global `$vars` also get a bit of ugliness. Everyone knows they're iffy.
  call s:fgbg('rubyGlobalVariable', 'red161', 'gray234')

  " rails.vim niceness:
  call s:fg('detailedRailsARAssociationMethod', 'teal50')

  " detailed.vim especialties:
  call s:fg('detailedInitialize', 'green84')
  hi link detailedEncodingDirective detailedDirective

  hi link detailedExits Exception
endfun

fun! s:diff_syntax_and_highlights()
  " vimdiff uses Diff*
  call s:bg('DiffChange', 'gray240')
  call s:bg('DiffText', 'gray232')
  call s:bg('DiffAdd', 'green23')
  call s:bg('DiffDelete', 'yellow58')
  " ft=diff syntax uses diff*
  call s:fg('diffAdded', 'green34')
  call s:fg('diffRemoved', 'yellow58')
  " diffFile
endfun

fun! s:c_syntax_and_highlights()
  hi link cRepeat detailedRepeat
  hi link cUserLabel detailedRepeat
  hi link cInclude detailedModule
  hi link cStatement detailedControl " return goto asm continue break
  hi link cConstant detailedConstant
  hi link cNumber detailedInteger
  " Since the C details came after Ruby, the names could be redone a bit:
  hi link cIncluded detailedString
  hi link cStructure detailedClass
  hi link cStorageClass detailedClass
  hi link cOperator detailedDefine
endfun

fun! s:go_syntax_and_highlights()

  " hi link goBlock detailedBlock
  hi link goDirective detailedDirective
  hi link goDeclaration detailedDeclaration
  hi link goDeclType detailedDeclType
  hi link goConstants detailedBoolean
  hi link goStatement detailedControl
  hi link goRawString detailedRawString
  hi link goImaginary detailedImaginary
  hi link goSpaceError BadWhitespace
endfun

fun! s:vim_syntax_and_highlights()
  hi link vimFuncKey detailedDefine
  hi link vimFunction detailedFunction
  "hi link vimFuncBody detailedDefine
endfun

fun! s:javascript_syntax_and_highlights()
  hi link javascriptFunction detailedDefine
  hi link javascriptIdentifier Type
  hi link javascriptRailsFunction detailedInstanceVariable
endfun

fun! s:detailed_syntax_addtions()
  call s:detailed_colors()

  " TODO - somehow make the detail{Todo,Fixme,Xxx} work for non-ruby langs.
  " E.g., shTodo overrides them, so it will need something like:
  " syn match   rubyComment   "#.*" contains=rubySharpBang,rubySpaceError,
  "     \rubyFirstAndSecondCommentLine,detailedTodo,detailedFixme,detailedXxx,@Spell
  syn keyword detailedTodo TODO contained
  syn keyword detailedFixme FIXME contained
  syn keyword detailedXxx XXX contained
endfun
call s:detailed_syntax_addtions() " Hrm, can this not be done with aucmd?

fun! s:ruby_syntax_and_highlights()
  " Steal this back from the too-generic 'rubyControl':
  syn match detailedExits "\<\%(exit!\|\%(abort\|at_exit\|exit\|fork\|trap\)\>[?!]\@!\)"

  " TODO: also handle %(…), etc
  syn region detailedInterpolatedString matchgroup=detailedInterpolatedStringDelimiter start="\"" end="\"" skip="\\\\\|\\\"" contains=@rubyStringSpecial,@Spell fold
  " TODO: Also, %x(). Anything else?
  syn region detailedExecutedString matchgroup=detailedExecutedStringDelimiter start="`" end="`"  skip="\\\\\|\\`"  contains=@rubyStringSpecial fold

  " The default syntax/ruby.vim gets this way wrong (only does 2 chars and is
  " transparent):
  syn match rubyBlockArgument "&[_[:lower:]][_[:alnum:]]*" contains=NONE display
  " Bonus!
  syn match rubyInitialize '\<initialize\>' contained containedin=rubyMethodDeclaration

  syn match rubyEncodingDirective "\cencoding: *utf-8" contained

  " TODO - make this more elegant.
  syn match rubyFirstAndSecondCommentLine '\%^#.*'
        \ contains=rubyEncodingDirective contained
  syn match rubyFirstAndSecondCommentLine '\%^#.*\n#.*'
        \ contains=rubyEncodingDirective contained

  syn match   rubyComment   "#.*" contains=rubySharpBang,rubySpaceError,
        \rubyFirstAndSecondCommentLine,detailedTodo,detailedFixme,detailedXxx,@Spell

  hi link rubyConditional  Conditional
  hi link rubyExceptional  rubyConditional " No-show.
  hi link rubyMethodExceptional  rubyDefine " And another.
  hi link rubyStringEscape  Special
  hi link rubyQuoteEscape  rubyStringEscape
  hi link rubyInvalidVariable  Error
  hi link rubyNoInterpolation  rubyString " E.g. \#{} inside a string.
  hi link rubyException   Exception
  hi link rubyKeyword     Keyword
  hi link rubyConstant detailedConstant
  hi link rubyEncodingDirective detailedEncodingDirective
  hi link rubyInitialize detailedInitialize
  hi link rubyRailsARAssociationMethod detailedRailsARAssociationMethod
  hi link rubySpaceError BadWhitespace
  hi link rubyData detailedData
  hi link rubyDataDirective detailedDataDirective
  hi link rubyDocumentation  Comment
  hi link rubyComment Comment
  hi link rubyFirstAndSecondCommentLine rubySharpBang
  hi link rubySharpBang detailedSharpBang
  hi link rubyDoBlock rubyRepeatExpression
  hi link rubyRepeatExpression detailedRepeatExpression
  hi link rubyRepeatModifier detailedRepeatModifier
  hi link rubyRepeat detailedRepeat
  hi link rubyCaseExpression rubyConditionalExpression
  hi link rubyConditionalExpression detailedConditionalExpression
  hi link rubyConditionalModifier detailedConditionalModifier
  hi link rubyControl detailedControl
  hi link rubyBlockExpression detailedBlockExpression
  hi link rubyBlock detailedBlock
  hi link rubyMethodBlock detailedMethodBlock
  hi link rubyEval detailedEval
  hi link rubyAttribute detailedAttribute
  hi link rubyAccess detailedAccess
  hi link rubyBeginEnd    Statement " TODO
  hi link rubyPseudoOperator  rubyOperator " -= /= **= *= etc
  hi link rubyOperator detailedOperator
  hi link rubyBoolean detailedBoolean
  hi link rubyPredefinedVariable detailedPredefinedVariable
  hi link rubyPredefinedConstant detailedPredefinedConstant
  hi link rubyBlockParameterList detailedBlockParameterList
  hi link rubyBlockParameter detailedBlockParameter
  hi link rubySymbol detailedSymbol
  hi link rubyBlockArgument detailedBlockArgument
  hi link rubyFloat detailedFloat
  hi link rubyInteger detailedInteger
  hi link rubyPseudoVariable detailedPseudoVariable
  hi link rubyASCIICode detailedASCIICode
  hi link rubyRegexpDelimiter detailedRegexpDelimiter
  hi link rubyRegexpDot detailedRegexpDot
  hi link rubyRegexpAnchor detailedRegexpAnchor
  hi link rubyRegexpEscape detailedRegexpEscape
  hi link rubyRegexpQuantifier detailedRegexpQuantifier
  hi link rubyRegexpCharClass detailedRegexpCharClass
  hi link rubyRegexpComment Comment
  hi link rubyRegexpSpecial detailedRegexpSpecial
  hi link rubyInterpolationDelimiter detailedInterpolationDelimiter
  hi link rubyStringDelimiter detailedStringDelimiter
  hi link rubyInstanceVariable detailedInstanceVariable
  hi link rubyFunction detailedFunction
  hi link rubyInclude detailedInclude
  hi link rubyDefine detailedDefine
  hi link rubyModule detailedModule
  hi link rubyClass detailedClass

  " Only linked highlights, not actual syntax:
  " call s:make_obvious('rubyIdentifier')
  " call s:make_obvious('rubyError')

  " Pretty much just the leftover default:
  " call s:make_obvious('rubyLocalVariableOrMethod')

  " Gets all [{()}] within any {}'s. Not very useful AFAICT:
  " call s:make_obvious('rubyCurlyBlock')

  " These mess up on first ] of [a[1]]. Seems plain busted.
  " call s:make_obvious('rubyArrayDelimiter')
  " call s:make_obvious('rubyArrayLiteral')

  " Mere implementation details, AFAICT:
  " call s:make_obvious('rubyNestedParentheses')
  " call s:make_obvious('rubyNestedCurlyBraces')
  " call s:make_obvious('rubyNestedAngleBrackets')
  " call s:make_obvious('rubyNestedSquareBrackets')
  " call s:make_obvious('rubyDelimEscape')
  " call s:make_obvious('rubySymbolDelimiter')

  " No-show: call s:make_obvious('rubyMethodDeclaration')
  " Not quite sure why these don't show up:
  " call s:make_obvious('rubyRegexpParens')
  " call s:make_obvious('rubyRegexpBrackets')
  " XXX no clue why this wont show up: call s:make_obvious('rubyHeredocStart')
  " TODO: fix these: call s:make_obvious('rubyAliasDeclaration2')
  "                  call s:make_obvious('rubyAliasDeclaration')
  " TODO! call s:make_obvious('rubyClassDeclaration')
  "       call s:make_obvious('rubyDeclaration')
  " call s:make_obvious('rubyModuleDeclaration')
  " TODO: call s:make_obvious('rubyOptionalDo')
  " TODO: call s:make_obvious('rubyOptionalDoLine')
endfun
" }}}

" Rainbow-Parens Improved {{{
" Inlined from v2.3 of http://www.vim.org/scripts/script.php?script_id=4176
" 1. to remove the external dep, 2. to work around vim-rails resetting it.
" Thanks!
fun! s:fatpacked_rainbow_parens()
  let guifgs = exists('g:rainbow_guifgs')? g:rainbow_guifgs : [
        \ 'DarkOrchid3', 'RoyalBlue3', 'SeaGreen3',
        \ 'DarkOrange3', 'FireBrick',
        \ ]

  " From Pharo Smalltalk:
  " Black, Green, Purple, Maroon, LightGreen, Orange, Red, Blue
  let ctermfgs = exists('g:rainbow_ctermfgs')? g:rainbow_ctermfgs : [
        \ '241', '22', '56', '124', '72', '166', '126', '38', ]

  let max = has('gui_running')? len(guifgs) : len(ctermfgs)

  let cmd = 'syn region %s matchgroup=%s start=/%s/ end=/%s/ containedin=%s contains=%s'
  let str = 'TOP'
  for each in range(1, max)
    let str .= ',lv'.each
  endfor
  for [left , right] in [['(',')'],['\[','\]'],['{','}']]
    for each in range(1, max - 1)
      exe printf(cmd, 'lv'.each, 'lv'.each.'c', left, right, 'lv'.(each+1) , str)
    endfor
    exe printf(cmd, 'lv'.max, 'lv'.max.'c', left, right, 'lv1' , str)
  endfor

  for id in range(1 , max)
    let ctermfg = ctermfgs[(max - id) % len(ctermfgs)]
    let guifg = guifgs[(max - id) % len(guifgs)]
    exe 'hi default lv'.id.'c ctermfg='.ctermfg.' guifg='.guifg
  endfor
endfun
" }}}

let &cpo = s:save_cpo

" vim:foldmethod=marker
