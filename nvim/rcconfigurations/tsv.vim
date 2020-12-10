augroup tsv
  autocmd!
  autocmd FileType tsv set noexpandtab
  autocmd FileType tsv set tabstop=16
  autocmd FileType tsv inoremap <silent><expr> <TAB> "\<TAB>"
augroup END
