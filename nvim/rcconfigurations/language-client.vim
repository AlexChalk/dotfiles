" http://vim.wikia.com/wiki/Omni_completion
" ctrl-o/ctrl-i to navigate jump stack

" if hidden is not set, TextEdit might fail.
" set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader><C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <leader><C-j> <Plug>(coc-diagnostic-next)

nmap <silent> <leader>gD <Plug>(coc-definition)
nmap <silent> <leader>K :call CocAction('doHover')<CR>
nmap <silent> <leader>fR <Plug>(coc-references)
nmap <silent> <leader>lr <Plug>(coc-rename)
" nmap <silent> <leader>ld :LspDocumentDiagnostics<CR>
nmap <silent> <leader>gI <Plug>(coc-implementation)
" i is for interface
nmap <silent> <leader>giD <Plug>(coc-type-definition)
" nmap <silent> <leader>lgs <plug>(lsp-status)
" nmap <silent> <leader>lws <plug>(lsp-workspace-symbol)

nmap <leader>ql :CocDisable<CR>
nmap <leader>sl :CocEnable<CR>

nmap <silent> <leader>fl <Plug>(coc-format)

" Don't trigger on . or ' in node: "suggest.autoTrigger": "none",
" nmap <leader>la :call CocAction('workspaceSymbol', 'config')

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
