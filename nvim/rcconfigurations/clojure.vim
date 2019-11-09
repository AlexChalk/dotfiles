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

" let g:fireplace_cljs_repl = '(figwheel.main.api/cljs-repl "dev")'
" Clojurescript repl connect is project/tooling dependent, here is an example with figwheel-main:
" 1. CLI: clj -A:cider-cljs
" 2. :Connect nrepl://localhost:<port>
" 3. Piggieback (figwheel.main.api/start "dev")
" 4. Open website
" 5. Piggieback (figwheel.main.api/cljs-repl "dev")

" Shadow-cljs
" 1. CLI: shadow-cljs watch <buildname>
" 2. :Connect nrepl://localhost:<clj-repl-port>
" 3. :Piggieback :<buildname>
" 4. Refresh browser
" 5. For CLJ, CLI: clj -A:cider-clj
" 6. :Connect nrepl://localhost:<port>
" 7. (Can't find a way to start cljs repl from within clj repl like with figwheel, so
"    would have to switch back and forth between connections if moving from clojure to cljs).

" Treat pixie like clojure
augroup pixie
  autocmd!
  autocmd BufNewFile,BufRead *.pxi set filetype=clojure
augroup END

" Source
" open: ]<C-D>
" split <C-W>d 
