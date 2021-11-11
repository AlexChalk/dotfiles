function! Expand(exp) abort
  let l:result = expand(a:exp)
  return l:result ==# '' ? '' : "file://" . l:result
endfunction

function! s:executeClojureCommand(command)
  if (a:command ==? 'move-to-let') || (a:command ==? 'introduce-let') || (a:command ==? 'extract-function')
    call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': a:command, 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Name: ')]})
  else
    call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': a:command, 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})
  endif
endfunction

augroup clojure-refactor
  autocmd!
  autocmd FileType clojure nnoremap <silent> <Leader>lcr :call fzf#run({
        \  'source': [
        \     "add-missing-libspec",
        \     "clean-ns",
        \     "cycle-coll", 
        \     "expand-let",
        \     "extract-function",
        \     "introduce-let",
        \     "move-to-let",
        \     "thread-first",
        \     "thread-first-all",
        \     "thread-last",
        \     "thread-last-all",
        \     "unwind-all",
        \     "unwind-thread",
        \     "add-import-to-namespace",
        \     "create-test",
        \     "cycle-privacy",
        \     "inline-symbol",
        \     "resolve-macro-as"
        \   ],
        \   'down': '30%',
        \   'sink': function('<sid>executeClojureCommand'),
        \  })<CR>
augroup END
