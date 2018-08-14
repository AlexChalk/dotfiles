""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Respect $HOME/.ignore
nnoremap <c-p> :Files<CR>

" Search everything
nnoremap <leader><c-p> :call fzf#vim#files('', {'source': 'rg --files --no-ignore --hidden --glob "!.git/*"'})<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow'
