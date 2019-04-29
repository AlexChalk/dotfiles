" Send blocks to ghci
augroup haskell
  autocmd!
  autocmd FileType haskell nmap <buffer> <leader>sbr {o:{<esc>}<bs>o:}<esc>0d^vip<leader>sr3u

  " autocmd FileType haskell nnoremap <buffer> <leader> :HdevtoolsType<CR>
  " autocmd FileType haskell nnoremap <buffer> <leader> :HdevtoolsInfo<CR>
  " autocmd FileType haskell nnoremap <buffer> <silent> <leade> :HdevtoolsClear<CR>
augroup END

let g:hdevtools_stack = 1


" let g:haskell_classic_highlighting = 1
" let g:haskell_indent_if = 3
" let g:haskell_indent_case = 2
" let g:haskell_indent_let = 4
" let g:haskell_indent_where = 6
" let g:haskell_indent_before_where = 2
" let g:haskell_indent_after_bare_where = 2
" let g:haskell_indent_do = 3
" let g:haskell_indent_in = 1
" let g:haskell_indent_guard = 2
" let g:haskell_indent_case_alternative = 1
" let g:cabal_indent_section = 2
"
" stack build --copy-compiler-tool hdevtools (plus maybe) hlint hindent hfmt
"
"
" So you can run stack --stack-yaml stack-<version>.yaml build --copy-compiler-tool in hie dir to install hie for various versions of GHC.
