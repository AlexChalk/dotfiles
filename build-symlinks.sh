cd $HOME
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/ignore .ignore
ln -s dotfiles/ignore .fdignore
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/rubocop.yml .rubocop.yml
mkdir .lein
ln -s dotfiles/lein/profiles.clj .lein/profiles.clj
mkdir -p .config/nvim
ln -s dotfiles/nvim/init.vim .config/nvim/init.vim
mkdir .config/nvim/Ultisnips
mkdir .config/nvim/ftdetect
ln -s dotfiles/nvim/ftdetect/* .config/nvim/ftdetect
ln -s dotfiles/nvim/Ultisnips/javascript.snippets .config/nvim/Ultisnips
ln -s dotfiles/nvim/Ultisnips/javascript.snippets .config/nvim/Ultisnips/typescript.snippets
