# Not all terminal emulators seem to add this—uncomment if needed.
# export PATH="$PATH:/usr/local/bin"
# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$HOME/bin-personal"
# Add haskell packages to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add gnu-sed as 'sed' to PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# Add rust to PATH
export PATH="$HOME/.cargo/bin:$PATH"
# Add ruby to PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
# Add go to PATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# Add n (nvm alternative) to PATH
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

export LANG="en_CA.UTF-8"
export LC_ALL="en_CA.UTF-8"


# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# use <c-s> in all applications
stty -ixon

# Needed for Z installation.
. `brew --prefix`/etc/profile.d/z.sh

# Source fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

setopt prompt_subst

[ -f $HOME/.zsh_plugins.sh ] && source $HOME/.zsh_plugins.sh

source $HOME/dotfiles/compinit.zsh

# User configuration
for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
