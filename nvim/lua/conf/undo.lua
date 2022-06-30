-----------------------------------------------------
-- Undo
-----------------------------------------------------
local opt = vim.opt
local home = os.getenv("HOME")

opt.undofile = true
opt.undodir = home .. "/.vim/undo"
opt.undolevels = 1000
opt.undoreload = 10000

local notempundofile = vim.api.nvim_create_augroup(
  "notempundofile",
  { clear = true }
)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "/tmp/*" },
  command = "setlocal noundofile",
  group = notempundofile,
})
