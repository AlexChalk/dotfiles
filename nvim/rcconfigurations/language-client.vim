" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }

" let g:LanguageClient_windowLogMessageLevel = 'Error'
" let g:LanguageClient_diagnosticsEnable = 0

nmap <leader>lom :call LanguageClient_contextMenu()<CR>
" consider shift-k instead of lch
nmap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>hq <C-W>j:q<CR>
nmap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nmap <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
nmap <leader>lps :call LanguageClient#workspace_symbol()<CR>
nmap <leader>la :call LanguageClient#textDocument_codeAction()<CR>
nmap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
vmap <leader>lf :call LanguageClient#textDocument_rangeFormatting()<CR>
nnoremap <leader>lm :call LanguageClient#explainErrorAtPoint()<CR>
nmap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nmap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nmap <leader>li :call LanguageClient#textDocument_implementation()<CR>
nmap <leader>lu :call LanguageClient#textDocument_references()<CR>

" To avoid lag, create jsconfig.json file containing at least this:
" {
"   \"exclude": [ \"node_modules" ]
" }
