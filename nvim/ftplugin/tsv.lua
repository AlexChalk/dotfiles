-----------------------------------------------------
-- Tsv
-----------------------------------------------------
vim.bo.expandtab = false
vim.bo.tabstop = 16
vim.api.nvim_buf_set_keymap(0, 'i', '<TAB>', '"\\<TAB>"', { noremap = true, silent = true, expr = true })
