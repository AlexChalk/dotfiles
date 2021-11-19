vim.g.elm_format_autosave = false
vim.g.elm_setup_keybindings = false

vim.api.nvim_buf_set_keymap(0, "", "K", ":ElmShowDocs<cr>", { noremap = false })
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>sbr",
  [[vipk<C-v>$A<space>\<esc>vip<leader>sru]],
  { noremap = false }
)

vim.api.nvim_set_keymap("n", "p", "p", { noremap = true })
vim.api.nvim_set_keymap("n", "P", "P", { noremap = true })
