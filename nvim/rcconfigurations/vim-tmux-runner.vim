""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Tmux-Runner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrPercentage = 20 
let g:VtrOrientation = "v"

" C-\ to unfocus
map <leader>st :VtrFocusRunner<CR>
map <leader>qt :VtrKillRunner<CR>

nmap <leader>ar :VtrAttachToPane<CR>
nmap <leader>sr :VtrSendLinesToRunner<CR>
vmap <leader>sr :VtrSendLinesToRunner<CR>
nmap <leader>scr :VtrSendCommandToRunner<CR>
nmap <leader>ccr :VtrFlushCommand<CR>

nmap <leader>sbr vip<leader>sr
