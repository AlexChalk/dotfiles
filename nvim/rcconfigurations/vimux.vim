""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxRunnerType = "pane"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

" Needed to make vimux runner work in window mode
let g:VimuxUseNearest = 0
map <leader>st :VimuxInspectRunner<CR>
map <leader>qt :VimuxCloseRunner<CR>
