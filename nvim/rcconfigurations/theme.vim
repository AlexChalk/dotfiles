""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme base16-gruvbox-dark-medium

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'parinfermode', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype', 'cocstatus', 'readonly' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'parinfermode': 'ParinferMode'
      \ },
      \ }

function! ParinferMode()
  if exists("g:parinfer_mode")
    return g:parinfer_mode
  else
    return ''
  endif
endfunction
