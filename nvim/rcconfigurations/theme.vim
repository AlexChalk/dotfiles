""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256
syntax enable
colorscheme base16-gruvbox-dark-medium

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

if !exists("airline_loaded")
  let airline_loaded = 1
  autocmd User AirlineAfterInit call AirlineInit()
endif
