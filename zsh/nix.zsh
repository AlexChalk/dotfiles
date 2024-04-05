nix() {
  if [[ "$1" == "shell" ]]; then
    shift
    USE_NIX_SHELL_PROMPT=true command nix shell "$@"
  else
    command nix "$@"
  fi
}
