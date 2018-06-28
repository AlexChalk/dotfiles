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

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'lifepillar/vim-mucomplete'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

"Themes
Plug 'chriskempson/base16-vim'
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

" Other custom text editing/navigation
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/matchit.zip'
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'typescript', 'tsx'] }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'tsx'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'tsx'], 'do': ':UpdateRemotePlugins' }

" Clojure
Plug 'clojure-vim/async-clj-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'snoe/clj-refactor.nvim', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'eraserhd/parinfer-rust', { 'for': ['clojure', 'clojurescript'], 'do': 'cargo build --release' }

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
