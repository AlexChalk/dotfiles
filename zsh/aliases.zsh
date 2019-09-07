# Personal Aliases
# For a full list of active aliases, run `alias`.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias nightwatch="./node_modules/.bin/nightwatch"
alias magit="emacs -q -l $HOME/dotfiles/emacs.d/magit-init.el"
alias tree='tree -C -I "*~|*#|node_modules|sprockets"'
alias brave='open -a "Brave Browser"'
alias c='clear'
alias brewup="brew update && brew upgrade && brew cleanup"
alias gh='hub'
alias rga='rg --no-ignore --hidden --glob "!.git/*"'
alias unix-linebreaks="vim -u NONE -c 'e ++ff=dos' -c 'w ++ff=unix' -c q"
alias hjoin="heroku apps -t busbud | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app you want to join' | xargs heroku join -a"
alias hname="heroku apps --all | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app whose name you want to copy' | tr -d '\n' | pbcopy"
alias nuse="n \$(cat .nvmrc)"
alias jsconfinit='cp $HOME/dotfiles/default.jsconfig.json jsconfig.json'
alias nostack='source $HOME/dotfiles/bin/nostack'
alias pyinit='eval "$(pyenv init -)"'
alias k='kubectl'
alias intwt='git intwt | pbcopy && cd $(pbpaste)'

