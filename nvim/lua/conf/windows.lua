-----------------------------------------------------
-- Windows
-----------------------------------------------------

-- Pre-populate a split/edit command with the current directory
vim.api.nvim_set_keymap(
  "n",
  "<leader>nvsp",
  [[:vsp <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>]],
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>nsp",
  [[:sp <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>]],
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>nnsp",
  [[:e <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>]],
  { noremap = false }
)

-- CTRL-W CTRL-F	Split current window in two.  Edit file name under cursor.

vim.api.nvim_set_keymap(
  "n",
  "<c-w>z",
  ":wincmd _<cr>:wincmd |<cr>",
  { noremap = true }
)

vim.api.nvim_set_keymap("n", "<c-w>-", ":wincmd |<cr> ", { noremap = true })

vim.api.nvim_set_keymap("n", [[<c-w>\]], ":wincmd _<cr> ", { noremap = true })

-- <c-w>=: rebalance windows
-- <c-w>R: Swap top/bottom or left/right split
-- <c-w>T: Break out current window into a new tabview
-- <c-w>o: Close every window in the current tabview but the current one

-- automatically rebalance windows on vim resize
local windows = vim.api.nvim_create_augroup("windows", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
  pattern = { "*" },
  command = "wincmd =",
  group = windows,
})
