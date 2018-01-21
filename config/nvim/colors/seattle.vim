" Seattle
" An elegant yet efficient color scheme for coders
" Author: MingBai <mbbill at gmail.com>
"
"                                                  "
"                                                  "
"                                                  "
"                                                  "
"                                                  "
"
" To Enable Color Preview:
" :SeattleLightsUp
"
" To Update Cterm Color After Modifying RGB Color:
" :SeattleNeon

" {{{
" CMD is not supported currently.
if &term == "win32"
    finish
endif
set background=dark
if exists("g:syntax_on")
    syntax reset
endif
hi clear
let g:colors_name="seattle"
" }}}

" Color Palette
" GUI BEGIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
highlight Normal guifg=#cccccc guibg=#292929

highlight CP_01  guifg=#CCCCCC
highlight CP_02  guifg=#7f7f7f gui=italic
highlight CP_03  guifg=#87C0E0 gui=underline
highlight CP_04  guifg=#292929 guibg=#CCCCCC
highlight CP_05  guifg=NONE    guibg=#4D4D4D
highlight CP_06  guifg=#7F7F7F guibg=#333333
highlight CP_07  guifg=#4D4D4D guibg=#4D4D4D
highlight CP_08  guifg=NONE    guibg=#666666
highlight CP_09  guifg=#AAAAAA guibg=#333333
highlight CP_0A  guifg=#7f7f7f

highlight CP_11  guifg=#F06A6A
highlight CP_12  guifg=#F69A42
highlight CP_13  guifg=#FAC863
highlight CP_14  guifg=#DDA790
highlight CP_15  guifg=#AB7967
highlight CP_16  guifg=#99C794
highlight CP_17  guifg=#5FB3B3
highlight CP_18  guifg=#63B0DC
highlight CP_19  guifg=#6699CC
highlight CP_1a  guifg=#C594C5
highlight CP_1b  guifg=#EE799F

highlight CP_21  guibg=#F06A6A guifg=#000000
highlight CP_22  guibg=#F69A42 guifg=#000000
highlight CP_23  guibg=#FAC863 guifg=#000000
highlight CP_24  guibg=#DDA790 guifg=#000000
highlight CP_25  guibg=#AB7967 guifg=#000000
highlight CP_26  guibg=#99C794 guifg=#000000
highlight CP_27  guibg=#5FB3B3 guifg=#000000
highlight CP_28  guibg=#63B0DC guifg=#000000
highlight CP_29  guibg=#6699CC guifg=#000000
highlight CP_2a  guibg=#C594C5 guifg=#000000
highlight CP_2b  guibg=#EE799F guifg=#000000

