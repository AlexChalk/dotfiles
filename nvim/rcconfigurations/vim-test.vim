""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vtr'
let test#javascript#jasmine#file_pattern = '\.test\.js'
let test#javascript#mocha#options = '--compilers js:babel-core/register'

" Run Test Assertion/File/Suite/Repeat
nmap <silent> <leader>rta :TestNearest<CR>
nmap <silent> <leader>rtf :TestFile<CR>
nmap <silent> <leader>rts :TestSuite<CR>
nmap <silent> <leader>rtr :TestLast<CR>
