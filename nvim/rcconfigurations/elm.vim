let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0

augroup elm
  autocmd!
  autocmd FileType elm map <buffer> K :ElmShowDocs<cr>
  autocmd FileType elm nmap <buffer> <leader>sbr vipk<c-v>$A<space>\<esc>vip<leader>sru
  autocmd FileType elm nnoremap p p
  autocmd FileType elm nnoremap P P
augroup END
