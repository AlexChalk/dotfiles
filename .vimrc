""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  " Use vim-mode, no vi mode. Should be first command.
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"execute pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nnoremap <Leader>f :NERDTree<CR>
nnoremap <Leader>b :bnext<CR>
nnoremap <Leader>n :bNext<CR>
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>
nnoremap p p`[v`]=
"Frame movement commands
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rspec test customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Misc. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.
set scrolloff=3	                	" maintain slight scroll
map Q gq                            " Don't use Ex mode, use Q for formatting
set showcmd		                    " display incomplete commands
set history=50	                	" keep 50 lines of command line history
set ignorecase                      " Make searches case-insensitive.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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
set guifont=Consolas:h13 " just in case I decide to use the gui
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.

"Use relativenumber
"set relativenumber
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline_theme='understated'
set ttimeoutlen=10

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['file'])
    let g:airline_section_c = airline#section#create([''])
    let g:airline_section_x = airline#section#create([''])
    let g:airline_section_y = airline#section#create(['filetype'])
    let g:airline_section_z = airline#section#create(['%l',':','%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable             " enable syntax highlighting (previously syntax on).
set background=light
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat.vim code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
