set background=light
highlight clear

if exists("syntax on")
  syntax reset
endif

let g:colors_name = "genericdc-light"

hi Normal       ctermfg=235 ctermbg=255
hi Special      ctermfg=234 ctermbg=NONE
hi Comment      ctermfg=247 ctermbg=NONE cterm=italic
hi Constant     ctermfg=237 ctermbg=NONE
hi String       ctermfg=68  ctermbg=NONE
hi Number       ctermfg=196 ctermbg=NONE
hi htmlTagName  ctermfg=235 ctermbg=NONE
hi Identifier   ctermfg=239 ctermbg=NONE
hi Statement    ctermfg=242 ctermbg=NONE cterm=NONE
hi Boolean      ctermfg=242 ctermbg=NONE cterm=NONE
hi PreProc      ctermfg=244 ctermbg=NONE
hi Type         ctermfg=239 ctermbg=NONE
hi Function     ctermfg=240 ctermbg=NONE cterm=italic
hi Repeat       ctermfg=244 ctermbg=NONE
hi Operator     ctermfg=239 ctermbg=NONE
hi Error        ctermfg=9   ctermbg=NONE
hi TODO         ctermfg=135 ctermbg=NONE cterm=italic
hi linenr       ctermfg=250 ctermbg=255
hi CursorLineNR ctermfg=246 ctermbg=234

hi Visual          ctermfg=255 ctermbg=241 cterm=italic
hi SpecialKey      ctermfg=255 ctermbg=NONE
hi NonText         ctermfg=255 ctermbg=NONE
hi ExtraWhitespace             ctermbg=196
hi MatchParen      ctermfg=234 ctermbg=242
hi Pmenu           ctermfg=250 ctermbg=237
hi PmenuSel        ctermfg=255 ctermbg=75

hi ColorColumn             ctermbg=253

match ExtraWhitespace /\s\+$/

hi link character	      constant
hi link number	        constant
hi link boolean	        constant
hi link Float		        Number
hi link Conditional	    Repeat
hi link Label		        Statement
hi link Keyword	        Statement
hi link Exception	      Statement
hi link Include	        PreProc
hi link Define	        PreProc
hi link Macro		        PreProc
hi link PreCondit	      PreProc
hi link StorageClass	  Type
hi link Structure	      Type
hi link Typedef	        Type
hi link htmlTag	        Special
hi link Tag		          Special
hi link SpecialChar	    Special
hi link Delimiter	      Special
hi link SpecialComment  Special
hi link Debug		        Special

" sytnax specific

" javascript (ala vim-javascript-syntax)
hi javaScriptFuncArg ctermfg=244 ctermbg=NONE
hi javaScriptFuncExp ctermfg=239
hi javaScriptBraces                           cterm=NONE

hi link javaScriptDocTags Comment


" go (ala vim-go)
hi gotypes     ctermfg=208 ctermbg=NONE cterm=italic
hi goDirective ctermfg=242 ctermbg=NONE cterm=italic

hi link goTodo         TODO
hi link goType         gotypes
hi link goSignedInts   gotypes
hi link goUnsignedInts gotypes
hi link goFloats       gotypes
hi link goComplexes    gotypes

hi goOperator    ctermfg=242
hi goBuiltins    ctermfg=70
hi goDeclaration ctermfg=242
hi goDeclType    ctermfg=242

hi goFunction  ctermfg=242 ctermbg=NONE cterm=italic
hi goMethod    ctermfg=242 ctermbg=NONE cterm=NONE
hi goStruct    ctermfg=235 ctermbg=NONE cterm=NONE
hi goStructDef ctermfg=235 ctermbg=NONE cterm=italic


" NerdTree
hi link NERDTreeDir Special
hi NERDTreeFile     ctermfg=241
