-----------------------------------------------------
-- Tex
-----------------------------------------------------
vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true })
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>pz",
  "<cmd>Telescope bibtex format_string=%s<cr>",
  { noremap = true }
)
vim.api.nvim_buf_set_keymap(
  0,
  "s",
  "<leader>pz",
  "<cmd>Telescope bibtex format_string=%s<cr>",
  { noremap = true }
)
vim.api.nvim_buf_set_keymap(
  0,
  "x",
  "<leader>pz",
  "<cmd>Telescope bibtex format_string=%s<cr>",
  { noremap = true }
)
