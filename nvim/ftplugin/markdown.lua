local opt = vim.bo

opt.textwidth = 0
opt.shiftwidth = 2

vim.g.markdown_recommended_style = false

vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true })
