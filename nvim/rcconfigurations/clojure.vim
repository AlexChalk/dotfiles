""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['.*']
let g:clojure_fuzzy_indent_blacklist = ['->', ':require']

augroup clojure-keyword
  autocmd!
  autocmd FileType clojure command! -buffer -nargs=1 Figwheel Piggieback (figwheel.main.api/cljs-repl "<args>")
  autocmd FileType clojure set iskeyword-=?,*,!,+,/,=,<,>,.,:,$ 
  "macro diagnostics are a pain
  autocmd FileType clojure call coc#config('diagnostic.enable', 0)
augroup END

let g:fireplace_cljs_repl = '(figwheel.main.api/cljs-repl "dev")'
" Clojurescript repl connect is project/tooling dependent, here is an example with figwheel-main:
" 1. :Connect nrepl://localhost:<port>
" 2. Piggieback (figwheel.main.api/start "dev")
" 3. Piggieback (figwheel.main.api/cljs-repl "dev")

" Treat pixie like clojure
augroup pixie
  autocmd!
  autocmd BufNewFile,BufRead *.pxi set filetype=clojure
augroup END

" Source
" open: ]<C-D>
" split <C-W>d 
