""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vtr'
let test#javascript#jasmine#file_pattern = '\.test\.js'

let g:test#javascript#mocha#options = ''

let s:babel_loaded = 0
function! MochaBabel()
  if s:babel_loaded
    let s:babel_loaded = 0
    let g:test#javascript#mocha#options = ''
  else
    let s:babel_loaded = 1
    let g:test#javascript#mocha#options = '--compilers js:babel-core/register'
  endif
endfunc
command! MochaBabel :call MochaBabel()

" Run Test Assertion/File/Suite/Repeat
nmap <silent> <leader>rta :TestNearest<CR>
nmap <silent> <leader>rtf :TestFile<CR>
nmap <silent> <leader>rts :TestSuite<CR>
nmap <silent> <leader>rtr :TestLast<CR>
