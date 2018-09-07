" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=
nnoremap <leader>"+p "+p
nnoremap <leader>"+P "+P

" Similar mappings for vim-system-copy
nnoremap cpp o<esc>"+p`[v`]=
nnoremap cpP O<esc>"+p`[v`]=
nnoremap <leader>cpp o<esc>"+p
nnoremap <leader>cpP O<esc>"+P

" Copy the entire buffer into the system register
nmap <leader>cac ggVG"+y
" Copy the entire buffer into vim register
nmap <leader>caf ggVGy

" replace-with-register bindings for system clipboard
nmap <leader>gr "+gr
nmap <leader>gR "+gR
