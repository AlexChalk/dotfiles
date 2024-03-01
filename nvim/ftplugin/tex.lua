-----------------------------------------------------
-- Tex
-----------------------------------------------------
vim.keymap.set(
  { "n", "s", "x" },
  "<leader>pz",
  "<cmd>Telescope bibtex format_string=%s<cr>",
  {}
)

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
