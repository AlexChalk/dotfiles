" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=

nmap cy <Plug>SystemCopy
xmap cy <Plug>SystemCopy
nmap cyy <Plug>SystemCopyLine
nmap cp <Plug>SystemPaste
nmap cpp <Plug>SystemPasteLine

" Copy the entire buffer into the system register
nmap <leader>cac ggVG"+y
" Copy the entire buffer into vim register
nmap <leader>caf ggVGy

" Replace with register custom bindings
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual
nmap <leader>cr "+<leader>r
nmap <leader>crr "+<leader>rr

" paste-and-search (freezes right now)
" nmap <leader>sp :rg<space><c-f>pA<cr>
