-----------------------------------------------------
-- Quickfix
-----------------------------------------------------
-- q close binding
vim.api.nvim_buf_set_keymap(0, "n", "q", ":ccl<CR>", { noremap = true })
