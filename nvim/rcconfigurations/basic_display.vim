""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler		              " show the cursor position all the time
set incsearch		          " do incremental searching
set number relativenumber " set numbers behaviour
set inccommand=nosplit    " show results of command incrementally
set textwidth=85          " Make it obvious where 
set colorcolumn=+1        " 85 characters is
set splitbelow            " set default :sp position
set splitright            " set default :vsp position
set cursorline

function! ToggleTextWidth()
  if &textwidth == 0
    set textwidth=85
  else 
    set textwidth=0
  endif
endfunc

command! ToggleTextWidth :call ToggleTextWidth()
