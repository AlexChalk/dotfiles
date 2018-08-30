" Send blocks to ghci
augroup haskell
  autocmd!
  autocmd FileType haskell nmap <buffer> <leader>sbr {o:{<esc>}<bs>o:}<esc>0d^vip<leader>sr3u
augroup END
