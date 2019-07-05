" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=
nnoremap <leader>"+p "+p
nnoremap <leader>"+P "+P

nmap <leader>y <Plug>SystemCopy
xmap <leader>y <Plug>SystemCopy
nmap <leader>yy <Plug>SystemCopyLine
nmap <leader>p <Plug>SystemPaste
nmap <leader>pp <Plug>SystemPasteLine

" Copy the entire buffer into the system register
nmap <leader>cac ggVG"+y
" Copy the entire buffer into vim register
nmap <leader>caf ggVGy

" replace-with-register bindings for system clipboard
nmap <leader>gr "+gr
nmap <leader>gR "+gR

" paste-and-search (freezes right now)
" nmap <leader>sp :rg<space><c-f>pA<cr>
