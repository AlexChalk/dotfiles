""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Misc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start    
set scrolloff=3	              " Maintain slight scroll
set showcmd		                " Display incomplete commands
set history=50	              " Keep 50 lines of command line history
set ignorecase                " Make searches case-insensitive by default.
set smartcase                 " Override ignorecase if caps are used.
set iskeyword+=-              " Define `w` consistently for - and _

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler		              " show the cursor position all the time
set incsearch		          " do incremental searching
set number relativenumber " set numbers behaviour
set inccommand=nosplit    " show results of command incrementally
set textwidth=72          " Make it obvious where 
set colorcolumn=+1        " 72 characters is
set splitbelow            " set default :sp position
set splitright            " set default :vsp position

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab equals two columns of space
set softtabstop=0         " used when shiftwidth=0
set shiftwidth=2          " indent of 2 columns
set shiftround            " always indent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set wrap                  " wrap text
