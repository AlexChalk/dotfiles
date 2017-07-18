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

# Needed for Z installataion.
. `brew --prefix`/etc/profile.d/z.sh

plugins=()

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Added by travis gem
[ -f /Users/adc/.travis/travis.sh ] && source /Users/adc/.travis/travis.sh

# User configuration
for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
