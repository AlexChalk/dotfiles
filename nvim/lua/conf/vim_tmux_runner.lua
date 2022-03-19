------------------------------------------------------------
-- Vim-Tmux-Runner
------------------------------------------------------------

vim.g.VtrStripLeadingWhitespace = 0
vim.g.VtrClearEmptyLines = 0
vim.g.VtrPercentage = 20
vim.g.VtrOrientation = "v"

-- C-\ to unfocus
vim.api.nvim_set_keymap("", "<leader>st", ":VtrFocusRunner<CR>", { noremap = false })
vim.api.nvim_set_keymap("", "<leader>qt", ":VtrKillRunner<CR>", { noremap = false })

vim.api.nvim_set_keymap(
  "n",
  "<leader>ar",
  ":VtrAttachToPane<CR>",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sr",
  ":VtrSendLinesToRunner<CR>",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>sr",
  ":VtrSendLinesToRunner<CR>",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>scr",
  ":VtrSendCommandToRunner<CR>",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ccr",
  ":VtrFlushCommand<CR>",
  { noremap = false }
)

vim.api.nvim_set_keymap("n", "<leader>sbr", "vip<leader>sr", { noremap = false })
