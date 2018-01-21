hi clear

if exists ("syntax_on")
  syntax reset
endif

let g:colors_name = "sky"

" Color palette.
let s:earth_gui = ["#8D6E63", "#BCAAA4"]
let s:earth_cterm = [95, 145]

let s:sky_gui = ["#00191a", "#003133", "#006064", "#0097A7", "#00BCD4"]
let s:sky_cterm = [00, 23, 23, 31, 38]

let s:star_gui = ["#e0e0e0", "#f5f5f5"]
let s:star_cterm = [188, 15]

let s:status_gui = ["#80c684", "#f5be19", "#f44034"]
let s:status_cterm = [114, 214, 203]

" Default, no background is set to allow transparency.
exe "hi Normal gui=NONE guifg=" s:star_gui[0] "guibg=NONE ctermfg=" s:star_cterm[0] "ctermbg=NONE"

" Editing.
exe "hi Cursor gui=NONE guifg=" s:star_gui[1] "guibg=" s:sky_gui[4] "ctermfg=" s:star_cterm[1] "ctermbg=" s:sky_cterm[4]
exe "hi CursorLine gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi CursorLineNr gui=NONE guifg=" s:sky_gui[4] "guibg=" s:sky_gui[0] "ctermfg=" s:sky_cterm[4] "ctermbg=" s:sky_cterm[0]
exe "hi LineNr gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"

" Number column.
exe "hi CursorColumn gui=NONE guifg=NONE guibg=" s:sky_gui[1] "ctermfg=NONE ctermbg=" s:sky_cterm[1]
exe "hi FoldColumn gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi Folded gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi SignColumn gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"

" Window/tab delimiters.
exe "hi ColorColumn gui=NONE guifg=" s:sky_gui[4] "guibg=" s:sky_gui[0] "ctermfg=" s:sky_cterm[4] "ctermbg=" s:sky_cterm[0]
exe "hi TabLine gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi TabLineFill gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi TabLineSel gui=NONE guifg=NONE guibg=" s:sky_gui[2] "ctermfg=NONE ctermbg=" s:sky_cterm[2]
exe "hi VertSplit gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"

" File navigation/searching.
exe "hi Directory gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi IncSearch gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi Search gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"

" Prompt/status.
exe "hi ModeMsg gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi MoreMsg gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi Question gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi StatusLine gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi StatusLineNC gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi Title gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi WildMenu gui=NONE guifg=" s:star_gui[1] "guibg=" s:sky_gui[4] "ctermfg=" s:star_cterm[1] "ctermbg=" s:sky_cterm[4]

" Visual aid.
exe "hi Conceal gui=NONE guifg=" s:sky_gui[1] "guibg=NONE ctermfg=" s:sky_cterm[1] "ctermbg=NONE"
exe "hi Error gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi ErrorMsg gui=NONE guifg=" s:status_gui[2] "guibg=NONE ctermfg=" s:status_cterm[2] "ctermbg=NONE"
exe "hi Ignore gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi MatchParen gui=NONE guifg=NONE guibg=" s:sky_gui[1] "ctermfg=NONE ctermbg=" s:sky_cterm[1]
exe "hi NonText gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi SpecialKey gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Todo gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi Underlined gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
exe "hi Visual gui=NONE guifg=" s:star_gui[1] "guibg=" s:sky_gui[2] "ctermfg=" s:star_cterm[1] "ctermbg=" s:sky_cterm[2]
exe "hi VisualNOS gui=NONE guifg=NONE guibg=" s:sky_gui[2] "ctermfg=NONE ctermbg=" s:sky_cterm[2]
exe "hi WarningMsg gui=NONE guifg=" s:status_gui[1] "guibg=NONE ctermfg=" s:status_cterm[1] "ctermbg=NONE"

" Variable types.
exe "hi Boolean gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi Character gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Constant gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi Float gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi Function gui=NONE guifg=" s:star_gui[0] "guibg=NONE ctermfg=" s:star_cterm[0] "ctermbg=NONE"
exe "hi Identifier gui=NONE guifg=" s:star_gui[0] "guibg=NONE ctermfg=" s:star_cterm[0] "ctermbg=NONE"
exe "hi Number gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi String gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi StringDelimiter gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"

