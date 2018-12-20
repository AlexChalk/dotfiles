""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>pp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>pi :let g:parinfer_mode = "indent"<cr>
nnoremap <leader>ps :let g:parinfer_mode = "smart"<cr>

" Reload all definitions for file in repl
augroup clojure
  autocmd!
  autocmd FileType clojure map <leader>ra :w<cr>:Require!<cr>
augroup END

" Indentation settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['.*']
let g:clojure_fuzzy_indent_blacklist = ['->', ':require']


" Begin connection to figwheel repl
nnoremap <leader>cfr :Connect<cr>

" Treat pixie like clojure
augroup pixie
  autocmd!
  autocmd BufNewFile,BufRead *.pxi set filetype=clojure
augroup END

" Source
" open: ]<C-D>
" split <C-W>d 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline config for parinfer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (exists('g:parinfer_airline_integration') ? g:parinfer_airline_integration : 1)
  function! ParinferAirline(...)
    if &filetype =~ '.*\(clojure\|scheme\|lisp\|racket\|hy\).*'
      let w:airline_section_a = g:airline_section_a . ' %{g:parinfer_mode}'
    endif
  endfunction

  try
    call airline#add_statusline_func('ParinferAirline')
  catch
  endtry
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END
