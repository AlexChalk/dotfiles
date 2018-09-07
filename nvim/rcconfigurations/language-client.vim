" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }

" let g:LanguageClient_windowLogMessageLevel = 'Error'

nmap <leader>lcm :call LanguageClient_contextMenu()<CR>
nmap <leader>lch :call LanguageClient#textDocument_hover()<CR>
nmap <leader>lcr :call LanguageClient#textDocument_rename()<CR>
nmap <leader>lcs :call LanguageClient#textDocument_documentSymbol()<CR>
nmap <leader>lcps :call LanguageClient#workspace_symbol()<CR>
nmap <leader>lca :call LanguageClient#textDocument_codeAction()<CR>
nmap <leader>lcf :call LanguageClient#textDocument_formatting()<CR>
vmap <leader>lcf :call LanguageClient#textDocument_rangeFormatting()<CR>
nmap <leader>gdd :call LanguageClient#textDocument_definition()<CR>
nmap <leader>gdt :call LanguageClient#textDocument_typeDefinition()<CR>
nmap <leader>gdi :call LanguageClient#textDocument_implementation()<CR>
nmap <leader>gdu :call LanguageClient#textDocument_references()<CR>
