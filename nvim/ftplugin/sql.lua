-----------------------------------------------------
-- Sql
-----------------------------------------------------
vim.api.nvim_buf_set_keymap(
  0,
  "",
  "<Leader>fs",
  ":!sql-formatter -u -o % %<CR>",
  { noremap = false }
)
