""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif

lua vim.opt.syntax = "enable"
lua vim.cmd('colorscheme base16-gruvbox-dark-medium')

" If not using my terminal emulator, i.e. no window manager
if $TERM == "tmux"
  highlight clear
  highlight ColorColumn guibg=grey
endif

lua vim.opt.laststatus = 2
lua vim.opt.ttimeoutlen = 10
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
