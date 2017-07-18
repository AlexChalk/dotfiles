# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/bin"

# Add n (nvm alternative) to PATH
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Path to your oh-my-zsh installation.
export ZSH=/Users/adc/.oh-my-zsh

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Theme
ZSH_THEME="pure-red-stars"

# setopt nolistbeep

# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# Needed for Z installataion.
. `brew --prefix`/etc/profile.d/z.sh

plugins=()

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Added by travis gem
[ -f /Users/adc/.travis/travis.sh ] && source /Users/adc/.travis/travis.sh

# User configuration
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

# Personal Aliases
# For a full list of active aliases, run `alias`.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias magit="emacs -q -l ~/dotfiles/emacs.d/magit-init.el"
alias tree='tree -C -I "*~|*#|node_modules|sprockets"'
alias chrome='open -a "Google Chrome"'
alias wdio='./node_modules/.bin/wdio wdio.conf.js'
