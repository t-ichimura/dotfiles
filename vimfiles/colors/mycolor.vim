" Vim color file
" Maintainer:   Takashi Ichimura <t-ichimura@gadget-frontier.net>
" Last Change:  2010 Dec 21
" grey on black
" optimized for TFT panels
" $Revision: 1.0 $

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "mycolor"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80       guibg=Black
highlight Search     guifg=Black        guibg=Red       gui=bold
highlight Visual     guifg=Grey25
highlight Cursor     guifg=Black        guibg=Green     gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue         guibg=white
highlight Statement  guifg=Yellow                       gui=NONE
highlight Type                                          gui=NONE
highlight Pmenu      guifg=Black        guibg=Grey
highlight PmenuSel                      guibg=DarkCyan
highlight PmenuSbar                     guibg=LightGrey
highlight PmenuThumb                    guibg=Grey50    gui=NONE

" Console
highlight Normal     ctermfg=LightGrey  ctermbg=Black
highlight Search     ctermfg=Black      ctermbg=Red     cterm=NONE
highlight Visual                                        cterm=reverse
highlight Cursor     ctermfg=Black      ctermbg=Green   cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue       ctermbg=white
highlight Statement  ctermfg=Yellow                     cterm=NONE
highlight Type                                          cterm=NONE
highlight Pmenu      ctermfg=Black      ctermbg=Grey
highlight PmenuSel                      ctermbg=DarkCyan
highlight PmenuSbar                     ctermbg=LightGrey

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey      ctermbg=Black   cterm=NONE      guifg=Grey80      guibg=Black   gui=NONE
    highlight Search  ctermfg=Black     ctermbg=Red     cterm=bold      guifg=Black       guibg=Red     gui=bold
    highlight Visual  ctermfg=Black     ctermbg=yellow  cterm=bold      guifg=Grey25                    gui=bold
    highlight Special ctermfg=LightBlue                 cterm=NONE      guifg=LightBlue                 gui=NONE
    highlight Comment ctermfg=Cyan                      cterm=NONE      guifg=LightBlue                 gui=NONE
  endif
endif

