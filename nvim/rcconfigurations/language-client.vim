" http://vim.wikia.com/wiki/Omni_completion
" ctrl-o/ctrl-i to navigate jump stack

" If a tsconfig exists for a project, consider copying it as your jsconfig.json.

" Project root issues: https://github.com/autozimu/LanguageClient-neovim/issues/464
" jsconfig.json info: https://code.visualstudio.com/docs/languages/jsconfig

nmap <leader>gD :LspDefinition<CR>
nmap <leader>K :LspHover<CR>
nmap <leader>fR :LspReferences<CR>
nmap <leader>lr :LspRename<CR>
nmap <leader>ld :LspDocumentDiagnostics<CR>
nmap <leader>gI :LspImplementation<CR>
" i is for interface
nmap <leader>giD :LspTypeDefinition<CR>
nmap <leader>lgs <plug>(lsp-status)
nmap <leader>lws <plug>(lsp-workspace-symbol)

nmap <leader>ql :call lsp#disable()<CR>
nmap <leader>sl :call lsp#enable()<CR>

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_highlight_references_enabled = 0
let g:lsp_highlights_enabled = 0
" let g:lsp_signs_enabled = 1
" let g:lsp_signs_error = {'text': '✗', 'texthl': 'GruvboxRedSign', 'linehl': 'Error'}
" let g:lsp_signs_warning = {}
" let g:lsp_signs_information = {}
" let g:lsp_signs_hint = {}

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
      \ 'whitelist': ['typescript', 'typescript.tsx'],
      \ })


  au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
      \ 'whitelist': ['javascript', 'javascript.jsx'],
      \ })
endif

if executable('clojure-lsp')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'clojure-lsp',
      \ 'cmd': {server_info->['clojure-lsp']},
      \ 'whitelist': ['clojure'],
      \ })
endif


if executable('pyls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
endif

if executable('hie-wrapper')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'hie-wrapper',
        \ 'cmd': {server_info->['hie-wrapper']},
        \ 'whitelist': ['haskell'],
        \ })
endif
