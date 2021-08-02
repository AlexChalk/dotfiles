""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Top settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
" Remember to run :PlugUpdate (and :PlugUpgrade if on macOS) once in a while
" For versioning: :SavePlugSnapshot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.local/share/nvim/plugged')

" General
Plug 'dyng/ctrlsf.vim'

Plug 'chaoren/vim-wordmotion'
Plug 'tomtom/tcomment_vim'

Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'SirVer/ultisnips'

Plug 'machakann/vim-highlightedyank'

Plug 'janko-m/vim-test'

Plug 'prabirshrestha/async.vim'

Plug 'EinfachToll/DidYouMean'

Plug 'ap/vim-css-color' 

Plug 'thiagoalessio/rainbow_levels.vim'

" lsp
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}

" Toomey other
Plug 'christoomey/vim-sort-motion'

" Tpope other
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-abolish'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" Shell interop
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'mattboehm/vim-unstack'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'typescriptreact'] }
Plug 'moll/vim-node'

" FSharp
" Plug 'kongo2002/fsharp-vim'
Plug 'AlexChalk/fsharp-vim'

" Debugger
Plug 'puremourning/vimspector', { 'do' : 'nix-shell -p python37Packages.setuptools nodejs-10_x --run \"./install_gadget.py --enable-python --force-enable-node\"' }

" Misc Langs
Plug 'Zaptic/elm-vim', { 'for': ['elm'] }
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'tsx'] }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'tpope/vim-classpath', { 'for': ['clojure', 'clojurescript'] }
" Plug 'tpope/vim-salve', { 'for': ['clojure', 'clojurescript'] }
" Plug 'tpope/vim-projectionist', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'markwoodhall/vim-sayid', { 'for': ['clojure', 'clojurescript'] }
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'eraserhd/parinfer-rust', { 'for': ['clojure', 'clojurescript'], 'do': 'nix-shell --run \"cargo build --release\"' }

" Wiki
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'godlygeek/tabular'
Plug 'ledger/vim-ledger'

call plug#end()

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
" let g:fsharp#automatic_workspace_init = 0
" https://github.com/fsharp/FsAutoComplete/releases/latest/download/fsautocomplete.netcore.zip

let g:vimspector_enable_mappings = 'HUMAN'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change leader and change space to prior leader functionality
let mapleader = ","
let maplocalleader = ","
nnoremap <space> ,

" abolish calls it 'mixed', i prefer 'pascal'
nmap crp crm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start-of-line only cabbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" example use: call SetupCommandAlias("pg", "postgres://")
function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction

call SetupCommandAlias("reload", "!touch uwsgi.reload")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source my customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '$HOME/dotfiles/nvim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction
call s:SourceConfigFilesIn('rcconfigurations')

lua << EOF
function build_import(filename)
  lua_extension = filename:find("%.lua$")
  return 'conf/' .. filename:sub(1, lua_extension - 1)
end

for filename in io.popen('dir $HOME/.config/nvim/lua/conf'):lines() do
  require(build_import(filename))
end
EOF

" -- your lua code here
"   require("conf/" .. filename)

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
