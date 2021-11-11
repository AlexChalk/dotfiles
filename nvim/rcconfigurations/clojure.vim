""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings
" let g:clojure_fuzzy_indent = 2
" let g:clojure_fuzzy_indent_patterns = ['.*']
" let g:clojure_fuzzy_indent_blacklist = ['->', ':require']

" Rainbow Parens
" let g:rainbow#blacklist = [233, 234] ansi or HEX
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END

" Autopairs
let g:sexp_enable_insert_mode_mappings = 0

" Keywords
" augroup clojure-keyword
"   autocmd!
"   autocmd FileType clojure set iskeyword-=?,*,!,+,/,=,<,>,.,:,$ 
" augroup END
