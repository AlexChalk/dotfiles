-----------------------------------------------------
-- Go
-----------------------------------------------------
vim.bo.expandtab = false
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>sir', '($v%J%ds(0i:<esc>V<leader>sr3u', { noremap = false })
