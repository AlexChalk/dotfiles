# Dotfiles

The dotfiles for my macOS unix environment.

Vim, git, zsh, and tmux are the main tools I use. I have [zplugin][] to manage zsh plugins and [vim-plug][] to manage vim plugins. [ripgrep][] and [fd][] are my searchers of choice.

[zplugin]: https://github.com/zdharma/zplugin
[vim-plug]: https://github.com/junegunn/vim-plug
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd

### Sources of Inspiration

* Upcase: tutorials by Thoughtbot—I learnt a lot from the Git, Tmux, and Vim tracks. If you use [this link](http://ssqt.co/m5c5igy) when you sign up, we both get a month's subscription half-price. 
* Chris Toomey: the most prolific instructor on Upcase—I often grab things from his dotfiles, which are [here](https://github.com/christoomey/dotfiles/).
* Oh My Zsh: although I no longer use it, I take things from it when I miss one of its features—check out the repo [here](https://github.com/robbyrussell/oh-my-zsh).

### Putting your dotfiles on github.

This excellent article [here](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) covers all the reasons I decided to upload my dotfiles to github. It also explains how you can do it too.


## Notes to self

## Nix(os)

No great need for nix-darwin on macos.

### Versioning nixos

- System upgrade: sudo nixos-rebuild switch
- System rollback: sudo nixos-rebuild switch --rollback
- User upgrade: 
- User rollback: nix-env --rollback
- Garbage collect everything (sudo to include system builds): nix-collect-garbage -d/--delete-older-than 

- Autoclear to 1gb when less than 100mb space remaining (pi):
nix.extraOptions = ''
  min-free = ${toString (100 * 1024 * 1024)}
  max-free = ${toString (1024 * 1024 * 1024)}
'';

Note: tmux paste-buffer shortcut for server is (c-s ]).

## Versioning vim plugins

Run `SavePlugSnapshot` before your run `PlugUpdate`; it will save a `.vim` file that
you can source to revert your changes.

Versioning vim-plug: this isn't really necessary, as you should only upgrade if it's
broken anyway (new features aren't added), but you can do so here if you really want
to: `https://github.com/junegunn/vim-plug/wiki/faq#shouldnt-vim-plug-update-itself-on-plugupdate-like-vundle`

## Versioning zsh plugins

Not supported right now by zplugin; but they have plans to add it, so wait.
Versioning zplugin: again, wait, hopefully their plans include that too.

## Browser

Use firefox sync.
