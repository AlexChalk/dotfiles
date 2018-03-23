""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Top settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
" Remember to run :PlugUpdate and :PlugUpgrade once in a while
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'lifepillar/vim-mucomplete'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'rust-lang/rust.vim'

"Themes
Plug 'morhetz/gruvbox'
Plug 'Blevs/vim-dzo'
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
Plug 'SirVer/ultisnips'

" Custom text objects
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'adc17/vim-textobj-wiw'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'w0rp/ale'

" Clojure
  Plug 'clojure-vim/async-clj-highlight'
  Plug 'snoe/clj-refactor.nvim'
  Plug 'clojure-vim/nvim-parinfer.js'
  Plug 'guns/vim-clojure-static'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'neovim/node-host'
  Plug 'tpope/vim-fireplace'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change leader and change space to prior leader functionality
let mapleader = ","
nnoremap <space> ,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source my customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/dotfiles/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction
call s:SourceConfigFilesIn('rcconfigurations')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat.vim code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
