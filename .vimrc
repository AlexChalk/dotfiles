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
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"execute pathogen#infect()

"Airline Settings
set laststatus=2
let g:airline_theme='solarized'

"Leader customizations
let mapleader = ","
nnoremap <Leader>n :NERDTree<CR>

"Rspec test customizations
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


"Editing
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set scrolloff=3		" maintain slight scroll
map Q gq " Don't use Ex mode, use Q for formatting
set showcmd		" display incomplete commands
set history=50		" keep 50 lines of command line history
set ignorecase            " Make searches case-insensitive.
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"Display
set guifont=Consolas:h13 " just in case I decide to use the gui
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
"Use relativenumber
set relativenumber
"set number  " if uncommented also adds actual line number for current line.

"Tabs and wrapping
"filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
:nnoremap p p`[v`]=

"Colours
syntax enable             " enable syntax highlighting (previously syntax on).
set background=light
colorscheme solarized

"Use system clipboard.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif