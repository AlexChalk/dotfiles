-----------------------------------------------------
-- Tex
-----------------------------------------------------
vim.keymap.set(
  { "n", "s", "x" },
  "<leader>pz",
  "<cmd>Telescope bibtex format_string=%s<cr>",
  { buffer = 0 }
)
vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true })
