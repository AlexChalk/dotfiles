""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start new lines from within normal mode
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" Echo full filename
nnoremap <Leader>ef :echo @%<CR>

" Easier command-mode binding
" nmap <leader>; :

" En-dashes (in insert mode) <ctrl>k -N
" Em-dashes (in insert mode) <ctrl>k -M
" All funky characters: `:h digraphs`

" Escape hatch from help files
augroup help
  autocmd!
  autocmd Filetype help nnoremap <buffer> q :q<CR>
augroup END

" Escape hatch from quickfix files
augroup quickfix
  autocmd!
  autocmd Filetype qf nnoremap <buffer> q :ccl<CR>
augroup END

" Escape hatch from markdown.lsp-hover files
augroup lsphover
  autocmd!
  autocmd Filetype markdown.lsp-hover nnoremap <buffer> q :q<CR>
augroup END

" Escape hatch from fugitiveblame files
augroup fugitiveblame
  autocmd!
  autocmd Filetype fugitiveblame nmap <buffer> q gq
augroup END

" Escape hatch from fugitive files
augroup fugitive
  autocmd!
  autocmd Filetype fugitive nmap <buffer> q gq
augroup END

" Escape hatch from ctrlsf as builtin squashes rightmost window sometimes
augroup ctrlsf
  autocmd!
  autocmd Filetype ctrlsf nmap <buffer> q :q<CR>
  autocmd Filetype ctrlsf nunmap <C-X>
augroup END

" Open and source vimrc
nmap <leader>ocs :sp $HOME/dotfiles/nvim/init.vim<cr>
nmap <leader>oct :tabedit $HOME/dotfiles/nvim/init.vim<cr>
nmap <leader>rc :w<cr>:source $HOME/dotfiles/nvim/init.vim<cr>

" Change dir to current file's directory
nmap <silent> <leader>cad :cd %:p:h<cr>
nmap <silent> <leader>cd :lcd %:p:h<cr>

" shortcut to turn search highlighting off
nmap <leader>nh :nohls<cr>

" diff open files
nmap <leader>dt :difft<cr>
" :diffs ~file~ — diff open file against provided new file
