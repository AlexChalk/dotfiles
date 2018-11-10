augroup sql
  autocmd!
  autocmd FileType sql map <leader>fs  :%!sqlformat --reindent --keywords upper --identifiers lower --indent_width 1 -<CR>
augroup END