highlight CP_31  guibg=#F06A6A guifg=#FFFFFF
highlight CP_32  guibg=#F69A42 guifg=#FFFFFF
highlight CP_33  guibg=#FAC863 guifg=#FFFFFF
highlight CP_34  guibg=#DDA790 guifg=#FFFFFF
highlight CP_35  guibg=#AB7967 guifg=#FFFFFF
highlight CP_36  guibg=#99C794 guifg=#FFFFFF
highlight CP_37  guibg=#5FB3B3 guifg=#FFFFFF
highlight CP_38  guibg=#63B0DC guifg=#FFFFFF
highlight CP_39  guibg=#6699CC guifg=#FFFFFF
highlight CP_3a  guibg=#C594C5 guifg=#FFFFFF
highlight CP_3b  guibg=#EE799F guifg=#FFFFFF
" GUI END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if !has("gui_running")
set t_Co=256
" Lines between CTERM BEGIN and CTERM END will be re-written,
" so DO NOT EDIT! Change GUI colors then call SeattleNeon()
" CTERM BEGIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
highlight Normal ctermfg=252 ctermbg=235
highlight CP_01  ctermfg=252
highlight CP_02  ctermfg=244 cterm=NONE
highlight CP_03  ctermfg=110 cterm=underline
highlight CP_04  ctermfg=235 ctermbg=252
highlight CP_05  ctermfg=NONE    ctermbg=239
highlight CP_06  ctermfg=244 ctermbg=236
highlight CP_07  ctermfg=239 ctermbg=239
highlight CP_08  ctermfg=NONE    ctermbg=241
highlight CP_09  ctermfg=248 ctermbg=236
highlight CP_0A  ctermfg=244
highlight CP_11  ctermfg=203
highlight CP_12  ctermfg=209
highlight CP_13  ctermfg=221
highlight CP_14  ctermfg=180
highlight CP_15  ctermfg=137
highlight CP_16  ctermfg=114
highlight CP_17  ctermfg=73
highlight CP_18  ctermfg=74
highlight CP_19  ctermfg=68
highlight CP_1a  ctermfg=176
highlight CP_1b  ctermfg=211
highlight CP_21  ctermbg=203 ctermfg=16
highlight CP_22  ctermbg=209 ctermfg=16
highlight CP_23  ctermbg=221 ctermfg=16
highlight CP_24  ctermbg=180 ctermfg=16
highlight CP_25  ctermbg=137 ctermfg=16
highlight CP_26  ctermbg=114 ctermfg=16
highlight CP_27  ctermbg=73 ctermfg=16
highlight CP_28  ctermbg=74 ctermfg=16
highlight CP_29  ctermbg=68 ctermfg=16
highlight CP_2a  ctermbg=176 ctermfg=16
highlight CP_2b  ctermbg=211 ctermfg=16
highlight CP_31  ctermbg=203 ctermfg=231
highlight CP_32  ctermbg=209 ctermfg=231
highlight CP_33  ctermbg=221 ctermfg=231
highlight CP_34  ctermbg=180 ctermfg=231
highlight CP_35  ctermbg=137 ctermfg=231
highlight CP_36  ctermbg=114 ctermfg=231
highlight CP_37  ctermbg=73 ctermfg=231
highlight CP_38  ctermbg=74 ctermfg=231
highlight CP_39  ctermbg=68 ctermfg=231
highlight CP_3a  ctermbg=176 ctermfg=231
highlight CP_3b  ctermbg=211 ctermfg=231
" CTERM END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
endif " has gui_running

" Real color definitions starts from here
" Syntax highlighting groups, using "!" to avoid E414
highlight! link Normal       CP_01
highlight! link Comment      CP_02
highlight! link Constant     CP_1b
highlight! link Identifier   CP_16
highlight! link Function     CP_18
highlight! link Type         CP_1a
highlight! link Keyword      CP_12
highlight! link PreProc      CP_1b
highlight! link Statement    CP_14
highlight! link Special      CP_16
highlight! link Underlined   CP_03
highlight! link Ignore       CP_02
highlight! link Error        CP_21
highlight! link Todo         CP_22
highlight! link Directory    CP_18
highlight! link Title        CP_14
" Others
highlight! link SignColumn   CP_01
highlight! link Cursor       CP_04
highlight! link CursorLine   CP_05
highlight! link CursorColumn CP_05
highlight! link ErrorMsg     CP_31
highlight! link FoldColumn   CP_08
highlight! link Folded       CP_08
highlight! link IncSearch    CP_28
highlight! link LineNr       CP_06
highlight! link MatchParen   CP_03
highlight! link ModeMsg      CP_18
highlight! link MoreMsg      CP_16
highlight! link NonText      CP_15
highlight! link Pmenu        CP_28
highlight! link PmenuSel     CP_35
highlight! link Question     CP_1a
highlight! link Search       CP_39
highlight! link SpecialKey   CP_0A
highlight! link StatusLine   CP_24
highlight! link StatusLineNC CP_06
highlight! link VertSplit    CP_07
highlight! link Visual       CP_08
highlight! link WarningMsg   CP_11
highlight! link WildMenu     CP_05
highlight! link colorcolumn  CP_06
highlight! link TabLine      CP_18
highlight! link TabLineFill  CP_06
highlight! link TabLineSel   CP_28
" Diff
highlight! link DiffAdd      CP_26
highlight! link DiffChange   CP_28
highlight! link DiffDelete   CP_05
highlight! link DiffText     CP_2b

