""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Respect ~/.ignore
nnoremap <c-p> :call fzf#vim#files('', {'source': 'ag -g "" --path-to-ignore ~/.ignore'})<CR>
" Search everything
nnoremap <leader><c-p> :Files<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
