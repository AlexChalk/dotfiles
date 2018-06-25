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

" Nerdtree equivalent
nnoremap <Leader>sf :e .<CR>

" Escape hatch from help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Open and source vimrc
nmap <leader>ocs :sp ~/dotfiles/nvim/init.vim<cr>
nmap <leader>oct :tabedit ~/dotfiles/nvim/init.vim<cr>
nmap <leader>rc :w<cr>:source $MYVIMRC<cr>

" Change dir to current file's directory
nmap <silent> <leader>cad :cd %:p:h<cr>
nmap <silent> <leader>cd :lcd %:p:h<cr>

" shortcut to turn search highlighting off
nmap <leader>nh :nohls<cr>
