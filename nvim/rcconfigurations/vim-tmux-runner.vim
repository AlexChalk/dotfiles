""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Tmux-Runner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrPercentage = 40 
let g:VtrOrientation = "h"

" C-\ to unfocus
map <leader>st :VtrFocusRunner<CR>
map <leader>qt :VtrKillRunner<CR>

nmap <leader>ar :VtrAttachToPane<CR>
nmap <leader>sr :VtrSendLinesToRunner<CR>
vmap <leader>sr :VtrSendLinesToRunner<CR>
nmap <leader>scr :VtrSendCommandToRunner<CR>
