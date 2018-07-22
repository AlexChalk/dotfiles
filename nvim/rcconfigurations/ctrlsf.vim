cnoreabbrev ag CtrlSF -R
cnoreabbrev agg ag

let g:ctrlsf_ackprg = '/usr/local/bin/rg'

let g:ctrlsf_default_view_mode = 'compact'

nnoremap <leader>tsr :CtrlSFToggle<cr>
