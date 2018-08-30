let g:elm_format_autosave = 0

augroup elm
  autocmd!
  autocmd FileType elm map <buffer> K :ElmShowDocs<cr>
  autocmd FileType elm nmap <buffer> <leader>sbr vipk<c-v>$A<space>\<esc>vip<leader>sru
augroup END
