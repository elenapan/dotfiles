""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Nefertiti Vim Color Scheme
"" (C) Copyright 2014 Jeet Sukumaran
"" Released under the BSD License
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General Setup {{{1
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "nefertiti"
" }}}1

" Code Setup {{{1
if !exists("g:did_nefertiti_code_setup")

    " Preamble {{{2
    let g:did_nefertiti_code_setup = 1
    let s:save_cpo = &cpo
    " }}}2

    " Dynamic Colors Base Definitions {{{2`
    let s:nefertiti_dynamic_colors = {}
    let s:nefertiti_dynamic_colors["Normal"]            = [ [0xdd, 0xd6, 0xc0], [], "guibg=#2c2824 gui=NONE" ]
    let s:nefertiti_dynamic_colors["NonText"]           = [ [0x66, 0x60, 0x46], [], "guibg=bg gui=NONE" ]
    let s:nefertiti_dynamic_colors["Folded"]            = [ [0x88, 0x80, 0x78], [0x3c, 0x34, 0x34], "gui=italic" ]
    let s:nefertiti_dynamic_colors["Comment"]           = [ [0x70, 0x70, 0x70], [], "gui=italic" ]
    let s:nefertiti_dynamic_colors["Boolean"]           = [ [0xff, 0x98, 0x00], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["String"]            = [ [0xaa, 0xaa, 0x99], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Identifier"]        = [ [0x99, 0x88, 0x77], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Function"]          = [ [0xdd, 0xcc, 0xa8], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Type"]              = [ [0x99, 0x66, 0x44], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Statement"]         = [ [0x90, 0x9a, 0x9f], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Keyword"]           = [ [0x90, 0x9a, 0x9f], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Constant"]          = [ [0xff, 0x98, 0x00], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Number"]            = [ [0xcc, 0x88, 0x00], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Special"]           = [ [0x71, 0x96, 0x11], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["PreProc"]           = [ [0xbb, 0xaa, 0x88], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Title"]             = [ [0x77, 0x88, 0x88], [], "gui=NONE" ]
    let s:nefertiti_dynamic_colors["Todo"]              = [ [0x8f, 0x6f, 0x8f], [], "guibg=#202020   gui=italic,underline,bold" ]
    let s:nefertiti_dynamic_colors["pythonExClass"]     = [ [0x99, 0x76, 0x76], [], "guibg=NONE gui=NONE" ]
    let s:nefertiti_dynamic_colors["pythonDecorator"]   = [ [0x88, 0x77, 0x44], [], "guibg=NONE gui=NONE" ]
    " }}}2

    " Dynamic Colors State Tracking Variables {{{2
    let s:nefertiti_brightness_levels = range(-96, 96, 8)
    let s:nefertiti_brightness_level_max = len(s:nefertiti_brightness_levels) - 1
    let s:nefertiti_brightness_level_min = 0
    let s:nefertiti_default_brightness_level = index(s:nefertiti_brightness_levels, 0)
    let g:nefertiti_base_brightness_level = get(g:, 'nefertiti_base_brightness_level', s:nefertiti_default_brightness_level)
    let g:nefertiti_current_brightness_level = g:nefertiti_base_brightness_level
    let g:nefertiti_base_search_highlight_intensity = get(g:, 'nefertiti_base_search_highlight_intensity', 4)
    let g:nefertiti_current_search_highlight_intensity = g:nefertiti_base_search_highlight_intensity
    " }}}2

    " Special Case Search Highlight Intensity {{{2
    let s:_nefertiti_search_highlight_intensity_highlight_map = ["333333", "555555", "666660", "aaaa99", "ddddbb", "ffffbb", "ffffff", "ff00ff"]
    " }}}2

    " Functions {{{2
    function! s:_nefertiti_change_brightness(step, up) "{{{3
        if empty(a:step)
            let l:level_step = 1
        else
            let l:level_step = a:step + 0
        endif
        if a:up
            let g:nefertiti_current_brightness_level += l:level_step
        else
            let g:nefertiti_current_brightness_level -= l:level_step
        endif
        call s:_nefertiti_validate_brightness_level()
        colorscheme nefertiti
    endfunction "}}}3

    function! s:_nefertiti_validate_brightness_level() "{{{3
        if g:nefertiti_current_brightness_level < s:nefertiti_brightness_level_min
            let g:nefertiti_current_brightness_level = s:nefertiti_brightness_level_min
        elseif g:nefertiti_current_brightness_level > s:nefertiti_brightness_level_max
            let g:nefertiti_current_brightness_level = s:nefertiti_brightness_level_max
        endif
    endfunction "}}}3

    function! s:_nefertiti_reset_brightness() "{{{3
        let g:nefertiti_current_brightness_level = g:nefertiti_base_brightness_level
        colorscheme nefertiti
    endfunction "}}}3

    function! s:_nefertiti_search_highlight_intensity(step, up) "{{{3
        if empty(a:step)
            let l:level_step = 1
        else
            let l:level_step = a:step + 0
        endif
        if a:up
            let g:nefertiti_current_search_highlight_intensity += l:level_step
        else
            let g:nefertiti_current_search_highlight_intensity -= l:level_step
        endif
        call s:_nefertiti_set_search_highlight()
        colorscheme nefertiti
    endfunction "}}}3

    function! s:_nefertiti_set_search_highlight() "{{{3
        if g:nefertiti_current_search_highlight_intensity < 0
            let g:nefertiti_current_search_highlight_intensity = len(s:_nefertiti_search_highlight_intensity_highlight_map) - 1
        elseif g:nefertiti_current_search_highlight_intensity >= len(s:_nefertiti_search_highlight_intensity_highlight_map)
            let g:nefertiti_current_search_highlight_intensity = 0
        endif
        execute "hi Search guibg=#" . s:_nefertiti_search_highlight_intensity_highlight_map[g:nefertiti_current_search_highlight_intensity] . " guifg=#000000 gui=bold"
    endfunction "}}}3

    function! s:_nefertiti_set_stable_colors() "{{{3
        """ Cursor {{{4
        hi Cursor           guifg=NONE      guibg=#626262   gui=NONE
        hi nCursor          guifg=black     guibg=green1    gui=NONE
        hi vCursor          guifg=black     guibg=magenta   gui=NONE
        hi iCursor          guifg=black     guibg=#f08080   gui=NONE
        hi cCursor          gui=reverse
        """ }}}4
        """ Cursor Line/Column {{{4
        hi CursorColumn     guibg=#000000
        hi CursorLine       guibg=#000000
        hi CursorLineNr     guifg=#ffee99   guibg=bg        gui=none
        hi ColorColumn      guibg=#202020
        """ }}}4
        """ Structural {{{4
        hi LineNr           guifg=#807060   guibg=#000000   gui=NONE
        hi SignColumn       guifg=#333344   guibg=#363636   gui=NONE
        hi StatusLine       guifg=#000000   guibg=#9d9080   gui=bold
        hi StatusLineNC     guifg=#000000   guibg=#48403a   gui=italic
        hi VertSplit        guifg=#48403a   guibg=#48403a   gui=NONE
        hi FoldColumn       guifg=#68838b   guibg=#4B4B4B   gui=bold
        """ }}}4
        """ Tabs {{{4
        hi TabLine          guifg=#ddd6c0   guibg=#9d9080   gui=NONE
        hi TabLineFill      guifg=#9d9080   guibg=#ddd6c0   gui=reverse
        hi TabLineSel       guibg=#2c2824   guifg=#ddd6c0   gui=bold
        """ }}}4
        """ Search {{{4
        hi IncSearch        guifg=#000000   guibg=#ff8800   gui=BOLD
        " hi Search           guifg=#000000   guibg=#ffffbb   gui=BOLD
        """ }}}4
        """ Selection {{{4
        hi Visual           guifg=#000000   guibg=#768798   gui=NONE
        """ }}}4
        """ Pop-up Menus {{{4
        hi Pmenu            guifg=#000000   guibg=#ccc0aa
        hi PmenuSel         guifg=#000000   guibg=#ee9944
        """ }}}4
        """ Messaging {{{4
        hi ModeMsg          guifg=#000000   guibg=#00ff00   gui=bold
        hi MoreMsg          guifg=#2e8b57   guibg=bg        gui=bold
        hi ErrorMsg         guifg=#ff6a6a   guibg=NONE      gui=bold
        hi WarningMsg       guifg=#ee9a00   guibg=bg        gui=NONE
        """ }}}4
        """ Spelling {{{4
        hi SpellBad         guisp=#ee2c2c   gui=undercurl
        hi SpellCap         guisp=#0000ff   gui=undercurl
        hi SpellLocal       guisp=#008b8b   gui=undercurl
        hi SpellRare        guisp=#ff00ff   gui=undercurl
        """ }}}4
        """ Diff {{{4
        hi DiffAdd          guibg=#445544   gui=NONE
        hi DiffDelete       guibg=#554422   gui=NONE
        hi DiffChange       guibg=#224455   gui=NONE
        hi DiffText         guibg=#224455   guifg=#00ffff gui=underline
        """ }}}4
        """ Other {{{4
        hi Directory        guifg=#ddaa66   guibg=bg        gui=NONE
        hi MatchParen       guifg=#fff000   guibg=bg        gui=bold
        hi SpecialKey       guifg=#cc6644   guibg=bg        gui=bold
        hi WildMenu         guifg=#000000   guibg=#87ceeb   gui=NONE
        """ Special Syntax {{{4
        hi link pythonDecoratorFunction pythonDecorator
        """ }}}4
    endfunction "}}}3

    function! s:_nefertiti_set_dynamic_colors() "{{{3
        call s:_nefertiti_validate_brightness_level()
        let brightness_boost = s:nefertiti_brightness_levels[g:nefertiti_current_brightness_level]
        for highlight_name in keys(s:nefertiti_dynamic_colors)
            let fg_rgb_list = copy(s:nefertiti_dynamic_colors[highlight_name][0])
            let bg_rgb_list = copy(s:nefertiti_dynamic_colors[highlight_name][1])
            let other = s:nefertiti_dynamic_colors[highlight_name][2]
            if !empty(fg_rgb_list)
                for idx in range(len(fg_rgb_list))
                    let c = fg_rgb_list[idx] + brightness_boost
                    if c > 255
                        let c = 255
                    elseif c < 0
                        let c = 0
                    endif
                    let fg_rgb_list[idx] = c
                endfor
                let fg = "guifg=#" . printf("%02x%02x%02x", fg_rgb_list[0], fg_rgb_list[1], fg_rgb_list[2])
            else
                let fg = ""
            endif
            if !empty(bg_rgb_list)
                for idx in range(len(bg_rgb_list))
                    let c = bg_rgb_list[idx] + brightness_boost
                    if c > 255
                        let c = 255
                    elseif c < 0
                        let c = 0
                    endif
                    let bg_rgb_list[idx] = c
                endfor
                let bg = "guibg=#" . printf("%02x%02x%02x", bg_rgb_list[0], bg_rgb_list[1], bg_rgb_list[2])
            else
                let bg = ""
            endif
            execute "highlight " . highlight_name . " " . fg . " " . bg . " " . other
        endfor
    endfunction "}}}3

    function! s:_nefertiti_set_colors() "{{{3
        call s:_nefertiti_set_stable_colors()
        call s:_nefertiti_set_dynamic_colors()
        call s:_nefertiti_set_search_highlight()
    endfunction "}}}3
    " }}}2

    " Epilogue {{{2
    let &cpo = s:save_cpo
    " }}}2

" }}}1

" Public Interface Setup {{{1

    " Commands {{{2
    command! -nargs=? NefertitiDarken :call <SID>_nefertiti_change_brightness(<q-args>, 0)
    command! -nargs=? NefertitiBrighten :call <SID>_nefertiti_change_brightness(<q-args>, 1)
    command! -nargs=0 NefertitiReset :call <SID>_nefertiti_reset_brightness()
    command! -nargs=0 NefertitiColors :call <SID>_nefertiti_set_colors()
    command! -nargs=? NefertitiSearchDarken :call <SID>_nefertiti_search_highlight_intensity(<q-args>, 0)
    command! -nargs=? NefertitiSearchBrighten :call <SID>_nefertiti_search_highlight_intensity(<q-args>, 1)
    " }}}2

    " Key Maps {{{2
    nnoremap <silent> <Plug>NefertitiBrighten     :NefertitiBrighten<CR>
    nnoremap <silent> <Plug>NefertitiDarken       :NefertitiDarken<CR>
    nnoremap <silent> <Plug>NefertitiReset        :NefertitiReset<CR>
    nnoremap <silent> <Plug>NefertitiSearchBrighten     :NefertitiSearchBrighten<CR>
    nnoremap <silent> <Plug>NefertitiSearchDarken       :NefertitiSearchDarken<CR>
    if !exists('g:nefertiti_suppress_keymaps') || !g:nefertiti_suppress_keymaps
        map <silent> <M-1>  <Plug>NefertitiDarken
        map <silent> <M-2>  <Plug>NefertitiBrighten
        map <silent> <M-0>  <Plug>NefertitiReset
        map <silent> <M-3>  <Plug>NefertitiSearchDarken
        map <silent> <M-4>  <Plug>NefertitiSearchBrighten
    endif
    " }}}2

endif
" }}}1

" Set Colors {{{1
:NefertitiColors
" }}}1

" Clean Up {{{1
" Set background again -- for some reason, this does not always 'take
set background=dark
" }}}1
