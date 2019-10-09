""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Misc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start    
set scrolloff=2	              " Maintain slight scroll
set showcmd		                " Display incomplete commands
set history=50	              " Keep 50 lines of command line history
set ignorecase                " Make searches case-insensitive by default.
set smartcase                 " Override ignorecase if caps are used.
set iskeyword+=-              " Define `w` consistently for - and _
set wildmenu
set lazyredraw
set formatoptions-=t
" set path+=**                  " Disabled because it doesn't play nice with node_modules

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
