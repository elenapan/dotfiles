" Vim color file - flatlandia
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "flatlandia"

hi WildMenu guifg=#1c1c1c ctermfg=233 guibg=#ffff99 ctermbg=228 gui=none cterm=none
"hi SignColumn -- no settings --
hi SpecialComment guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Typedef guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi Title guifg=#f8f8f8 guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Folded guifg=#798188 guibg=#26292c guisp=#26292c gui=NONE ctermfg=66 ctermbg=236 cterm=NONE
hi PreCondit guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Include guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Float guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#b8b8b8 guibg=#292c2f guisp=#636567 gui=NONE ctermfg=15 ctermbg=241 cterm=NONE
hi StatusLine guifg=#f8f8f8 guibg=#292c2f guisp=#292c2f gui=bold ctermfg=15 ctermbg=241 cterm=bold
"hi CTagsMember -- no settings --
hi NonText guifg=#2d3033 guibg=#2d3033 guisp=#2d3033 gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
hi VertSplit guifg=#2d3033 guibg=#2d3033 guisp=#2d3033 gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
"hi TabLineSel -- no settings --
hi LineNr guifg=#515253 guibg=#2c2f31 guisp=#2c2f31 gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
hi TabLineFill guifg=#e2e4e5 guibg=#212325 guisp=#212325 gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
hi TabLine guifg=#797a7b  guibg=#212325 guisp=#212325 gui=NONE ctermfg=248 ctermbg=234 cterm=NONE
hi TabLineSel gui=bold guifg=#c9cacb ctermfg=248 ctermbg=234 cterm=NONE

"hi CTagsGlobalConstant -- no settings --
hi ErrorMsg guifg=#f8f8f8 guibg=#ad3725 guisp=#ad3725 gui=NONE ctermfg=15 ctermbg=124 cterm=NONE
"hi Ignore -- no settings --
hi Debug guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=#cdcecf guibg=#35393e guisp=#35393e gui=NONE ctermfg=252 ctermbg=238 cterm=NONE
hi PMenuSel guifg=#ffffff guibg=#3498DB guisp=#82898f gui=bold ctermfg=237 ctermbg=150 cterm=NONE
hi PMenu guifg=#949ba1 guibg=#303336 guisp=#2c2f34 gui=NONE ctermfg=245 ctermbg=237 cterm=NONE
hi PMenuThumb guifg=#82898f guibg=#4c4f54 guisp=#4c4f54 gui=NONE ctermfg=245 ctermbg=237 cterm=NONE
hi Identifier guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Conditional guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Todo guifg=#798188 guibg=NONE guisp=NONE gui=bold ctermfg=66 ctermbg=NONE cterm=bold
hi Special guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Normal guifg=#e0e0e0 guibg=#26292c guisp=#26292c gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
hi Label guifg=#f6f6f6 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
hi Search guifg=#16191c guibg=#fffebe guisp=#b4c2cf gui=NONE ctermfg=236 ctermbg=152 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Statement guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#60666b guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Character guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi Number guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi Boolean guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi Operator guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#2d3033 guisp=#36393c gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
"hi Union -- no settings --
hi WarningMsg guifg=#f8f8f8 guibg=#aa2915 guisp=#aa2915 gui=NONE ctermfg=15 ctermbg=124 cterm=NONE
"hi VisualNOS -- no settings --
hi DiffText guifg=NONE guibg=#2E4052 guisp=#2E4052 gui=bold ctermfg=15 ctermbg=24 cterm=bold
hi DiffChange guifg=NONE guibg=#273645 guisp=#273645 gui=NONE ctermfg=15 ctermbg=17 cterm=NONE
hi DiffDelete guifg=#8F433D guibg=#8F433D guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=#f8f8f8 guibg=#487a1a guisp=#487a1a gui=bold ctermfg=15 ctermbg=2 cterm=bold
"hi ModeMsg -- no settings --
hi ModeMsg guifg=#a0a0a0 guibg=#26292c guisp=#26292c gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
hi Question guifg=#a0a0a0 guibg=#26292c guisp=#26292c gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
hi CursorColumn guifg=NONE guibg=#3b3e40 guisp=#3b3e40 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi Define guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Function guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
"hi FoldColumn -- no settings --
hi PreProc guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#414549 guisp=#414549 gui=NONE ctermfg=NONE ctermbg=240 cterm=NONE
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
hi Exception guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi Keyword guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Type guifg=#8aC8DB guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi Cursor guifg=#222222 ctermfg=234 guibg=#cceeff ctermbg=219 gui=none cterm=none
"hi SpellLocal -- no settings --
"hi Error -- no settings --
hi SpecialKey guifg=#7a8288 guibg=#3b3e40 guisp=#3b3e40 gui=NONE ctermfg=66 ctermbg=238 cterm=NONE
hi Constant guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
"hi DefinedName -- no settings --
hi Tag guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi String guifg=#9298a1 guibg=NONE guisp=NONE gui=NONE ctermfg=247 ctermbg=NONE cterm=NONE
hi MatchParen guifg=#26292c guibg=#fa9a4b guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=underline
"hi LocalVariable -- no settings --
hi Repeat guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --

hi Directory guifg=#898d8a guibg=#26292c guisp=#2d3033 gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
hi Structure guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi Macro guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi htmlarg guifg=#b7d877 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi javascriptfunction guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi jsDocTags guifg=#60666b guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi jsDocType guifg=#80868b guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi jsDocSeeTag guifg=#80868b guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi jsDocTypeNoParam guifg=#80868b guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi jsDocParam guifg=#90969b guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE

hi ocamlType guifg=#f6f080 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE

hi cssfunctionname guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi erubycomment guifg=#798188 guibg=NONE guisp=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi rubyclass guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsarmethod guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi htmlspecialchar guifg=#f1e94b guibg=NONE guisp=NONE gui=NONE ctermfg=227 ctermbg=NONE cterm=NONE
hi rubyexception guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi csscommonattr guifg=#b7d877 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubyescape guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubyfunction guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi rubyrailsuserclass guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
"hi cssbraces -- no settings --
hi rubyglobalvariable guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#b7d877 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubyblockparameter guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi erubyrailsmethod guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi javascriptrailsfunction guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi javascriptbraces -- no settings --
hi rubyregexpdelimiter guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi csscolor guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubyconstant guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi rubyrailsmethod guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi erubydelimiter -- no settings --
hi rubypseudovariable guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsarassociationmethod guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsrendermethod guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyinstancevariable guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi rubyinterpolationdelimiter -- no settings --
hi rubyclassvariable guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi htmltag guifg=#b7d877 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubycontrol guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi yamlalias guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi csspseudoclassid guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi colorcolumn guifg=NONE guibg=#3b3e40 guisp=#3b3e40 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi cssvaluelength guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi rubystringdelimiter guifg=#f6f6f6 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi yamldocumentheader guifg=#f6f6f6 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi yamlanchor guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyregexp guifg=#ffb454 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubysymbol guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi cssurl guifg=#fb9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyinclude guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi cssclassname guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi yamlkey guifg=#72aaca guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
hi rubyoperator guifg=#fa9a4b guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
"hi clear -- no settings --
hi htmlendtag guifg=#b7d877 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE



" NerdTree
hi Directory guifg=#898d8a guibg=#26292c guisp=#2d3033 gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
hi! link VisualNOS	Visual
hi! link FoldColumn	Folded

let g:airline_theme='flatlandia'
