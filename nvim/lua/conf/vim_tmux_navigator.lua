vim.g.tmux_navigator_no_mappings = true

vim.keymap.set(
  { "n" },
  "<c-h>",
  ":<C-U>TmuxNavigateLeft<cr>",
  { remap = false, silent = true }
)
vim.keymap.set(
  { "n" },
  "<c-j>",
  ":<C-U>TmuxNavigateDown<cr>",
  { remap = false, silent = true }
)
vim.keymap.set(
  { "n" },
  "<c-k>",
  ":<C-U>TmuxNavigateUp<cr>",
  { remap = false, silent = true }
)
vim.keymap.set(
  { "n" },
  "<c-l>",
  ":<C-U>TmuxNavigateRight<cr>",
  { remap = false, silent = true }
)
vim.keymap.set(
  { "n" },
  [[<c-\>]],
  ":<C-U>TmuxNavigatePrevious<cr>",
  { remap = false, silent = true }
)
