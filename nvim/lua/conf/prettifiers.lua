-----------------------------------------------------
-- Prettifiers
-----------------------------------------------------

-- Might be able to remove these now with null-ls:
-- nvim/lua/lsp_setup/null_ls.lua
SetupCommandAlias("PrettyJson", "%!jq .")
SetupCommandAlias("MinifyJson", "%!jq -c .")
SetupCommandAlias("PrettyXml", "%!xq .")
SetupCommandAlias("MinifyXml", "%!minify --type=xml")

vim.api.nvim_set_keymap("n", "<leader>fj", ":PrettyJson<CR>", { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>fj", ":PrettyJson<CR>", { noremap = false })
vim.api.nvim_set_keymap("x", "<leader>fj", ":PrettyJson<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>mj", ":MinifyJson<cr>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>fx", ":PrettyXml<cr>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>mx", ":MinifyXml<cr>", { noremap = false })
