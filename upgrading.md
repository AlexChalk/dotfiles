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
  * Finder: Finder > Preferences, Finder > Presentation, Finder > cmd+j for default behaviour.
  * Keyboard: caps, repetitions, text, shortcuts.
  * Mouse tap.
2. Terminal
  * Run `core-install` selectively (delete lines as appropriate)
  * Run `build-symlinks`.
  * Set shell: Préférences Système > Users and Groups > Unlock > Right Click on Picture > Advanced options > `/usr/local/bin/zsh`.
  * Restart shell, run `python-setup`,  `node-setup`, `ruby-setup`, `wm-install`, and anything missing from `core-install`.
  * Open neovim, run `:CheckHealth` and follow any instructions.
  * If you want to use emacs, create real `.emacs.d` directory in `$HOME` and add symlinks to `init.el` file and `lisp` dir from dotfiles.
3. Apps
  * Put them back—only fancy case is arq, for which instructions are [here](https://www.arqbackup.com/documentation/pages/recovering.html). 
  * Click restore once you've added the account.
  * Settings are saved with backup, you only need to note the general advanced preferences.

## Misc
* Put back your system fonts.
* Adguard: add ###hot-network-questions as a user filter rule.
* Remember to improve this guide as you perform your next upgrade.