" {{{ Unimportant stuff
let s:gray_scale_json = '{
\"000000":16,
\"080808":232,
\"121212":233,
\"1c1c1c":234,
\"262626":235,
\"303030":236,
\"3a3a3a":237,
\"444444":238,
\"4e4e4e":239,
\"585858":240,
\"626262":241,
\"6c6c6c":242,
\"767676":243,
\"808080":244,
\"8a8a8a":245,
\"949494":246,
\"9e9e9e":247,
\"a8a8a8":248,
\"b2b2b2":249,
\"bcbcbc":250,
\"c6c6c6":251,
\"d0d0d0":252,
\"dadada":253,
\"e4e4e4":254,
\"eeeeee":255,
\"ffffff":231
\}'

function! s:read_rgb_txt()
    let rgb_file = $VIMRUNTIME."/rgb.txt"
    let rgb_lines = readfile(rgb_file)
    let ret = {}
    " each line is like r g b name
    for line in rgb_lines
        let s = split(line)
        let key = tolower(s[3])
        let ret[key] = printf("%02x", str2nr(s[0])).
                    \printf("%02x", str2nr(s[1])).
                    \printf("%02x", str2nr(s[2]))
    endfor
    return ret
endfunction

function! s:close_color(c)
    let steps = [0x00, 0x5f, 0x87, 0xaf, 0xd7, 0xff]
    for i in range(5)
        if a:c >= steps[i] && a:c <= steps[i+1]
            if abs(a:c - steps[i]) < abs(steps[i+1] - a:c)
                return i
            else
                return i+1
            endif
        endif
    endfor
endfunction

let s:gray_scale = {}
" accepts a number from 0-255
function! s:close_gray_scale(c)
    if len(s:gray_scale) == 0
        let s:gray_scale = json_decode(s:gray_scale_json)
    endif
    let gs_keys = sort(keys(s:gray_scale))
    for i in range(len(gs_keys)-1)
        let c1 = str2nr(gs_keys[i][:1], 16)
        let c2 = str2nr(gs_keys[i+1][:1], 16)
        if a:c >= c1 && a:c <= c2
            if abs(a:c - c1) < abs(a:c - c2)
                return s:gray_scale[gs_keys[i]]
            else
                return s:gray_scale[gs_keys[i+1]]
            endif
        endif
    endfor
    echoerr "Should not reach here"
endfunction

let s:color_name_to_rgb = {}
" this function takes either #RRGGBB or a color name like blue
function! s:rgb_to_256(rgb)
    let _rgb = tolower(a:rgb)
    " initialize once
    if len(s:color_name_to_rgb) == 0
        let s:color_name_to_rgb = s:read_rgb_txt()
        if len(s:color_name_to_rgb) == 0
            echoerr "Failed to read rgb.txt"
            return 0
        endif
    endif
    " get name->rgb from rgb.txt
    if has_key(s:color_name_to_rgb, _rgb)
        let _rgb = s:color_name_to_rgb[_rgb]
    elseif matchstr(_rgb, "^#") != ""
        let _rgb = _rgb[1:]
    endif
    if strlen(_rgb) != 6
        echoerr "Invalid rgb value: "._rgb
        return
    endif
    let r = str2nr(_rgb[:1], 16)
    let g = str2nr(_rgb[2:3], 16)
    let b = str2nr(_rgb[4:], 16)
    " process gray scale if r g b is close
    if abs(r-g)<=2 && abs(g-b)<=2
        return s:close_gray_scale((r+g+b) / 3)
    endif
    return s:close_color(r) * 36
                \+ s:close_color(g) * 6
                \+ s:close_color(b) + 16