" Language constructs.
exe "hi Comment gui=NONE guifg=" s:sky_gui[3] "guibg=NONE ctermfg=" s:sky_cterm[3] "ctermbg=NONE"
exe "hi Conditional gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Debug gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Delimiter gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi Exception gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Include gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Keyword gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Label gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Noise gui=NONE guifg=" s:sky_gui[4] "guibg=NONE ctermfg=" s:sky_cterm[4] "ctermbg=NONE"
exe "hi Operator gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi PreProc gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Repeat gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Special gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi SpecialChar gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi Statement gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi StorageClass gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi Structure gui=NONE guifg=" s:earth_gui[0] "guibg=NONE ctermfg=" s:earth_cterm[0] "ctermbg=NONE"
exe "hi Type gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"

" Diffing.
exe "hi DiffAdd gui=NONE guifg=" s:status_gui[0] "guibg=NONE ctermfg=" s:status_cterm[0] "ctermbg=NONE"
exe "hi DiffChange gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi DiffDelete gui=NONE guifg=" s:status_gui[2] "guibg=NONE ctermfg=" s:status_cterm[2] "ctermbg=NONE"
exe "hi DiffText gui=NONE guifg=" s:status_gui[0] "guibg=NONE ctermfg=" s:status_cterm[0] "ctermbg=NONE"

" Completion menu.
exe "hi Pmenu gui=NONE guifg=" s:star_gui[0] "guibg=" s:sky_gui[2] "ctermfg=" s:star_cterm[0] "ctermbg=" s:sky_cterm[2]
exe "hi PmenuSbar gui=NONE guifg=NONE guibg=" s:sky_gui[0] "ctermfg=NONE ctermbg=" s:sky_cterm[0]
exe "hi PmenuSel gui=NONE guifg=" s:star_gui[1] "guibg=" s:sky_gui[4] "ctermfg=" s:star_cterm[1] "ctermbg=" s:sky_cterm[4]
exe "hi PmenuThumb gui=NONE guifg=NONE guibg=" s:sky_gui[1] "ctermfg=NONE ctermbg=" s:sky_cterm[1]

" Spelling.
exe "hi SpellBad gui=undercurl guisp=NONE guifg=" s:status_gui[2] "guibg=NONE ctermfg=" s:status_cterm[2] "ctermbg=NONE"
exe "hi SpellCap gui=undercurl guisp=NONE guifg=" s:status_gui[2] "guibg=NONE ctermfg=" s:status_cterm[2] "ctermbg=NONE"
exe "hi SpellLocal gui=undercurl guisp=NONE guifg=" s:status_gui[1] "guibg=NONE ctermfg=" s:status_cterm[1] "ctermbg=NONE"
exe "hi SpellRare gui=undercurl guisp=NONE guifg=" s:status_gui[1] "guibg=NONE ctermfg=" s:status_cterm[1] "ctermbg=NONE"

" JavaScript.
exe "hi jsBraces gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"
exe "hi jsFuncBraces gui=NONE guifg=" s:earth_gui[1] "guibg=NONE ctermfg=" s:earth_cterm[1] "ctermbg=NONE"

if has("nvim")
  exe "hi EndOfBuffer gui=NONE guifg=" s:sky_gui[2] "guibg=NONE ctermfg=" s:sky_cterm[2] "ctermbg=NONE"
  exe "hi TermCursor gui=NONE guifg=" s:star_gui[1] "guibg=" s:sky_gui[4] "ctermfg=" s:star_cterm[1] "ctermbg=" s:sky_cterm[4]
  exe "hi TermCursorNC gui=NONE guifg=" s:sky_gui[4] "guibg=" s:sky_gui[0] "ctermfg=" s:sky_cterm[4] "ctermbg=" s:sky_cterm[0]
endif

