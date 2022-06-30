----------------------------------------------------------------
-- Vim-test setup
----------------------------------------------------------------

vim.g["test#strategy"] = "vtr"
vim.g["test#javascript#mocha#file_pattern"] = [[\vtests?/.*.(ts|tsx|js|jsx|coffee)$]]
vim.g["test#python#runner"] = "pytest"

vim.api.nvim_set_keymap("n", "<leader>rta", ":TestNearest<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>rtf", ":TestFile<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>rts", ":TestSuite<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>rtr", ":TestLast<CR>", { noremap = false })

-- local function TypeScriptTransform(cmd)
--   return vim.fn.substitute(cmd, [[\v(.*)mocha]], "TS_NODE_FILES=true ts-mocha", "")
-- end
-- vim.g["test#custom_transformations"] = { mocha = TypeScriptTransform }
-- vim.g["test#transformation"] = "mocha"
