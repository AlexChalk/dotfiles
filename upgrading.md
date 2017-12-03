# Upgrade Process

## Before you begin
1. Office backups:
  * Excel scripts: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Queries
  * Word template: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized
  * Above paths only work from CLI
2. Homebrew:
  * Note everything you want to keep.
  * Also do a `brew bundle dump`—if something isn't working on your new machine, the bundle dump will give you a good idea of what might be missing.
3. Node:
  * Find globally installed packages you want to keep: `npm list -g --depth=0`.
4. Mac system settings:
  * Note customizations in Finder > Preferences, and Finder > Presentation.
  * System Preferences > Keyboard—take screenshot of settings.
5. iTerm settings:
  * Note changes to working_dir setting and profile settings: colors, window, font, left option key.
6. Misc:
  * Make a note of everything you want to keep in applications folder.
  * Copy any fonts you want to keep from fontbook.
  * Copy `.zshenv` and `.zsh_history`.
7. System backup, and copy of entire home directory.

## Initial Upgrade Process:
1. MacOS system settings:
  * Dock position/behaviour.
  * Computer name in "Sharing".
  * Airplay settings in "Monitors".
  * Finder: Finder > Preferences, Finder > Presentation, Finder > cmd+j for default behaviour.
  * Keyboard: caps, repetitions, text, shortcuts.
  * Mouse tap.
  * `touch ~/.hushlogin`.
2. Code fundamentals:
  * `xcode-select --install`
  * Get Homebrew back: https://brew.sh/
  * Heroku: https://devcenter.heroku.com/articles/heroku-cli
  * ssh-agent configuration: https://help.github.com/articles/connecting-to-github-with-ssh/
  * Put `.zshenv` (and `.zsh_history` if you want it) back.
3. Apps needed for config to work:
  * Install all your brew packages.
  * Install n using n-install: https://github.com/mklement0/n-install 
  * Python: `pip3 install virtualenv` && `pip3 install virtualenvwrapper`
  * Ruby: `rbenv init`  &&  `rbenv install *-ruby-version-*` && `rbenv global *-ruby-version-*` && `gem install bundler` && `gem install rubocop`
4. iTerm2:
  * Color scheme: https://github.com/herrbischoff/iterm2-gruvbox
5. Zplug:
  * Set shell: Préférences Système > Users and Groups > Unlock > Right Click on Picture > Advanced options > `/usr/local/bin/zsh`
  * Follow instructions here: https://github.com/zplug/zplug
  * Symlink to `zshrc` and `tmux.conf`, open shell, zplug install, restart shell
## Now that your configs will work:
1. Neovim:
  * Recreate symlinks at `~/.config/nvim` as organized in `nvim` (you don't need to symlink `rcconfigurations`).
  * VimPlug: https://github.com/junegunn/vim-plug
  * `:CheckHealth`—follow instructions
  * You'll probably need `pip2 install neovim` && `pip3 install neovim` && `gem install neovim`.
  * Nvim-parinfer: follow instructions here—https://github.com/clojure-vim/nvim-parinfer.js
  * Also check out info here: https://github.com/clojure-vim/nvim-parinfer.js/issues/32

2. Other dotfiles:
  * Organization of repo correctly describes where symlinks should go, (except for nvim). 
  * If you want to use emacs, use real `.emacs.d` directory and add symlinks to `init.el` file and `lisp` dir.

3. mongodb
  * `. ./scripts/local/restore-from-staging`

4. Redis
  * Good installation instructions here for manual compile: `https://medium.com/@stockholmux/setting-up-redis-on-macos-sierra-5cd795e1644d`

5. nginx

  * Put `127.0.0.1   local.roof.ai` under `127.0.0.1   localhost` in` /etc/hosts`.

  * Symlinks to config files at `/usr/local/etc/nginx/`

  * If you're using brew services, you need `sudo`.

  * Security certificate files go in `/usr/local/etc`: 

    ``````
    ~/ssl_creation  ❯ openssl req \
         -newkey rsa:2048 \
         -x509 \
         -nodes \
         -keyout localhost.key \
         -new \
         -out localhost.crt \
         -subj /CN=local.roof.ai \
         -reqexts SAN \
         -extensions SAN \
         -config <(cat /System/Library/OpenSSL/openssl.cnf \
             <(printf '[SAN]\nsubjectAltName=DNS:local.roof.ai')) \
         -sha256 \
         -days 3650
    ~/ssl_creation  ❯ mv localhost.key roof_ssl_certificate_key
    ~/ssl_creation  ❯ mv localhost.crt roof_ssl_certificate
    ``````

  * `localhost.crt` should also be stored in the "Trousseaux d'accès" as `local.roof.ai.cer`.

## Misc
* Put back your system fonts.
* Remember to improve this guide as you perform your next upgrade.