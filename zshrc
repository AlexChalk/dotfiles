# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/custom-binaries"

# Add n (nvm alternative) to PATH
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Path to your oh-my-zsh installation.
export ZSH=/Users/adc/.oh-my-zsh

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Theme
ZSH_THEME="fishy"

# setopt nolistbeep

# Needed for Z installataion.
. `brew --prefix`/etc/profile.d/z.sh

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew osx)

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# added by travis gem
[ -f /Users/adc/.travis/travis.sh ] && source /Users/adc/.travis/travis.sh

# added by fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Personal Aliases
# For a full list of active aliases, run `alias`.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias tree='tree -I "*~|*#|node_modules|sprockets"'
alias chrome='open -a "Google Chrome"'
alias wdio='./node_modules/.bin/wdio wdio.conf.js'
