"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt+=menuone
set completeopt+=longest
set completeopt-=preview  " Don't use preview window for autocomplete
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 0

" let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetsDir = '~/dotfiles/vim/rcconfigurations/ultisnips_definitions'
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = '<C-;>'
" let g:mucomplete#chains = { 'javascript': [ 'ulti', 'omni'] }
" let g:mucomplete#chains = { 'default': ['omni', 'ulti', 'path', 'keyn', 'dict', 'uspl'] }
