""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Misc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start    
set scrolloff=3	              " Maintain slight scroll
set showcmd		                " Display incomplete commands
set history=50	              " Keep 50 lines of command line history
set ignorecase                " Make searches case-insensitive by default.
set smartcase                 " Override ignorecase if caps are used.
set iskeyword+=-              " Define `w` consistently for - and _
set wildmenu
set lazyredraw
" set path+=**                  " Disabled because it doesn't play nice with node_modules

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
set textwidth=85          " Make it obvious where 
set colorcolumn=+1        " 85 characters is
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


" Replace carriage return characters with real linebreaks
" %s/\\n/\r/g

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

augroup notempundofile
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
