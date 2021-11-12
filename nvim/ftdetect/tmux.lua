-- PR for native lua: https://github.com/neovim/neovim/pull/14661
vim.cmd("au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux")
