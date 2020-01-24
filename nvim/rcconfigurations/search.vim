call SetupCommandAlias("rg", "CtrlSF")
cnoreabbrev rgg rg

let g:ctrlsf_ackprg = 'rg'

let g:ctrlsf_default_view_mode = 'compact'

" let g:ctrlsf_extra_backend_args = {
"       \ 'ag': '--path-to-ignore $HOME/.ignore'
"       \ }

let g:ctrlsf_mapping = {
      \ 'open'    : ['<CR>', 'o'],
      \ 'openb'   : 'O',
      \ 'split'   : '<C-X>',
      \ 'vsplit'  : '<C-V>',
      \ 'tab'     : '<C-T>',
      \ 'tabb'    : 'T',
      \ 'popen'   : 'p',
      \ 'popenf'  : 'P',
      \ 'quit'    : '',
      \ 'next'    : '<C-N>',
      \ 'prev'    : '<C-P>',
      \ 'pquit'   : 'Q',
      \ 'loclist' : '',
      \ 'chgmode' : 'M',
      \ 'stop'    : '<C-C>',
      \}

let g:ctrlsf_auto_close = {
      \ "normal" : 0,
      \ "compact": 0
      \ }

" subdir search
" :CtrlSF {pattern} /path/to/dir

nnoremap <leader>so :CtrlSFOpen<cr>
nnoremap <leader>su :CtrlSFUpdate<cr>

nmap <leader>dK <Plug>DashSearch

" Project-wide search and replace
" :args `rg -l search_expression .`
" :argdo %s/old/new/g | w
