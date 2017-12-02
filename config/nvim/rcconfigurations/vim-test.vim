""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vimux'

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>
