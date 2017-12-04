""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Tmux Runner/Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VtrPercentage = 40
nnoremap <leader>vl :VtrSendLinesToRunner<cr>
nnoremap <leader>vf :VtrSendFile<cr>
nnoremap <leader>vc :VtrSendCommand<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>vd :VtrDetachRunner<cr>
nnoremap <leader>vr :VtrFocusRunner<cr>

let g:VimuxRunnerType = "window"
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vq :VimuxCloseRunner<CR>
