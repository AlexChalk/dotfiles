" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=

nnoremap cy "+y
xnoremap cy "+y
nnoremap cyy "+yy
nnoremap cp "+p

" Copy the entire buffer into the system register
nmap <leader>cac ggVG"+y
" Copy the entire buffer into vim register
nmap <leader>caf ggVGy

" Replace with register custom bindings
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual
nmap c<leader>r "+<leader>r
nmap c<leader>rr "+<leader>rr

" paste-and-search (freezes right now)
" nmap <leader>sp :rg<space><c-f>pA<cr>
