" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=
nnoremap <leader>"+p "+p
nnoremap <leader>"+P "+P

" Copy the entire buffer into the system register
nmap <leader>cac ggVG"+y
" Copy the entire buffer into vim register
nmap <leader>caf ggVGy

" replace-with-register bindings for system clipboard
nmap <leader>gr "+gr
nmap <leader>gR "+gR
