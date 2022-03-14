""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start new lines from within normal mode
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" Echo full filename
nnoremap <Leader>sf :echo @%<CR>

" Re-read all buffers in case underlying files have been modified (e.g. by git hook/linter)
" nnoremap <Leader>rb :checktime<CR>

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

" Escape hatch from fugitiveblame files
augroup fugitiveblame
  autocmd!
  autocmd Filetype fugitiveblame nmap <buffer> q gq
augroup END

" Open and source vimrc
nmap <leader>ocs :sp $HOME/dotfiles/nvim/init.lua<cr>
nmap <leader>oct :tabedit $HOME/dotfiles/nvim/init.lua<cr>
nmap <leader>rc :w<cr>:source $HOME/dotfiles/nvim/init.lua<cr>

" Change dir to current file's directory
nmap <silent> <leader>cad :cd %:p:h<cr>
nmap <silent> <leader>cd :lcd %:p:h<cr>

" shortcut to turn search highlighting off
nmap <leader>nh :nohls<cr>

" :difft        — diff open files
" :diffs ~file~ — diff open file against provided new file
