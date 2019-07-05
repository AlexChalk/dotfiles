" Pre-populate a split/edit command with the current directory
nmap <leader>nvs :vsp <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>nsp :sp <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>nns :e <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
" CTRL-W CTRL-F	Split current window in two.  Edit file name under cursor.

" maximize a vim window
nnoremap <c-w>z :wincmd _<cr>:wincmd \|<cr> 
" max width
nnoremap <c-w>- :wincmd \|<cr> 
" max height
nnoremap <c-w>\ :wincmd _<cr> 
" <c-w>=: rebalance windows
" <c-w>R: Swap top/bottom or left/right split
" <c-w>T: Break out current window into a new tabview
" <c-w>o: Close every window in the current tabview but the current one

" automatically rebalance windows on vim resize
augroup windows
  autocmd!
  autocmd VimResized * :wincmd =
augroup END
