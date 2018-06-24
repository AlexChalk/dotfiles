""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vimux'
let test#javascript#jasmine#file_pattern = '\.test\.js'

" Run Test Assertion/File/Suite/Repeat
nmap <silent> <leader>rta :TestNearest<CR>
nmap <silent> <leader>rtf :TestFile<CR>
nmap <silent> <leader>rts :TestSuite<CR>
nmap <silent> <leader>rtr :TestLast<CR>
