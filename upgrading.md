# Upgrade Process

## Non-coding
1. Save important files:
  * Any fonts you want to keep from fontbook.
  * Excel scripts: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Queries
  * Word config: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized
  * Copy them all back
2. Make a copy of your entire home directory
  * Copy back the files you need onto new system
3. Go through applications folder and note everything you'd like to keep
  * On new machine, install from (order of preference) brew cask, app store, company site
4. Bookmarks/history
  * Export from all browsers (just in case);
5. Microsoft Office
  * Login at office.com/myaccount and redownload

## Fundamentals
1. First things first:
  * `xcode-select --install`
2. Get Homebrew back:
  * Follow instructions here: https://brew.sh/
3. Heroku
  * Good instructions at these two addresses: https://devcenter.heroku.com/articles/authentication, https://devcenter.heroku.com/articles/heroku-cli
4. ssh-agent configuration:
  * Good instructions can be found here: https://help.github.com/articles/connecting-to-github-with-ssh/
5. Don't forget your env variables:
  * Make a copy of `.zshenv`

## Brew and languages
1. Homebrew:
  * Make a note of what you're autostarting with `brew services list`
  * Do a brew bundle dump of your brew leaves and brew cask list. Check brew list as well (e.g. for git)
  * Then add back packages you want on new machine and `brew services start` as appropriate.
  * Keep leaves/cask backup from previous system. If you want to keep a new backup, maintain it alongside the old one.
  * If anything has stopped working, installing things from your old brew leaves backups is the first thing to try
2. Node:
  * Install n using n-install: https://github.com/mklement0/n-install 
  * Find globally installed packages you want to keep: npm list -g --depth=0
  * If eslint acts weird, install it globally in brew's node
3. Ruby:
  * Follow instructions at https://medium.com/@adc17/use-rbenv-for-cleaner-rspec-stack-traces-4e5ce2ff5cd0
  * Don't forget `gem install rubocop`
4. Clojure/Cljs:
  * brew install leiningen
  * The first time you run `lein`, install the latest jdk if prompted (consider using brew cask)
  * For cljs: lein new figwheel 
5. Python:
  * brew install python && brew install python3
  * pip3 install virtualenv

## Tools
1. Neovim:
  * Recreate symlinks as organized in `config` and `vim` (you don't need to symlink `rcconfigurations`)
  * Follow instructions here: https://github.com/junegunn/vim-plug
  * Run `:CheckHealth` and follow instructions
  * For nvim-parinfer follow instructions here: https://github.com/clojure-vim/nvim-parinfer.js
  * Also check out info here: https://github.com/clojure-vim/nvim-parinfer.js/issues/32
2. zsh:
  * Follow instructions here: https://github.com/zplug/zplug
  * Set shell: Préférences Système > Users and Groups > Unlock > Right Click on Picture > Advanced options
  * Open shell, zplug install, restart shell
  * If theme doesn't download, clone it manually into `~/.zplug/repos/adc17/`
3. Other dotfiles:
  * Organization of repo correctly describes where symlinks should go
  * If you want to use emacs, use real `.emacs.d` directory and add symlinks to `init.el` file and `lisp` dir.
4. iTerm2:
  * Color scheme: https://github.com/herrbischoff/iterm2-gruvbox
  * I don't know how to export settings, so just screenshot everything :(

## Misc
1. /etc/hosts
  * Note any adjustments made and replicate them
2. Work dir:
  * Copy as-is or at least copy back non-github files
3. Redis
  * Check which version you're using
  * Download from homebrew, or good installation instructions here for manual compile: https://medium.com/@stockholmux/setting-up-redis-on-macos-sierra-5cd795e1644d
  * conf to copy is here: /Users/adc/.redis/redis.conf
4. nginx
  * Copy config file at `/usr/local/etc/nginx/nginx.conf`
  * Symlink to infra/conf/local/default.conf at `conf.d/default.conf` inside `/usr/local/etc/nginx`
  * `sudo brew services start nginx`
5. mongodb
  * `. ./scripts/local/restore-from-staging`
6. Nightwatch
  * Good info at `msn-lives-again` repo and here: https://github.com/dwyl/learn-nightwatch 
