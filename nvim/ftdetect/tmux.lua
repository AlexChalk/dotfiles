-- PR for native lua: https://github.com/neovim/neovim/pull/12378
vim.cmd("au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux")
