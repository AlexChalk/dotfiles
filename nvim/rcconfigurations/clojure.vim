""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>pp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>pi :let g:parinfer_mode = "indent"<cr>
autocmd FileType clojure map <leader>r :w<cr>:Require!<cr>
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['.*']
let g:clojure_fuzzy_indent_blacklist = ['->', ':require']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END
