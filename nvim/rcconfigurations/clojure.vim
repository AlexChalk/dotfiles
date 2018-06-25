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


" Connect to figwheel repl
" nnoremap <leader>cfr :exe 'Connect nrepl://localhost:7002 ' getcwd()<cr>

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
