nix() {
  if [[ "$1" == "shell" ]]; then
    shift
    CONFIG_SHELL=true command nix shell "$@"
  else
    command nix "$@"
  fi
}
