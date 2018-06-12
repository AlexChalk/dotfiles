# Dotfiles

The dotfiles for my macOS unix environment.

Vim, git, zsh, and tmux are the main tools I use. I have [zplug][] to manage zsh plugins and [vim-plug][] to manage vim plugins. [ag][] is my searcher of choice.

[vim-plug]: https://github.com/junegunn/vim-plug.
[zplug]: https://github.com/zplug/zplug
[ag]: https://github.com/ggreer/the_silver_searcher

### Dependencies

* tmux.conf: reattach-to-user-namespace, on homebrew. 
* zshrc: zplug, https://github.com/zplug/zplug
* vim prettifiers: https://github.com/tdewolff/minify/tree/master/cmd/minify

### Sources of Inspiration

* Upcase: tutorials by Thoughtbot—I learnt a lot from the Git, Tmux, and Vim tracks. If you use [this link](http://ssqt.co/m5c5igy) when you sign up, we both get a month's subscription half-price. 
* Chris Toomey: the most prolific instructor on Upcase—I often grab things from his dotfiles, which are [here](https://github.com/christoomey/dotfiles/).
* Oh My Zsh: although I no longer use it, I take things from it when I miss one of its features—check out the repo [here](https://github.com/robbyrussell/oh-my-zsh).

### Putting your dotfiles on github.

This excellent article [here](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) covers all the reasons I decided to upload my dotfiles to github. It also explains how you can do it too.
