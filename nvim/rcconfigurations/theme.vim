""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
" colorscheme dzo
" colorscheme nova
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline_extensions = []
" let g:airline_theme="base16_atelierheath"
" let g:airline_theme="deus"
set ttimeoutlen=10

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_c = airline#section#create(['file'])
  let g:airline_section_x = airline#section#create([''])
  let g:airline_section_y = airline#section#create(['filetype'])
  let g:airline_section_z = airline#section#create(['%l',':','%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
