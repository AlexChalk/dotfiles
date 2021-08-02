-------------------------------------------------
-- Tabs and wrapping
-------------------------------------------------
local opt = vim.opt

opt.autoindent = true       -- auto-indent
opt.tabstop = 2             -- tab equals two columns of space
opt.softtabstop = 0         -- used when shiftwidth=0
opt.shiftwidth = 2          -- indent of 2 columns
opt.shiftround = true       -- always indent to the nearest tabstop
opt.expandtab = true        -- use spaces instead of tabs
opt.wrap = true             -- wrap text

-- Replace carriage return characters with real linebreaks
-- %s/\\n/\r/g
