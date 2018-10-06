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
# Add haskell packages to PATH
export PATH="$HOME/.local/bin:$PATH"

export LC_ALL="en_US.UTF-8"

# Run `rbenvinit` before doing any ruby coding
rbenvinit() {
  eval "$(command rbenv init -)"
}

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# use <c-s> in all applications
stty -ixon

# Needed for Z installation.
. `brew --prefix`/etc/profile.d/z.sh

# Source fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

setopt prompt_subst

source $HOME/.zsh_plugins.sh
autoload -Uz compinit

if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# User configuration
for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
