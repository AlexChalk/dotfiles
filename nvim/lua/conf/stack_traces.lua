-----------------------------------------------------
-- Stack traces
-----------------------------------------------------

-- open file copied from stacktrace
vim.api.nvim_set_keymap(
  "n",
  "<leader>osf",
  ":UnstackFromClipboard<cr>",
  { noremap = false }
)

-- no highlighting of line—it already jumps there
-- vim.g.unstack_showsigns = 0
