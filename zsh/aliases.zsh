# Personal Aliases
# For a full list of active aliases, run `alias`.
alias tree='tree -C -I "*~|*#|node_modules|sprockets"'
alias c='clear'
alias brewup="brew update && brew upgrade && brew cleanup"
alias rga='rg --no-ignore --hidden --glob "!.git/*"'
alias unix-linebreaks="vim -u NONE -c 'e ++ff=dos' -c 'w ++ff=unix' -c q"
alias hjoin="heroku apps -t busbud | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app you want to join' | xargs heroku join -a"
alias hname="heroku apps --all | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app whose name you want to copy' | tr -d '\n' | pbcopy"
alias nuse="n \$(cat .nvmrc)"
alias nostack='source $HOME/dotfiles/bin/nostack'
alias pyinit='eval "$(pyenv init -)"'
alias k='kubectl'
alias intwt='git intwt | pbcopy && cd $(pbpaste)'
alias vim='nvim'
alias wl-paste-tr='wl-paste | tr -d "\r"'
alias yuse='yarn policies set-version $(jq .engines.yarn package.json | tr -d '"'"'"'"'"')'
alias lock='swaylock -f -c 000000'
alias vimpair="vim -c 'set nornu'"
alias gh='GITHUB_TOKEN= gh'
alias clam_on='swaymsg output eDP-1 disable'
alias clam_off='swaymsg output eDP-1 enable'
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias nethogs="sudo nethogs"
alias jdtls="jdt-language-server"
alias standby="systemctl suspend"
alias realsize="du -h -d 0"
