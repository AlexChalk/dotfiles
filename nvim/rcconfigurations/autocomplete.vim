"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set completeopt+=menuone
" set completeopt+=longest
" set completeopt-=preview  " Don't use preview window for autocomplete
" set shortmess+=c
" set belloff+=ctrlg
" let g:mucomplete#enable_auto_at_startup = 0

let g:UltiSnipsSnippetsDir="$HOME/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = '<C-]>'

" Deoplete
" let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
call deoplete#custom#option('auto_complete_delay', 350)
" call deoplete#custom#option('auto_complete', v:false)
nmap <silent> <leader>ad :call deoplete#enable()<CR>
nmap <silent> <leader>qd :call deoplete#disable()<CR>


inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"


" Mucomplete: C-J/C-H to move between completion types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Built-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - Use ^n and ^p to go back and forth in the suggestion list
