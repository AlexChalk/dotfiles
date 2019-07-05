""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Because undo is persistent, we don't need tmp as well
augroup notempundofile
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
