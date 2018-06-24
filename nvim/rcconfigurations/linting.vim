""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting with ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'ruby': ['rubocop'],
      \ 'eruby': [''],
      \}

nmap <silent> <leader><C-k> <Plug>(ale_previous_wrap)
nmap <silent> <leader><C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>ds <Plug>(ale_hover)
nmap <silent> <leader>em <Plug>(ale_detail)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformatting with ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>fl :ALEFix<CR>
let g:ale_fixers = {
      \   'javascript': [
      \       'eslint',
      \   ],
      \   'typescript': [
      \       'tslint',
      \   ],
      \   'json': [
      \       'fixjson', 
      \       'jq'
      \   ],
      \}
