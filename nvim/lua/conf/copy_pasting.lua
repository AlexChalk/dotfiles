-- Autocorrect indentation after pasting, but keep non-indenting option
-- for when pasting large files from clipboard.
vim.api.nvim_set_keymap('n', 'p', 'p`[v`]=', { noremap = true })
vim.api.nvim_set_keymap('n', 'P', 'P`[v`]=', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>cy', '"+y', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>cy', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cyy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cp', '"+p', { noremap = true })

-- Copy the entire buffer into the system register
vim.api.nvim_set_keymap('n', '<leader>cac', 'ggVG"+y', { noremap = false })
-- Copy the entire buffer into vim register
vim.api.nvim_set_keymap('n', '<leader>caf', 'ggVGy', { noremap = false })

-- Replace with register custom bindings
vim.api.nvim_set_keymap('n', '<Leader>r', '<Plug>ReplaceWithRegisterOperator', { noremap = false })
vim.api.nvim_set_keymap('n', '<Leader>rr', '<Plug>ReplaceWithRegisterLine', { noremap = false })
vim.api.nvim_set_keymap('x', '<Leader>r', '<Plug>ReplaceWithRegisterVisual', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>cr', '"+<leader>r', { noremap = false })
vim.api.nvim_set_keymap('n', '<leader>crr', '"+<leader>rr', { noremap = false })

-- paste-and-search (freezes right now)
-- vim.api.nvim_set_keymap('n', '<leader>sp', ':rg<space><c-f>pA<cr>', { noremap = false })

-----------------------------------------------------
-- Clipboard
-----------------------------------------------------
-- Wayland clipboard provider that strips carriage returns (GTK3 issue).

-- This is needed because currently there's an issue where GTK3 applications on
-- Wayland contain carriage returns at the end of the lines (this is a root
-- issue that needs to be fixed).
-- https://github.com/neovim/neovim/issues/10223
if (vim.env.WAYLAND_DISPLAY ~= nil) then
  -- Call out to external script as can't use lambdas yet:
  -- https://github.com/nanotee/nvim-lua-guide#conversion-is-not-always-possible
  -- https://github.com/neovim/neovim/issues/13436#issuecomment-767431218
  vim.g.clipboard = {
    name = 'wayland-strip-carriage',
    copy = {
      ['+'] = 'wl-copy --foreground --type text/plain',
      ['*'] = 'wl-copy --foreground --type text/plain --primary',
    },
    paste = {
      ['+'] = 'nvim-wl-paste',
      ['*'] = 'nvim-wl-paste --primary',
    },
    cache_enabled = true,
  }
end
