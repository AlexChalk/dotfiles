# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/bin"
# Add n (nvm alternative) to PATH
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# use <c-s> in all applications
stty -ixon

# Needed for Z installataion.
. `brew --prefix`/etc/profile.d/z.sh

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "adc17/pure-red-stars", as:theme
zplug load

# Added by travis gem
[ -f /Users/adc/.travis/travis.sh ] && source /Users/adc/.travis/travis.sh

# User configuration
for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
