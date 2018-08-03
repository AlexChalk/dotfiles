""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Respect $HOME/.ignore
nnoremap <c-p> :Files<CR>

" Search everything
nnoremap <leader><c-p> :call fzf#vim#files('', {'source': '\ag -ag ""'})<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
