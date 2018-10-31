# Personal Aliases
# For a full list of active aliases, run `alias`.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias nightwatch="./node_modules/.bin/nightwatch"
alias magit="emacs -q -l $HOME/dotfiles/emacs.d/magit-init.el"
alias tree='tree -C -I "*~|*#|node_modules|sprockets"'
alias chrome='open -a "Google Chrome"'
alias c='clear'
alias brewup="brew update && brew upgrade && brew cleanup"
alias gh='hub'
alias rga='rg --no-ignore --hidden --glob "!.git/*"'
alias unix-linebreaks="vim -u NONE -c 'e ++ff=dos' -c 'w ++ff=unix' -c q"
alias hjoin="heroku apps -t busbud | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app you want to join' | xargs heroku join -a"
alias hlogs="heroku apps --all | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app whose logs you want to tail' | xargs heroku logs -t -a"
alias hname="heroku apps --all | tail -n+2 | grep . | sed 's/ .*$//' | fzf --header='Select the app whose name you want to copy' | tr -d '\n' | pbcopy"
alias nuse="n \$(cat .nvmrc)"
alias antibodyupdate='antibody bundle < $HOME/dotfiles/zsh_plugins.txt | sed -e "s:$HOME:\$HOME:g" > $HOME/.zsh_plugins.sh && antibody update'
# alias ghc="stack ghc"
# alias ghci="stack ghci"
# alias runghc="stack runghc"
