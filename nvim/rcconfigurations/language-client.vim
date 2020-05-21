" http://vim.wikia.com/wiki/Omni_completion
" ctrl-o/ctrl-i to navigate jump stack

" if hidden is not set, TextEdit might fail.
" set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000

" Coc confirm completion (gets you autoimport in js/ts)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use `[r` and `]r` to navigate diagnostics
" nmap <silent> [r <Plug>(coc-diagnostic-prev)
" nmap <silent> ]r <Plug>(coc-diagnostic-next)
nmap <silent> <leader><C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <leader><C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gdd <Plug>(coc-definition)
nmap <silent> <leader>K :call CocAction('doHover')<CR>
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>lr <Plug>(coc-rename)
nmap <silent> <leader>fi <Plug>(coc-implementation)
nmap <silent> <leader>gid <Plug>(coc-type-definition)

" <C-K>/<C-J> to navigate in interactive mode
" Search workspace symbols
nmap <silent> <leader>sp :<C-u>CocList -I symbols<cr>
" Find symbol of current document
nnoremap <silent> <leader>ast :<C-u>CocList outline<cr>

nmap <leader>ql :CocDisable<CR>
nmap <leader>sl :CocEnable<CR>

nmap <silent> <leader>fl <Plug>(coc-format)

" nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" Don't trigger on . or ' in node: "suggest.autoTrigger": "none",

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
