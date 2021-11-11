""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure-parinfer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>lpp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>lpi :let g:parinfer_mode = "indent"<cr>
nnoremap <leader>lps :let g:parinfer_mode = "smart"<cr>


augroup clojureparinfer
  autocmd!
  " autocmd FileType clojure POff
  " autocmd BufRead *.clj,*.cljs,*.cljc,*.edn,*.joke POn
  autocmd BufReadCmd zipfile:*/* setlocal nomodifiable
augroup END
