-- Autocorrect indentation after pasting, but keep non-indenting option
-- for when pasting large files from clipboard.
vim.api.nvim_set_keymap("n", "p", "p`[v`]=", { noremap = true })
vim.api.nvim_set_keymap("n", "P", "P`[v`]=", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>cy", '"+y', { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>cy", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cyy", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", '"+p', { noremap = true })

-- Copy the entire buffer into the system register
vim.api.nvim_set_keymap("n", "<leader>cac", 'ggVG"+y', { noremap = false })
-- Copy the entire buffer into vim register
vim.api.nvim_set_keymap("n", "<leader>caf", "ggVGy", { noremap = false })

-- Replace with register custom bindings
vim.api.nvim_set_keymap(
  "n",
  "<Leader>r",
  "<Plug>ReplaceWithRegisterOperator",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>rr",
  "<Plug>ReplaceWithRegisterLine",
  { noremap = false }
)
vim.api.nvim_set_keymap(
  "x",
  "<Leader>r",
  "<Plug>ReplaceWithRegisterVisual",
  { noremap = false }
)
vim.api.nvim_set_keymap("n", "<leader>cr", '"+<leader>r', { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>crr", '"+<leader>rr', { noremap = false })

-- paste-and-search (freezes right now)
-- vim.api.nvim_set_keymap('n', '<leader>sp', ':rg<space><c-f>pA<cr>', { noremap = false })
