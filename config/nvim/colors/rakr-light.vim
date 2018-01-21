" rakr-light
" ==========
"
" Author:   Ramzi Akremi <ramzi.dev@icloud.com>
" Version:  0.1
"
set background=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "rakr-light"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  " functions {{{
  " returns an approximate grey index for the given grey level
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " returns the palette index for the given grey index
  fun <SID>grey_color(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " returns an approximate color index for the given color level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun <SID>rgb_color(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " returns the palette index to approximate the given R/G/B color levels
  fun <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " there are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " use the grey
        return <SID>grey_color(l:gx)
      else
        " use the color
        return <SID>rgb_color(l:x, l:y, l:z)
      endif
    else
      " only one possibility
      return <SID>rgb_color(l:x, l:y, l:z)
    endif
  endfun

  " returns the palette index to approximate the 'rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
  endfun

  " sets the highlighting for the given group
  fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
  endfun
  " }}}


  let turquoise   = "07c5ac"
  let greenSea    = "16a085"
  let emerald     = "2ecc71"
  let nephritis   = "27ae60"
  let peterRiver  = "3498db"
  let belizeHole  = "2980b9"
  let amethyst    = "9b59b6"
  let wisteria    = "8e44ad"
  let wetAsphalt  = "34495e"
  let midnightBlue= "2c3e50"
  let sunFlower   = "f1c40f"
  let orange      = "f49c12"
  let carrot      = "e67e22"
  let pumpkin     = "d35400"
  let alizarin    = "e74c3c"
  let pomegranate = "c0392b"
  let lightclouds = "f3f7f8"
  let clouds      = "ecf0f1"
  let darkClouds  = "E8ECED"
  let silver      = "bdc3c7"
  let concrete    = "95a5a6"
  let asbestos    = "7f8c8d"


  let bg1 = darkClouds
  let bg2 = clouds
  let bg3 = lightclouds
  let fg0 = silver
  let fg1 = concrete
  let fg2 = wetAsphalt
  let fg3 = midnightBlue
  let accent00 = sunFlower
  let accent11 = peterRiver
  let accent12 = belizeHole
  let accent20 = pumpkin
  let accent21 = alizarin
  let accent22 = pomegranate
  let accent31 = turquoise
  let accent32 = greenSea
  let accent41 = amethyst
  let accent42 = wisteria


  " Default Colors
  call <SID>X("Normal",                     fg2,      bg2,      "none")
  call <SID>X("Comment",                    fg1,      "",       "italic")
  call <SID>X("Constant",                   accent32, "",       "")
  call <SID>X("Delimiter",                  fg1,      "",       "none")
  call <SID>X("Identifier",                 accent12, "",       "")
  call <SID>X("Ignore",                     fg1,      "",       "")
  call <SID>X("MatchParen",                 accent22, bg3,      "bold,underline")
  call <SID>X("NonText",                    fg0,      bg1,       "")
  call <SID>X("Number",                     accent21, "",       "")
  call <SID>X("Operator",                   fg1,      "",       "none")
  call <SID>X("PreProc",                    accent12, "",       "bold")
  call <SID>X("Statement",                  accent31, "",       "none")
  call <SID>X("Special",                    accent11, "",       "italic")
  call <SID>X("SpecialKey",                 accent11, "",       "bold")
  call <SID>X("Title",                      fg2,      "",       "bold")
  call <SID>X("Type",                       accent12, "",       "none")
  call <SID>X("Underlined",                 fg1,      "",       "underline")

  call <SID>X("CursorLine",                 "",       bg1,      "")
  call <SID>X("CursorLineNr",               accent21, "",       "none")
  call <SID>X("LineNr",                     fg1,      bg1,      "")
  call <SID>X("PMenu",                      bg2,      fg3,      "none")
  call <SID>X("PMenuSel",                   bg2,      fg1,      "none")
  call <SID>X("PMenuThumb",                 bg2,      fg2,      "none")
  call <SID>X("PMenuSbar",                  bg2,      bg1,      "none")
  call <SID>X("Todo",                       accent22, accent00, "bold")
  call <SID>X("VertSplit",                  fg0,      fg0,      "")
  call <SID>X("Visual",                     "",       accent00, "")
  call <SID>X("VisualNOS",                  "",       bg3,      "")

  " CSS and SCSS highlights
  call <SID>X("cssURL",                     accent21, "",       "underline")
  call <SID>X("cssColor",                   accent11, "",       "")
  call <SID>X("cssValueNumber",             accent11, "",       "")
  call <SID>X("cssBorderAttr",              accent11, "",       "")
  call <SID>X("cssBackgroundAttr",          accent11, "",       "")
  call <SID>X("cssPositioningAttr",         accent11, "",       "")
  call <SID>X("cssTextAttr",                accent11, "",       "")
  call <SID>X("cssValueLength",             accent11, "",       "")
  call <SID>X("cssUnitDecorators",          accent11, "",       "")
  call <SID>X("cssPseudoClassId",           accent11, "",       "")
  call <SID>X("cssBraces",                  fg1,      "",       "")
  call <SID>X("cssTagName",                 accent21, "",       "")
  call <SID>X("cssFunctionName",            accent31, "",       "")
  call <SID>X("cssProp",                    fg3,      "",       "")

  call <SID>X("scssAmpersand",              accent32, "",       "bold")
  call <SID>X("scssAttribute",              fg1,      "",       "")
  call <SID>X("scssDefinition",             fg2,      "",       "")
  call <SID>X("scssFunctionName",           accent11, "",       "")
  call <SID>X("scssInclude",                accent31, "",       "bold")
  call <SID>X("scssMixinName",              accent12, "",       "")
  call <SID>X("scssMixinParams",            fg1,      "",       "")
  call <SID>X("scssSelectorName",           accent21, "",       "")
  call <SID>X("scssVariable",               accent21, "",       "")
  call <SID>X("scssNull",                   accent21, "",       "")
  call <SID>X("scssIf",                     accent12, "",       "")


  " HTML highlights
  call <SID>X("HTMLTagName",                accent21, "",       "")
  call <SID>X("HTMLSpecialTagName",         accent21, "",       "")
  call <SID>X("HTMLEndTag",                 fg1,      "",       "bold")
  call <SID>X("HTMLTag",                    fg1,      "",       "bold")
  call <SID>X("HTMLTagN",                   accent21, "",       "")
  call <SID>X("HTMLArg",                    accent21, "",       "")

  " Markdown highlights
  call <SID>X("markdownJekyllFrontMatter",                  accent32,      "",       "bold")

  " NERDTREE highlights
  call <SID>X("Directory",                  fg1,      "",       "bold")
  call <SID>X("NERDTreeCWD",                fg2,      "",       "bold")
  call <SID>X("NERDTreeFlags",              fg2,      "",       "bold")
  call <SID>X("NERDTreeFile",               fg2,      "",       "")
  call <SID>X("NERDTreeDirSlash",           fg2,      "",       "")
  call <SID>X("NERDTreeExecFile",           fg2,      "",       "")
  call <SID>X("NERDTreeGitFlags",           accent22, "",       "")
  call <SID>X("NERDTreeGitStatusDirDirty",  accent22, "",       "bold")
  call <SID>X("NERDTreeGitStatusModified",  accent21, "",       "bold")
  call <SID>X("NERDTreeGitStatusUntracked", fg1,      "",       "bold")
  call <SID>X("NERDTreeOpenable",           accent12, "",       "")
  call <SID>X("NERDTreeClosable",           accent12, "",       "")

  " Ruby highlights
  call <SID>X("rubyControl",                accent12, "",       "")
  call <SID>X("rubyBlockParameter",                accent22, "",       "")
  call <SID>X("rubyBlockParameterList",                accent21, "",       "")


  " VimL hightlights
  call <SID>X("vimCommand",                 accent21, "",       "")
  call <SID>X("vimCommentTitle",            fg1,      "",       "underline")
  call <SID>X("vimNotFunc",                 accent11, "",       "")
  call <SID>X("vimFunction",                accent12, "",       "")
  call <SID>X("vimFuncVar",                 accent21, "",       "")
  call <SID>X("vimFuncSID",                 fg1,      "",       "")

  " YAML hightlights
  call <SID>X("yamlBlockMappingKey",        accent21, "",       "")
endif

" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}
" vim: set fdl=0 fdm=marker:

set background=light
