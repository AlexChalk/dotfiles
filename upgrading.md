# Upgrade Process

## Before you begin
1. Backups:
  * Excel scripts: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Queries
  * Word template: /Users/adc/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized
  * Above paths only work from CLI
  * Super duper clone
  * Copy of select files from home directory.
2. Homebrew:
  * Note everything you want to keep.
  * Also do a `brew bundle dump`—if something isn't working on your new machine, the bundle dump will give you a good idea of what might be missing.
  * (if it's a work computer, run bundle install to get everything back as you had it once your symlinks are built.)
  * (If it's a work computer, rsync across your git dir.)
3. Node:
  * Find globally installed packages you want to keep: `npm list -g --depth=0`.
4. Mac system settings:
* Note customizations in Finder > Preferences, and Finder > Presentation.
  * System Preferences > Keyboard—take screenshot of settings.
5. Misc:
  * Make a note of everything you want to keep in applications folder.
  * Copy any fonts you want to keep from fontbook.
  * Copy `.zshenv` and `.zsh_history`.
  * Note Arq backup config.

## Initial Upgrade Process:
1. MacOS system settings:
  * Dock position/behaviour.
  * Computer name in "Sharing".
  * Airplay settings in "Monitors".
  * Finder: Finder > Preferences (general, tags, sidebar), Finder > Presentation for default behaviour.
  * Keyboard: modifiers, repetitions, text, shortcuts (launchpad, screenshots, spotlight), input sources.
  * Automator -> screensaver, save as 'start screen saver', shortcuts -> services -> start screen saver.
  * Trackpad point and click.
2. Core utils (included in core-install)
  * xcode-select --install
  * curl to install brew
3. Terminal
  * Run `core-install` selectively (delete lines as appropriate)
  * Run `build-symlinks`.
  * Set shell: Préférences Système > Users and Groups > Unlock > Right Click on Picture > Advanced options > `/usr/local/bin/zsh`.
  * Restart shell, run `python-setup`,  `node-setup`, `ruby-setup`, `wm-install`, and anything missing from `core-install`.
  * Open neovim, run `:CheckHealth` and follow any instructions.
  * If you want to use emacs, create real `.emacs.d` directory in `$HOME` and add symlinks to `init.el` file and `lisp` dir from dotfiles.
4. Apps
  * Put them back—only fancy case is arq, for which instructions are [here](https://www.arqbackup.com/documentation/pages/recovering.html). 
  * Click restore once you've added the account.
  * Settings are saved with backup, you only need to note the general advanced preferences.
5. Firefox
  * Customize
  * Extensions, themes
  * Search

## Misc
* Put back your system fonts.
* Adguard: add ###hot-network-questions as a user filter rule.
* Remember to improve this guide as you perform your next upgrade.
