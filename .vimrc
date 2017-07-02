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
Plugin 'Chiel92/vim-autoformat'
Plugin 'christoomey/vim-system-copy'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
"Plugin 'janko-m/vim-test'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'w0rp/ale'
if has("nvim")
  Plugin 'neovim/node-host'
  Plugin 'clojure-vim/nvim-parinfer.js'
endif
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"execute pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nnoremap <Leader>f :NERDTree<CR>
nnoremap <Leader>b :bNext<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>
nnoremap p p`[v`]=
nnoremap P P`[v`]=
if has("nvim")
  nnoremap <c-s> :w<CR>
endif
nnoremap <space> ,

"Frame movement commands
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>sf :VtrSendFile<cr>
nnoremap <leader>sc :VtrSendCommand<cr>
nnoremap <leader>sa :VtrAttachToPane<cr>
nnoremap <leader>sr :VtrFocusRunner<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting with ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'ruby': [],
      \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rspec test customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
  let g:rspec_command = "vsplit | term bundle exec rspec {spec}"
endif
"let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
map <Leader>rv :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rf :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

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
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_extensions = []
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
" Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt+=menuone
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt+=noselect
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat.vim code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
