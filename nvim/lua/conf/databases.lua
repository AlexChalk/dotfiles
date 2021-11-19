-----------------------------------------------------
-- Databases
-----------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>sdb", "vip:DB<CR>", { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>sdb", ":DB<CR>", { noremap = false })

SetupCommandAlias("pg", "DB w:db = postgres://")
