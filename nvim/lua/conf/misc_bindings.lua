---------------------------------------------------------------
-- Key Customizations
---------------------------------------------------------------

-- Start new lines from within normal mode
vim.api.nvim_set_keymap("n", "<CR>", "o<ESC>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader><CR>", "O<ESC>", { noremap = true })

-- Echo full filename
vim.api.nvim_set_keymap("n", "<Leader>sf", ":echo @%<CR>", { noremap = true })

-- Re-read all buffers in case underlying files have been modified (e.g. by git hook/linter)
-- nnoremap <Leader>rb :checktime<CR>

-- Easier command-mode binding
-- nmap <leader>; :

-- En-dashes (in insert mode) <ctrl>k -N
-- Em-dashes (in insert mode) <ctrl>k -M
-- All funky characters: `:h digraphs`

-- Open and source vimrc
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ocs",
  ":sp $HOME/dotfiles/nvim/init.lua<CR>",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>oct",
  ":tabedit $HOME/dotfiles/nvim/init.lua<CR>",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>rc",
  ":w<CR>:source $HOME/dotfiles/nvim/init.lua<CR>",
  { noremap = false }
)

-- Change dir to current file's directory
vim.api.nvim_set_keymap(
  "n",
  "<Leader>cad",
  ":cd %:p:h<CR>",
  { noremap = false, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cd",
  ":lcd %:p:h<CR>",
  { noremap = false, silent = true }
)

-- shortcut to turn search highlighting off
vim.api.nvim_set_keymap("n", "<Leader>nh", ":nohls<CR>", { noremap = false })

-- :difft        — diff open files
-- :diffs ~file~ — diff open file against provided new file
