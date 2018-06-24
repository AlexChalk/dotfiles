""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ttimeoutlen=10
let g:airline_extensions = ['ale']
let g:airline#extensions#ale#enabled = 1

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_c = airline#section#create(['file'])
  let g:airline_section_x = airline#section#create([''])
  let g:airline_section_y = airline#section#create(['filetype'])
  let g:airline_section_z = airline#section#create(['%l',':','%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
