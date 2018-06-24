""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>pp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>pi :let g:parinfer_mode = "indent"<cr>
nnoremap <leader>ps :let g:parinfer_mode = "smart"<cr>

" Reload all definitions for file in repl
autocmd FileType clojure map <leader>ra :w<cr>:Require!<cr>

" Indentation settings
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
