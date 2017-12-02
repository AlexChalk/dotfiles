""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --path-to-ignore\ ~/.ignore\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --path-to-ignore ~/.ignore -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ack")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ack!<SPACE>
  endif
endif
