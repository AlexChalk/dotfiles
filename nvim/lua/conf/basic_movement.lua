-- Move up and down by visible lines if current line is wrapped
-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })

vim.opt.startofline = false
vim.api.nvim_set_keymap("n", "<M-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true })
