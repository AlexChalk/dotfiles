-----------------------------------------------------
-- Display
-----------------------------------------------------
local opt = vim.opt
opt.ruler = true -- show the cursor position all the time
opt.incsearch = true -- do incremental searching
opt.number = true -- set numbers behaviour
opt.relativenumber = true -- set numbers behaviour

opt.inccommand = "nosplit" -- show results of command incrementally
opt.textwidth = 85 -- Make it obvious where
opt.colorcolumn = "+1" -- 85 characters is
opt.splitbelow = true -- set default :sp position
opt.splitright = true -- set default :vsp position
opt.cursorline = true

function ToggleTextWidth()
  if vim.o.textwidth == 0 then
    opt.textwidth = 85
  else
    opt.textwidth = 0
  end
end

-- PR for native lua: https://github.com/neovim/neovim/pull/11613
vim.cmd("command! ToggleTextWidth lua ToggleTextWidth()")
