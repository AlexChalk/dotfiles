"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt+=menuone
set completeopt+=longest
" set completeopt+=noinsert,noselect
set completeopt-=preview  " Don't use preview window for autocomplete
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 0
" let g:mucomplete#ultisnips#match_at_start = 0
let g:UltiSnipsExpandTrigger = '<C-]>'
" let g:mucomplete#chains = { 'javascript': [ 'ulti', 'omni'] }
" let g:mucomplete#chains = { 'default': ['omni', 'ulti', 'path', 'keyn', 'dict', 'uspl'] }

let g:ultisnips_javascript = {
     \ 'keyword-spacing': 'always',
     \ 'semi': 'always',
     \ 'space-before-function-paren': 'always',
\ }
