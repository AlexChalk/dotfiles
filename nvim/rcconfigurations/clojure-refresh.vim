""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure-refresh
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Refresh repl
function! s:Refresh(bang,ns)
  let cmd = ('(clojure.tools.namespace.repl/refresh'.(a:bang ? '-all' : '').')')
  echo cmd
  try
    call fireplace#session_eval("(require '(clojure.tools.namespace repl))")
    call fireplace#session_eval(cmd)
    return ''
  catch /^Clojure:.*/
    return ''
  endtry
endfunction

function! s:setup_refresh()
  command! -buffer -bar -bang -complete=customlist,fireplace#ns_complete -nargs=? Refresh :exe s:Refresh(<bang>0, <q-args>)
  nnoremap <silent><buffer> cpf :Refresh<CR>
endfunction

augroup fireplace_refresh
  autocmd!
  autocmd FileType clojure call s:setup_refresh()
augroup END
