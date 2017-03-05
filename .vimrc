set nocompatible  " Use vim-mode, no vi mode. Should be first command.

execute pathogen#infect()

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
set number

"Tabs and wrapping
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

"Colours
syntax enable             " enable syntax highlighting (previously syntax on).

"Use system clipboard (no * or + necessary to copy out of/paste into vim).
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
