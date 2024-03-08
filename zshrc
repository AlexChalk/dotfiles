# Store original path to revert in certain double-path-setting scenarios
ORIGINAL_PATH=$PATH

# Not all terminal emulators seem to add this—uncomment if needed.
# export PATH="$PATH:/usr/local/bin"

# Add personal scripts to PATH
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/bin-personal:$PATH"

# Add tfswitch binaries to PATH
export PATH="$HOME/bin:$PATH"

# Add haskell and pipx packages to PATH
export PATH="$HOME/.local/bin:$PATH"

if [[ "$OSTYPE" == darwin* ]]; then
  # Source homebrew
  # eval $(/opt/homebrew/bin/brew shellenv) # (recommended)
  export PATH="/opt/homebrew/bin:$PATH" # (faster)
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
  export PATH="/usr/local/opt/openjdk/bin:$PATH"


  export HOMEBREW_NO_INSTALL_CLEANUP="true"
  export NIX_CHANNEL="nixos-21.11"
  export NIX_REMOTE_SYSTEMS="/etc/nix/machines"
  export MY_MACHINE="macos"

  export LANG="en_CA.UTF-8"
  export LC_ALL="en_CA.UTF-8"
fi

if [[ "$OSTYPE" != darwin* && -d "$HOME/.config/yarn/global/node_modules/.bin" ]]; then
  export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
fi

if [[ "$OSTYPE" != darwin* ]]; then
  export XDG_CURRENT_DESKTOP="Unity"
  export XDG_SESSION_DESKTOP="Unity"
  export MY_MACHINE="nixos"
fi

export EDITOR="nvim"
bindkey -e

# fzf for nixos
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

# fzf for others
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# # Leiningen ultra workaround
export LEIN_USE_BOOTCLASSPATH=no

# Nix package manager
if [[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# use <c-s> in all applications
stty -ixon

### Added by Zinit's installer: https://github.com/zdharma/zinit
# Check back for rollback feature: https://github.com/zdharma/zinit/issues/135#issuecomment-497585546
# Update plugins: `zinit update --all`; update and compile zinit: `zinit self-update`.
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

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
export CASE_SENSITIVE=false
zinit ice wait"0" lucid blockf
zinit snippet OMZ::lib/completion.zsh
zinit ice wait"0" lucid blockf
zinit light zsh-users/zsh-completions

# Nix shell
zinit ice wait"0" lucid blockf
zinit light chisui/zsh-nix-shell

# n.b. this will be cached and require deleting if there are changes
zinit ice wait"0" lucid blockf
zinit snippet $HOME/dotfiles/zsh-completions-personal.zsh

# Syntax highlighting
zinit ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zinit light zsh-users/zsh-syntax-highlighting

for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

if [[ -n $IN_NIX_SHELL ]]; then
  export PATH=${ORIGINAL_PATH}
fi

ensure_tmux_is_running
