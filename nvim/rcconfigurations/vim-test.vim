""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vtr'
let test#javascript#mocha#file_pattern = '\vtests?/.*\.(ts|tsx|js|jsx|coffee)$'

nmap <silent> <leader>rta :TestNearest<CR>
nmap <silent> <leader>rtf :TestFile<CR>
nmap <silent> <leader>rts :TestSuite<CR>
nmap <silent> <leader>rtr :TestLast<CR>

function! TypeScriptTransform(cmd) abort
  return substitute(a:cmd, '\v(.*)mocha', 'TS_NODE_FILES=true ts-mocha', '')
endfunction

let g:test#custom_transformations = {'mocha': function('TypeScriptTransform')}
let g:test#transformation = 'mocha'
