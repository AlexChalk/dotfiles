""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start new lines from within normal mode
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" Easier command-mode binding
nmap <leader>; :

" En-dashes (in insert mode) <ctrl>k -N
" Em-dashes (in insert mode) <ctrl>k -M
" All funky characters: `:h digraphs`

" Escape hatch from help files
augroup help
  autocmd!
  autocmd Filetype help nnoremap <buffer> q :q<CR>
augroup END

" Open and source vimrc
nmap <leader>ocs :sp $HOME/dotfiles/nvim/init.vim<cr>
nmap <leader>oct :tabedit $HOME/dotfiles/nvim/init.vim<cr>
nmap <leader>rc :w<cr>:source $MYVIMRC<cr>

" Change dir to current file's directory
nmap <silent> <leader>cad :cd %:p:h<cr>
nmap <silent> <leader>cd :lcd %:p:h<cr>

" shortcut to turn search highlighting off
nmap <leader>nh :nohls<cr>

" diff open files
nmap <leader>dt :difft<cr>
