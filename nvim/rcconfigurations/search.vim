cnoreabbrev rg CtrlSF
cnoreabbrev rgg rg

let g:ctrlsf_ackprg = 'ag'

let g:ctrlsf_default_view_mode = 'compact'

let g:ctrlsf_extra_backend_args = {
      \ 'ag': '--path-to-ignore $HOME/.ignore'
      \ }

let g:ctrlsf_mapping = {
      \ 'open'    : ['<CR>', 'o'],
      \ 'openb'   : 'O',
      \ 'split'   : '<C-O>',
      \ 'vsplit'  : '<C-V>',
      \ 'tab'     : '<C-T>',
      \ 'tabb'    : 'T',
      \ 'popen'   : 'p',
      \ 'popenf'  : 'P',
      \ 'quit'    : 'q',
      \ 'next'    : '<C-J>',
      \ 'prev'    : '<C-K>',
      \ 'pquit'   : 'q',
      \ 'loclist' : '',
      \ 'chgmode' : 'M',
      \ 'stop'    : '<C-C>',
      \}

nnoremap <leader>tsr :CtrlSFToggle<cr>

nmap <leader>K <Plug>DashSearch

" Project-wide search and replace
" :args `rg -l search_expression .`
" :argdo %s/old/new/g | w
