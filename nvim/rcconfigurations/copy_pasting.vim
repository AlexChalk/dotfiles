" Autocorrect indentation after pasting, but keep non-indenting option
" for when pasting large files from clipboard.
nnoremap p p`[v`]=
nnoremap P P`[v`]=

nnoremap <leader>cy "+y
xnoremap <leader>cy "+y
nnoremap <leader>cyy "+yy
nnoremap <leader>cp "+p

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

" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).

if !empty($WAYLAND_DISPLAY)
  let g:clipboard = {
        \   'name': 'wayland-strip-carriage',
        \   'copy': {
        \      '+': 'wl-copy --foreground --type text/plain',
        \      '*': 'wl-copy --foreground --type text/plain --primary',
        \    },
        \   'paste': {
        \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
        \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
        \   },
        \   'cache_enabled': 1,
        \ }
endif
