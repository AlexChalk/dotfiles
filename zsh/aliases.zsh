# Personal Aliases
# For a full list of active aliases, run `alias`.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias karma="./node_modules/karma/bin/karma"
alias nightwatch="./node_modules/.bin/nightwatch"
alias magit="emacs -q -l ~/dotfiles/emacs.d/magit-init.el"
alias tree='tree -C -I "*~|*#|node_modules|sprockets"'
alias chrome='open -a "Google Chrome"'
alias c='clear'
alias eslint-quick-init="cp ~/dotfiles/eslintrc.js ./.eslintrc.js && yarn add --dev eslint@latest eslint-plugin-react@latest"
alias brewup="brew update && brew upgrade && brew cleanup"
# You need to update your ag configs in ctrlp.vim and ack.vim if this changes
alias ag='ag --path-to-ignore ~/.ignore'
alias gh='hub'
