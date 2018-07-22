autocmd FileType elm map K :ElmShowDocs<cr>

let g:elm_format_autosave = 0

autocmd FileType elm nmap <leader>sbr vipk<c-v>$A<space>\<esc>vip<leader>sru
