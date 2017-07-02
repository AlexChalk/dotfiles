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
Plugin 'Chiel92/vim-autoformat'
Plugin 'christoomey/vim-system-copy'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'morhetz/gruvbox'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'w0rp/ale'
if has("nvim")
  Plugin 'neovim/node-host'
  Plugin 'clojure-vim/nvim-parinfer.js'
endif
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change leader and change space to prior leader functionality
let mapleader = ","
nnoremap <space> ,

" Start new lines from within normal mode
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" Autocorrect indentation after pasting
nnoremap p p`[v`]=
nnoremap P P`[v`]=

" C-s bindings for neovim (don't work in vim)
if has("nvim")
  nnoremap <c-s> :w<CR>
  imap <C-s> <esc>:w<CR>
endif

" Nerdtree equivalent
nnoremap <Leader>f :e .<CR>
" Escape hatch from help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Open and source vimrc
nmap <leader>co :sp $MYVIMRC<cr>
nmap <leader>ct :tabedit ~/.vimrc<cr>
nmap <leader>cs :source $MYVIMRC<cr>

" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>

" Copy the entire buffer into the system register
nmap <leader>co ggVG"+y

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Frame movement commands
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Tmux Runner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
map <Leader>rv :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rf :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'

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
set backspace=indent,eol,start    " Allow backspacing over everything in insert mode.
set scrolloff=3	                 	" Maintain slight scroll
set showcmd		                    " Display incomplete commands
set history=50	                 	" Keep 50 lines of command line history
set ignorecase                    " Make searches case-insensitive.
set textwidth=80                  " Make it obvious where 80 characters is
set colorcolumn=+1
set splitbelow
set splitright

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
set wrap                  " don't wrap text

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
" Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

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
