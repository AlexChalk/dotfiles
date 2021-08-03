-----------------------------------------------------
-- Undo
-----------------------------------------------------
local opt = vim.opt

opt.undofile = true
opt.undodir = '~/.vim/undo'
opt.undolevels = 1000
opt.undoreload = 10000

-- Because undo is persistent, we don't need tmp as well
-- PR for native lua: https://github.com/neovim/neovim/pull/12378
vim.cmd([[
  augroup notempundofile
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
  augroup END
]])
