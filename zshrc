# Not all terminal emulators seem to add this—uncomment if needed.
# export PATH="$PATH:/usr/local/bin"
# Add personal scripts to PATH
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/bin-personal:$PATH"

if [[ "$OSTYPE" == darwin* ]]; then
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


  export HOMEBREW_NO_INSTALL_CLEANUP="true"
  export NIX_CHANNEL="nixos-19.03"
  export NIX_REMOTE_SYSTEMS="/etc/nix/machines"
  export MY_MACHINE="macos"
fi

if [[ "$OSTYPE" != darwin* && -d "$HOME/.config/yarn/global/node_modules/.bin" ]]; then
  export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
fi

if [[ "$OSTYPE" != darwin* ]]; then
  export XDG_CURRENT_DESKTOP="Unity"
  export MY_MACHINE="nixos"
fi

export EDITOR="nvim"
bindkey -e
export LANG="en_CA.UTF-8"
export LC_ALL="en_CA.UTF-8"

# fzf for nixos
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

# fzf for others
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Nix package manager
if [[ -e $HOME/.nix-profile/etc/profile.d/nix.sh && -z $CONFIG_SHELL ]]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# use <c-s> in all applications
stty -ixon

### Added by Zinit's installer: https://github.com/zdharma/zinit
# Check back for rollback feature: https://github.com/zdharma/zinit/issues/135#issuecomment-497585546
# Update plugins: `zinit update --all`; update and compile zinit: `zinit self-update`.
source $HOME/.zinit/bin/zinit.zsh

# Theme (don't lazy load prompt as we want it from start)
# setopt promptsubst
# zinit light AlexChalk/pure-red-stars
if [[ -n $CONFIG_SHELL ]]; then
    nix_shell="nix-shell"
else
    nix_shell=""
fi

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'; 
zinit light sindresorhus/pure
PROMPT='%F{magenta}$nix_shell% %(?.%F{blue}.%F{yellow})❯% %(?.%F{yellow}.%F{magenta})❯%(?.%F{green}.%F{red})❯%f '
PURE_CMD_MAX_EXEC_TIME=3600

zinit ice wait"0" lucid blockf
zinit snippet OMZ::lib/theme-and-appearance.zsh

# Z
zinit ice wait"0" lucid blockf
zinit light agkozak/zsh-z

# Completion
zinit ice wait"0" lucid blockf
zinit snippet OMZ::lib/completion.zsh
zinit ice wait"0" lucid blockf
zinit light zsh-users/zsh-completions

# n.b. this will be cached and require deleting if there are changes
zinit ice wait"0" lucid blockf
zinit snippet $HOME/dotfiles/zsh-completions-personal.zsh

# Syntax highlighting
zinit ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zinit light zsh-users/zsh-syntax-highlighting

for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
