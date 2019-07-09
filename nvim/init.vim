""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Top settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Redefine conflicting vim wiki binding
let g:vimwiki_map_prefix = '<Leader><Leader>w'
let g:vimwiki_conceal_onechar_markers = 0
" let g:vimwiki_url_maxsave = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
" Remember to run :PlugUpdate (and :PlugUpgrade if on macOS) once in a while
" For versioning: :SavePlugSnapshot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.local/share/nvim/plugged')

" General
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

Plug 'chaoren/vim-wordmotion'
Plug 'tomtom/tcomment_vim'

Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'

Plug 'chrisbra/matchit' " Including in nvim runtime/plugin
Plug 'machakann/vim-highlightedyank'

Plug 'w0rp/ale'
Plug 'janko-m/vim-test'

Plug 'rizzatti/dash.vim'

" prabirshrestha
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'

" Toomey other
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'

" Tpope other
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shell interop
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'mattboehm/vim-unstack'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
Plug 'moll/vim-node'

" Misc Langs
Plug 'elmcast/elm-vim', { 'for': ['elm'] }
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'tsx'] }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'tpope/vim-classpath', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'markwoodhall/vim-sayid', { 'for': ['clojure', 'clojurescript'] }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'eraserhd/parinfer-rust', { 'for': ['clojure', 'clojurescript'], 'do': 'cargo build --release' }

" Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change leader and change space to prior leader functionality
let mapleader = ","
nnoremap <space> ,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start-of-line only cabbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" example use: call SetupCommandAlias("pg", "postgres://")
function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source my customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '$HOME/dotfiles/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction
call s:SourceConfigFilesIn('rcconfigurations')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VersionedPluginBuilds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SavePlugSnapshot()
  execute "PlugSnapshot! " . "$HOME/.vim-plug-snapshots/" . strftime("%Y-%m-%d_%X") . ".vim"
endfunction
command! SavePlugSnapshot :call SavePlugSnapshot()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" repeat.vim code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
