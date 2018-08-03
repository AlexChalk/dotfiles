cnoreabbrev ag CtrlSF -R
cnoreabbrev agg ag

let g:ctrlsf_ackprg = '/usr/local/bin/rg'

let g:ctrlsf_default_view_mode = 'compact'

nnoremap <leader>tsr :CtrlSFToggle<cr>

" Project-wide search and replace
" :args `ag -l search_expression .`
" :argdo %s/old/new/g | w
