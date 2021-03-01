# Upgrade Process

## Before you begin
1. Mac system settings:
  - Note customizations in Finder > Preferences, and Finder > Presentation.
  - System Preferences > Keyboard
2. Misc:
  - Make a note of everything you want to keep in applications folder.
  - `brew bundle dump`
  - Copy `.zshenv` and `.zsh_history`.
  - Note Arq backup config.

## Initial Upgrade Process:
1. MacOS system settings:
  - Dock position/behaviour.
  - Computer name in "Sharing".
  - Airplay settings in "Monitors".
  - Finder: Finder > Preferences (general, tags, sidebar), Finder > (right click in white space) > show view options for default behaviour.
  - Keyboard: modifiers, repetitions, text, shortcuts (launchpad, screenshots, spotlight), input sources.
  - Automator -> quick action, start screensaver, save as 'start screen saver', shortcuts -> services -> start screen saver.
  - Trackpad point and click.
2. Apps
  - Put them back—only fancy case is arq, for which instructions are [here](https://www.arqbackup.com/documentation/pages/recovering.html). 
  - Click restore once you've added the account.
  - Settings are saved with backup, you only need to note the general advanced preferences.
3. Firefox
  - Customize
  - Extensions, themes
  - Search
4. zshenv
  - `source $HOME/dotfiles/zsh/aliases.zsh`

## Misc
- Adguard: add ###hot-network-questions as a user filter rule.
- Remember to improve this guide as you perform your next upgrade.
