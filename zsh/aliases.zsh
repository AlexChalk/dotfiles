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
