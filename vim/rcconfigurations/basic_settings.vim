""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Misc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start    
set scrolloff=3	              " Maintain slight scroll
set showcmd		                " Display incomplete commands
set history=50	              " Keep 50 lines of command line history
set ignorecase                " Make searches case-insensitive.
set iskeyword+=-              " Define `w` consistently for - and _

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"Use system clipboard.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler		              " show the cursor position all the time
set incsearch		          " do incremental searching
" set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set number relativenumber
if has("nvim")
  set inccommand=nosplit
endif
set textwidth=72          " Make it obvious where 80 characters is
set colorcolumn=+1
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=0         " tab stop
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set wrap                  " wrap text
