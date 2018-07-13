# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$HOME/bin-personal"
# Add rust to PATH
export PATH="$HOME/.cargo/bin:$PATH"
# Add n (nvm alternative) to PATH
export N_PREFIX="$HOME/n" # Added by n-install (see http://git.io/n-install-repo).
export PATH="$N_PREFIX/bin:$PATH"
# Add go to PATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Add rbenv init command
eval "$(rbenv init -)"

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# use <c-s> in all applications
stty -ixon

# Needed for Z installation.
. `brew --prefix`/etc/profile.d/z.sh

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Remember to run zplug update every once in a while
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "adc17/pure-red-stars", as:theme

zplug load

# User configuration
for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
