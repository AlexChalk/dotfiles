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

-- Convert in 0.7 when lua functions can be passed to vim variables
-- https://github.com/nanotee/nvim-lua-guide#conversion-is-not-always-possible
-- vim.cmd([[
--   function! TypeScriptTransform(cmd) abort
--     return substitute(a:cmd, '\v(.*)mocha', 'TS_NODE_FILES=true ts-mocha', '')
--   endfunction

--   let g:test#custom_transformations = {'mocha': function('TypeScriptTransform')}
--   let g:test#transformation = 'mocha'
-- ]])
