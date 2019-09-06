# Complete g like git
compdef g=git

if [ -x "$(command -v kubectl)" ]; then 
  source <(kubectl completion zsh)
  compdef k=kubectl
fi