endfunction

function! s:process_line(line)
    let result = a:line
    if match(result, "^highlight")
        return ""
    endif
    " Starts processing
    let guis = ["guifg", "guibg", "gui"]
    let cterms = ["ctermfg", "ctermbg", "cterm"]
    for i in range(3)
        let matched = matchstr(a:line, guis[i].'=\S\+')
        if matched == ""
            continue
        endif
        let converted = matchstr(matched, '=\zs.*')
        " special treat for some unsupported properties
        if index(["italic","reverse","inverse","standout"], converted) != -1
            let converted = "NONE"
        endif
        if i != 2 && converted != "NONE" " do not convert gui= or NONE
            let converted = s:rgb_to_256(converted)
        endif
        let converted = cterms[i] . "=" . converted
        let result = substitute(result, matched, converted, "")
    endfor
    return result
endfunction

function! s:SeattleLightsUp()
    if v:version < 800
        echoerr "The magic power needs Vim 8.0 and later."
        return
    endif
    if exists("s:run_once")
        return
    else
        let s:run_once = 1
    endif
    let current_filename = expand('%:p')
    let lines = readfile(current_filename)
    for i in lines
        " highlight link
        let hi_name = matchstr(i, '^highlight!\s\+link\s\+\zs\S\+\ze')
        if hi_name != ""
            exec "syn match " . hi_name . ' "^highlight! link '.hi_name.'\s*"'
            continue
        endif
        " normal highlight
        let hi_name = matchstr(i, '^highlight\s\+\zs\S\+\ze')
        if hi_name != ""
            exec "syn match " . hi_name . ' "^highlight '.hi_name.'\s*"'
            continue
        endif
    endfor
    " Magic..
    call map(json_decode("[{4:4,10:6,18:4,24:6,31:6,38:2,45:6},{3:2,10:2,17:2,
        \21:2,26:2,33:2,38:2,45:2},{4:4,10:4,17:6,26:2,33:2,38:2,45:4},{7:2,
        \10:2,17:2,21:2,26:2,33:2,38:2,45:2},{4:4,10:6,17:2,21:2,26:2,33:2,38:6,
        \45:6}]"),{i,v->(map(v,{m,n->(i+matchadd("CP_2".(i+1),'\%'.(i+5).'l\%'.m.
        \'c.\{'.n.'}',99))}))})
endfunction

function! s:SeattleNeon()
    if v:version < 800
        echoerr "The magic power needs Vim 8.0 and later."
        return
    endif
    let saved_cursor = getcurpos()
    let gui_begin = search("^\" GUI BEGIN")
    let gui_end = search("^\" GUI END")
    if gui_begin == 0 || gui_end == 0 || gui_begin >= gui_end
        echoerr "Invalid GUI marker"
        return
    endif
    if gui_begin >= gui_end-1
        echoerr "Empty highlight lines?"
        return
    endif
    let cterm_lines = []
    for i in range(gui_begin+1, gui_end-1)
        let line = s:process_line(getline(i))
        if line != ""
            let cterm_lines += [ line ]
        endif
    endfor
    let cterm_begin = search("^\" CTERM BEGIN") + 1
    let cterm_end = search("^\" CTERM END") - 1
    if cterm_begin == 0 || cterm_end == 0 || cterm_begin > cterm_end+1
        echoerr "Invalid CTERM marker"
        return
    endif
    if cterm_end >= cterm_begin
        exec cterm_begin . "," . cterm_end . " delete"
    endif
    call append(cterm_begin-1, cterm_lines)
    call setpos('.', saved_cursor)
    call s:SeattleLightsUp()
endfunction

command!    SeattleLightsUp     so % | call s:SeattleLightsUp()
command!    SeattleNeon         so % | call s:SeattleNeon()
" }}}
" vim: set ts=4 et ft=vim ff=unix fdm=marker:
