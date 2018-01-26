""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxRunnerType = "pane"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "33"
" Needed to make vimux runner work in window mode
" let g:VimuxUseNearest = 0
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vq :VimuxCloseRunner<CR>
