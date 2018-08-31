""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CtagsAsync()
  let job_id = async#job#start(['atomic-ctags'],
        \ {
        \   'on_exit': function('s:on_exit'),
        \ })
endfunction
command! CtagsAsync call <sid>CtagsAsync()

function! s:on_exit(job_id, exit_code, _)
  if a:exit_code != 0
    echohl Error
    echom 'Error running: ' . a:job_id . '; exit code: ' . a:exit_code
    echohl None
  endif
endfunction

augroup async_ctags
  autocmd!
  autocmd VimEnter * CtagsAsync
  autocmd BufWritePost * CtagsAsync
augroup END

" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" Vanilla
" - :b lets you autocomplete any open buffer
