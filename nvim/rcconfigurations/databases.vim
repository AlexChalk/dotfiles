nmap <leader>sdb vip:DB<CR>
vmap <leader>sdb :DB<CR>

" Connection
" Trigger with / to add final slash
lua SetupCommandAlias("pg", "DB w:db = postgres://")
" cnoreabbrev pg DB w:db = postgres://
" DB w:db = postgres:///db-name
"
" function! WriteCommitAndQuit()
"     w
"     silent !git commit -am "auto"
"     q
" endfunction
