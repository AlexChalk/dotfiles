-----------------------------------------------------
-- Swap files
-----------------------------------------------------
local opt = vim.opt
local home = os.getenv("HOME")

opt.backup = true
opt.swapfile = true
opt.backupdir = home .. "/.vim/tmp"
opt.directory = home .. "/.vim/tmp"
