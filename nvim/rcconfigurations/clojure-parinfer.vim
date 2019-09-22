""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure-parinfer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>lp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>li :let g:parinfer_mode = "indent"<cr>
nnoremap <leader>ls :let g:parinfer_mode = "smart"<cr>
" not a real mode, but stops plugin from running

function! POff()
  let g:parinfer_mode = "off"
  ParinferOff
endfunc
command! POff :call POff()

function! POn()
  if g:parinfer_mode == "off"
    let g:parinfer_mode = "smart"
  endif
  ParinferOn
endfunc
command! POn :call POn()

nnoremap <leader>le :POn<cr>
nnoremap <leader>lo :POff<cr>

" reverse vim-clojure-static behaviour (I don't know why it messes with this, but if I realize I might change it back)
augroup clojure
  autocmd!
  autocmd FileType clojure POff
  autocmd InsertEnter *.clj,*.cljs,*.cljc,*.edn POn
augroup END
