""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['.*']
let g:clojure_fuzzy_indent_blacklist = ['->', ':require']

augroup clojure-keyword
  autocmd!
  autocmd FileType clojure set iskeyword-=?,*,!,+,/,=,<,>,.,:,$ 
  "macro diagnostics are a pain
  autocmd FileType clojure call coc#config('diagnostic.enable', 0)
augroup END

" https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-with-Vim
" Begin connection to figwheel repl: :Connect<cr>


" Treat pixie like clojure
augroup pixie
  autocmd!
  autocmd BufNewFile,BufRead *.pxi set filetype=clojure
augroup END

" Source
" open: ]<C-D>
" split <C-W>d 
